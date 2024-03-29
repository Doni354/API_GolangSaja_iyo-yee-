/*
 Navicat Premium Data Transfer

 Source Server         : PostGres
 Source Server Type    : PostgreSQL
 Source Server Version : 160001 (160001)
 Source Host           : localhost:5432
 Source Catalog        : SkinCare
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160001 (160001)
 File Encoding         : 65001

 Date: 28/01/2024 09:35:02
*/


-- ----------------------------
-- Sequence structure for attachment_uploads_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."attachment_uploads_id_seq";
CREATE SEQUENCE "public"."attachment_uploads_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for diagnosis_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."diagnosis_id_seq";
CREATE SEQUENCE "public"."diagnosis_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for diagnosis_users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."diagnosis_users_id_seq";
CREATE SEQUENCE "public"."diagnosis_users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dockter_categories_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dockter_categories_id_seq";
CREATE SEQUENCE "public"."dockter_categories_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for dockter_ratings_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."dockter_ratings_id_seq";
CREATE SEQUENCE "public"."dockter_ratings_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for docters_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."docters_id_seq";
CREATE SEQUENCE "public"."docters_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for doctor_ratings_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."doctor_ratings_id_seq";
CREATE SEQUENCE "public"."doctor_ratings_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq1
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq1";
CREATE SEQUENCE "public"."users_id_seq1" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for attachment_uploads
-- ----------------------------
DROP TABLE IF EXISTS "public"."attachment_uploads";
CREATE TABLE "public"."attachment_uploads" (
  "id" int4 NOT NULL DEFAULT nextval('attachment_uploads_id_seq'::regclass),
  "file" text COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" timestamp(6),
  "updated_by" varchar(64) COLLATE "pg_catalog"."default",
  "status" bool NOT NULL
)
;

