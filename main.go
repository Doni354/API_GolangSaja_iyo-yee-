package main

import (
	"ApiSkinCarePG/config"
	"ApiSkinCarePG/diag"
	"ApiSkinCarePG/doctor"
	"fmt"

	"github.com/gin-gonic/gin"
)

func main() {
	config.Conn()

	r := gin.Default()
	r.GET("SkinCare/doctors", doctor.GetAllDoctors)
	r.GET("SkinCare/doctors/:id", doctor.GetDoctorByID)
	r.GET("SkinCare/diag/result/:id", diag.GetResultById)
	r.GET("SkinCare/diag/result", diag.GetLatestResult)
	r.POST("/post", diag.CreateAttachmentUpload)
	r.GET("/photo", diag.GetLatestPhoto)
	r.POST("SkinCare/diag/postD", diag.CreateData)
	r.GET("SkinCare/diag/getD", diag.GetLatestData)

	// Mengatur rute endpoint untuk mendapatkan data dokter berdasarkan ID

	// Menjalankan server
	err := r.Run(":1111")
	if err != nil {
		fmt.Println("Gagal menjalankan server:", err)
	}

	fmt.Println("GET ALL DOCTORS")
	fmt.Println("localhost:1111/SkinCare/doctors")
	fmt.Println("GET DOCTORS BY ID")
	fmt.Println("localhost:1111/SkinCare/doctors/[ID]")
	fmt.Println("GET LATEST RESULT DIAG")
	fmt.Println("localhost:1111/SkinCare/diag/result")
	fmt.Println("GET RESULT DIAG BY ID")
	fmt.Println("localhost:1111/SkinCare/diag/result/[ID]")
	fmt.Println("POST DIAG")
	fmt.Println("localhost:1111/SkinCare/diag/postD")
	fmt.Println("GET DIAG")
	fmt.Println("localhost:1111/SkinCare/diag/getD")

}
