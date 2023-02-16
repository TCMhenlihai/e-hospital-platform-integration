/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : e_hostpital_db

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 16/02/2023 11:02:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bloodpressure
-- ----------------------------
DROP TABLE IF EXISTS `bloodpressure`;
CREATE TABLE `bloodpressure`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `doctor_id` int(0) NOT NULL,
  `RecordDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `bloodpressure_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bloodpressure_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cancers
-- ----------------------------
DROP TABLE IF EXISTS `cancers`;
CREATE TABLE `cancers`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `doctor_id` int(0) NOT NULL,
  `CancerType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `RecordDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `cancers_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `cancers_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for clinic_admin
-- ----------------------------
DROP TABLE IF EXISTS `clinic_admin`;
CREATE TABLE `clinic_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `ClinicName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clinic_admin
-- ----------------------------
INSERT INTO `clinic_admin` VALUES (3, 'Test', '6131112222', 'First Ave', 'Ottawa', 'Ontario', 'Canada', 'K1SK1S');

-- ----------------------------
-- Table structure for clinic_servicehistory
-- ----------------------------
DROP TABLE IF EXISTS `clinic_servicehistory`;
CREATE TABLE `clinic_servicehistory`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `clinic_id` int(0) NOT NULL,
  `IsWalkIn` int(0) NOT NULL,
  `ServiceDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `clinic_id`(`clinic_id`) USING BTREE,
  CONSTRAINT `clinic_servicehistory_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `clinic_servicehistory_ibfk_2` FOREIGN KEY (`clinic_id`) REFERENCES `clinic_admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clinic_servicehistory
-- ----------------------------
INSERT INTO `clinic_servicehistory` VALUES (1, 1, 3, 1, '2023-01-19 00:00:00');
INSERT INTO `clinic_servicehistory` VALUES (2, 1, 3, 1, '2023-01-19 20:25:01');
INSERT INTO `clinic_servicehistory` VALUES (3, 1, 3, 0, '2023-01-30 15:50:30');

-- ----------------------------
-- Table structure for doctors_registration
-- ----------------------------
DROP TABLE IF EXISTS `doctors_registration`;
CREATE TABLE `doctors_registration`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Lname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Age` int(0) NOT NULL,
  `bloodGroup` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MobileNumber` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EmailId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ConfirmEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Medical_LICENSE_Number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DLNumber` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Specialization` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PractincingHospital` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `verification` tinyint(1) NULL DEFAULT NULL,
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors_registration
-- ----------------------------
INSERT INTO `doctors_registration` VALUES (1, 'Demo', 'Test', 18, 'O', '123456789', 'test@test.com', 'test@test.com', 'Ottawa', '', 'Test', 'Ottawa', 'ON', 'Canada', '123456789-ABC', '123456789-ABC', '123456789-ABC', '123456789-ABC', 'Male', 'DOC123', 'DOC123', 1, NULL);
INSERT INTO `doctors_registration` VALUES (5, 'a', 'a', 0, 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'a', 'DOC-ON-a-a-6033310000', 'a8d3bdc110bf60c3dc114e27f1706a3c', 0, NULL);
INSERT INTO `doctors_registration` VALUES (6, 'Doctor', 'Test', 12, 'A', '0132322323232', 'test1234@test.com', 'test123@test.com', '123', '123', '1111', 'SA', '123', '中国', '123', '123', '123', '123', 'male', 'DOC-ON-12-123-818510000', '123', 1, 'Doctor Test');

