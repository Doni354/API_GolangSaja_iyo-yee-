
package doctor

import (
	"database/sql"
	"net/http"
	"strconv"

	"ApiSkinCarePG/config"

	"github.com/gin-gonic/gin"
)

type Doctor struct {
	ID       int    `json:"id"`
	Active   bool   `json:"active"`
	Nama     string `json:"nama"`
	Photo    string `json:"photo"`
	Profile  string `json:"profile"`
	Str      string `json:"str"`
	Jam      string `json:"jam"`
	Category string `json:"category"`
}

func GetDoctorByID(c *gin.Context) {
	idStr := c.Param("id")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": "failed get data", "error": "ID harus berupa angka", "version": "v1"})
		return
	}

	row := config.DB.QueryRow(`
		SELECT d.id, d.active, d.nama, d.photo, d.profile, d.str, d.jam, dc.category
		FROM doctors d
		LEFT JOIN doctor_categories dc ON d.id_doctor_categories = dc.id
		WHERE d.id = $1
	`, id)

	var doctor Doctor
	err = row.Scan(&doctor.ID, &doctor.Active, &doctor.Nama, &doctor.Photo, &doctor.Profile, &doctor.Str, &doctor.Jam, &doctor.Category)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"message": "data not found", "data": nil, "version": "v1"})
			return
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
			return
		}
	}

	c.JSON(http.StatusOK, gin.H{"message": "success get data", "data": doctor, "version": "v1"})
}

