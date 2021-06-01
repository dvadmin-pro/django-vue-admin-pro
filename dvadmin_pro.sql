/*
 Navicat Premium Data Transfer

 Source Server         : 本地服务器
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : dvadmin_pro

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 07/06/2021 10:45:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 4, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 4, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 4, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can view session', 4, 'view_session');
INSERT INTO `auth_permission` VALUES (17, 'Can add 用户表', 5, 'add_users');
INSERT INTO `auth_permission` VALUES (18, 'Can change 用户表', 5, 'change_users');
INSERT INTO `auth_permission` VALUES (19, 'Can delete 用户表', 5, 'delete_users');
INSERT INTO `auth_permission` VALUES (20, 'Can view 用户表', 5, 'view_users');
INSERT INTO `auth_permission` VALUES (21, 'Can add 部门表', 6, 'add_dept');
INSERT INTO `auth_permission` VALUES (22, 'Can change 部门表', 6, 'change_dept');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 部门表', 6, 'delete_dept');
INSERT INTO `auth_permission` VALUES (24, 'Can view 部门表', 6, 'view_dept');
INSERT INTO `auth_permission` VALUES (25, 'Can add 字典表', 7, 'add_dictionary');
INSERT INTO `auth_permission` VALUES (26, 'Can change 字典表', 7, 'change_dictionary');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 字典表', 7, 'delete_dictionary');
INSERT INTO `auth_permission` VALUES (28, 'Can view 字典表', 7, 'view_dictionary');
INSERT INTO `auth_permission` VALUES (29, 'Can add 菜单表', 8, 'add_menu');
INSERT INTO `auth_permission` VALUES (30, 'Can change 菜单表', 8, 'change_menu');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 菜单表', 8, 'delete_menu');
INSERT INTO `auth_permission` VALUES (32, 'Can view 菜单表', 8, 'view_menu');
INSERT INTO `auth_permission` VALUES (33, 'Can add 字典详细表', 9, 'add_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (34, 'Can change 字典详细表', 9, 'change_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 字典详细表', 9, 'delete_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (36, 'Can view 字典详细表', 9, 'view_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (37, 'Can add 角色表', 10, 'add_role');
INSERT INTO `auth_permission` VALUES (38, 'Can change 角色表', 10, 'change_role');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 角色表', 10, 'delete_role');
INSERT INTO `auth_permission` VALUES (40, 'Can view 角色表', 10, 'view_role');
INSERT INTO `auth_permission` VALUES (41, 'Can add 岗位表', 11, 'add_post');
INSERT INTO `auth_permission` VALUES (42, 'Can change 岗位表', 11, 'change_post');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 岗位表', 11, 'delete_post');
INSERT INTO `auth_permission` VALUES (44, 'Can view 岗位表', 11, 'view_post');
INSERT INTO `auth_permission` VALUES (45, 'Can add 权限表', 12, 'add_permission');
INSERT INTO `auth_permission` VALUES (46, 'Can change 权限表', 12, 'change_permission');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 权限表', 12, 'delete_permission');
INSERT INTO `auth_permission` VALUES (48, 'Can view 权限表', 12, 'view_permission');
INSERT INTO `auth_permission` VALUES (49, 'Can add 菜单权限表', 13, 'add_menupermission');
INSERT INTO `auth_permission` VALUES (50, 'Can change 菜单权限表', 13, 'change_menupermission');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 菜单权限表', 13, 'delete_menupermission');
INSERT INTO `auth_permission` VALUES (52, 'Can view 菜单权限表', 13, 'view_menupermission');
INSERT INTO `auth_permission` VALUES (53, 'Can add 权限表', 12, 'add_button');
INSERT INTO `auth_permission` VALUES (54, 'Can change 权限表', 12, 'change_button');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 权限表', 12, 'delete_button');
INSERT INTO `auth_permission` VALUES (56, 'Can view 权限表', 12, 'view_button');
INSERT INTO `auth_permission` VALUES (57, 'Can add 菜单权限表', 13, 'add_menubutton');
INSERT INTO `auth_permission` VALUES (58, 'Can change 菜单权限表', 13, 'change_menubutton');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 菜单权限表', 13, 'delete_menubutton');
INSERT INTO `auth_permission` VALUES (60, 'Can view 菜单权限表', 13, 'view_menubutton');

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (4, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'system', 'button');
INSERT INTO `django_content_type` VALUES (6, 'system', 'dept');
INSERT INTO `django_content_type` VALUES (7, 'system', 'dictionary');
INSERT INTO `django_content_type` VALUES (8, 'system', 'menu');
INSERT INTO `django_content_type` VALUES (13, 'system', 'menubutton');
INSERT INTO `django_content_type` VALUES (11, 'system', 'post');
INSERT INTO `django_content_type` VALUES (10, 'system', 'role');
INSERT INTO `django_content_type` VALUES (9, 'system', 'sysdictionarylist');
INSERT INTO `django_content_type` VALUES (5, 'system', 'users');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-06-01 17:13:51.091278');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-06-01 17:13:51.115680');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2021-06-01 17:13:51.194735');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-06-01 17:13:51.210352');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-06-01 17:13:51.214256');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-06-01 17:13:51.218158');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-06-01 17:13:51.222062');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-06-01 17:13:51.223039');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-06-01 17:13:51.226943');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-06-01 17:13:51.230885');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-06-01 17:13:51.234788');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-06-01 17:13:51.240607');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-06-01 17:13:51.245489');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2021-06-01 17:13:51.249392');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2021-06-01 17:13:51.262078');
INSERT INTO `django_migrations` VALUES (16, 'system', '0001_initial', '2021-06-01 17:13:51.812544');
INSERT INTO `django_migrations` VALUES (17, 'system', '0002_auto_20210602_2111', '2021-06-02 21:11:25.959104');
INSERT INTO `django_migrations` VALUES (18, 'system', '0003_auto_20210602_2118', '2021-06-02 21:18:32.519718');
INSERT INTO `django_migrations` VALUES (19, 'system', '0004_alter_menupermission_menu', '2021-06-04 11:00:55.022964');
INSERT INTO `django_migrations` VALUES (20, 'system', '0005_auto_20210605_0136', '2021-06-05 01:36:24.319788');
INSERT INTO `django_migrations` VALUES (21, 'system', '0006_auto_20210605_0139', '2021-06-05 01:39:14.357078');
INSERT INTO `django_migrations` VALUES (22, 'system', '0007_role_permission', '2021-06-05 02:08:14.541500');

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
-- Table structure for system_button
-- ----------------------------
DROP TABLE IF EXISTS `system_button`;
CREATE TABLE `system_button`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限值',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_permission_creator_id_413e5462`(`creator_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_button
-- ----------------------------
INSERT INTO `system_button` VALUES ('644e9c34-e3d6-4518-b795-a603a6e9a137', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-06-06 11:45:48.034748', '2021-06-06 11:45:48.034748', '单例', 'Retrieve', 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76');
INSERT INTO `system_button` VALUES ('80cb145b-5035-4517-a28a-7d59426f73f8', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-03 00:41:51.382200', '2021-06-03 00:41:51.382200', '新增', 'Create', '456b688c-8ad5-46de-bc2e-d41d8047bd42');
INSERT INTO `system_button` VALUES ('ccc3f35f-c80c-4929-b8cc-67531698f397', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-04 11:21:56.142501', '2021-06-04 11:21:56.142501', '查询', 'Search', '456b688c-8ad5-46de-bc2e-d41d8047bd42');

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `sort` int(11) NOT NULL COMMENT '显示排序',
  `owner` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` int(11) NULL DEFAULT NULL COMMENT '部门状态',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级部门',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_dept_creator_id_bbfb6d95`(`creator_id`) USING BTREE,
  INDEX `system_dept_parent_id_04e6e6fd`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
INSERT INTO `system_dept` VALUES ('d2c03bd9-dad0-4262-88ca-c3681d224fc3', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-05 00:58:29.314965', '2021-06-05 00:58:29.314965', '猿码团队', 1, NULL, NULL, NULL, 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL);
INSERT INTO `system_dept` VALUES ('fd8230ca-67bd-4347-8a9b-57eb19be5d9e', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-05 01:14:12.103891', '2021-06-05 01:14:12.103891', '研发部门', 1, NULL, NULL, NULL, 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'd2c03bd9-dad0-4262-88ca-c3681d224fc3');

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` int(11) NOT NULL COMMENT '状态',
  `sort` int(11) NULL DEFAULT NULL COMMENT '显示排序',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code`(`code`) USING BTREE,
  INDEX `system_dictionary_creator_id_f8c7f9f4`(`creator_id`) USING BTREE,
  INDEX `system_dictionary_parent_id_bbcfeb45`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_dictionary_detail
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary_detail`;
CREATE TABLE `system_dictionary_detail`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示名称',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实际值',
  `status` int(11) NOT NULL COMMENT '状态',
  `remark` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `dict_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联主表',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_dictionary_detail_creator_id_faa15e80`(`creator_id`) USING BTREE,
  INDEX `system_dictionary_detail_dict_id_b34cd202`(`dict_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '显示排序',
  `is_link` int(11) NOT NULL COMMENT '是否外链',
  `web_path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由地址',
  `status` int(11) NOT NULL COMMENT '菜单状态',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级菜单',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_menu_creator_id_d58495af`(`creator_id`) USING BTREE,
  INDEX `system_menu_parent_id_c715739f`(`parent_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('4236eb70-1558-43a0-9cf2-037230c547f9', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-05 16:16:34.858889', '2021-06-05 16:16:34.858889', '', '部门管理', 1, 0, '/dept', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('54f769b0-3dff-416c-8102-e55ec44827cc', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-02 22:12:38.358235', '2021-06-02 22:12:38.358235', NULL, '系统管理', 1, 0, NULL, 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL);
INSERT INTO `system_menu` VALUES ('56c3f341-4f46-4b04-9cfc-c8a14701707e', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-04 12:38:37.895726', '2021-06-02 22:51:55.154016', '', '菜单管理', 1, 0, '/menu', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('5a05450c-cec2-4819-8d54-e0d6f6aac3a6', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-04 12:58:46.192352', '2021-06-04 12:51:37.603817', '', '用户管理', 1, 0, '', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');

-- ----------------------------
-- Table structure for system_menu_button
-- ----------------------------
DROP TABLE IF EXISTS `system_menu_button`;
CREATE TABLE `system_menu_button`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限值',
  `api` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口地址',
  `method` int(11) NULL DEFAULT NULL COMMENT '接口请求方法',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联菜单',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_menu_permission_menu_id_c5eb0137_fk_system_menu_id`(`menu_id`) USING BTREE,
  INDEX `system_menu_permission_creator_id_775ada8a`(`creator_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu_button
-- ----------------------------
INSERT INTO `system_menu_button` VALUES ('10610c56-cec2-4774-9468-e1c763e59e70', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-05 16:28:26.635170', '2021-06-05 16:28:26.635170', '新增', 'Create', '/api/system/dept/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_menu_button` VALUES ('1e76ca9d-0547-4e26-b034-12c93b36d7ec', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-04 11:24:32.855914', '2021-06-04 11:24:32.855914', '查询', 'Search', '/api/system/menu/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_menu_button` VALUES ('305c8675-d2af-48b0-8d57-c75a2bee7bf7', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-06-06 12:20:08.838406', '2021-06-06 12:20:08.838406', '单例', 'Retrieve', '/api/system/user/(?P<pk>.*?)/aaa', 0, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_menu_button` VALUES ('43696212-ecba-4e66-8678-33c9bc935c76', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-06-06 11:06:43.274667', '2021-06-06 11:06:43.274667', '查询', 'Search', '/api/system/user/', 0, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_menu_button` VALUES ('6732bfe7-9283-49f9-b260-f570366c5a2b', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-04 10:49:12.515571', '2021-06-04 10:49:12.515571', '新增', 'Create', '/api/system/menu/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_menu_button` VALUES ('ae48bda9-aaea-4cb4-a0c8-e10eff579a28', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-06-06 11:06:31.917649', '2021-06-06 11:06:31.917649', '新增', 'Create', '/api/system/user/', 1, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `sort` int(11) NOT NULL COMMENT '岗位顺序',
  `status` int(11) NOT NULL COMMENT '岗位状态',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_post_creator_id_e3f13f28`(`creator_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限字符',
  `sort` int(11) NOT NULL COMMENT '角色顺序',
  `status` int(11) NOT NULL COMMENT '角色状态',
  `admin` int(11) NOT NULL COMMENT '是否为admin',
  `data_range` int(11) NOT NULL COMMENT '数据权限范围',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `system_role_creator_id_ea515370`(`creator_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role
-- ----------------------------
INSERT INTO `system_role` VALUES ('35b58d98-b506-4f93-be79-ed1e109da071', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-06 18:34:15.599664', '2021-06-06 09:40:55.460289', '简单用户', 'public', 1, 1, 0, 4, NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42');
INSERT INTO `system_role` VALUES ('36001d1a-1b3e-4413-bdfe-b3bc04375f46', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-05 16:16:59.536606', '2021-06-04 22:48:52.662859', '管理员', 'admin', 1, 1, 1, 4, NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42');

-- ----------------------------
-- Table structure for system_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_role_dept`;
CREATE TABLE `system_role_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dept_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_role_dept_role_id_dept_id_e50efeba_uniq`(`role_id`, `dept_id`) USING BTREE,
  INDEX `system_role_dept_role_id_b44a7cef`(`role_id`) USING BTREE,
  INDEX `system_role_dept_dept_id_f2f8d11a`(`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------
INSERT INTO `system_role_dept` VALUES (4, '35b58d98-b506-4f93-be79-ed1e109da071', 'd2c03bd9-dad0-4262-88ca-c3681d224fc3');
INSERT INTO `system_role_dept` VALUES (3, '35b58d98-b506-4f93-be79-ed1e109da071', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e');
INSERT INTO `system_role_dept` VALUES (1, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', 'd2c03bd9-dad0-4262-88ca-c3681d224fc3');
INSERT INTO `system_role_dept` VALUES (2, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e');

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menu_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_role_menu_role_id_menu_id_bceffeea_uniq`(`role_id`, `menu_id`) USING BTREE,
  INDEX `system_role_menu_role_id_381c2e52`(`role_id`) USING BTREE,
  INDEX `system_role_menu_menu_id_400f4f82`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
INSERT INTO `system_role_menu` VALUES (7, '35b58d98-b506-4f93-be79-ed1e109da071', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_role_menu` VALUES (8, '35b58d98-b506-4f93-be79-ed1e109da071', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_role_menu` VALUES (6, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_role_menu` VALUES (1, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_role_menu` VALUES (5, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_role_menu` VALUES (4, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');

-- ----------------------------
-- Table structure for system_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_role_permission`;
CREATE TABLE `system_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `menubutton_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_role_permission_role_id_menubutton_id_5fb41eb5_uniq`(`role_id`, `menubutton_id`) USING BTREE,
  INDEX `system_role_permission_role_id_ca5e9412`(`role_id`) USING BTREE,
  INDEX `system_role_permission_menubutton_id_aef88309`(`menubutton_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_role_permission
-- ----------------------------
INSERT INTO `system_role_permission` VALUES (16, '35b58d98-b506-4f93-be79-ed1e109da071', '43696212-ecba-4e66-8678-33c9bc935c76');
INSERT INTO `system_role_permission` VALUES (13, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '1e76ca9d-0547-4e26-b034-12c93b36d7ec');
INSERT INTO `system_role_permission` VALUES (11, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '6732bfe7-9283-49f9-b260-f570366c5a2b');

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users`  (
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL COMMENT 'Designates that this user has all permissions without explicitly assigning them.',
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL COMMENT 'Designates whether the user can log into this admin site.',
  `is_active` tinyint(1) NOT NULL COMMENT 'Designates whether this user should be treated as active. Unselect this instead of deleting accounts.',
  `date_joined` datetime(6) NOT NULL,
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) NULL DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别',
  `creator_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `dept_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联部门',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `system_users_creator_id_610a4b11`(`creator_id`) USING BTREE,
  INDEX `system_users_dept_id_9060c641`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_users
-- ----------------------------
INSERT INTO `system_users` VALUES ('pbkdf2_sha256$260000$Q60dvTUcDJAiVzvZMPSYyV$9ZFqbjqTDa5U4GGubAh1xX+YDKsqm5AU8GCficncr5I=', NULL, 0, '', '', 0, 1, '2021-06-06 10:19:26.000000', '2457d43b-bb74-4ac6-94ae-454acf1f0160', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-06-06 11:49:33.153610', '2021-06-06 10:19:26.377959', 'test', '', NULL, NULL, '测试', 1, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e');
INSERT INTO `system_users` VALUES ('pbkdf2_sha256$260000$oE0tnjC7PRIV6aCEah0J1F$scZo6l2/kekoClW8jZ6bM4PmSXevb4qzqHLro8PvzLc=', NULL, 1, '', '', 1, 1, '2021-06-01 17:14:17.000000', '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, NULL, NULL, '2021-06-06 10:03:13.685385', '2021-06-01 17:14:17.424568', 'superadmin', '1638245306@qq.com', NULL, NULL, '超级管理员', 1, NULL, NULL);
INSERT INTO `system_users` VALUES ('pbkdf2_sha256$260000$oE0tnjC7PRIV6aCEah0J1F$scZo6l2/kekoClW8jZ6bM4PmSXevb4qzqHLro8PvzLc=', NULL, 0, '', '', 0, 1, '2021-06-06 09:52:27.000000', 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-06 10:09:25.465915', '2021-06-06 09:52:27.857521', 'demo', '', NULL, NULL, 'demo', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e');

-- ----------------------------
-- Table structure for system_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `system_users_groups`;
CREATE TABLE `system_users_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_users_groups_users_id_group_id_7483be9d_uniq`(`users_id`, `group_id`) USING BTREE,
  INDEX `system_users_groups_group_id_13685d93_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `system_users_groups_group_id_13685d93_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `system_users_groups_users_id_3c266c8f_fk_system_users_id` FOREIGN KEY (`users_id`) REFERENCES `system_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_users_post
-- ----------------------------
DROP TABLE IF EXISTS `system_users_post`;
CREATE TABLE `system_users_post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `post_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_users_post_users_id_post_id_1932458d_uniq`(`users_id`, `post_id`) USING BTREE,
  INDEX `system_users_post_users_id_5046a91b`(`users_id`) USING BTREE,
  INDEX `system_users_post_post_id_6560916c`(`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_users_role
-- ----------------------------
DROP TABLE IF EXISTS `system_users_role`;
CREATE TABLE `system_users_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_users_role_users_id_role_id_efdd1ca1_uniq`(`users_id`, `role_id`) USING BTREE,
  INDEX `system_users_role_users_id_898e5d39`(`users_id`) USING BTREE,
  INDEX `system_users_role_role_id_056fc093`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_users_role
-- ----------------------------
INSERT INTO `system_users_role` VALUES (10, '2457d43b-bb74-4ac6-94ae-454acf1f0160', '35b58d98-b506-4f93-be79-ed1e109da071');
INSERT INTO `system_users_role` VALUES (11, '2457d43b-bb74-4ac6-94ae-454acf1f0160', '36001d1a-1b3e-4413-bdfe-b3bc04375f46');
INSERT INTO `system_users_role` VALUES (1, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', '35b58d98-b506-4f93-be79-ed1e109da071');

-- ----------------------------
-- Table structure for system_users_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `system_users_user_permissions`;
CREATE TABLE `system_users_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `system_users_user_permis_users_id_permission_id_84c282cb_uniq`(`users_id`, `permission_id`) USING BTREE,
  INDEX `system_users_user_pe_permission_id_691fa57c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `system_users_user_pe_permission_id_691fa57c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `system_users_user_pe_users_id_1cfa57c2_fk_system_us` FOREIGN KEY (`users_id`) REFERENCES `system_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
