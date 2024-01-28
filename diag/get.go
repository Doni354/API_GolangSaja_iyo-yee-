package diag

import (
	"database/sql"
	"net/http"

	"ApiSkinCarePG/config"

	"github.com/gin-gonic/gin"
)

type Photo struct {
	Id        int    `json:"id"`
	File      string `json:"file"`
	CreatedAt string `json:"created_at"`
	CreatedBy string `json:"created_by"`
}

func GetLatestPhoto(c *gin.Context) {
	row := config.DB.QueryRow(`
		SELECT id, file, created_at, created_by
		FROM attachment_uploads
		ORDER BY id DESC
		LIMIT 1
	`)

	var Photo Photo
	err := row.Scan(&Photo.Id, &Photo.File, &Photo.CreatedAt, &Photo.CreatedBy)
	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"message": "data not found", "data": nil, "version": "v1"})
			return
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
			return
		}
	}

	c.JSON(http.StatusOK, gin.H{"message": "success get latest data", "data": Photo, "version": "v1"})
}