-- ----------------------------
-- Records of attachment_uploads
-- ----------------------------
INSERT INTO "public"."attachment_uploads" VALUES (2, 'photo.jpg', '2024-01-22 08:40:59.577907', 'John Doe', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (3, 'photo1.jpg', '2024-01-22 08:41:23.213383', 'Doe', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (4, 'test.jpg', '2024-01-22 08:42:31.290355', 'Doni', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (6, 'test4.jpg', '2024-01-23 20:29:49.97698', 'Doni', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (5, 'gambar.jpg', '2024-01-22 08:54:14.680388', 'iyos', NULL, NULL, 't');
INSERT INTO "public"."attachment_uploads" VALUES (7, 'gambar.jpg', '2024-01-23 20:50:29.332908', 'rifki', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (8, 'nama_file.jpg', '2024-01-25 08:49:18.559897', 'John Doie', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (9, 'nama_file.jpg', '2024-01-25 08:50:20.045118', 'John Doie', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (10, 'nama_file.jpg', '2024-01-25 08:54:05.830401', 'John Doie', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (11, 'nama_file.jpg', '2024-01-25 09:05:38.833191', 'John Doie', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (12, 'nama_file.jpg', '2024-01-25 19:15:13.677994', 'John Doie', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (13, 'nama_file.jpg', '2024-01-25 19:16:47.481239', 'John Doie', NULL, NULL, 'f');
INSERT INTO "public"."attachment_uploads" VALUES (14, 'nama_file.jpg', '2024-01-28 09:25:27.482944', 'John Doie', NULL, NULL, 'f');

-- ----------------------------
-- Table structure for diagnosis
-- ----------------------------
DROP TABLE IF EXISTS "public"."diagnosis";
CREATE TABLE "public"."diagnosis" (
  "id" int4 NOT NULL DEFAULT nextval('diagnosis_id_seq'::regclass),
  "judul" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "deskripsi" text COLLATE "pg_catalog"."default",
  "attachment_upload_id" int4,
  "active" int4,
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" timestamp(6),
  "updated_by" varchar(64) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of diagnosis
-- ----------------------------
INSERT INTO "public"."diagnosis" VALUES (1, 'cacar', 'penyakit kulit', 5, 1, '2024-01-20 19:14:37', 'doni', NULL, NULL);

-- ----------------------------
-- Table structure for diagnosis_users
-- ----------------------------
DROP TABLE IF EXISTS "public"."diagnosis_users";
CREATE TABLE "public"."diagnosis_users" (
  "id" int4 NOT NULL DEFAULT nextval('diagnosis_users_id_seq'::regclass),
  "user_id" int4 NOT NULL,
  "diagnosis_id" int4,
  "status" int4,
  "created_at" timestamp(6),
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" timestamp(6) NOT NULL,
  "updated_by" varchar(64) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of diagnosis_users
-- ----------------------------

-- ----------------------------
-- Table structure for doctor_categories
-- ----------------------------
DROP TABLE IF EXISTS "public"."doctor_categories";
CREATE TABLE "public"."doctor_categories" (
  "id" int4 NOT NULL DEFAULT nextval('dockter_categories_id_seq'::regclass),
  "active" int4,
  "category" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" timestamp(6),
  "updated_by" varchar(64) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of doctor_categories
-- ----------------------------
INSERT INTO "public"."doctor_categories" VALUES (1, 1, 'Dermatopatologi', '2024-01-08 19:54:38', 'doni', NULL, NULL);
INSERT INTO "public"."doctor_categories" VALUES (2, 1, 'Dokter Umum', '2024-01-09 07:29:27', 'doni', NULL, NULL);

-- ----------------------------
-- Table structure for doctor_ratings
-- ----------------------------
DROP TABLE IF EXISTS "public"."doctor_ratings";
CREATE TABLE "public"."doctor_ratings" (
  "id" int4 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "id_doctor" int2 NOT NULL,
  "star" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" timestamp(6),
  "updated_by" date
)
;

-- ----------------------------
-- Records of doctor_ratings
-- ----------------------------
INSERT INTO "public"."doctor_ratings" OVERRIDING SYSTEM VALUE VALUES (2, 4, '4', '2024-01-06 21:15:29', 'as', NULL, NULL);
INSERT INTO "public"."doctor_ratings" OVERRIDING SYSTEM VALUE VALUES (7, 5, '3', '2024-01-08 20:10:39', 'doni', NULL, NULL);
INSERT INTO "public"."doctor_ratings" OVERRIDING SYSTEM VALUE VALUES (8, 4, '1', '2024-01-10 20:50:23', 'as', NULL, NULL);

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS "public"."doctors";
CREATE TABLE "public"."doctors" (
  "id" int4 NOT NULL DEFAULT nextval('docters_id_seq'::regclass),
  "active" int4,
  "nama" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "photo" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" timestamp(6),
  "updated_by" varchar(64) COLLATE "pg_catalog"."default",
  "profile" text COLLATE "pg_catalog"."default",
  "str" text COLLATE "pg_catalog"."default",
  "jam" text COLLATE "pg_catalog"."default",
  "id_doctor_categories" int8
)
;

-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO "public"."doctors" VALUES (4, 1, 'dr.Mario', 'https://iatrosclinic.faskes.com/po-content/uploads/medium/medium_doctor-6.jpg', '2024-01-07 19:45:07', 'doni', '2024-01-08 08:14:06', 'doni', 'Disini nanti isinya deskripsi singkat berisi profil, pengalaman kerja, pendidikan Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '3278567894672345', '08.00 - 21.00', 1);
INSERT INTO "public"."doctors" VALUES (5, 1, 'dr.Olivia', '.hpg', '2024-01-08 20:08:43', 'doni', NULL, NULL, 'testt', '1234567', '23123', 1);
INSERT INTO "public"."doctors" VALUES (6, 1, 'dr.Haqiqie', '.jpg', '2024-01-08 20:09:23', 'doni', NULL, NULL, 'tesss', '53213', '1322', 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int4 NOT NULL GENERATED ALWAYS AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "tanggal_lahir" varchar(64) COLLATE "pg_catalog"."default",
  "status" int2,
  "created_at" timestamp(6) NOT NULL,
  "created_by" varchar(64) COLLATE "pg_catalog"."default" NOT NULL,
  "updated_at" timestamp(6),
  "updated_by" varchar(64) COLLATE "pg_catalog"."default",
  "hp" varchar(16) COLLATE "pg_catalog"."default" DEFAULT NULL::character varying,
  "sid" int4 NOT NULL
)
;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."attachment_uploads_id_seq"
OWNED BY "public"."attachment_uploads"."id";
SELECT setval('"public"."attachment_uploads_id_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."diagnosis_id_seq"
OWNED BY "public"."diagnosis"."id";
SELECT setval('"public"."diagnosis_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."diagnosis_users_id_seq"
OWNED BY "public"."diagnosis_users"."id";
SELECT setval('"public"."diagnosis_users_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dockter_categories_id_seq"
OWNED BY "public"."doctor_categories"."id";
SELECT setval('"public"."dockter_categories_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."dockter_ratings_id_seq"
OWNED BY "public"."doctor_ratings"."id";
SELECT setval('"public"."dockter_ratings_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."docters_id_seq"
OWNED BY "public"."doctors"."id";
SELECT setval('"public"."docters_id_seq"', 6, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."doctor_ratings_id_seq"
OWNED BY "public"."doctor_ratings"."id";
SELECT setval('"public"."doctor_ratings_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq1"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq1"', 1, false);

-- ----------------------------
-- Primary Key structure for table attachment_uploads
-- ----------------------------
ALTER TABLE "public"."attachment_uploads" ADD CONSTRAINT "attachment_uploads_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table diagnosis
-- ----------------------------
ALTER TABLE "public"."diagnosis" ADD CONSTRAINT "diagnosis_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table diagnosis_users
-- ----------------------------
ALTER TABLE "public"."diagnosis_users" ADD CONSTRAINT "diagnosis_users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table doctor_categories
-- ----------------------------
ALTER TABLE "public"."doctor_categories" ADD CONSTRAINT "dockter_categories_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Auto increment value for doctor_ratings
-- ----------------------------
SELECT setval('"public"."doctor_ratings_id_seq"', 8, true);

-- ----------------------------
-- Primary Key structure for table doctor_ratings
-- ----------------------------
ALTER TABLE "public"."doctor_ratings" ADD CONSTRAINT "dockter_ratings_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table doctors
-- ----------------------------
ALTER TABLE "public"."doctors" ADD CONSTRAINT "docters_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Auto increment value for users
-- ----------------------------
SELECT setval('"public"."users_id_seq1"', 1, false);

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id", "sid");
