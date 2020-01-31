/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : django_mall

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 31/01/2020 22:03:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_login_record
-- ----------------------------
DROP TABLE IF EXISTS `account_login_record`;
CREATE TABLE `account_login_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_login_record_user_id_21d063a4_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `account_login_record_user_id_21d063a4_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_user
-- ----------------------------
DROP TABLE IF EXISTS `account_user`;
CREATE TABLE `account_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `integral` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_user_username_d393f583_uniq`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_user
-- ----------------------------
INSERT INTO `account_user` VALUES (1, '12345678911', 'leo', 'pbkdf2_sha256$36000$RXIPavUr19BU$O6YSRpBJ1tqbG1ii1cKUSp/ZfA6ymiMmE96rznyHnVk=', '', 123, 11, '2020-01-09 03:21:11.000000', '', '', 1, 1, 0, NULL, '');
INSERT INTO `account_user` VALUES (2, 'admin', 'admin', 'pbkdf2_sha256$36000$tHdgKSZLJpA5$y5nmuoyWjdvAFtQC/MGoGStJ3edxTDPvTSL0YLgBaP8=', NULL, 1111, 122, '2020-01-09 11:25:24.000000', 'admin@123.com', 'admin', 1, 1, 1, '2020-01-27 07:34:13.356489', 'admin');
INSERT INTO `account_user` VALUES (3, '12345678933', '昵称', 'pbkdf2_sha256$36000$S2zBiYctuXcR$Ne0c6I9D5UuoArSuizU951nUw+a5b+pflIiRFdRZZFk=', '', 0, 0, '2020-01-09 03:35:41.000000', '', '', 1, 1, 0, '2020-01-09 08:19:39.000000', '');

