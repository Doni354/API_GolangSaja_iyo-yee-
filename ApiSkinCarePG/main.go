package main

import (
	"ApiSkinCarePG/config"
	"ApiSkinCarePG/controller"
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	config.Conn()
	// Membuat objek router Gin
	router := gin.Default()

	// Mengatur rute endpoint untuk mendapatkan data dokter berdasarkan ID
	router.GET("/doctors/:id", controller.GetDoctorByID)
	router.GET("/doctors", controller.GetAllDoctors)
	// Menjalankan server
	err := router.Run(":1111")
	if err != nil {
		fmt.Println("Gagal menjalankan server:", err)
	}
}
