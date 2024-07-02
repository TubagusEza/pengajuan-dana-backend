/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100422
 Source Host           : localhost:3306
 Source Schema         : pengajuan_db

 Target Server Type    : MySQL
 Target Server Version : 100422
 File Encoding         : 65001

 Date: 02/07/2024 15:26:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for divisi
-- ----------------------------
DROP TABLE IF EXISTS `divisi`;
CREATE TABLE `divisi`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of divisi
-- ----------------------------
INSERT INTO `divisi` VALUES (1, 'Marketing & Sales', '2024-07-01 19:46:09', '2024-07-01 19:46:09');
INSERT INTO `divisi` VALUES (2, 'HC & GA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `divisi` VALUES (3, 'Operational & Procurement', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `divisi` VALUES (4, 'Finance Accounting & Tax', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for metode
-- ----------------------------
DROP TABLE IF EXISTS `metode`;
CREATE TABLE `metode`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_metode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of metode
-- ----------------------------
INSERT INTO `metode` VALUES (1, 'Transfer', '2024-07-01 19:55:06', '2024-07-01 19:55:06');
INSERT INTO `metode` VALUES (2, 'Auto Debit', '2024-07-02 01:34:08', '2024-07-02 01:34:08');
INSERT INTO `metode` VALUES (3, 'Cash', '2024-07-02 08:04:45', '2024-07-02 08:04:45');
INSERT INTO `metode` VALUES (4, 'Lain-Lain', '2024-07-02 08:04:52', '2024-07-02 08:04:52');

-- ----------------------------
-- Table structure for pengajuan
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan`;
CREATE TABLE `pengajuan`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nominal` int NOT NULL,
  `userId` int NOT NULL,
  `metodeId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  INDEX `metodeId`(`metodeId`) USING BTREE,
  CONSTRAINT `pengajuan_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pengajuan_ibfk_2` FOREIGN KEY (`metodeId`) REFERENCES `metode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengajuan
-- ----------------------------
INSERT INTO `pengajuan` VALUES (1, 300002, 3, 1, '2024-07-02 01:29:16', '2024-07-02 08:13:35');
INSERT INTO `pengajuan` VALUES (6, 7000000, 1, 3, '2024-07-02 08:13:57', '2024-07-02 08:13:57');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `sid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expires` datetime NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('2WBnAbNpEmj87ceqGVPg96sE91JjjfRJ', '2024-07-03 06:04:07', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:04:07', '2024-07-02 06:04:07');
INSERT INTO `sessions` VALUES ('3MHjKyarbPde5LvVbjkvRQt1bdBY3gZa', '2024-07-03 07:57:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:57:47', '2024-07-02 07:57:47');
INSERT INTO `sessions` VALUES ('67uq2qtbB0J4ihdtg2OxcrEk0wMUNYsr', '2024-07-03 06:54:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:54:47', '2024-07-02 06:54:47');
INSERT INTO `sessions` VALUES ('9oW5kfBqUjp1vMq2hxOuMJowKJJgueda', '2024-07-03 07:48:44', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:48:44', '2024-07-02 07:48:44');
INSERT INTO `sessions` VALUES ('9Wu-6yq3GR1xxFupRplHQZoRocaTmNQt', '2024-07-03 07:59:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:59:30', '2024-07-02 07:59:30');
INSERT INTO `sessions` VALUES ('AEkFN9Ntp0TB37B4H_4yUbw4-bAqSb76', '2024-07-03 06:04:37', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:04:37', '2024-07-02 06:04:37');
INSERT INTO `sessions` VALUES ('BcbilK_-U2Jbg4mn5e99cne7Zh9EJW72', '2024-07-03 08:13:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 08:13:26', '2024-07-02 08:13:26');
INSERT INTO `sessions` VALUES ('eoL0YJNIo6sK5p3htAJCOZOHo-ansz-z', '2024-07-03 06:53:33', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:53:33', '2024-07-02 06:53:33');
INSERT INTO `sessions` VALUES ('Gc53ZjB6rITV4OBYZiJtsX0c6UZBMdYB', '2024-07-03 07:59:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:59:03', '2024-07-02 07:59:03');
INSERT INTO `sessions` VALUES ('hpLZVOgEXEN7f0Il5Rcr02LnsTS1D--u', '2024-07-03 07:49:27', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:49:27', '2024-07-02 07:49:27');
INSERT INTO `sessions` VALUES ('jx0V_wWwcx7dutl1CYwN-ciXkABuKDQn', '2024-07-03 07:57:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:57:47', '2024-07-02 07:57:47');
INSERT INTO `sessions` VALUES ('Khydqq2xBH-W00RodDAmL42JjotC0mL1', '2024-07-03 08:04:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":1}', '2024-07-02 02:29:10', '2024-07-02 08:04:52');
INSERT INTO `sessions` VALUES ('kQRbscDzOCgZMff2qjEtP35y6KK-QFjK', '2024-07-03 07:49:00', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:49:00', '2024-07-02 07:49:00');
INSERT INTO `sessions` VALUES ('Ll_o8YP_qxdWD2rDBrz4IQ5vjzqX23oc', '2024-07-03 07:10:25', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:10:25', '2024-07-02 07:10:25');
INSERT INTO `sessions` VALUES ('MktiPqbuQqmJx9-cjFVch6fgB6yETPn_', '2024-07-03 07:47:53', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:47:53', '2024-07-02 07:47:53');
INSERT INTO `sessions` VALUES ('mRrJRgQyJjxXpkDvKjc8Mz-YKCGuBU1Y', '2024-07-03 07:19:52', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:19:52', '2024-07-02 07:19:52');
INSERT INTO `sessions` VALUES ('OWPPhiprkpbSS9rq9hx3xERvxsUNRgBm', '2024-07-03 07:50:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:50:30', '2024-07-02 07:50:30');
INSERT INTO `sessions` VALUES ('PtemidF_pfv0AQqi5AT0OJOiwNZG7YlD', '2024-07-03 08:25:09', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"},\"userId\":1}', '2024-07-02 06:07:06', '2024-07-02 08:25:09');
INSERT INTO `sessions` VALUES ('pVfO0HHa-KChckDg2-hN8JpoWQN6LP0X', '2024-07-03 05:57:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 05:57:13', '2024-07-02 05:57:13');
INSERT INTO `sessions` VALUES ('Q6cpSXSm-9s3Ln3Y-KYDLjVWEJvViBUw', '2024-07-03 05:56:49', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 05:56:49', '2024-07-02 05:56:49');
INSERT INTO `sessions` VALUES ('QRHg__kf-Hic80kgdXhqeOB1c0nnFrOL', '2024-07-03 05:40:13', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 05:40:13', '2024-07-02 05:40:13');
INSERT INTO `sessions` VALUES ('r7kM6VzsY4S0EWYdo3or74-wQBpSG64j', '2024-07-03 06:07:06', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:07:06', '2024-07-02 06:07:06');
INSERT INTO `sessions` VALUES ('R9p_h8ta2HKg5crk9saDuXW-KCjs8sFV', '2024-07-03 08:13:31', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 08:13:31', '2024-07-02 08:13:31');
INSERT INTO `sessions` VALUES ('rsDDbxP0MSAsVpMnZG9ClUBLj9x3QP1u', '2024-07-03 06:55:45', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:55:45', '2024-07-02 06:55:45');
INSERT INTO `sessions` VALUES ('SiTdP-ya8cL0VJ9gMqegOjuK5bfgM7mf', '2024-07-03 07:59:30', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:59:30', '2024-07-02 07:59:30');
INSERT INTO `sessions` VALUES ('SSntwhhqV5EeNpFl_V9YGDXhZkXQUDc6', '2024-07-03 07:09:47', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:09:47', '2024-07-02 07:09:47');
INSERT INTO `sessions` VALUES ('UtCXCnjLE2O2dI2XN02inI9m-PSH44uS', '2024-07-03 05:40:26', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 05:40:26', '2024-07-02 05:40:26');
INSERT INTO `sessions` VALUES ('V-L79yjNrmBtDzvk4-FnVCT-oPk9TqSg', '2024-07-03 06:06:58', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:06:58', '2024-07-02 06:06:58');
INSERT INTO `sessions` VALUES ('XQ0IpNWCNFlNCTB9hv41WO_24FhdWgUQ', '2024-07-03 08:14:46', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 08:14:46', '2024-07-02 08:14:46');
INSERT INTO `sessions` VALUES ('YD9B43B5x4Pi3VYfnKMKoqCer-D2EaE8', '2024-07-03 06:04:28', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 06:04:28', '2024-07-02 06:04:28');
INSERT INTO `sessions` VALUES ('zVMzRmlCH_PvD5tCs5RzTUPKbEbEpLN9', '2024-07-03 08:13:57', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 08:13:57', '2024-07-02 08:13:57');
INSERT INTO `sessions` VALUES ('_om1GkGi2koouMOwGnd0_Ew4cGyTf9mX', '2024-07-03 07:20:20', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:20:20', '2024-07-02 07:20:20');
INSERT INTO `sessions` VALUES ('_sIVinTD6KSoJR5jQXJAFK-ZQuNJ-Lvi', '2024-07-03 07:59:03', '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"secure\":false,\"httpOnly\":true,\"path\":\"/\"}}', '2024-07-02 07:59:03', '2024-07-02 07:59:03');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `divisiId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `divisiId`(`divisiId`) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`divisiId`) REFERENCES `divisi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Tubagus', 'tubagus@email.com', '$argon2id$v=19$m=65536,t=3,p=4$PlJDR14q87MND94m8TMlBQ$oit8S6izY2ur6rEDCuMTtzRrg2Oz6Eqx3z6PPbLW1XE', 'Admin', 1, '2024-07-01 19:50:34', '2024-07-01 19:50:34');
INSERT INTO `users` VALUES (3, 'Mochammad', 'mochammad@email.com', '$argon2id$v=19$m=65536,t=3,p=4$7f+G6LSZOk0/5nvuCSZV7Q$cw2+x9kK1GkonAVT81GAFvip5PmyKEL0FNGJ92mOURU', 'User', 1, '2024-07-01 23:42:02', '2024-07-01 23:42:02');
INSERT INTO `users` VALUES (4, 'Eza', 'eza@email.com', '$argon2id$v=19$m=65536,t=3,p=4$sFuwDlcAB/EWelx7hb62lw$FUHTdC6VZMJec303L0J+IREkGjgu/0DCQJVsRHxg8E0', 'User', 1, '2024-07-02 00:32:13', '2024-07-02 00:32:13');
INSERT INTO `users` VALUES (5, 'Rizqi', 'rizqi@email.com', '$argon2id$v=19$m=65536,t=3,p=4$XkwVDdyK9xK3xCXc/KrCVA$LRTGdZTHwnm4hlQHcWe7fmhQZsbeCFdrPjXwTZRY42Y', 'User', 2, '2024-07-02 07:50:31', '2024-07-02 07:50:31');
INSERT INTO `users` VALUES (6, 'Firdaus', 'firdaus@email.com', '$argon2id$v=19$m=65536,t=3,p=4$mrTu1H6xJxXdhALlukgsAQ$5qA+LIGuECsqQWynaBdro4EniOkpJIaLXWk1gwGrBZo', 'User', 3, '2024-07-02 08:14:46', '2024-07-02 08:14:46');

SET FOREIGN_KEY_CHECKS = 1;
