package diag


import (
	"database/sql"
	"net/http"
	"strconv"

	"ApiSkinCarePG/config"

	"github.com/gin-gonic/gin"
)

type Result struct {
	ID       int    `json:"id"`
	Title     string `json:"judul"`
	Des    string `json:"deskripsi"`
	Photo  string `json:"file"`
}

func GetResultById(c *gin.Context) {
	idStr := c.Param("id")
	id, err := strconv.Atoi(idStr)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": "failed get data", "error": "ID harus berupa angka", "version": "v1"})
		return
	}

	row := config.DB.QueryRow(`
		SELECT d.id, d.judul, d.deskripsi, df.file
		FROM diagnosis d
		LEFT JOIN attachment_uploads df ON d.attachment_upload_id = df.id
		WHERE d.id = $1
	`, id)

	var Result Result
	err = row.Scan(&Result.ID, &Result.Title, &Result.Des, &Result.Photo)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"message": "data not found", "data": nil, "version": "v1"})
			return
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
			return
		}
	}

	c.JSON(http.StatusOK, gin.H{"message": "success get data", "data": Result, "version": "v1"})
}

func GetLatestResult(c *gin.Context) {
	row := config.DB.QueryRow(`
		SELECT d.id, d.judul, d.deskripsi, df.file
		FROM diagnosis d
		LEFT JOIN attachment_uploads df ON d.attachment_upload_id = df.id
		ORDER BY d.id DESC
		LIMIT 1
	`)

	var Result Result
	err := row.Scan(&Result.ID, &Result.Title, &Result.Des, &Result.Photo)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"message": "data not found", "data": nil, "version": "v1"})
			return
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
			return
		}
	}

	c.JSON(http.StatusOK, gin.H{"message": "success get latest data", "data": Result, "version": "v1"})
}

