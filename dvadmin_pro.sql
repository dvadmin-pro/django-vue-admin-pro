/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : dvadmin_pro

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 17/07/2021 13:31:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
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
INSERT INTO `auth_permission` VALUES (33, 'Can add 菜单权限表', 9, 'add_menubutton');
INSERT INTO `auth_permission` VALUES (34, 'Can change 菜单权限表', 9, 'change_menubutton');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 菜单权限表', 9, 'delete_menubutton');
INSERT INTO `auth_permission` VALUES (36, 'Can view 菜单权限表', 9, 'view_menubutton');
INSERT INTO `auth_permission` VALUES (37, 'Can add 字典详细表', 10, 'add_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (38, 'Can change 字典详细表', 10, 'change_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 字典详细表', 10, 'delete_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (40, 'Can view 字典详细表', 10, 'view_sysdictionarylist');
INSERT INTO `auth_permission` VALUES (41, 'Can add 角色表', 11, 'add_role');
INSERT INTO `auth_permission` VALUES (42, 'Can change 角色表', 11, 'change_role');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 角色表', 11, 'delete_role');
INSERT INTO `auth_permission` VALUES (44, 'Can view 角色表', 11, 'view_role');
INSERT INTO `auth_permission` VALUES (45, 'Can add 岗位表', 12, 'add_post');
INSERT INTO `auth_permission` VALUES (46, 'Can change 岗位表', 12, 'change_post');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 岗位表', 12, 'delete_post');
INSERT INTO `auth_permission` VALUES (48, 'Can view 岗位表', 12, 'view_post');
INSERT INTO `auth_permission` VALUES (49, 'Can add 操作日志', 13, 'add_operationlog');
INSERT INTO `auth_permission` VALUES (50, 'Can change 操作日志', 13, 'change_operationlog');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 操作日志', 13, 'delete_operationlog');
INSERT INTO `auth_permission` VALUES (52, 'Can view 操作日志', 13, 'view_operationlog');
INSERT INTO `auth_permission` VALUES (53, 'Can add 登录日志', 14, 'add_loginlog');
INSERT INTO `auth_permission` VALUES (54, 'Can change 登录日志', 14, 'change_loginlog');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 登录日志', 14, 'delete_loginlog');
INSERT INTO `auth_permission` VALUES (56, 'Can view 登录日志', 14, 'view_loginlog');
INSERT INTO `auth_permission` VALUES (57, 'Can add 权限表', 15, 'add_button');
INSERT INTO `auth_permission` VALUES (58, 'Can change 权限表', 15, 'change_button');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 权限表', 15, 'delete_button');
INSERT INTO `auth_permission` VALUES (60, 'Can view 权限表', 15, 'view_button');
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (4, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (15, 'system', 'button');
INSERT INTO `django_content_type` VALUES (6, 'system', 'dept');
INSERT INTO `django_content_type` VALUES (7, 'system', 'dictionary');
INSERT INTO `django_content_type` VALUES (14, 'system', 'loginlog');
INSERT INTO `django_content_type` VALUES (8, 'system', 'menu');
INSERT INTO `django_content_type` VALUES (9, 'system', 'menubutton');
INSERT INTO `django_content_type` VALUES (13, 'system', 'operationlog');
INSERT INTO `django_content_type` VALUES (12, 'system', 'post');
INSERT INTO `django_content_type` VALUES (11, 'system', 'role');
INSERT INTO `django_content_type` VALUES (10, 'system', 'sysdictionarylist');
INSERT INTO `django_content_type` VALUES (5, 'system', 'users');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-07-17 00:44:49.845675');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-07-17 00:44:49.888471');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2021-07-17 00:44:49.990779');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-07-17 00:44:50.015827');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-07-17 00:44:50.020966');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-07-17 00:44:50.025975');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-07-17 00:44:50.031351');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-07-17 00:44:50.032960');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-07-17 00:44:50.038418');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-07-17 00:44:50.043623');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-07-17 00:44:50.049858');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-07-17 00:44:50.065081');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-07-17 00:44:50.072934');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2021-07-17 00:44:50.080590');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2021-07-17 00:44:50.109924');
INSERT INTO `django_migrations` VALUES (16, 'system', '0001_initial', '2021-07-17 00:44:50.881882');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_button
-- ----------------------------
DROP TABLE IF EXISTS `system_button`;
CREATE TABLE `system_button` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) NOT NULL COMMENT '权限名称',
  `value` varchar(64) NOT NULL COMMENT '权限值',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `system_button_creator_id_2b6b251e` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_button