-- ----------------------------
-- Table structure for hospital_admin
-- ----------------------------
DROP TABLE IF EXISTS `hospital_admin`;
CREATE TABLE `hospital_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `Hospital_Name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email_Id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Confirm_Email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Facilities_departments​` int(0) NOT NULL,
  `Number_Doctors` int(0) NOT NULL,
  `Number_Nurse` int(0) NOT NULL,
  `No_Admins` int(0) NOT NULL,
  `Patients_per_year` int(0) NOT NULL,
  `​Tax_registration_number​` int(0) NOT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `verification` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hospital_admin
-- ----------------------------
INSERT INTO `hospital_admin` VALUES (1, 'Ottawa', 'admin@admin.com', 'admin@admin.com', '1', '2', '31312', 'Lahore', 'Canada', 'ON', 0, 0, 0, 0, 0, 0, 'admin', 'admin', 1);
INSERT INTO `hospital_admin` VALUES (6, 'test', 'test@test', 'test@test', 'test', 'test', 'k1sk1s', 'ottawa', 'canada', 'on', 1, 1, 1, 1, 1, 1, 'HOS-3936010000', '2af685682b4e4c649685dfe26a645621', 0);
INSERT INTO `hospital_admin` VALUES (7, 'test1', 'test1@test', 'test1@test', 'test1', 'test1', 'k1sk1s', 'ottawa', 'canada', 'on', 1, 1, 1, 1, 1, 1, 'HOS-8449010000', 'da0afcaec024a50bdc25b87cf78d06b7', 0);
INSERT INTO `hospital_admin` VALUES (8, 'ohsfodsh', 'sdjfsdf', 'lsdjsl', 'jlsjd', 'jlsjd', 'jldsjdslkd', 'jlsdjsld', 'sljdjsdls', 'jsldjsldjsld', 0, 0, 0, 0, 0, 0, 'HOS-2537410000', '57fa2a6ab965ca1effdeacac5e8aaef2', 0);
INSERT INTO `hospital_admin` VALUES (9, 'aoifds', 'dfgdgfd', 'dfgdfgd', 'fffff', 'fffff', 'fsdfsdfsd', 'Ottawa', 'Canada', 'ON', 0, 10, 11, 12, 13, 14, 'HOS-1555010000', 'de4ee470f7a1d79c73f60e715ecf3515', 0);
INSERT INTO `hospital_admin` VALUES (10, 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 0, 0, 0, 0, 0, 0, 'HOS-4145210000', '9a2ca4689daa3c11f47f32d1217ca4a5', 0);
INSERT INTO `hospital_admin` VALUES (11, 'ffdf', 'ddddffd', 'ddfdfdf', 'dfddfdffddf', 'dfddfdffddf', 'dfdddf', 'fdfdfddd', 'fdfdfddffd', 'dfdfdfdffd', 0, 0, 0, 0, 0, 0, 'HOS-7711810000', 'c22ec73a949d9eb4a97b618f067ff7f1', 0);
INSERT INTO `hospital_admin` VALUES (12, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-6906410000', 'd01edcc1332aeb5c485e096be99d3fe8', 0);
INSERT INTO `hospital_admin` VALUES (13, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-7892110000', '59a005d76540ee3f8829c7a5379076af', 0);
INSERT INTO `hospital_admin` VALUES (14, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-6634610000', 'cddc7e87c779f01d68a92937d34456f8', 0);
INSERT INTO `hospital_admin` VALUES (15, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-4088310000', 'd56946cf608db036f69a42feae6d695c', 0);
INSERT INTO `hospital_admin` VALUES (16, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-5604910000', 'bb79b263292dacd1f6b9b73d5a3d4e2b', 0);
INSERT INTO `hospital_admin` VALUES (17, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-1361610000', '3cf371d39bd3070d24f500a50102da44', 0);
INSERT INTO `hospital_admin` VALUES (18, 'dfsdf', 'fsdfsf', 'dsfsdfds', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-6070510000', '62a0c1171c004aa53519e0813c6b0502', 0);
INSERT INTO `hospital_admin` VALUES (19, 'dfsdf', 'andre.band2000@gmail.com', 'andre.band2000@gmail.com', 'dsfsdf', 'dsfsdf', 'dsfsdf', 'dfsfds', 'dsdfsf', 'dsfsd', 0, 0, 0, 0, 0, 0, 'HOS-4263210000', '4bc1a425518bbde1102bd80f1051ef98', 0);
INSERT INTO `hospital_admin` VALUES (20, 'sds', 'alireza2777@gmail.com', 'alireza2777@gmail.com', 'dgd', 'dgd', 'dgd', 'kjlk', 'jljl', 'jllj', 0, 0, 0, 0, 0, 0, 'HOS-1012010000', 'b8099e6f145a5de2056ec0645ba21876', 0);
INSERT INTO `hospital_admin` VALUES (21, 'sjdhjsakd', 'sadathosseiny.hossein@gmail.co', 'sadathosseiny.hossein@gmail.co', 'qwqw', 'qwqw', 'K2P 1S4', 'ottawa', 'Canada', 'Ontario', 0, 0, 0, 0, 0, 0, 'HOS-351310000', '25e8d768782a227c26e280255138b514', 0);
INSERT INTO `hospital_admin` VALUES (22, 'Ssxzcz', 'sadathosseiny.hossein@gmail.co', 'sadathosseiny.hossein@gmail.co', 'saas', 'saas', 'K2P 1S4', 'ottawa', 'Canada', 'Ontario', 0, 0, 0, 0, 0, 0, 'HOS-4247610000', '3ba752d6d84586c52a99b9d4bd34a22d', 0);

-- ----------------------------
-- Table structure for master_admin
-- ----------------------------
DROP TABLE IF EXISTS `master_admin`;
CREATE TABLE `master_admin`  (
  `id` int(0) NOT NULL,
  `userName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_admin
