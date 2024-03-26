/*
 Navicat Premium Data Transfer

 Source Server         : Blog
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : 192.168.68.207:3308
 Source Schema         : xiaohai_blog_initial

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 26/03/2024 22:51:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_article
-- ----------------------------
DROP TABLE IF EXISTS `b_article`;
CREATE TABLE `b_article`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `category_id` int NULL DEFAULT NULL COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章标题',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文章简介',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面',
  `text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `is_push` int NULL DEFAULT 0 COMMENT '是否发布(0否，1是)',
  `is_top` int NULL DEFAULT 0 COMMENT '是否顶置(0否，1是)',
  `top_time` datetime NULL DEFAULT NULL COMMENT '顶置时间',
  `is_original` int NULL DEFAULT 0 COMMENT '是否原创 (0原创，1转载)',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转载地址',
  `page_view` int NULL DEFAULT 0 COMMENT '浏览量',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_article
-- ----------------------------

-- ----------------------------
-- Table structure for b_article_like
-- ----------------------------
DROP TABLE IF EXISTS `b_article_like`;
CREATE TABLE `b_article_like`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` int NOT NULL COMMENT '文章id',
  `user_id` int NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户文章点赞表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_article_like
-- ----------------------------

-- ----------------------------
-- Table structure for b_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_article_tag`;
CREATE TABLE `b_article_tag`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签关联' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for b_category
-- ----------------------------
DROP TABLE IF EXISTS `b_category`;
CREATE TABLE `b_category`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分类名称',
  `click` int NULL DEFAULT 0 COMMENT '点击次数',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_category
-- ----------------------------

-- ----------------------------
-- Table structure for b_comment
-- ----------------------------
DROP TABLE IF EXISTS `b_comment`;
CREATE TABLE `b_comment`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父id',
  `article_id` int NOT NULL COMMENT '文章id(0 代表留言)',
  `user_id` int NOT NULL COMMENT '评论人id',
  `reply_user_id` int NULL DEFAULT NULL COMMENT '回复人id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '评论内容',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_comment
-- ----------------------------

-- ----------------------------
-- Table structure for b_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `b_friend_link`;
CREATE TABLE `b_friend_link`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NOT NULL COMMENT '用户id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站地址',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '站长邮箱',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '下架原因',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '审核状态（0-待审核,1-通过,2-未通过）',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '友情链接表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_friend_link
-- ----------------------------

-- ----------------------------
-- Table structure for b_notifications
-- ----------------------------
DROP TABLE IF EXISTS `b_notifications`;
CREATE TABLE `b_notifications`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NOT NULL COMMENT '用户id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知类型',
  `article_id` int NULL DEFAULT NULL COMMENT '文章id',
  `comment_id` int NULL DEFAULT NULL COMMENT '评论id',
  `like_id` int NULL DEFAULT NULL COMMENT '喜欢id',
  `link_id` int NULL DEFAULT NULL COMMENT '友链id',
  `feedback_id` int NULL DEFAULT NULL COMMENT '反馈id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_read` int NULL DEFAULT 0 COMMENT '是否已读(0否，1是)',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统通知' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_notifications
-- ----------------------------

-- ----------------------------
-- Table structure for b_tags
-- ----------------------------
DROP TABLE IF EXISTS `b_tags`;
CREATE TABLE `b_tags`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签名称',
  `click` int NULL DEFAULT 0 COMMENT '点击次数',
  `sort` int NULL DEFAULT 0 COMMENT '排序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_tags
-- ----------------------------

-- ----------------------------
-- Table structure for file_manager
-- ----------------------------
DROP TABLE IF EXISTS `file_manager`;
CREATE TABLE `file_manager`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int NOT NULL DEFAULT 0 COMMENT '父id目录关联',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名称',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件地址',
  `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `file_size` int NULL DEFAULT 0 COMMENT '文件大小',
  `file_hash` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件内容哈希',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of file_manager
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站logo',
  `name` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站描述',
  `record_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ICP备案号',
  `security_record_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公安备案号',
  `email_message` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '消息邮箱通知（0开启，1关闭）',
  `email_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `email_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱发件人',
  `email_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱授权码',
  `email_port` int NULL DEFAULT NULL COMMENT '邮箱发送端口',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '本地文件地址',
  `disk_size` bigint NOT NULL DEFAULT 0 COMMENT '存储容量',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '关于介绍',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '/system/favicon.ico', 'DoteCode', 'DotCode | 点码', 'DoteCode,点码,开源博客,Java技术分享,Spring教程', '一个专注于技术分享的博客平台，大家以共同学习，乐于分享，拥抱开源的价值观进行学习交流', '', NULL, '1', 'smtp.qq.com', '1372195290@qq.com', '', 587, 'C:/Users/wangchenghai/Pictures/files/', 104857600, '# 欢迎来到我的博客！\n这里是一个分享知识、记录生活、思考未来的平台。\n\n在这里，我将和大家分享我对于生活、职场、学习等各个方面的见解和心得体会，希望能够为大家提供有价值的帮助和启发。\n\n同时，我也会在博客中记录我的生活点滴、分享我的兴趣爱好、思考我的未来规划，希望能够通过这种方式与大家建立更加亲近的关系。\n\n感谢您的光临，希望我的博客能够给您带来不一样的体验和收获！\n\n', 1, '2023-02-02 10:34:11', 1, '2024-02-03 16:33:08');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_sort` int NULL DEFAULT NULL COMMENT '字典排序',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `dict_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典标签',
  `dict_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典键值',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `style` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, 'sys_user_sex', '女', '0', '0', 'success', NULL, 1, '2023-02-26 13:12:00', 1, '2023-03-19 22:26:36');
INSERT INTO `sys_dict_data` VALUES (2, 2, 'sys_user_sex', '男', '1', '0', 'success', NULL, 1, '2023-02-26 21:18:43', 1, '2023-03-19 22:26:47');
INSERT INTO `sys_dict_data` VALUES (3, 3, 'sys_user_sex', '未知', '2', '0', 'warning', NULL, 1, '2023-02-26 21:41:13', 1, '2023-03-01 11:09:57');
INSERT INTO `sys_dict_data` VALUES (4, 1, 'sys_normal_disable', '正常', '0', '0', 'success', NULL, 1, '2023-02-27 10:37:38', 1, '2023-03-01 15:03:21');
INSERT INTO `sys_dict_data` VALUES (5, 2, 'sys_normal_disable', '停用', '1', '0', 'warning', NULL, 1, '2023-02-27 10:37:49', 1, '2023-03-01 15:03:21');
INSERT INTO `sys_dict_data` VALUES (6, 0, 'sys_request_method', 'POST', 'POST', '0', '', '', 1, '2023-03-30 17:52:52', 1, '2023-03-30 18:13:00');
INSERT INTO `sys_dict_data` VALUES (7, 0, 'sys_request_method', 'DELETE', 'DELETE', '0', 'danger', '', 1, '2023-03-30 17:56:58', 1, '2023-03-30 17:59:16');
INSERT INTO `sys_dict_data` VALUES (8, 0, 'sys_request_method', 'GET', 'GET', '0', 'success', '', 1, '2023-03-30 17:57:13', 1, '2023-03-30 17:59:16');
INSERT INTO `sys_dict_data` VALUES (9, 0, 'sys_request_method', 'PUT', 'PUT', '0', 'warning', '', 1, '2023-03-30 17:57:26', 1, '2023-03-30 17:59:16');
INSERT INTO `sys_dict_data` VALUES (10, 0, 'sys_check_state', '待审核', '0', '0', 'warning', '', 1, '2023-07-03 16:01:33', 1, '2023-07-03 16:01:33');
INSERT INTO `sys_dict_data` VALUES (11, 1, 'sys_check_state', '已通过', '1', '0', 'success', '', 1, '2023-07-03 16:02:03', 1, '2023-08-03 12:46:36');
INSERT INTO `sys_dict_data` VALUES (12, 2, 'sys_check_state', '未通过', '2', '0', 'danger', '', 1, '2023-07-03 16:02:18', 1, '2023-07-03 16:02:18');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', '用户性别', 1, '2023-02-25 21:52:09', 1, '2023-02-27 17:22:36');
INSERT INTO `sys_dict_type` VALUES (2, '系统状态', 'sys_normal_disable', '0', '系统状态\n', 1, '2023-02-26 09:07:02', 1, '2023-03-01 15:03:21');
INSERT INTO `sys_dict_type` VALUES (3, '请求方式', 'sys_request_method', '0', '请求方式', 1, '2023-03-30 17:52:00', 1, '2023-03-30 17:59:16');
INSERT INTO `sys_dict_type` VALUES (4, '审核状态', 'sys_check_state', '0', '审核状态', 1, '2023-07-03 16:00:34', 1, '2023-07-03 16:01:08');

-- ----------------------------
-- Table structure for sys_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sys_feedback`;
CREATE TABLE `sys_feedback`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NOT NULL COMMENT '用户id',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '反馈内容',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0-待审核,1-已通过,2-未通过）',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户反馈' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '模块名称',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求url',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '主机地址',
  `oper_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `oper_browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '返回参数',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '错误消息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1异常）',
  `created_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int NULL DEFAULT 0 COMMENT '父菜单ID',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `menu_sort` int NULL DEFAULT NULL COMMENT '显示顺序',
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, 'el-icon-s-tools', 1, '系统管理', 'M', 'system', '', '', '0', 1, '2023-03-02 11:30:16', 1, '2023-04-04 09:36:38');
INSERT INTO `sys_menu` VALUES (2, 1, 'tree-table', 3, '菜单管理', 'C', 'menu', 'system/menu/index', '', '0', 1, '2023-03-02 13:17:28', 1, '2023-03-05 12:38:36');
INSERT INTO `sys_menu` VALUES (3, 1, 'user', 1, '用户管理', 'C', 'user', 'system/user/index', '', '0', 1, '2023-03-02 15:52:57', 1, '2023-03-06 11:54:17');
INSERT INTO `sys_menu` VALUES (4, 1, 'peoples', 2, '角色管理', 'C', 'role', 'system/role/index', '', '0', 1, '2023-03-02 16:23:39', 1, '2023-03-05 12:38:32');
INSERT INTO `sys_menu` VALUES (5, 1, 'el-icon-s-order', 4, '字典管理', 'C', 'dictType', 'system/dict/type/index', '', '0', 1, '2023-03-02 17:05:03', 1, '2023-03-05 12:38:39');
INSERT INTO `sys_menu` VALUES (6, 0, 'el-icon-cpu', 2, '系统监控', 'M', 'monitor', '', '', '0', 1, '2023-03-02 17:11:55', 1, '2023-04-04 09:36:48');
INSERT INTO `sys_menu` VALUES (7, 6, 'el-icon-stopwatch', 1, '系统服务', 'C', 'server', 'monitor/server/index', '', '0', 1, '2023-03-02 17:15:15', 1, '2023-03-05 12:38:45');
INSERT INTO `sys_menu` VALUES (8, 6, 'el-icon-user', 2, '在线用户', 'C', 'online', 'monitor/online/index', '', '0', 1, '2023-03-02 17:18:26', 1, '2023-03-05 12:42:04');
INSERT INTO `sys_menu` VALUES (9, 1, 'el-icon-s-claim', 5, '字典数据', 'C', 'dictData/:id', 'system/dict/data/index', '', '0', 1, '2023-03-06 10:54:05', 1, '2023-03-06 10:54:05');
INSERT INTO `sys_menu` VALUES (10, 3, '', 1, '新增', 'F', '', '', 'system:user:add', '0', 1, '2023-03-06 11:17:09', 1, '2023-03-06 11:17:09');
INSERT INTO `sys_menu` VALUES (11, 3, '', 2, '更新', 'F', '', '', 'system:user:update', '0', 1, '2023-03-06 11:26:29', 1, '2023-03-06 11:26:29');
INSERT INTO `sys_menu` VALUES (12, 3, '', 3, '删除', 'F', '', '', 'system:user:delete', '0', 1, '2023-03-06 11:31:19', 1, '2023-03-06 11:31:19');
INSERT INTO `sys_menu` VALUES (13, 3, '', 0, '列表', 'F', '', '', 'system:user:list', '0', 1, '2023-03-06 11:54:33', 1, '2023-03-06 11:54:33');
INSERT INTO `sys_menu` VALUES (14, 4, '', 0, '列表', 'F', '', '', 'system:role:list', '0', 1, '2023-03-06 11:56:48', 1, '2023-03-06 11:56:48');
INSERT INTO `sys_menu` VALUES (15, 4, '', 1, '新增', 'F', '', '', 'system:role:add', '0', 1, '2023-03-06 11:58:19', 1, '2023-03-06 11:58:19');
INSERT INTO `sys_menu` VALUES (16, 4, '', 2, '更新', 'F', '', '', 'system:role:update', '0', 1, '2023-03-06 11:58:54', 1, '2023-03-06 11:58:54');
INSERT INTO `sys_menu` VALUES (17, 4, '', 3, '删除', 'F', '', '', 'system:role:delete', '0', 1, '2023-03-06 11:59:49', 1, '2023-03-06 11:59:49');
INSERT INTO `sys_menu` VALUES (18, 2, '', 0, '列表', 'F', '', '', 'system:menu:list', '0', 1, '2023-03-06 13:18:09', 1, '2023-03-06 13:18:28');
INSERT INTO `sys_menu` VALUES (19, 2, '', 1, '新增', 'F', '', '', 'system:menu:add', '0', 1, '2023-03-06 13:18:40', 1, '2023-03-06 13:18:40');
INSERT INTO `sys_menu` VALUES (20, 2, '', 2, '更新', 'F', '', '', 'system:menu:update', '0', 1, '2023-03-06 13:18:58', 1, '2023-03-06 13:18:58');
INSERT INTO `sys_menu` VALUES (21, 2, '', 3, '删除', 'F', '', '', 'system:menu:delete', '0', 1, '2023-03-06 13:19:12', 1, '2023-03-06 13:19:12');
INSERT INTO `sys_menu` VALUES (22, 5, '', 0, '列表', 'F', '', '', 'system:dict:list', '0', 1, '2023-03-06 13:21:30', 1, '2023-03-06 13:21:30');
INSERT INTO `sys_menu` VALUES (23, 5, '', 1, '新增', 'F', '', '', 'system:dict:add', '0', 1, '2023-03-06 13:21:45', 1, '2023-03-06 13:21:45');
INSERT INTO `sys_menu` VALUES (24, 5, '', 3, '删除', 'F', '', '', 'system:dict:delete', '0', 1, '2023-03-06 13:22:00', 1, '2023-03-06 13:22:00');
INSERT INTO `sys_menu` VALUES (25, 5, '', 2, '更新', 'F', '', '', 'system:dict:update', '0', 1, '2023-03-06 13:22:16', 1, '2023-03-06 13:22:16');
INSERT INTO `sys_menu` VALUES (26, 9, '', 0, '列表', 'F', '', '', 'dict:data:list', '0', 1, '2023-03-06 13:22:48', 1, '2023-03-06 13:22:48');
INSERT INTO `sys_menu` VALUES (27, 9, '', 1, '新增', 'F', '', '', 'dict:data:add', '0', 1, '2023-03-06 13:23:02', 1, '2023-03-06 13:23:02');
INSERT INTO `sys_menu` VALUES (28, 9, '', 2, '更新', 'F', '', '', 'dict:data:update', '0', 1, '2023-03-06 13:23:18', 1, '2023-03-06 13:23:18');
INSERT INTO `sys_menu` VALUES (29, 9, '', 3, '删除', 'F', '', '', 'dict:data:delete', '0', 1, '2023-03-06 13:23:39', 1, '2023-03-06 13:23:39');
INSERT INTO `sys_menu` VALUES (30, 5, '', 4, '刷新缓存', 'F', '', '', 'system:dict:clean', '0', 1, '2023-03-06 13:42:13', 1, '2023-03-06 13:42:32');
INSERT INTO `sys_menu` VALUES (31, 1, 'el-icon-s-tools', 2, '系统配置', 'C', 'config', 'system/config/index', '', '0', 1, '2023-03-08 14:15:33', 1, '2023-03-08 14:15:53');
INSERT INTO `sys_menu` VALUES (32, 0, 'el-icon-files', 3, '文件管理', 'M', 'file', '', '', '0', 1, '2023-03-18 11:53:52', 1, '2023-03-31 17:56:06');
INSERT INTO `sys_menu` VALUES (33, 32, 'el-icon-folder-opened', 0, '文件详情', 'C', 'files', 'file/files/index', '', '0', 1, '2023-03-18 11:57:26', 1, '2023-03-18 12:09:05');
INSERT INTO `sys_menu` VALUES (34, 32, 'el-icon-delete', 2, '回收站', 'C', 'delete', 'file/delete/index', '', '1', 1, '2023-03-18 12:09:56', 1, '2024-02-03 16:33:37');
INSERT INTO `sys_menu` VALUES (35, 1, 'el-icon-info', 5, '日志管理', 'C', 'log', 'system/log/index', '', '0', 1, '2023-03-30 15:58:04', 1, '2023-03-30 15:58:49');
INSERT INTO `sys_menu` VALUES (36, 35, '', 0, '列表', 'F', '', '', 'system:log:list', '0', 1, '2023-03-30 16:15:16', 1, '2023-03-30 16:15:16');
INSERT INTO `sys_menu` VALUES (37, 35, '', 1, '删除', 'F', '', '', 'system:log:delete', '0', 1, '2023-03-30 16:15:42', 1, '2023-03-30 16:15:42');
INSERT INTO `sys_menu` VALUES (38, 35, '', 2, '清空', 'F', '', '', 'system:log:clean', '0', 1, '2023-03-30 16:16:51', 1, '2023-03-30 16:17:04');
INSERT INTO `sys_menu` VALUES (39, 31, '', 0, '查看', 'F', '', '', 'system:config:select', '0', 1, '2023-03-31 11:04:08', 1, '2023-03-31 11:04:08');
INSERT INTO `sys_menu` VALUES (40, 31, '', 1, '保存', 'F', '', '', 'system:config:save', '0', 1, '2023-03-31 11:04:58', 1, '2023-03-31 11:04:58');
INSERT INTO `sys_menu` VALUES (41, 0, 'edit', 0, '文章管理', 'M', 'note', '', '', '0', 1, '2023-03-31 17:55:49', 1, '2023-03-31 17:59:32');
INSERT INTO `sys_menu` VALUES (42, 41, 'el-icon-collection-tag', 4, '标签管理', 'C', 'tags', 'note/tags/index', '', '0', 1, '2023-03-31 17:59:09', 1, '2023-07-03 15:50:53');
INSERT INTO `sys_menu` VALUES (43, 42, '', 0, '列表', 'F', '', '', 'note:tags:list', '0', 1, '2023-04-03 13:25:39', 1, '2023-04-03 13:25:39');
INSERT INTO `sys_menu` VALUES (44, 42, '', 1, '新增', 'F', '', '', 'note:tags:add', '0', 1, '2023-04-03 13:25:53', 1, '2023-04-03 13:25:57');
INSERT INTO `sys_menu` VALUES (45, 42, '', 2, '更新', 'F', '', '', 'note:tags:update', '0', 1, '2023-04-03 13:26:15', 1, '2023-04-03 13:26:15');
INSERT INTO `sys_menu` VALUES (46, 42, '', 3, '删除', 'F', '', '', 'note:tags:delete', '0', 1, '2023-04-03 13:26:35', 1, '2023-04-03 13:26:35');
INSERT INTO `sys_menu` VALUES (47, 41, 'el-icon-price-tag', 3, '分类管理', 'C', 'category', 'note/category/index', '', '0', 1, '2023-04-03 13:28:22', 1, '2023-04-07 11:00:36');
INSERT INTO `sys_menu` VALUES (48, 47, '', 0, '列表', 'F', '', '', 'note:category:list', '0', 1, '2023-04-03 13:53:48', 1, '2023-04-03 13:53:48');
INSERT INTO `sys_menu` VALUES (49, 47, '', 1, '新增', 'F', '', '', 'note:category:add', '0', 1, '2023-04-03 13:54:09', 1, '2023-04-03 13:54:09');
INSERT INTO `sys_menu` VALUES (50, 47, '', 2, '更新', 'F', '', '', 'note:category:update', '0', 1, '2023-04-03 13:54:29', 1, '2023-04-03 13:54:29');
INSERT INTO `sys_menu` VALUES (51, 47, '', 3, '删除', 'F', '', '', 'note:category:delete', '0', 1, '2023-04-03 13:55:00', 1, '2023-04-03 13:55:00');
INSERT INTO `sys_menu` VALUES (52, 41, 'el-icon-document', 0, '文章中心', 'C', 'article', 'note/article/index', '', '0', 1, '2023-04-04 14:26:20', 1, '2023-04-07 16:37:27');
INSERT INTO `sys_menu` VALUES (53, 52, '', 0, '列表', 'F', '', '', 'note:article:list', '0', 1, '2023-04-04 14:33:19', 1, '2023-04-04 14:33:19');
INSERT INTO `sys_menu` VALUES (54, 52, '', 1, '新增', 'F', '', '', 'note:article:add', '0', 1, '2023-04-04 14:33:59', 1, '2023-04-04 14:33:59');
INSERT INTO `sys_menu` VALUES (55, 52, '', 2, '更新', 'F', '', '', 'note:article:update', '0', 1, '2023-04-04 14:34:15', 1, '2023-04-04 14:34:15');
INSERT INTO `sys_menu` VALUES (56, 52, '', 3, '删除', 'F', '', '', 'note:article:delete', '0', 1, '2023-04-04 14:34:45', 1, '2023-04-04 14:34:45');
INSERT INTO `sys_menu` VALUES (57, 41, 'el-icon-edit', 1, '写作中心', 'C', 'edit', 'note/edit/index', '', '0', 1, '2023-04-06 17:36:31', 1, '2023-04-07 16:37:23');
INSERT INTO `sys_menu` VALUES (58, 52, '', 4, '是否顶置', 'F', '', '', 'note:article:top', '0', 1, '2023-04-08 21:34:32', 1, '2023-04-08 21:34:32');
INSERT INTO `sys_menu` VALUES (59, 52, '', 5, '是否发布', 'F', '', '', 'note:article:push', '0', 1, '2023-04-08 21:34:51', 1, '2023-04-08 21:34:51');
INSERT INTO `sys_menu` VALUES (65, 8, '', 0, '列表', 'F', '', '', 'monitor:online:list', '0', 1, '2023-04-13 13:22:58', 1, '2023-04-13 13:22:58');
INSERT INTO `sys_menu` VALUES (66, 8, '', 1, '退出', 'F', '', '', 'monitor:online:delete', '0', 1, '2023-04-13 13:23:18', 1, '2023-04-13 13:23:18');
INSERT INTO `sys_menu` VALUES (67, 41, 'el-icon-message', 5, '留言管理', 'C', 'comment', 'note/comment/index', '', '0', 1, '2023-05-25 21:03:38', 1, '2023-05-25 22:53:26');
INSERT INTO `sys_menu` VALUES (68, 67, '', 0, '列表', 'F', '', '', 'note:comment:list', '0', 1, '2023-05-28 08:37:42', 1, '2023-05-28 08:38:16');
INSERT INTO `sys_menu` VALUES (69, 67, '', 1, '新增', 'F', '', '', 'note:comment:add', '0', 1, '2023-05-28 08:38:32', 1, '2023-07-03 15:52:03');
INSERT INTO `sys_menu` VALUES (70, 67, '', 2, '删除', 'F', '', '', 'note:comment:delete', '0', 1, '2023-05-28 08:39:01', 1, '2023-05-28 08:39:01');
INSERT INTO `sys_menu` VALUES (71, 41, 'like', 2, '喜欢文章', 'C', 'like', 'note/like/index', '', '0', 1, '2023-07-03 10:39:29', 1, '2023-07-03 15:50:40');
INSERT INTO `sys_menu` VALUES (72, 71, '', 0, '列表', 'F', '', '', 'note:like:list', '0', 1, '2023-07-03 10:40:49', 1, '2023-07-03 13:28:03');
INSERT INTO `sys_menu` VALUES (73, 71, '', 2, '删除', 'F', '', '', 'note:like:delete', '0', 1, '2023-07-03 10:41:10', 1, '2023-07-03 13:28:12');
INSERT INTO `sys_menu` VALUES (74, 71, '', 1, '新增', 'F', '', '', 'note:like:add', '0', 1, '2023-07-03 10:42:47', 1, '2023-07-03 13:28:08');
INSERT INTO `sys_menu` VALUES (75, 41, 'el-icon-link', 6, '友情链接', 'C', 'link', 'note/link/index', '', '0', 1, '2023-07-03 15:50:05', 1, '2023-07-03 15:50:05');
INSERT INTO `sys_menu` VALUES (76, 75, '', 0, '列表', 'F', '', '', 'note:link:list', '0', 1, '2023-07-03 15:51:46', 1, '2023-07-03 15:51:46');
INSERT INTO `sys_menu` VALUES (77, 75, '', 1, '新增', 'F', '', '', 'note:link:add', '0', 1, '2023-07-03 15:52:40', 1, '2023-07-03 15:52:40');
INSERT INTO `sys_menu` VALUES (78, 75, '', 2, '更新', 'F', '', '', 'note:link:update', '0', 1, '2023-07-03 15:53:16', 1, '2023-07-03 15:53:16');
INSERT INTO `sys_menu` VALUES (79, 75, '', 3, '删除', 'F', '', '', 'note:link:delete', '0', 1, '2023-07-03 15:53:45', 1, '2023-07-03 15:53:45');
INSERT INTO `sys_menu` VALUES (80, 0, 'el-icon-help', 4, '接口文档', 'M', 'api', '', '', '0', 1, '2023-07-06 11:47:52', 1, '2023-07-06 11:47:52');
INSERT INTO `sys_menu` VALUES (81, 80, 'el-icon-document', 0, 'Knife4j', 'C', 'knife4j', 'api/knife4j/index', '', '0', 1, '2023-07-06 11:49:12', 1, '2023-07-06 11:49:12');
INSERT INTO `sys_menu` VALUES (82, 80, 'el-icon-document', 1, 'Swagger', 'C', 'swagger', 'api/swagger/index', '', '0', 1, '2023-07-06 13:17:41', 1, '2023-07-06 13:17:41');
INSERT INTO `sys_menu` VALUES (83, 52, '', 6, '导入', 'F', '', '', 'note:article:import', '0', 1, '2023-07-08 13:47:22', 1, '2023-07-08 13:47:33');
INSERT INTO `sys_menu` VALUES (84, 1, 'bug', 6, '用户反馈', 'C', 'feedback', 'system/feedback/index', '', '0', 1, '2023-08-03 11:25:08', 1, '2023-08-03 16:58:08');
INSERT INTO `sys_menu` VALUES (85, 84, '', 0, '列表', 'F', '', '', 'system:feedback:list', '0', 1, '2023-08-03 13:36:54', 1, '2023-08-03 13:36:54');
INSERT INTO `sys_menu` VALUES (86, 84, '', 1, '新增', 'F', '', '', 'system:feedback:add', '0', 1, '2023-08-03 13:37:24', 1, '2023-08-03 13:37:28');
INSERT INTO `sys_menu` VALUES (87, 84, '', 2, '更新', 'F', '', '', 'system:feedback:update', '0', 1, '2023-08-03 13:39:30', 1, '2023-08-03 13:39:30');
INSERT INTO `sys_menu` VALUES (88, 84, '', 3, '删除', 'F', '', '', 'system:feedback:delete', '0', 1, '2023-08-03 13:39:52', 1, '2023-08-03 13:39:52');
INSERT INTO `sys_menu` VALUES (89, 32, 'el-icon-picture-outline', 1, '文章图片', 'C', 'image', 'file/image/index', '', '0', 1, '2023-08-31 16:19:24', 1, '2023-08-31 16:20:25');
INSERT INTO `sys_menu` VALUES (90, 52, '', 7, '导出', 'F', '', '', 'note:article:download', '0', 1, '2023-12-05 13:38:45', 1, '2023-12-05 13:38:53');
INSERT INTO `sys_menu` VALUES (91, 89, '', 0, '列表', 'F', '', '', 'file:image:list', '0', 1, '2024-01-23 11:35:51', 1, '2024-01-23 11:35:51');
INSERT INTO `sys_menu` VALUES (92, 89, '', 1, '上传图片', 'F', '', '', 'file:image:upload', '0', 1, '2024-01-23 11:38:08', 1, '2024-01-23 11:41:34');
INSERT INTO `sys_menu` VALUES (93, 89, '', 2, '重命名', 'F', '', '', 'file:image:update', '0', 1, '2024-01-23 11:38:31', 1, '2024-01-23 11:38:31');
INSERT INTO `sys_menu` VALUES (94, 89, '', 3, '删除', 'F', '', '', 'file:image:delete', '0', 1, '2024-01-23 11:38:48', 1, '2024-01-23 11:38:48');
INSERT INTO `sys_menu` VALUES (95, 33, '', 0, '列表', 'F', '', '', 'file:files:list', '0', 1, '2024-01-26 11:09:52', 1, '2024-01-26 11:09:52');
INSERT INTO `sys_menu` VALUES (96, 33, '', 1, '新建文件夹', 'F', '', '', 'file:files:folder', '0', 1, '2024-01-26 11:10:35', 1, '2024-01-26 11:12:04');
INSERT INTO `sys_menu` VALUES (97, 33, '', 2, '上传文件', 'F', '', '', 'file:files:file', '0', 1, '2024-01-26 11:11:15', 1, '2024-01-26 11:11:15');
INSERT INTO `sys_menu` VALUES (98, 33, '', 3, '重命名', 'F', '', '', 'file:files:update', '0', 1, '2024-01-26 11:11:38', 1, '2024-01-26 11:11:45');
INSERT INTO `sys_menu` VALUES (99, 33, '', 4, '删除', 'F', '', '', 'file:files:delete', '0', 1, '2024-01-26 11:12:53', 1, '2024-01-26 11:12:53');
INSERT INTO `sys_menu` VALUES (101, 52, '', 8, '抓取', 'F', '', '', 'note:article:reptile', '0', 1, '2024-02-29 10:52:22', 1, '2024-02-29 10:52:34');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '角色状态（0正常 1停用）',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'admin', '管理员', '可以管理所有东西', '0', 1, '2023-01-29 16:51:22', 1, '2024-01-26 13:59:20');
INSERT INTO `sys_role` VALUES (2, 'user', '普通用户', '', '0', 2, '2023-02-03 17:39:35', 1, '2024-01-26 11:03:47');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单权限id',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3311 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (3178, 1, 41, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3179, 1, 52, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3180, 1, 53, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3181, 1, 54, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3182, 1, 55, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3183, 1, 56, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3184, 1, 58, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3185, 1, 59, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3186, 1, 83, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3187, 1, 90, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3188, 1, 101, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3189, 1, 57, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3190, 1, 71, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3191, 1, 72, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3192, 1, 74, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3193, 1, 73, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3194, 1, 47, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3195, 1, 48, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3196, 1, 49, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3197, 1, 50, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3198, 1, 51, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3199, 1, 42, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3200, 1, 43, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3201, 1, 44, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3202, 1, 45, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3203, 1, 46, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3204, 1, 67, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3205, 1, 68, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3206, 1, 69, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3207, 1, 70, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3208, 1, 75, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3209, 1, 76, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3210, 1, 77, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3211, 1, 78, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3212, 1, 79, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3213, 1, 1, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3214, 1, 3, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3215, 1, 13, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3216, 1, 10, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3217, 1, 11, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3218, 1, 12, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3219, 1, 4, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3220, 1, 14, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3221, 1, 15, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3222, 1, 16, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3223, 1, 17, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3224, 1, 31, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3225, 1, 39, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3226, 1, 40, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3227, 1, 2, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3228, 1, 18, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3229, 1, 19, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3230, 1, 20, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3231, 1, 21, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3232, 1, 5, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3233, 1, 22, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3234, 1, 23, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3235, 1, 25, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3236, 1, 24, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3237, 1, 30, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3238, 1, 9, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3239, 1, 26, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3240, 1, 27, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3241, 1, 28, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3242, 1, 29, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3243, 1, 35, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3244, 1, 36, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3245, 1, 37, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3246, 1, 38, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3247, 1, 84, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3248, 1, 85, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3249, 1, 86, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3250, 1, 87, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3251, 1, 88, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3252, 1, 6, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3253, 1, 7, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3254, 1, 8, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3255, 1, 65, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3256, 1, 66, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3257, 1, 32, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3258, 1, 33, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3259, 1, 95, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3260, 1, 96, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3261, 1, 97, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3262, 1, 98, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3263, 1, 99, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3264, 1, 89, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3265, 1, 91, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3266, 1, 92, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3267, 1, 93, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3268, 1, 94, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3269, 1, 80, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3270, 1, 81, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3271, 1, 82, 1, '2024-02-29 10:53:34', 1, '2024-02-29 10:53:34');
INSERT INTO `sys_role_menu` VALUES (3272, 2, 41, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3273, 2, 52, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3274, 2, 53, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3275, 2, 54, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3276, 2, 55, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3277, 2, 56, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3278, 2, 59, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3279, 2, 83, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3280, 2, 101, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3281, 2, 57, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3282, 2, 71, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3283, 2, 72, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3284, 2, 74, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3285, 2, 73, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3286, 2, 47, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3287, 2, 48, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3288, 2, 49, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3289, 2, 51, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3290, 2, 42, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3291, 2, 43, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3292, 2, 44, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3293, 2, 46, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3294, 2, 67, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3295, 2, 68, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3296, 2, 69, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3297, 2, 70, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3298, 2, 75, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3299, 2, 76, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3300, 2, 77, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3301, 2, 1, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3302, 2, 84, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3303, 2, 85, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3304, 2, 86, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3305, 2, 32, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3306, 2, 89, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3307, 2, 91, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3308, 2, 92, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3309, 2, 93, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');
INSERT INTO `sys_role_menu` VALUES (3310, 2, 94, 1, '2024-02-29 11:19:39', 1, '2024-02-29 11:19:39');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '2' COMMENT '用户性别（ 0女 1男2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `gitee` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'gitee地址',
  `github` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'github地址',
  `qq_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'qq号',
  `we_chat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信号',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自我介绍',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `login_count` int UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `login_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最后登录ip',
  `login_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `login_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作系统',
  `login_browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '浏览器',
  `disk_size` bigint NOT NULL DEFAULT 0 COMMENT '存储容量',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '4XBeVW8wO9P1tgT0TDRU2w==', '小海', '1', '/files/1/avatar/da7626c4538341078e7f7db16779afc8.png', '1372195290@qq.com', '15677777777', 'https://gitee.com/wch2019', 'https://github.com/wch2019', '1372195290', '1', '用一点点代码，改变生活', '0', 536, '127.0.0.1', '内网IP', '2024-02-03 16:29:35', 'Windows 10', 'Chrome 12', 104857600, 1, '2023-02-02 17:30:22', 1, '2024-02-03 16:32:45');
INSERT INTO `sys_user` VALUES (2, 'user', '4XBeVW8wO9P1tgT0TDRU2w==', '普通用户', '2', '/files/2/avatar/a760e7d77d5a415ba2e876081115d9dd.png', '137@qq.com', NULL, NULL, NULL, NULL, NULL, NULL, '0', 20, '127.0.0.1', '内网IP', '2024-01-26 11:03:59', 'Windows 10', 'Chrome 12', 104857600, 1, '2023-02-02 17:30:22', 1, '2024-02-03 16:32:52');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  `created_by` int NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` int NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, 1, '2024-02-03 16:32:45', 1, '2024-02-03 16:32:45');
INSERT INTO `sys_user_role` VALUES (2, 2, 2, 1, '2024-02-03 16:32:52', 1, '2024-02-03 16:32:52');

SET FOREIGN_KEY_CHECKS = 1;
