// controller/doctor_controller.go

package controller

import (
	"database/sql"
	"net/http"
	"strconv"

	"ApiSkinCarePG/config"

	"github.com/gin-gonic/gin"
)

type Doctor struct {
	ID      int    `json:"id"`
	Active  bool   `json:"active"`
	Nama    string `json:"nama"`
	Photo   string `json:"photo"`
	Profile string `json:"profile"`
	Str     string `json:"str"`
	Jam     string `json:"jam"`
}

func GetDoctorByID(c *gin.Context) {
	idStr := c.Param("id")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": "failed get data", "error": "ID harus berupa angka", "version": "v1"})
		return
	}

	row := config.DB.QueryRow("SELECT id, active, nama, photo, profile, str, jam FROM doctors WHERE id = $1", id)

	var doctor Doctor
	err = row.Scan(&doctor.ID, &doctor.Active, &doctor.Nama, &doctor.Photo, &doctor.Profile, &doctor.Str, &doctor.Jam)
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

func GetAllDoctors(c *gin.Context) {
	rows, err := config.DB.Query("SELECT id, active, nama, photo FROM doctors")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
		return
	}
	defer rows.Close()

	var doctors []Doctor
	for rows.Next() {
		var doctor Doctor
		err := rows.Scan(&doctor.ID, &doctor.Active, &doctor.Nama, &doctor.Photo)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
			return
		}
		doctors = append(doctors, doctor)
	}

	if len(doctors) == 0 {
		c.JSON(http.StatusNotFound, gin.H{"message": "data not found", "data": nil, "version": "v1"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "success get data", "data": doctors, "version": "v1"})
}