-- ----------------------------
INSERT INTO `master_admin` VALUES (0, 'ADM-M-CA-01', 'E@hospital01', 'uottawabiomedicalsystems@gmail');
INSERT INTO `master_admin` VALUES (2, 'admin', 'admin', 'admin@example.com');

-- ----------------------------
-- Table structure for medialboodpressure
-- ----------------------------
DROP TABLE IF EXISTS `medialboodpressure`;
CREATE TABLE `medialboodpressure`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `patient_id` int(0) NOT NULL,
  `doctor_id` int(0) NOT NULL,
  `RecordDate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `medialboodpressure_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `medialboodpressure_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors_registration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patients_registration
-- ----------------------------
DROP TABLE IF EXISTS `patients_registration`;
CREATE TABLE `patients_registration`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `FName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Age` int(0) NOT NULL,
  `BloodGroup` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MobileNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `EmailId` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PostalCode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `City` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Province` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `HCardNumber` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PassportNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PRNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `DLNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `verification` tinyint(1) NULL DEFAULT NULL,
  `isSick` int(0) NULL DEFAULT NULL COMMENT 'type 1: sicked, type 2: unsicked',
  `FullName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CaseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patients_registration
-- ----------------------------
INSERT INTO `patients_registration` VALUES (1, 'Test', 'Demo', 18, 'O', '123456789', 'test@test.com', 'Testing Address', 'Ottawa', 'Test123', 'Ottawa', 'Ontario', '123456789-ABC', '123456789-ABC', '123456789-ABC', '123456789-ABC', 'Male', 'PAT123', 'PAT123', 1, 1, NULL, NULL);
INSERT INTO `patients_registration` VALUES (31, 'F', 'L', 24, 'A', '0132322323232', 'test1236@test.com', 'Address', 'SA', '1111', 'SA', '123', '13', '123', '123', '123', 'male', 'PAT-ON-24-123-265010000', '123', 1, 0, 'F L', 'Normal: [(222, 505),(504, 770),(770, 1044),(1044, 1339),(1339, 1631),(1631, 1926),(1926, 2205),(2205, 2492),(2491, 2794),(2793, 3067),(3066, 3357)];');

-- ----------------------------
-- Table structure for sickness_record
-- ----------------------------
DROP TABLE IF EXISTS `sickness_record`;
CREATE TABLE `sickness_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'Create Time',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isSick` tinyint(1) NULL DEFAULT NULL,
  `diagnosis` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'doctor write diagnosis according uploaded images',
  `doctor_id` int(0) NULL DEFAULT NULL COMMENT 'doctor id',
  `PatientName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `DoctorName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CaseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sickness_record
-- ----------------------------
INSERT INTO `sickness_record` VALUES (72, NULL, NULL, 0, NULL, NULL, 'F L', NULL, 'male', 'PAT-ON-24-123-265010000', 'Normal: [(222, 505),(504, 770),(770, 1044),(1044, 1339),(1339, 1631),(1631, 1926),(1926, 2205),(2205, 2492),(2491, 2794),(2793, 3067),(3066, 3357)];');

-- ----------------------------
-- Table structure for tmp_etl_table
-- ----------------------------
DROP TABLE IF EXISTS `tmp_etl_table`;
CREATE TABLE `tmp_etl_table`  (
  `ClinicName` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `Location` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `City` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `Province` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `Country` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `PostalCode` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `NumberOfPatients` decimal(18, 0) NULL DEFAULT NULL,
  `Date` date NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tmp_etl_table
-- ----------------------------
INSERT INTO `tmp_etl_table` VALUES ('Test', 'First Ave', 'Ottawa', 'Ontario', 'Canada', 'K1SK1S', 2, '2023-01-19');
INSERT INTO `tmp_etl_table` VALUES ('Test', 'First Ave', 'Ottawa', 'Ontario', 'Canada', 'K1SK1S', 1, '2023-01-30');

SET FOREIGN_KEY_CHECKS = 1;
