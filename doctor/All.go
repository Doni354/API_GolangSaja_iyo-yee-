package doctor

import (
	"ApiSkinCarePG/config"
	"net/http"

	"github.com/gin-gonic/gin"
)

type aDoctor struct {
	ID       int    `json:"id"`
	Active   bool   `json:"active"`
	Nama     string `json:"nama"`
	Photo    string `json:"photo"`
	Category string `json:"category"`
}

func GetAllDoctors(c *gin.Context) {
	rows, err := config.DB.Query(`
		SELECT d.id, d.active, d.nama, d.photo, dc.category
		FROM doctors d
		LEFT JOIN doctor_categories dc ON d.id_doctor_categories = dc.id
	`)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
		return
	}
	defer rows.Close()

	var doctors []aDoctor
	for rows.Next() {
		var adoctor aDoctor
		err := rows.Scan(&adoctor.ID, &adoctor.Active, &adoctor.Nama, &adoctor.Photo, &adoctor.Category)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
			return
		}
		doctors = append(doctors, adoctor)
	}

	if len(doctors) == 0 {
		c.JSON(http.StatusNotFound, gin.H{"message": "data not found", "data": nil, "version": "v1"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "success get data", "data": doctors, "version": "v1"})
}