-- ----------------------------
BEGIN;
INSERT INTO `system_button` VALUES ('4547b93a-36b9-410d-987c-3c52a9b51156', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-27 12:38:11.692049', '2021-06-27 12:38:11.692049', '编辑', 'Update', '456b688c-8ad5-46de-bc2e-d41d8047bd42');
INSERT INTO `system_button` VALUES ('4a410769-6b0a-4ed3-90f0-b5d89a6f802c', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-27 13:28:11.893765', '2021-06-27 13:28:11.893765', '删除', 'Delete', '456b688c-8ad5-46de-bc2e-d41d8047bd42');
INSERT INTO `system_button` VALUES ('644e9c34-e3d6-4518-b795-a603a6e9a137', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-06-06 11:45:48.034748', '2021-06-06 11:45:48.034748', '单例', 'Retrieve', 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76');
INSERT INTO `system_button` VALUES ('80cb145b-5035-4517-a28a-7d59426f73f8', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-03 00:41:51.382200', '2021-06-03 00:41:51.382200', '新增', 'Create', '456b688c-8ad5-46de-bc2e-d41d8047bd42');
INSERT INTO `system_button` VALUES ('ccc3f35f-c80c-4929-b8cc-67531698f397', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-06-04 11:21:56.142501', '2021-06-04 11:21:56.142501', '查询', 'Search', '456b688c-8ad5-46de-bc2e-d41d8047bd42');
COMMIT;

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) NOT NULL COMMENT '部门名称',
  `sort` int(11) NOT NULL COMMENT '显示排序',
  `owner` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `status` int(11) DEFAULT NULL COMMENT '部门状态',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '上级部门',
  PRIMARY KEY (`id`),
  KEY `system_dept_creator_id_bbfb6d95` (`creator_id`),
  KEY `system_dept_parent_id_04e6e6fd` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_dept
-- ----------------------------
BEGIN;
INSERT INTO `system_dept` VALUES ('cae96ade-7483-4827-bb0d-d2bd63ec1cc4', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 13:00:37.496908', '2021-07-17 13:00:37.496925', '财务部门', 2, NULL, NULL, NULL, 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'd2c03bd9-dad0-4262-88ca-c3681d224fc3');
INSERT INTO `system_dept` VALUES ('d2c03bd9-dad0-4262-88ca-c3681d224fc3', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 13:04:02.102264', '2021-06-05 00:58:29.314965', 'dvadmin团队', 1, '', '', '', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL);
INSERT INTO `system_dept` VALUES ('fd8230ca-67bd-4347-8a9b-57eb19be5d9e', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-04 22:43:51.718537', '2021-06-05 01:14:12.103891', '研发部门', 1, '', '', '', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'd2c03bd9-dad0-4262-88ca-c3681d224fc3');
COMMIT;

-- ----------------------------
-- Table structure for system_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `status` int(11) NOT NULL COMMENT '状态',
  `sort` int(11) DEFAULT NULL COMMENT '显示排序',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '父级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `system_dictionary_creator_id_f8c7f9f4` (`creator_id`),
  KEY `system_dictionary_parent_id_bbcfeb45` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_dictionary_detail
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary_detail`;
CREATE TABLE `system_dictionary_detail` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `code` varchar(100) DEFAULT NULL COMMENT '编码',
  `label` varchar(100) DEFAULT NULL COMMENT '显示名称',
  `value` varchar(100) DEFAULT NULL COMMENT '实际值',
  `status` int(11) NOT NULL COMMENT '状态',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `dict_id` varchar(255) DEFAULT NULL COMMENT '关联主表',
  PRIMARY KEY (`id`),
  KEY `system_dictionary_detail_creator_id_faa15e80` (`creator_id`),
  KEY `system_dictionary_detail_dict_id_b34cd202` (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_dictionary_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `system_login_log`;
CREATE TABLE `system_login_log` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `session_id` varchar(64) DEFAULT NULL COMMENT '会话标识',
  `browser` varchar(64) NOT NULL COMMENT '浏览器',
  `ipaddr` varchar(32) DEFAULT NULL COMMENT 'ip地址',
  `loginLocation` varchar(64) DEFAULT NULL COMMENT '登录位置',
  `msg` longtext COMMENT '操作信息',
  `os` varchar(64) DEFAULT NULL COMMENT '操作系统',
  `status` tinyint(1) NOT NULL COMMENT '登录状态',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `system_login_log_creator_id_1c6a4055` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `icon` varchar(64) DEFAULT NULL COMMENT '菜单图标',
  `name` varchar(64) NOT NULL COMMENT '菜单名称',
  `sort` int(11) DEFAULT NULL COMMENT '显示排序',
  `is_link` int(11) NOT NULL COMMENT '是否外链',
  `web_path` varchar(128) DEFAULT NULL COMMENT '路由地址',
  `status` int(11) NOT NULL COMMENT '菜单状态',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '上级菜单',
  PRIMARY KEY (`id`),
  KEY `system_menu_creator_id_d58495af` (`creator_id`),
  KEY `system_menu_parent_id_c715739f` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_menu` VALUES ('151035da-77a3-4a62-b474-fce6824571fb', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:39:34.737112', '2021-07-17 12:38:42.812786', 'support', '按钮管理', 6, 0, '/button', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('15c9ebc5-d12f-470a-a560-938a7dc57570', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:07:05.183453', '2021-06-09 10:43:19.385482', 'users', '角色管理', 3, 0, '/role', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('4236eb70-1558-43a0-9cf2-037230c547f9', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:10:51.739396', '2021-06-05 16:16:34.858889', 'university', '部门管理', 1, 0, '/dept', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('4ba07859-8b73-4524-a1a6-bbff36d98337', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:36:07.990116', '2021-06-09 10:48:07.558080', 'gears', '操作日志', 1, 0, '/operationLog', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'c236fb6b-ddaa-4deb-b79b-16e42d9f347f');
INSERT INTO `system_menu` VALUES ('54f769b0-3dff-416c-8102-e55ec44827cc', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 11:07:00.194417', '2021-06-02 22:12:38.358235', 'briefcase', '系统管理', 1, 0, '', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL);
INSERT INTO `system_menu` VALUES ('56c3f341-4f46-4b04-9cfc-c8a14701707e', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:11:00.077287', '2021-06-02 22:51:55.154016', 'reorder', '菜单管理', 2, 0, '/menu', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('5a05450c-cec2-4819-8d54-e0d6f6aac3a6', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:50:23.102500', '2021-06-04 12:51:37.603817', 'user', '用户管理', 5, 0, '/user', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('a607e820-36e5-45c0-aabf-85a8e4e2c7ac', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:11:16.426537', '2021-06-09 10:44:16.755044', 'user-plus', '权限管理', 4, 0, '/rolePermission', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_menu` VALUES ('c236fb6b-ddaa-4deb-b79b-16e42d9f347f', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 11:26:03.514553', '2021-06-09 10:44:30.279128', 'clock-o', '日志管理', 1, 0, '', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL);
COMMIT;

-- ----------------------------
-- Table structure for system_menu_button
-- ----------------------------
DROP TABLE IF EXISTS `system_menu_button`;
CREATE TABLE `system_menu_button` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `value` varchar(64) NOT NULL COMMENT '权限值',
  `api` varchar(64) NOT NULL COMMENT '接口地址',
  `method` int(11) DEFAULT NULL COMMENT '接口请求方法',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `menu_id` varchar(255) NOT NULL COMMENT '关联菜单',
  PRIMARY KEY (`id`),
  KEY `system_menu_button_creator_id_c3d89b15` (`creator_id`),
  KEY `system_menu_button_menu_id_eb56b604` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_menu_button
-- ----------------------------
BEGIN;
INSERT INTO `system_menu_button` VALUES ('0209de89-6b9f-4d8a-84d3-ccfc3cc8b4da', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:50:45.039191', '2021-07-17 12:50:45.039205', '编辑', 'Update', '/api/system/button/{id}/', 2, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '151035da-77a3-4a62-b474-fce6824571fb');
INSERT INTO `system_menu_button` VALUES ('04896a47-0f3a-4e2f-a111-bfe15f9e31c5', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:46:07.321625', '2021-07-17 10:46:07.321639', '编辑', 'Update', '/api/system/menu/{id}/', 2, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_menu_button` VALUES ('0d931efc-2f80-418f-b4a0-5251f0a88f69', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:58:08.238545', '2021-07-17 12:58:08.238560', '新增', 'Create', '/api/system/operation_log/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4ba07859-8b73-4524-a1a6-bbff36d98337');
INSERT INTO `system_menu_button` VALUES ('10610c56-cec2-4774-9468-e1c763e59e70', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:55:11.490204', '2021-06-05 16:28:26.635170', '新增', 'Create', '/api/system/dept/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_menu_button` VALUES ('140166e2-471e-455e-9dcd-05cebbbab95d', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:49:52.726649', '2021-07-17 10:49:52.726664', '查询', 'Search', '/api/system/role/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '15c9ebc5-d12f-470a-a560-938a7dc57570');
INSERT INTO `system_menu_button` VALUES ('14e7088f-a39b-47ae-bd67-b9bbcabae96b', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:52:16.902106', '2021-07-17 12:52:16.902121', '单例', 'Retrieve', '/api/system/user/{id}/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_menu_button` VALUES ('1b4f27a7-8ab8-4388-ae57-46e29976cf0e', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:51:00.946869', '2021-07-17 12:51:00.946886', '新增', 'Create', '/api/system/button/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '151035da-77a3-4a62-b474-fce6824571fb');
INSERT INTO `system_menu_button` VALUES ('2a3d4756-4d51-4129-b3c4-b2c7a00dbb8a', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:49:13.037449', '2021-07-17 10:49:13.037465', '新增', 'Create', '/api/system/role/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '15c9ebc5-d12f-470a-a560-938a7dc57570');
INSERT INTO `system_menu_button` VALUES ('37462e31-3cdf-4576-af10-5958f53b1bef', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:57:46.808056', '2021-07-17 12:57:46.808070', '查询', 'Search', '/api/system/operation_log/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4ba07859-8b73-4524-a1a6-bbff36d98337');
INSERT INTO `system_menu_button` VALUES ('3e11db64-b8e8-4558-963b-71d063a7db16', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:54:58.223479', '2021-07-17 11:02:29.479193', '编辑', 'Update', '/api/system/dept/{id}/', 2, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_menu_button` VALUES ('3fd6ae6c-fd76-4465-b2b6-db672f4bd79e', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:49:22.565619', '2021-07-17 10:49:22.565633', '删除', 'Delete', '/api/system/role/{id}/', 3, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '15c9ebc5-d12f-470a-a560-938a7dc57570');
INSERT INTO `system_menu_button` VALUES ('42ad6e05-7c84-444f-bcae-09de84f4988b', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:46:23.910311', '2021-07-17 10:46:23.910325', '查询', 'Search', '/api/system/menu/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_menu_button` VALUES ('43696212-ecba-4e66-8678-33c9bc935c76', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-06-06 11:06:43.274667', '2021-06-06 11:06:43.274667', '查询', 'Search', '/api/system/user/', 0, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_menu_button` VALUES ('51085c21-2279-490f-8878-594f059f7616', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:51:16.974687', '2021-07-17 12:51:16.974701', '删除', 'Delete', '/api/system/button/{id}/', 3, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '151035da-77a3-4a62-b474-fce6824571fb');
INSERT INTO `system_menu_button` VALUES ('57fda7d5-7419-4006-85d9-afa19d31b872', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-18 16:47:35.020984', '2021-07-18 16:47:35.021010', '编辑', 'Update', '/api/system/role/{id}/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'a607e820-36e5-45c0-aabf-85a8e4e2c7ac');
INSERT INTO `system_menu_button` VALUES ('6208f412-6bca-4d7b-a5a0-0103b7ba6091', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:51:09.632072', '2021-07-17 12:51:09.632088', '单例', 'Retrieve', '/api/system/button/{id}/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '151035da-77a3-4a62-b474-fce6824571fb');
INSERT INTO `system_menu_button` VALUES ('6300774a-d19c-43ad-8102-d7bf341eff33', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:55:17.280261', '2021-07-17 11:02:52.329081', '单例', 'Retrieve', '/api/system/dept/{id}/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_menu_button` VALUES ('646e9790-24f5-4606-abc4-0b5eede12f66', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:55:05.951783', '2021-07-17 11:02:41.535815', '查询', 'Search', '/api/system/dept/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_menu_button` VALUES ('875bdfeb-0c34-441d-8ee3-bb93c21e17dd', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:52:04.793328', '2021-07-17 12:52:04.793345', '编辑', 'Update', '/api/system/user/{id}/', 2, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_menu_button` VALUES ('8ae924bd-576c-4ae1-92eb-b0a98148baae', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:45:33.371343', '2021-07-17 10:45:33.371359', '删除', 'Delete', '/api/system/menu/{id}/', 3, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_menu_button` VALUES ('8b7a0e79-a6ef-4946-87c6-8c042b887e1c', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:58:19.684635', '2021-07-17 12:58:19.684649', '单例', 'Retrieve', '/api/system/operation_log/{id}/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4ba07859-8b73-4524-a1a6-bbff36d98337');
INSERT INTO `system_menu_button` VALUES ('96022ae5-6425-47b9-8f89-01edc33eb2b7', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-04 00:03:30.775861', '2021-07-02 23:52:35.484180', '单例', 'Retrieve', '/api/system/role/{id}/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '15c9ebc5-d12f-470a-a560-938a7dc57570');
INSERT INTO `system_menu_button` VALUES ('9fc8436a-1996-478f-a155-5de7939a54dc', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 11:04:25.133327', '2021-07-17 11:04:25.133342', '新增', 'Create', '/api/system/user/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_menu_button` VALUES ('abe5c07f-0cab-4053-ac24-e782792e9d7f', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:45:21.579633', '2021-07-17 10:45:21.579647', '新增', 'Create', '/api/system/menu/', 1, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_menu_button` VALUES ('acfde861-1872-47e2-a1f1-abeda5175b7f', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:58:35.498998', '2021-07-17 12:58:35.499012', '删除', 'Delete', '/api/system/operation_log/{id}/', 3, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4ba07859-8b73-4524-a1a6-bbff36d98337');
INSERT INTO `system_menu_button` VALUES ('af60d628-73b1-4c5d-b34e-7c70ab9bd87e', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:50:52.569062', '2021-07-17 12:50:52.569078', '查询', 'Search', '/api/system/button/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '151035da-77a3-4a62-b474-fce6824571fb');
INSERT INTO `system_menu_button` VALUES ('b10f7d08-2592-4b54-8557-b5ca864a029a', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:55:23.691347', '2021-07-17 10:56:57.452581', '删除', 'Delete', '/api/system/dept/{id}/', 3, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_menu_button` VALUES ('bb7de9ee-5fd1-46f5-9849-088c522f49c7', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:52:26.321220', '2021-07-17 12:52:26.321237', '删除', 'Delete', '/api/system/user/{id}/', 3, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_menu_button` VALUES ('d22c0176-96e0-48b3-b81e-13443f306af5', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:49:34.390066', '2021-07-17 10:49:34.390080', '编辑', 'Update', '/api/system/role/{id}/', 2, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '15c9ebc5-d12f-470a-a560-938a7dc57570');
INSERT INTO `system_menu_button` VALUES ('e6b93920-2236-46ec-841b-cff6f63ce788', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 12:57:35.483738', '2021-07-17 12:57:35.483752', '编辑', 'Update', '/api/system/operation_log/{id}/', 2, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '4ba07859-8b73-4524-a1a6-bbff36d98337');
INSERT INTO `system_menu_button` VALUES ('fcbe4cec-cc2d-436d-92ba-023f8c9ad31c', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 10:46:40.845109', '2021-07-17 10:46:40.845123', '单例', 'Retrieve', '/api/system/menu/{id}/', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
COMMIT;

-- ----------------------------
-- Table structure for system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `system_operation_log`;
CREATE TABLE `system_operation_log` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `request_modular` varchar(64) DEFAULT NULL COMMENT '请求模块',
  `request_path` varchar(400) DEFAULT NULL COMMENT '请求地址',
  `request_body` longtext COMMENT '请求参数',
  `request_method` varchar(8) DEFAULT NULL COMMENT '请求方式',
  `request_msg` longtext COMMENT '操作说明',
  `request_ip` varchar(32) DEFAULT NULL COMMENT '请求ip地址',
  `request_browser` varchar(64) DEFAULT NULL COMMENT '请求浏览器',
  `response_code` varchar(32) DEFAULT NULL COMMENT '响应状态码',
  `request_os` varchar(64) DEFAULT NULL COMMENT '操作系统',
  `json_result` longtext COMMENT '返回信息',
  `status` tinyint(1) NOT NULL COMMENT '响应状态',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `system_operation_log_creator_id_5407dfa5` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_operation_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_post
-- ----------------------------
DROP TABLE IF EXISTS `system_post`;
CREATE TABLE `system_post` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) NOT NULL COMMENT '岗位名称',
  `code` varchar(32) NOT NULL COMMENT '岗位编码',
  `sort` int(11) NOT NULL COMMENT '岗位顺序',
  `status` int(11) NOT NULL COMMENT '岗位状态',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `system_post_creator_id_e3f13f28` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role` (
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `key` varchar(64) NOT NULL COMMENT '权限字符',
  `sort` int(11) NOT NULL COMMENT '角色顺序',
  `status` int(11) NOT NULL COMMENT '角色状态',
  `admin` int(11) NOT NULL COMMENT '是否为admin',
  `data_range` int(11) NOT NULL COMMENT '数据权限范围',
  `remark` longtext COMMENT '备注',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `system_role_creator_id_ea515370` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_role
-- ----------------------------
BEGIN;
INSERT INTO `system_role` VALUES ('35b58d98-b506-4f93-be79-ed1e109da071', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 13:04:30.034532', '2021-06-06 09:40:55.460289', '普通用户', 'public', 2, 1, 0, 3, NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42');
INSERT INTO `system_role` VALUES ('36001d1a-1b3e-4413-bdfe-b3bc04375f46', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 13:23:01.184794', '2021-06-04 22:48:52.662859', '管理员', 'admin', 1, 1, 1, 4, NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42');
COMMIT;

-- ----------------------------
-- Table structure for system_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_role_dept`;
CREATE TABLE `system_role_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) NOT NULL,
  `dept_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_role_dept_role_id_dept_id_e50efeba_uniq` (`role_id`,`dept_id`),
  KEY `system_role_dept_role_id_b44a7cef` (`role_id`),
  KEY `system_role_dept_dept_id_f2f8d11a` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `system_role_dept` VALUES (1, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', 'd2c03bd9-dad0-4262-88ca-c3681d224fc3');
INSERT INTO `system_role_dept` VALUES (2, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e');
COMMIT;

-- ----------------------------
-- Table structure for system_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_role_menu`;
CREATE TABLE `system_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) NOT NULL,
  `menu_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_role_menu_role_id_menu_id_bceffeea_uniq` (`role_id`,`menu_id`),
  KEY `system_role_menu_role_id_381c2e52` (`role_id`),
  KEY `system_role_menu_menu_id_400f4f82` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `system_role_menu` VALUES (9, '35b58d98-b506-4f93-be79-ed1e109da071', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_role_menu` VALUES (8, '35b58d98-b506-4f93-be79-ed1e109da071', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
INSERT INTO `system_role_menu` VALUES (6, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '4236eb70-1558-43a0-9cf2-037230c547f9');
INSERT INTO `system_role_menu` VALUES (1, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '54f769b0-3dff-416c-8102-e55ec44827cc');
INSERT INTO `system_role_menu` VALUES (5, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '56c3f341-4f46-4b04-9cfc-c8a14701707e');
INSERT INTO `system_role_menu` VALUES (4, '36001d1a-1b3e-4413-bdfe-b3bc04375f46', '5a05450c-cec2-4819-8d54-e0d6f6aac3a6');
COMMIT;

-- ----------------------------
-- Table structure for system_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `system_role_permission`;
CREATE TABLE `system_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) NOT NULL,
  `menubutton_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_role_permission_role_id_menubutton_id_5fb41eb5_uniq` (`role_id`,`menubutton_id`),
  KEY `system_role_permission_role_id_ca5e9412` (`role_id`),
  KEY `system_role_permission_menubutton_id_aef88309` (`menubutton_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `system_role_permission` VALUES (16, '35b58d98-b506-4f93-be79-ed1e109da071', '43696212-ecba-4e66-8678-33c9bc935c76');
COMMIT;

-- ----------------------------
-- Table structure for system_users
-- ----------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE `system_users` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL COMMENT 'Designates that this user has all permissions without explicitly assigning them.',
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL COMMENT 'Designates whether the user can log into this admin site.',
  `is_active` tinyint(1) NOT NULL COMMENT 'Designates whether this user should be treated as active. Unselect this instead of deleting accounts.',
  `date_joined` datetime(6) NOT NULL,
  `id` varchar(255) NOT NULL COMMENT 'Id',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `modifier` varchar(255) DEFAULT NULL COMMENT '修改人',
  `dept_belong_id` varchar(255) DEFAULT NULL COMMENT '数据归属部门',
  `update_datetime` datetime(6) DEFAULT NULL COMMENT '修改时间',
  `create_datetime` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `username` varchar(150) NOT NULL COMMENT '用户账号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `name` varchar(40) NOT NULL COMMENT '姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `creator_id` varchar(255) DEFAULT NULL COMMENT '创建人',
  `dept_id` varchar(255) DEFAULT NULL COMMENT '关联部门',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `system_users_creator_id_610a4b11` (`creator_id`),
  KEY `system_users_dept_id_9060c641` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_users
-- ----------------------------
BEGIN;
INSERT INTO `system_users` VALUES ('pbkdf2_sha256$260000$Q60dvTUcDJAiVzvZMPSYyV$9ZFqbjqTDa5U4GGubAh1xX+YDKsqm5AU8GCficncr5I=', NULL, 0, '', '', 0, 1, '2021-06-06 10:19:26.000000', '2457d43b-bb74-4ac6-94ae-454acf1f0160', NULL, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e', '2021-07-03 17:38:30.993187', '2021-06-06 10:19:26.377959', 'test', '', NULL, NULL, '测试', 1, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e');
INSERT INTO `system_users` VALUES ('pbkdf2_sha256$260000$oE0tnjC7PRIV6aCEah0J1F$scZo6l2/kekoClW8jZ6bM4PmSXevb4qzqHLro8PvzLc=', NULL, 1, '', '', 1, 1, '2021-06-01 17:14:17.000000', '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, NULL, NULL, '2021-06-06 10:03:13.685385', '2021-06-01 17:14:17.424568', 'superadmin', '1638245306@qq.com', NULL, NULL, '超级管理员', 1, NULL, NULL);
INSERT INTO `system_users` VALUES ('pbkdf2_sha256$260000$oE0tnjC7PRIV6aCEah0J1F$scZo6l2/kekoClW8jZ6bM4PmSXevb4qzqHLro8PvzLc=', NULL, 0, '', '', 0, 0, '2021-06-06 09:52:27.000000', 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-04 22:28:41.747561', '2021-06-06 09:52:27.857521', 'demo', '', NULL, NULL, 'demo', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'fd8230ca-67bd-4347-8a9b-57eb19be5d9e');
INSERT INTO `system_users` VALUES ('pbkdf2_sha256$260000$DO6dpT8e4Ls0yD51grncC8$KZfswxNJ8MILTWwy+bicRyU7Q3PKC4orn4SJbhIkN4Q=', NULL, 0, '', '', 0, 1, '2021-07-03 17:44:50.000000', 'd1431450-5068-4461-b57e-7862c005a547', NULL, '456b688c-8ad5-46de-bc2e-d41d8047bd42', NULL, '2021-07-17 11:07:32.198959', '2021-07-03 17:44:50.230548', 'admin', '', NULL, NULL, '管理员', 0, '456b688c-8ad5-46de-bc2e-d41d8047bd42', 'd2c03bd9-dad0-4262-88ca-c3681d224fc3');
COMMIT;

-- ----------------------------
-- Table structure for system_users_groups
-- ----------------------------
DROP TABLE IF EXISTS `system_users_groups`;
CREATE TABLE `system_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_users_groups_users_id_group_id_7483be9d_uniq` (`users_id`,`group_id`),
  KEY `system_users_groups_group_id_13685d93_fk_auth_group_id` (`group_id`),
  CONSTRAINT `system_users_groups_group_id_13685d93_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `system_users_groups_users_id_3c266c8f_fk_system_users_id` FOREIGN KEY (`users_id`) REFERENCES `system_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_users_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_users_post
-- ----------------------------
DROP TABLE IF EXISTS `system_users_post`;
CREATE TABLE `system_users_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) NOT NULL,
  `post_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_users_post_users_id_post_id_1932458d_uniq` (`users_id`,`post_id`),
  KEY `system_users_post_users_id_5046a91b` (`users_id`),
  KEY `system_users_post_post_id_6560916c` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_users_post
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for system_users_role
-- ----------------------------
DROP TABLE IF EXISTS `system_users_role`;
CREATE TABLE `system_users_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_users_role_users_id_role_id_efdd1ca1_uniq` (`users_id`,`role_id`),
  KEY `system_users_role_users_id_898e5d39` (`users_id`),
  KEY `system_users_role_role_id_056fc093` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_users_role
-- ----------------------------
BEGIN;
INSERT INTO `system_users_role` VALUES (10, '2457d43b-bb74-4ac6-94ae-454acf1f0160', '35b58d98-b506-4f93-be79-ed1e109da071');
INSERT INTO `system_users_role` VALUES (1, 'bcb411ce-13ff-4a2a-8eda-fcdd243a7f76', '35b58d98-b506-4f93-be79-ed1e109da071');
INSERT INTO `system_users_role` VALUES (14, 'd1431450-5068-4461-b57e-7862c005a547', '35b58d98-b506-4f93-be79-ed1e109da071');
COMMIT;

-- ----------------------------
-- Table structure for system_users_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `system_users_user_permissions`;
CREATE TABLE `system_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` varchar(255) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_users_user_permis_users_id_permission_id_84c282cb_uniq` (`users_id`,`permission_id`),
  KEY `system_users_user_pe_permission_id_691fa57c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `system_users_user_pe_permission_id_691fa57c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `system_users_user_pe_users_id_1cfa57c2_fk_system_us` FOREIGN KEY (`users_id`) REFERENCES `system_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of system_users_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
