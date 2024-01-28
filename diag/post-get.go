package diag

import (
	"database/sql"
	"log"
	"net/http"
	"time"

	"ApiSkinCarePG/config"

	"github.com/gin-gonic/gin"
)

type Data struct {
	Id        int       `json:"id"`
	File      string    `json:"file"`
	CreatedAt time.Time `json:"created_at"`
	CreatedBy string    `json:"created_by"`
	Status    bool      `json:"status"`
}

func CreateData(c *gin.Context) {
	var attachment Data

	// Bind JSON request body to the AttachmentUpload struct
	if err := c.ShouldBindJSON(&attachment); err != nil {
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}

	// Set CreatedAt to current time
	attachment.CreatedAt = time.Now()

	// Set default Status to false (0)
	attachment.Status = false

	// Insert data into attachment_uploads table and return the inserted ID
	err := config.DB.QueryRow(`
		INSERT INTO attachment_uploads (file, created_at, created_by, status)
		VALUES ($1, $2, $3, $4)
		RETURNING id
	`, attachment.File, attachment.CreatedAt, attachment.CreatedBy, attachment.Status).Scan(&attachment.Id)

	if err != nil {
		log.Fatal(err)
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}

	c.JSON(200, attachment)
}

func GetLatestData(c *gin.Context) {
	var lastInsertedID int

	// Get the last inserted ID from the attachment_uploads table
	err := config.DB.QueryRow(`
		SELECT id
		FROM attachment_uploads
		ORDER BY id DESC
		LIMIT 1
	`).Scan(&lastInsertedID)

	if err != nil {
		if err == sql.ErrNoRows {
			c.JSON(http.StatusNotFound, gin.H{"message": "data not found", "data": nil, "version": "v1"})
			return
		} else {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
			return
		}
	}

	// Retrieve data based on the last inserted ID
	row := config.DB.QueryRow(`
		SELECT id, file, created_at, created_by
		FROM attachment_uploads
		WHERE id = $1
	`, lastInsertedID)

	var data Data
	err = row.Scan(&data.Id, &data.File, &data.CreatedAt, &data.CreatedBy)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": "internal server error", "error": err.Error(), "version": "v1"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "success get data by last inserted ID", "data": data, "version": "v1"})
}
