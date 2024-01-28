package diag

import (
	"ApiSkinCarePG/config"
	"log"
	"time"

	"github.com/gin-gonic/gin"
)

type AttachmentUpload struct {
	File      string    `json:"file" binding:"required"`
	CreatedAt time.Time `json:"created_at"`
	CreatedBy string    `json:"created_by" binding:"required"`
	Status    bool      `json:"status"`
}

func CreateAttachmentUpload(c *gin.Context) {
	var attachment AttachmentUpload

	// Bind JSON request body to the AttachmentUpload struct
	if err := c.ShouldBindJSON(&attachment); err != nil {
		c.JSON(400, gin.H{"error": err.Error()})
		return
	}

	// Set CreatedAt to current time
	attachment.CreatedAt = time.Now()

	// Set default Status to false (0)
	attachment.Status = false

	// Insert data into attachment_uploads table
	_, err := config.DB.Exec("INSERT INTO attachment_uploads (file, created_at, created_by, status) VALUES ($1, $2, $3, $4)",
		attachment.File, attachment.CreatedAt, attachment.CreatedBy, attachment.Status)

	if err != nil {
		log.Fatal(err)
		c.JSON(500, gin.H{"error": "Internal Server Error"})
		return
	}

	c.JSON(200, attachment)
}