-- ----------------------------
-- Table structure for account_user_address
-- ----------------------------
DROP TABLE IF EXISTS `account_user_address`;
CREATE TABLE `account_user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `area` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `town` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `account_user_address_user_id_03074eb2_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `account_user_address_user_id_03074eb2_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_user_address
-- ----------------------------
INSERT INTO `account_user_address` VALUES (1, '广东省', '广州市', '天河区', NULL, '测试', 'leo', '12345678900', 0, 1, '2020-01-09 06:46:50.838161', '2020-01-09 07:32:56.563227', 3);
INSERT INTO `account_user_address` VALUES (2, '广东省', '深圳市', '罗湖区', NULL, 'test', 'tom', '12345678999', 1, 1, '2020-01-09 06:48:33.632227', '2020-01-09 07:33:02.927199', 3);
INSERT INTO `account_user_address` VALUES (3, '广东省', '广州市', '天河区', NULL, '测试2', 'leo', '12345678900', 0, 0, '2020-01-09 07:20:08.864730', '2020-01-09 07:44:12.858208', 3);
INSERT INTO `account_user_address` VALUES (4, '广东省', '广州市', '天河区', NULL, '测试3', 'leo', '12345678900', 1, 1, '2020-01-09 07:21:11.727578', '2020-01-10 09:27:54.046832', 2);

-- ----------------------------
-- Table structure for account_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `account_user_groups`;
CREATE TABLE `account_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_user_groups_user_id_group_id_4d09af3e_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `account_user_groups_group_id_6c71f749_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `account_user_profile`;
CREATE TABLE `account_user_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_email_valid` tinyint(1) NOT NULL,
  `phone_no` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_phone_valid` tinyint(1) NOT NULL,
  `sex` smallint(6) NOT NULL,
  `age` smallint(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `account_user_profile_user_id_3660f8fb_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `account_user_user_permissions`;
CREATE TABLE `account_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_user_user_permis_user_id_permission_id_48bdd28b_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `account_user_user_pe_permission_id_66c44191_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_passwdchangelog
-- ----------------------------
DROP TABLE IF EXISTS `accounts_passwdchangelog`;
CREATE TABLE `accounts_passwdchangelog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (11, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (12, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (17, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (18, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (19, 'Can add news', 7, 'add_news');
INSERT INTO `auth_permission` VALUES (20, 'Can change news', 7, 'change_news');
INSERT INTO `auth_permission` VALUES (21, 'Can delete news', 7, 'delete_news');
INSERT INTO `auth_permission` VALUES (22, 'Can add slider', 8, 'add_slider');
INSERT INTO `auth_permission` VALUES (23, 'Can change slider', 8, 'change_slider');
INSERT INTO `auth_permission` VALUES (24, 'Can delete slider', 8, 'delete_slider');
INSERT INTO `auth_permission` VALUES (25, 'Can add passwd change log', 9, 'add_passwdchangelog');
INSERT INTO `auth_permission` VALUES (26, 'Can change passwd change log', 9, 'change_passwdchangelog');
INSERT INTO `auth_permission` VALUES (27, 'Can delete passwd change log', 9, 'delete_passwdchangelog');
INSERT INTO `auth_permission` VALUES (28, 'Can add user profile', 10, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (29, 'Can change user profile', 10, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (30, 'Can delete user profile', 10, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (31, 'Can add user', 11, 'add_user');
INSERT INTO `auth_permission` VALUES (32, 'Can change user', 11, 'change_user');
INSERT INTO `auth_permission` VALUES (33, 'Can delete user', 11, 'delete_user');
INSERT INTO `auth_permission` VALUES (34, 'Can add login record', 12, 'add_loginrecord');
INSERT INTO `auth_permission` VALUES (35, 'Can change login record', 12, 'change_loginrecord');
INSERT INTO `auth_permission` VALUES (36, 'Can delete login record', 12, 'delete_loginrecord');
INSERT INTO `auth_permission` VALUES (37, 'Can add user address', 13, 'add_useraddress');
INSERT INTO `auth_permission` VALUES (38, 'Can change user address', 13, 'change_useraddress');
INSERT INTO `auth_permission` VALUES (39, 'Can delete user address', 13, 'delete_useraddress');
INSERT INTO `auth_permission` VALUES (40, 'Can add tag', 14, 'add_tag');
INSERT INTO `auth_permission` VALUES (41, 'Can change tag', 14, 'change_tag');
INSERT INTO `auth_permission` VALUES (42, 'Can delete tag', 14, 'delete_tag');
INSERT INTO `auth_permission` VALUES (43, 'Can add classify', 15, 'add_classify');
INSERT INTO `auth_permission` VALUES (44, 'Can change classify', 15, 'change_classify');
INSERT INTO `auth_permission` VALUES (45, 'Can delete classify', 15, 'delete_classify');
INSERT INTO `auth_permission` VALUES (46, 'Can add product', 16, 'add_product');
INSERT INTO `auth_permission` VALUES (47, 'Can change product', 16, 'change_product');
INSERT INTO `auth_permission` VALUES (48, 'Can delete product', 16, 'delete_product');
INSERT INTO `auth_permission` VALUES (49, 'Can add image file', 17, 'add_imagefile');
INSERT INTO `auth_permission` VALUES (50, 'Can change image file', 17, 'change_imagefile');
INSERT INTO `auth_permission` VALUES (51, 'Can delete image file', 17, 'delete_imagefile');
INSERT INTO `auth_permission` VALUES (52, 'Can add comments', 18, 'add_comments');
INSERT INTO `auth_permission` VALUES (53, 'Can change comments', 18, 'change_comments');
INSERT INTO `auth_permission` VALUES (54, 'Can delete comments', 18, 'delete_comments');
INSERT INTO `auth_permission` VALUES (55, 'Can add cart', 19, 'add_cart');
INSERT INTO `auth_permission` VALUES (56, 'Can change cart', 19, 'change_cart');
INSERT INTO `auth_permission` VALUES (57, 'Can delete cart', 19, 'delete_cart');
INSERT INTO `auth_permission` VALUES (58, 'Can add order', 20, 'add_order');
INSERT INTO `auth_permission` VALUES (59, 'Can change order', 20, 'change_order');
INSERT INTO `auth_permission` VALUES (60, 'Can delete order', 20, 'delete_order');
INSERT INTO `auth_permission` VALUES (61, 'Can view login record', 12, 'view_loginrecord');
INSERT INTO `auth_permission` VALUES (62, 'Can view passwd change log', 9, 'view_passwdchangelog');
INSERT INTO `auth_permission` VALUES (63, 'Can view 用户信息', 11, 'view_user');
INSERT INTO `auth_permission` VALUES (64, 'Can view user address', 13, 'view_useraddress');
INSERT INTO `auth_permission` VALUES (65, 'Can view user profile', 10, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (66, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (67, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (68, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (69, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (70, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (71, 'Can view classify', 15, 'view_classify');
INSERT INTO `auth_permission` VALUES (72, 'Can view 商品信息', 16, 'view_product');
INSERT INTO `auth_permission` VALUES (73, 'Can view tag', 14, 'view_tag');
INSERT INTO `auth_permission` VALUES (74, 'Can view cart', 19, 'view_cart');
INSERT INTO `auth_permission` VALUES (75, 'Can view comments', 18, 'view_comments');
INSERT INTO `auth_permission` VALUES (76, 'Can view order', 20, 'view_order');
INSERT INTO `auth_permission` VALUES (77, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (78, 'Can view 图片', 17, 'view_imagefile');
INSERT INTO `auth_permission` VALUES (79, 'Can view 新闻通知', 7, 'view_news');
INSERT INTO `auth_permission` VALUES (80, 'Can view 轮播图', 8, 'view_slider');
INSERT INTO `auth_permission` VALUES (81, 'Can add Bookmark', 21, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can change Bookmark', 21, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (83, 'Can delete Bookmark', 21, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (84, 'Can add User Setting', 22, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (85, 'Can change User Setting', 22, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (86, 'Can delete User Setting', 22, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (87, 'Can add User Widget', 23, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (88, 'Can change User Widget', 23, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (89, 'Can delete User Widget', 23, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (90, 'Can add log entry', 24, 'add_log');
INSERT INTO `auth_permission` VALUES (91, 'Can change log entry', 24, 'change_log');
INSERT INTO `auth_permission` VALUES (92, 'Can delete log entry', 24, 'delete_log');
INSERT INTO `auth_permission` VALUES (93, 'Can view Bookmark', 21, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (94, 'Can view log entry', 24, 'view_log');
INSERT INTO `auth_permission` VALUES (95, 'Can view User Setting', 22, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (96, 'Can view User Widget', 23, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (97, 'Can add revision', 25, 'add_revision');
INSERT INTO `auth_permission` VALUES (98, 'Can change revision', 25, 'change_revision');
INSERT INTO `auth_permission` VALUES (99, 'Can delete revision', 25, 'delete_revision');
INSERT INTO `auth_permission` VALUES (100, 'Can add version', 26, 'add_version');
INSERT INTO `auth_permission` VALUES (101, 'Can change version', 26, 'change_version');
INSERT INTO `auth_permission` VALUES (102, 'Can delete version', 26, 'delete_version');
INSERT INTO `auth_permission` VALUES (103, 'Can view revision', 25, 'view_revision');
INSERT INTO `auth_permission` VALUES (104, 'Can view version', 26, 'view_version');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$36000$tHdgKSZLJpA5$y5nmuoyWjdvAFtQC/MGoGStJ3edxTDPvTSL0YLgBaP8=', '2020-01-09 02:34:22.605784', 1, 'admin', '', '', 'admin@123.com', 1, 1, '2020-01-08 09:07:43.966849');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$36000$Ea5WFP2oAcJJ$Rm8tjtBPyXV16ysLG3w0Sqo/yAI++pOmnz6B4rs3EDM=', '2020-01-09 03:07:24.629771', 0, '12345678922', '', '', '', 1, 1, '2020-01-09 03:07:24.524054');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2020-01-10 01:23:20.313941', '1', '12345678911', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (2, '2020-01-10 01:24:12.285922', '1', '12345678911', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (3, '2020-01-10 01:24:20.279541', '1', '12345678911', 2, '[]', 11, 2);
INSERT INTO `django_admin_log` VALUES (4, '2020-01-10 01:24:30.541091', '3', '12345678933', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 11, 2);
INSERT INTO `django_admin_log` VALUES (5, '2020-01-10 02:55:24.917477', '7', 'Product object', 2, '[{\"changed\": {\"fields\": [\"price\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (6, '2020-01-10 02:56:32.946507', '7', '五粮液股份公司 富贵天下绵纯级 500ml 52度 浓香型白酒', 2, '[{\"changed\": {\"fields\": [\"types\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (7, '2020-01-10 06:33:03.367577', '1', 'Order object', 1, '[{\"added\": {}}]', 20, 2);
INSERT INTO `django_admin_log` VALUES (8, '2020-01-10 07:04:25.525017', '7', '五粮液股份公司 富贵天下绵纯级 500ml 52度 浓香型白酒', 2, '[{\"changed\": {\"fields\": [\"price\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (9, '2020-01-10 07:37:34.498151', '1', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (10, '2020-01-10 07:43:24.629641', '1', 'ImageFile object', 3, '', 17, 2);
INSERT INTO `django_admin_log` VALUES (11, '2020-01-10 07:43:44.966242', '2', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (12, '2020-01-10 07:44:02.407589', '3', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (13, '2020-01-10 07:55:31.105585', '1', 'Tag object', 1, '[{\"added\": {}}]', 14, 2);
INSERT INTO `django_admin_log` VALUES (14, '2020-01-10 07:55:36.563015', '3', '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', 2, '[{\"changed\": {\"fields\": [\"tags\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (15, '2020-01-10 07:58:08.201402', '2', 'jstj:酒水推荐', 1, '[{\"added\": {}}]', 14, 2);
INSERT INTO `django_admin_log` VALUES (16, '2020-01-10 07:58:32.125377', '3', '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', 2, '[{\"changed\": {\"fields\": [\"tags\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (17, '2020-01-10 07:58:48.952366', '3', 'cnxh:猜你喜欢', 1, '[{\"added\": {}}]', 14, 2);
INSERT INTO `django_admin_log` VALUES (18, '2020-01-10 07:59:17.858047', '7', '五粮液股份公司 富贵天下绵纯级 500ml 52度 浓香型白酒', 2, '[{\"changed\": {\"fields\": [\"tags\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (19, '2020-01-10 07:59:35.416109', '7', '五粮液股份公司 富贵天下绵纯级 500ml 52度 浓香型白酒', 2, '[]', 16, 2);
INSERT INTO `django_admin_log` VALUES (20, '2020-01-10 07:59:48.718530', '6', '波龙波士顿龙虾鲜活大龙虾鲜活海鲜水产特大澳洲澳龙特大奥龙超大', 2, '[{\"changed\": {\"fields\": [\"tags\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (21, '2020-01-10 07:59:56.626376', '4', '俞兆林卫衣 男2017春新款运动休闲印花大码潮人卫衣卫裤加厚外套套装男', 2, '[{\"changed\": {\"fields\": [\"tags\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (22, '2020-01-10 08:00:02.762960', '5', '洋河蓝色经典 海之蓝42度375ml 2瓶 洋河官方旗舰店 绵柔型白酒', 2, '[{\"changed\": {\"fields\": [\"tags\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (23, '2020-01-10 09:02:39.918825', '3', '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', 2, '[]', 16, 2);
INSERT INTO `django_admin_log` VALUES (24, '2020-01-10 09:07:13.091219', '1', 'jszc:酒水专场', 1, '[{\"added\": {}}]', 15, 2);
INSERT INTO `django_admin_log` VALUES (25, '2020-01-10 09:08:16.991294', '7', '五粮液股份公司 富贵天下绵纯级 500ml 52度 浓香型白酒', 2, '[{\"changed\": {\"fields\": [\"classes\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (26, '2020-01-10 09:08:24.022486', '5', '洋河蓝色经典 海之蓝42度375ml 2瓶 洋河官方旗舰店 绵柔型白酒', 2, '[{\"changed\": {\"fields\": [\"classes\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (27, '2020-01-10 09:08:28.860545', '3', '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', 2, '[{\"changed\": {\"fields\": [\"classes\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (28, '2020-01-10 09:27:43.479069', '4', 'UserAddress object', 2, '[{\"changed\": {\"fields\": [\"user\", \"is_default\"]}}]', 13, 2);
INSERT INTO `django_admin_log` VALUES (29, '2020-01-10 09:27:54.050822', '4', 'UserAddress object', 2, '[{\"changed\": {\"fields\": [\"is_valid\"]}}]', 13, 2);
INSERT INTO `django_admin_log` VALUES (30, '2020-01-10 09:36:05.208951', '4', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (31, '2020-01-10 09:36:20.826255', '5', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (32, '2020-01-10 09:38:16.101829', '7', '五粮液股份公司 富贵天下绵纯级 500ml 52度 浓香型白酒', 2, '[{\"changed\": {\"fields\": [\"img\"]}}]', 16, 2);
INSERT INTO `django_admin_log` VALUES (33, '2020-01-11 01:37:43.765481', '5', 'ImageFile object', 2, '[{\"changed\": {\"fields\": [\"object_id\"]}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (34, '2020-01-11 01:37:49.758457', '4', 'ImageFile object', 2, '[{\"changed\": {\"fields\": [\"object_id\"]}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (35, '2020-01-11 01:45:34.673816', '6', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (36, '2020-01-11 01:45:50.339912', '7', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (37, '2020-01-11 01:46:28.645094', '8', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (38, '2020-01-11 01:46:55.481308', '9', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (39, '2020-01-11 01:47:30.386940', '10', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (40, '2020-01-11 01:47:46.812045', '11', 'ImageFile object', 1, '[{\"added\": {}}]', 17, 2);
INSERT INTO `django_admin_log` VALUES (41, '2020-01-11 06:55:41.079001', '3', 'Order object', 3, '', 20, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (12, 'accounts', 'loginrecord');
INSERT INTO `django_content_type` VALUES (9, 'accounts', 'passwdchangelog');
INSERT INTO `django_content_type` VALUES (11, 'accounts', 'user');
INSERT INTO `django_content_type` VALUES (13, 'accounts', 'useraddress');
INSERT INTO `django_content_type` VALUES (10, 'accounts', 'userprofile');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (15, 'mall', 'classify');
INSERT INTO `django_content_type` VALUES (16, 'mall', 'product');
INSERT INTO `django_content_type` VALUES (14, 'mall', 'tag');
INSERT INTO `django_content_type` VALUES (19, 'mine', 'cart');
INSERT INTO `django_content_type` VALUES (18, 'mine', 'comments');
INSERT INTO `django_content_type` VALUES (20, 'mine', 'order');
INSERT INTO `django_content_type` VALUES (25, 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES (26, 'reversion', 'version');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (17, 'system', 'imagefile');
INSERT INTO `django_content_type` VALUES (7, 'system', 'news');
INSERT INTO `django_content_type` VALUES (8, 'system', 'slider');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2020-01-06 02:49:02.845328');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2020-01-06 02:49:03.685082');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2020-01-06 02:49:03.887540');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2020-01-06 02:49:03.897513');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2020-01-06 02:49:04.053097');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0002_alter_permission_name_max_length', '2020-01-06 02:49:04.172777');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0003_alter_user_email_max_length', '2020-01-06 02:49:04.207683');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0004_alter_user_username_opts', '2020-01-06 02:49:04.216660');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0005_alter_user_last_login_null', '2020-01-06 02:49:04.289466');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0006_require_contenttypes_0002', '2020-01-06 02:49:04.295448');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0007_alter_validators_add_error_messages', '2020-01-06 02:49:04.305422');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0008_alter_user_username_max_length', '2020-01-06 02:49:04.381220');
INSERT INTO `django_migrations` VALUES (13, 'sessions', '0001_initial', '2020-01-06 02:49:04.429122');
INSERT INTO `django_migrations` VALUES (14, 'system', '0001_initial', '2020-01-06 02:49:04.499902');
INSERT INTO `django_migrations` VALUES (15, 'accounts', '0001_initial', '2020-01-06 08:07:37.609795');
INSERT INTO `django_migrations` VALUES (16, 'mall', '0001_initial', '2020-01-06 09:27:50.924052');
INSERT INTO `django_migrations` VALUES (17, 'system', '0002_imagefile', '2020-01-06 09:27:51.046724');
INSERT INTO `django_migrations` VALUES (18, 'mine', '0001_initial', '2020-01-06 09:57:51.253284');
INSERT INTO `django_migrations` VALUES (19, 'accounts', '0002_auto_20200109_1121', '2020-01-09 03:21:12.868297');
INSERT INTO `django_migrations` VALUES (20, 'accounts', '0003_auto_20200110_1404', '2020-01-10 06:05:07.578305');
INSERT INTO `django_migrations` VALUES (21, 'mall', '0002_auto_20200110_1404', '2020-01-10 06:05:08.165759');
INSERT INTO `django_migrations` VALUES (22, 'reversion', '0001_squashed_0004_auto_20160611_1202', '2020-01-10 06:05:08.568685');
INSERT INTO `django_migrations` VALUES (23, 'system', '0003_auto_20200110_1404', '2020-01-10 06:05:08.581650');
INSERT INTO `django_migrations` VALUES (24, 'xadmin', '0001_initial', '2020-01-10 06:05:09.076298');
INSERT INTO `django_migrations` VALUES (25, 'xadmin', '0002_log', '2020-01-10 06:05:09.288730');
INSERT INTO `django_migrations` VALUES (26, 'xadmin', '0003_auto_20160715_0100', '2020-01-10 06:05:09.383477');
INSERT INTO `django_migrations` VALUES (27, 'accounts', '0004_auto_20200110_1706', '2020-01-10 09:06:07.069818');
INSERT INTO `django_migrations` VALUES (28, 'mall', '0003_auto_20200110_1706', '2020-01-10 09:06:07.369018');
INSERT INTO `django_migrations` VALUES (29, 'mine', '0002_auto_20200110_1706', '2020-01-10 09:06:07.412901');
INSERT INTO `django_migrations` VALUES (30, 'mall', '0004_auto_20200111_0851', '2020-01-11 00:51:12.375872');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6k2ulf3p0hdrro1ngnr6dzb5hetrcesd', 'MThjZjZmYzMyOTlhYjg5ZDc2ZjIyNDQzMzIzNjZmZmNhOGNkYWFkYTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzIyMjZjMTBlYjlkMDRmZWM5ZDE3MTZmYTg1MDlhNzQxOTkwNGE2IiwiTElTVF9RVUVSWSI6W1sibWFsbCIsInByb2R1Y3QiXSwiX3FfPTg1MDAiXSwid2l6YXJkX3hhZG1pbnVzZXJ3aWRnZXRfYWRtaW5fd2l6YXJkX2Zvcm1fcGx1Z2luIjp7InN0ZXAiOiJXaWRnZXRcdTdjN2JcdTU3OGIiLCJzdGVwX2RhdGEiOnt9LCJzdGVwX2ZpbGVzIjp7fSwiZXh0cmFfZGF0YSI6e319fQ==', '2020-01-24 06:18:08.282933');
INSERT INTO `django_session` VALUES ('afv6dl0vrbtg3wnbicraelx48r5mzi8x', 'YjkwZGU4ZWQyOTQyZGQ3YWVlZTZiMGZhM2IxOGY2MDI4OTY0MTNiNTp7InZlcmlmeV9jb2RlIjoiWEF2ayIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzIyMjZjMTBlYjlkMDRmZWM5ZDE3MTZmYTg1MDlhNzQxOTkwNGE2IiwidXNlcl9pZCI6Mn0=', '2020-02-10 08:09:39.191568');
INSERT INTO `django_session` VALUES ('i9pxap46l5a3u660z3ezp0zg7grs28ec', 'ZTFkNDUxMjEyZWJhZTljYzZiMmI4Mjk1MzJkMTlmNTcxYzZhYTc5NDp7InZlcmlmeV9jb2RlIjoiN1dpcyIsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzIyMjZjMTBlYjlkMDRmZWM5ZDE3MTZmYTg1MDlhNzQxOTkwNGE2In0=', '2020-01-25 00:59:16.435976');
INSERT INTO `django_session` VALUES ('rqxpxkfkyxfntb4vrp1hzizl3nyo9a7m', 'NmE2M2VkNzY4MzcxMjg0OTZiNWM0ZjRjNzg1OTBjM2JjYTI5Y2Y2ZTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzIyMjZjMTBlYjlkMDRmZWM5ZDE3MTZmYTg1MDlhNzQxOTkwNGE2In0=', '2020-01-25 00:43:23.783373');

-- ----------------------------
-- Table structure for mall_classify
-- ----------------------------
DROP TABLE IF EXISTS `mall_classify`;
CREATE TABLE `mall_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reorder` smallint(6) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mall_classify_parent_id_c0e3ac09_fk_mall_classify_id`(`parent_id`) USING BTREE,
  CONSTRAINT `mall_classify_parent_id_c0e3ac09_fk_mall_classify_id` FOREIGN KEY (`parent_id`) REFERENCES `mall_classify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_classify
-- ----------------------------
INSERT INTO `mall_classify` VALUES (1, '1ee2cd070d6c4e4ca380a62dc7f8289e', 'classify/酒.png', 'jszc', '酒水专场', NULL, 0, 1, '2020-01-10 09:07:13.090252', '2020-01-10 09:07:13.090252', NULL);

-- ----------------------------
-- Table structure for mall_product
-- ----------------------------
DROP TABLE IF EXISTS `mall_product`;
CREATE TABLE `mall_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `types` smallint(6) NOT NULL,
  `price` int(11) NOT NULL,
  `origin_price` double NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `buy_link` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reorder` smallint(6) NOT NULL,
  `status` smallint(6) NOT NULL,
  `sku_count` int(11) NOT NULL,
  `remain_count` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `score` double NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product
-- ----------------------------
INSERT INTO `mall_product` VALUES (1, 'b0cc53e48a2d473eb1efd43e4ebfbf03', 'AKG/爱科技 K3003I入耳式三分频男女通用HIFI经典热销耳机', 'AKG参考级殿堂音质 圈铁混合三频', '<p><img alt=\"图片\" src=\"/medias/201902/product/b11.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/b12.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/b13.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/b14.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/b15.jpg\" /></p>', 12, 4999, 4999, '201902/product/main.jpg', NULL, 0, 11, 100, 95, 0, 10, 1, '2019-02-27 06:21:19.794736', '2019-02-28 05:00:50.628252');
INSERT INTO `mall_product` VALUES (2, 'c3f9b45fa953493b95ef7f1d9502d396', '宁美国度i5 8500/GTX1050Ti台式吃鸡电脑主机全套DIY游戏组装整机', '热销64万台 行业爆款 旗舰机', '<p><img alt=\"图片\" src=\"/medias/201902/product/c11.jpg\"><img alt=\"图片\" src=\"/medias/201902/product/c12.jpg\"><img alt=\"图片\" src=\"/medias/201902/product/c13.jpg\"><img alt=\"图片\" src=\"/medias/201902/product/c14.jpg\"></p>', 12, 3999, 3999, '201902/product/c0.jpg', NULL, 0, 11, 100, 100, 0, 10, 1, '2019-02-27 06:41:49.274680', '2019-02-27 06:41:49.274680');
INSERT INTO `mall_product` VALUES (3, '278f5849259b463d960b7ea38a17861c', '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', '法国品牌 菜鸟宁波保税7号仓发货', '<p><img alt=\"图片\" src=\"/medias/201902/product/d11.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/d12.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/d13.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/d14.jpg\" /></p>', 12, 89, 89, '201902/product/d0.jpg', NULL, 0, 11, 1000, 994, 0, 10, 1, '2019-02-27 06:50:24.504798', '2020-01-27 07:57:16.988841');
INSERT INTO `mall_product` VALUES (4, '01b1473e3e98474ca96fe631bcb1ce19', '俞兆林卫衣 男2017春新款运动休闲印花大码潮人卫衣卫裤加厚外套套装男', '【2019春季全场2件8】春款薄绒休闲套头纯色印花连帽大码卫衣套装新款上新！！', '<p><img src=\"/medias/201902/product/xq1.jpg\" /><img src=\"/medias/201902/product/xq2.jpg\" /><img src=\"/medias/201902/product/xq3.jpg\" /><img src=\"/medias/201902/product/xq4.jpg\" /><img src=\"/medias/201902/product/xq5.jpg\" /><img src=\"/medias/201902/product/xq6.jpg\" /><img src=\"/medias/201902/product/xq7.jpg\" /><img src=\"/medias/201902/product/xq8.jpg\" /><img src=\"/medias/201902/product/xq9.jpg\" /></p>', 12, 296, 296, '201902/product/zhutu01.jpg', NULL, 0, 11, 100, 96, 0, 10, 1, '2019-02-27 07:06:49.221879', '2020-01-11 06:53:32.799071');
INSERT INTO `mall_product` VALUES (5, '31ea8d8957f042c78c958c85df4a7445', '洋河蓝色经典 海之蓝42度375ml 2瓶 洋河官方旗舰店 绵柔型白酒', '特优绵柔原酒，绵甜、爽净 酒厂直营', '<p><img alt=\"图片\" src=\"/medias/201902/product/e11.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/d12.jpg\" /></p>', 12, 218, 218, '201902/product/e0.jpg', NULL, 0, 11, 45, 45, 0, 10, 1, '2019-02-27 07:52:42.291366', '2020-01-10 09:08:24.015534');
INSERT INTO `mall_product` VALUES (6, 'cc0dea4d4b2d4e22987fa1fb1f13ea6f', '波龙波士顿龙虾鲜活大龙虾鲜活海鲜水产特大澳洲澳龙特大奥龙超大', '野生龙虾 鲜活发货', '<p><img alt=\"图片\" src=\"/medias/201902/product/f11.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/f12.jpg\" /></p>', 12, 148, 148, '201902/product/f0.jpg', NULL, 0, 11, 30, 30, 0, 10, 1, '2019-02-27 07:59:50.060388', '2020-01-10 07:59:48.712546');
INSERT INTO `mall_product` VALUES (7, '8a326cee56204a45bf6d46e5c66a2438', '五粮液股份公司 富贵天下绵纯级 500ml 52度 浓香型白酒', '富贵天下绵纯级 500ml 52度', '<p><img alt=\"图片\" src=\"/medias/201902/product/g11.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/g12.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/g13.jpg\" /><img alt=\"图片\" src=\"/medias/201902/product/g14.jpg\" /></p>', 11, 1550, 56, '202001/product/五粮液1.jpg', NULL, 0, 11, 45, 45, 0, 10, 1, '2019-02-27 08:06:17.870061', '2020-01-10 09:38:16.093848');

-- ----------------------------
-- Table structure for mall_product_classes
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_classes`;
CREATE TABLE `mall_product_classes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `classify_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mall_product_classes_product_id_classify_id_671eace7_uniq`(`product_id`, `classify_id`) USING BTREE,
  INDEX `mall_product_classes_classify_id_497eccf8_fk_mall_classify_id`(`classify_id`) USING BTREE,
  CONSTRAINT `mall_product_classes_classify_id_497eccf8_fk_mall_classify_id` FOREIGN KEY (`classify_id`) REFERENCES `mall_classify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mall_product_classes_product_id_a4e66a9c_fk_mall_product_id` FOREIGN KEY (`product_id`) REFERENCES `mall_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product_classes
-- ----------------------------
INSERT INTO `mall_product_classes` VALUES (3, 3, 1);
INSERT INTO `mall_product_classes` VALUES (2, 5, 1);
INSERT INTO `mall_product_classes` VALUES (1, 7, 1);

-- ----------------------------
-- Table structure for mall_product_tags
-- ----------------------------
DROP TABLE IF EXISTS `mall_product_tags`;
CREATE TABLE `mall_product_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mall_product_tags_product_id_tag_id_4b930b4b_uniq`(`product_id`, `tag_id`) USING BTREE,
  INDEX `mall_product_tags_tag_id_be3e5033_fk_mall_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `mall_product_tags_product_id_50e37f33_fk_mall_product_id` FOREIGN KEY (`product_id`) REFERENCES `mall_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mall_product_tags_tag_id_be3e5033_fk_mall_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `mall_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_product_tags
-- ----------------------------
INSERT INTO `mall_product_tags` VALUES (1, 3, 1);
INSERT INTO `mall_product_tags` VALUES (2, 3, 2);
INSERT INTO `mall_product_tags` VALUES (7, 4, 1);
INSERT INTO `mall_product_tags` VALUES (8, 4, 3);
INSERT INTO `mall_product_tags` VALUES (9, 5, 1);
INSERT INTO `mall_product_tags` VALUES (10, 5, 2);
INSERT INTO `mall_product_tags` VALUES (11, 5, 3);
INSERT INTO `mall_product_tags` VALUES (5, 6, 1);
INSERT INTO `mall_product_tags` VALUES (6, 6, 3);
INSERT INTO `mall_product_tags` VALUES (3, 7, 1);
INSERT INTO `mall_product_tags` VALUES (4, 7, 2);

-- ----------------------------
-- Table structure for mall_tag
-- ----------------------------
DROP TABLE IF EXISTS `mall_tag`;
CREATE TABLE `mall_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reorder` smallint(6) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mall_tag
-- ----------------------------
INSERT INTO `mall_tag` VALUES (1, '657460aff4aa4644bc0e2bf46b4db524', '', 'jxtj', '精选推荐', 0, 1, '2020-01-10 07:55:31.103589', '2020-01-10 07:55:31.103589');
INSERT INTO `mall_tag` VALUES (2, '357c983454d541b98d6f836df2076aa3', '', 'jstj', '酒水推荐', 0, 1, '2020-01-10 07:58:08.199405', '2020-01-10 07:58:08.199405');
INSERT INTO `mall_tag` VALUES (3, '04bd7ee398d941938bc918618b8c1432', '', 'cnxh', '猜你喜欢', 0, 1, '2020-01-10 07:58:48.951412', '2020-01-10 07:58:48.951412');

-- ----------------------------
-- Table structure for mine_cart
-- ----------------------------
DROP TABLE IF EXISTS `mine_cart`;
CREATE TABLE `mine_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(11) NOT NULL,
  `origin_price` double NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `status` smallint(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mine_cart_order_id_6abe2a51_fk_mine_order_id`(`order_id`) USING BTREE,
  INDEX `mine_cart_product_id_a32304f1_fk_mall_product_id`(`product_id`) USING BTREE,
  INDEX `mine_cart_user_id_80a1cba0_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `mine_cart_order_id_6abe2a51_fk_mine_order_id` FOREIGN KEY (`order_id`) REFERENCES `mine_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_cart_product_id_a32304f1_fk_mall_product_id` FOREIGN KEY (`product_id`) REFERENCES `mall_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_cart_user_id_80a1cba0_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mine_cart
-- ----------------------------
INSERT INTO `mine_cart` VALUES (1, '俞兆林卫衣 男2017春新款运动休闲印花大码潮人卫衣卫裤加厚外套套装男', '201902/product/zhutu01.jpg', 296, 296, 2, 592, 11, '2020-01-11 03:03:31.913613', '2020-01-11 03:03:36.370691', 2, 4, 2);
INSERT INTO `mine_cart` VALUES (3, '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', '201902/product/d0.jpg', 89, 89, 1, 89, 11, '2020-01-11 07:28:22.072412', '2020-01-11 07:28:22.072412', 4, 3, 2);
INSERT INTO `mine_cart` VALUES (4, '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', '201902/product/d0.jpg', 89, 89, 1, 89, 11, '2020-01-27 07:41:22.446736', '2020-01-27 07:41:22.446736', 5, 3, 2);
INSERT INTO `mine_cart` VALUES (5, '【直营】法国Lafite拉菲进口传奇波尔多干红葡萄酒2016珍藏佳酿酒', '201902/product/d0.jpg', 89, 89, 4, 356, 11, '2020-01-27 07:45:26.303449', '2020-01-27 07:57:16.994803', 6, 3, 2);

-- ----------------------------
-- Table structure for mine_order
-- ----------------------------
DROP TABLE IF EXISTS `mine_order`;
CREATE TABLE `mine_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `buy_count` int(11) NOT NULL,
  `buy_amount` double NOT NULL,
  `to_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_area` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `to_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `express_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `express_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mine_order_user_id_44497741_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `mine_order_user_id_44497741_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mine_order
-- ----------------------------
INSERT INTO `mine_order` VALUES (1, '200001', 1, 0, 'leo', '广东省佛山市顺德区', 'xxx小学', '12233444444', NULL, NULL, NULL, 11, 3);
INSERT INTO `mine_order` VALUES (2, '20002', 1, 1, 'leo', '广东省 广州市 天河区', '测试3', '12345678900', NULL, NULL, NULL, 11, 2);
INSERT INTO `mine_order` VALUES (4, '202001111528306594372943', 1, 89, 'leo', '广东省 广州市 天河区', '测试3', '12345678900', NULL, NULL, NULL, 11, 2);
INSERT INTO `mine_order` VALUES (5, '202001271543313948431413', 1, 89, 'leo', '广东省 广州市 天河区', '测试3', '12345678900', NULL, NULL, NULL, 11, 2);
INSERT INTO `mine_order` VALUES (6, '202001271557456701826981', 4, 356, 'leo', '广东省 广州市 天河区', '测试3', '12345678900', NULL, NULL, NULL, 11, 2);

-- ----------------------------
-- Table structure for mine_product_comments
-- ----------------------------
DROP TABLE IF EXISTS `mine_product_comments`;
CREATE TABLE `mine_product_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reorder` smallint(6) NOT NULL,
  `is_anonymous` tinyint(1) NOT NULL,
  `score` double NOT NULL,
  `score_deliver` double NOT NULL,
  `score_package` double NOT NULL,
  `score_speed` double NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mine_product_comments_order_id_4dd83f73_fk_mine_order_id`(`order_id`) USING BTREE,
  INDEX `mine_product_comments_product_id_87a1df8d_fk_mall_product_id`(`product_id`) USING BTREE,
  INDEX `mine_product_comments_user_id_63aa808b_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `mine_product_comments_order_id_4dd83f73_fk_mine_order_id` FOREIGN KEY (`order_id`) REFERENCES `mine_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_product_comments_product_id_87a1df8d_fk_mall_product_id` FOREIGN KEY (`product_id`) REFERENCES `mall_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `mine_product_comments_user_id_63aa808b_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reversion_revision_user_id_17095f45_fk_account_user_id`(`user_id`) USING BTREE,
  INDEX `reversion_revision_date_created_96f7c20c`(`date_created`) USING BTREE,
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `format` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `serialized_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `object_repr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `reversion_version_db_content_type_id_objec_b2c54f65_uniq`(`db`, `content_type_id`, `object_id`, `revision_id`) USING BTREE,
  INDEX `reversion_version_content_type_id_7d0ff25c_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id`(`revision_id`) USING BTREE,
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_images
-- ----------------------------
DROP TABLE IF EXISTS `system_images`;
CREATE TABLE `system_images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `summary` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_images_content_type_id_1c82240b_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  CONSTRAINT `system_images_content_type_id_1c82240b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_images
-- ----------------------------
INSERT INTO `system_images` VALUES (2, '202001/images/卫衣.jpg', '俞兆林卫衣1', 4, 1, '2020-01-10 07:43:44.965276', '2020-01-10 07:43:44.965276', 16);
INSERT INTO `system_images` VALUES (3, '202001/images/卫衣1.jpg', '俞兆林卫衣2', 4, 1, '2020-01-10 07:44:02.405602', '2020-01-10 07:44:02.405602', 16);
INSERT INTO `system_images` VALUES (4, '202001/images/五粮液1.jpg', '五粮液1', 7, 1, '2020-01-10 09:36:05.207985', '2020-01-11 01:37:49.756460', 16);
INSERT INTO `system_images` VALUES (5, '202001/images/五粮液2.jpg', '五粮液2', 7, 1, '2020-01-10 09:36:20.825203', '2020-01-11 01:37:43.761464', 16);
INSERT INTO `system_images` VALUES (6, '202001/images/波士顿龙虾1.jpg', '龙虾1', 6, 1, '2020-01-11 01:45:34.671994', '2020-01-11 01:45:34.671994', 16);
INSERT INTO `system_images` VALUES (7, '202001/images/波士顿龙虾2.jpg', '龙虾2', 6, 1, '2020-01-11 01:45:50.338914', '2020-01-11 01:45:50.338914', 16);
INSERT INTO `system_images` VALUES (8, '202001/images/海之蓝1.jpg', '海之蓝1', 5, 1, '2020-01-11 01:46:28.644095', '2020-01-11 01:46:28.644095', 16);
INSERT INTO `system_images` VALUES (9, '202001/images/海之蓝2.jpg', '海之蓝2', 5, 1, '2020-01-11 01:46:55.480335', '2020-01-11 01:46:55.480335', 16);
INSERT INTO `system_images` VALUES (10, '202001/images/法国干红.jpg', '法国拉菲', 3, 1, '2020-01-11 01:47:30.385970', '2020-01-11 01:47:30.385970', 16);
INSERT INTO `system_images` VALUES (11, '202001/images/法国干红1.jpg', '法国拉菲2', 3, 1, '2020-01-11 01:47:46.810009', '2020-01-11 01:47:46.810009', 16);

-- ----------------------------
-- Table structure for system_news
-- ----------------------------
DROP TABLE IF EXISTS `system_news`;
CREATE TABLE `system_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `types` smallint(6) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reorder` smallint(6) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `view_count` int(11) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_news
-- ----------------------------
INSERT INTO `system_news` VALUES (1, 11, '热烈庆祝积分商城正式上线', '热烈庆祝积分商城正式上线', 1, '2020-01-01 11:05:43.000000', '2020-06-07 11:05:46.000000', 130, 1, 1, '2020-01-06 11:06:26.000000', '2020-01-06 06:58:07.704549');
INSERT INTO `system_news` VALUES (2, 11, '标题0', '内容0', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (3, 11, '标题1', '内容1', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (4, 11, '标题2', '内容2', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (5, 11, '标题3', '内容3', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (6, 11, '标题4', '内容4', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (7, 11, '标题5', '内容5', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (8, 11, '标题6', '内容6', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (9, 11, '标题7', '内容7', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (10, 11, '标题8', '内容8', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (11, 11, '标题9', '内容9', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (12, 11, '标题10', '内容10', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.381400');
INSERT INTO `system_news` VALUES (13, 11, '标题11', '内容11', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.381400', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (14, 11, '标题12', '内容12', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (15, 11, '标题13', '内容13', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (16, 11, '标题14', '内容14', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (17, 11, '标题15', '内容15', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (18, 11, '标题16', '内容16', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (19, 11, '标题17', '内容17', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (20, 11, '标题18', '内容18', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (21, 11, '标题19', '内容19', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (22, 11, '标题20', '内容20', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (23, 11, '标题21', '内容21', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (24, 11, '标题22', '内容22', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (25, 11, '标题23', '内容23', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (26, 11, '标题24', '内容24', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (27, 11, '标题25', '内容25', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (28, 11, '标题26', '内容26', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (29, 11, '标题27', '内容27', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (30, 11, '标题28', '内容28', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (31, 11, '标题29', '内容29', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (32, 11, '标题30', '内容30', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (33, 11, '标题31', '内容31', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (34, 11, '标题32', '内容32', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (35, 11, '标题33', '内容33', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (36, 11, '标题34', '内容34', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (37, 11, '标题35', '内容35', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (38, 11, '标题36', '内容36', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (39, 11, '标题37', '内容37', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (40, 11, '标题38', '内容38', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (41, 11, '标题39', '内容39', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (42, 11, '标题40', '内容40', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (43, 11, '标题41', '内容41', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.382397', '2020-01-06 07:03:33.382397');
INSERT INTO `system_news` VALUES (44, 11, '标题42', '内容42', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (45, 11, '标题43', '内容43', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (46, 11, '标题44', '内容44', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (47, 11, '标题45', '内容45', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (48, 11, '标题46', '内容46', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (49, 11, '标题47', '内容47', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (50, 11, '标题48', '内容48', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (51, 11, '标题49', '内容49', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (52, 11, '标题50', '内容50', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (53, 11, '标题51', '内容51', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (54, 11, '标题52', '内容52', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (55, 11, '标题53', '内容53', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (56, 11, '标题54', '内容54', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (57, 11, '标题55', '内容55', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (58, 11, '标题56', '内容56', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (59, 11, '标题57', '内容57', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (60, 11, '标题58', '内容58', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (61, 11, '标题59', '内容59', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (62, 11, '标题60', '内容60', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (63, 11, '标题61', '内容61', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (64, 11, '标题62', '内容62', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (65, 11, '标题63', '内容63', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (66, 11, '标题64', '内容64', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (67, 11, '标题65', '内容65', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (68, 11, '标题66', '内容66', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (69, 11, '标题67', '内容67', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (70, 11, '标题68', '内容68', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (71, 11, '标题69', '内容69', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (72, 11, '标题70', '内容70', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.383418');
INSERT INTO `system_news` VALUES (73, 11, '标题71', '内容71', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.383418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (74, 11, '标题72', '内容72', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (75, 11, '标题73', '内容73', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (76, 11, '标题74', '内容74', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (77, 11, '标题75', '内容75', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (78, 11, '标题76', '内容76', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (79, 11, '标题77', '内容77', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (80, 11, '标题78', '内容78', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (81, 11, '标题79', '内容79', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (82, 11, '标题80', '内容80', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (83, 11, '标题81', '内容81', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (84, 11, '标题82', '内容82', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (85, 11, '标题83', '内容83', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (86, 11, '标题84', '内容84', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (87, 11, '标题85', '内容85', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (88, 11, '标题86', '内容86', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (89, 11, '标题87', '内容87', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (90, 11, '标题88', '内容88', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (91, 11, '标题89', '内容89', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (92, 11, '标题90', '内容90', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (93, 11, '标题91', '内容91', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (94, 11, '标题92', '内容92', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (95, 11, '标题93', '内容93', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (96, 11, '标题94', '内容94', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (97, 11, '标题95', '内容95', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (98, 11, '标题96', '内容96', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (99, 11, '标题97', '内容97', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (100, 11, '标题98', '内容98', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (101, 11, '标题99', '内容99', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');
INSERT INTO `system_news` VALUES (102, 11, '标题100', '内容100', 0, NULL, NULL, 0, 0, 1, '2020-01-06 07:03:33.384418', '2020-01-06 07:03:33.384418');

-- ----------------------------
-- Table structure for system_slider
-- ----------------------------
DROP TABLE IF EXISTS `system_slider`;
CREATE TABLE `system_slider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `types` smallint(6) NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `reorder` smallint(6) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `end_time` datetime(6) DEFAULT NULL,
  `target_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_slider
-- ----------------------------
INSERT INTO `system_slider` VALUES (1, '面膜', '品牌: LEADERS/丽得姿面膜单品: 美蒂优补水保湿面膜组合装产地: 韩国面膜分类: 贴片式保质期: 3年功效: 补水 保湿化妆品净含量: 20片', 11, '/static/upload/ban1.jpg', 0, NULL, NULL, 'https://detail.tmall.com/item.htm?spm=a230r.1.14.8.2ca33cf1y8QYOR&id=580006637508&ns=1&abbucket=1&skuId=3859170476310', 1, '2020-01-02 10:52:05.000000', '2020-01-06 10:52:10.000000');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 2);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_account_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
