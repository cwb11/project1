/*
Navicat MySQL Data Transfer

Source Server         : Test
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : exercise

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2021-04-10 21:24:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '加密盐',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `modified_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '修改人',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '逻辑删除标识(0、否 1、是)',
  PRIMARY KEY (`account_id`) USING BTREE,
  KEY `FK_account_role_id` (`role_id`),
  CONSTRAINT `FK_account_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='账号表';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '1', 'mp', '17a1640916cfa8356adc4336a72ac75d', 'ecbe5fac60d1499595fbb98dfa854501', '程序牛人', '男', 'mp@126.com', '2020-11-10 13:46:32', '2021-04-09 15:53:00', null, '1', '0');
INSERT INTO `account` VALUES ('2', '8', 'imooc', 'ff9d8b226e9404bc00b3446993d3e6bc', 'c9c5162cc7924b469619308e6d36fb9e', '小暮', '男', 'xm@126.com', '2021-04-08 10:02:59', '2021-04-09 18:07:00', '1', '1', '0');
INSERT INTO `account` VALUES ('3', '3', 'ls', '6dcd48c06d59def873a5c89dd3d820f7', 'ab532228cca44b5e8892d90ded263c08', '李四', '男', 'ls@126.com', '2021-04-08 14:28:48', '2021-04-09 16:03:03', '1', '1', '0');
INSERT INTO `account` VALUES ('4', '1', 'aa', '9bd2b2efeb27d8cacf64a666d4f23b5a', 'd4209a259a0e4f8d9b468af354583904', 'aa', '男', 'aa@126.com', '2021-04-08 14:39:56', null, '1', null, '1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `age` tinyint(3) unsigned DEFAULT NULL COMMENT '年龄',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `modified_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '修改人',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '逻辑删除标识(0、否 1、是)',
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '刘强', '男', '22', 'lq@126.com', '18888888888', '北京市海淀区', '2021-04-06 16:56:00', '2021-04-09 20:55:42', null, '2', '1');
INSERT INTO `customer` VALUES ('2', '余明辉', '男', '32', 'ymh@126.com', '17777777777', '北京市朝阳区', '2021-04-06 16:57:12', null, null, null, '0');
INSERT INTO `customer` VALUES ('3', '张三', '男', '29', 'zs@126.com', '12222222222', '', null, '2021-04-07 15:12:11', null, '1', '0');
INSERT INTO `customer` VALUES ('4', '李明', '男', '28', 'lm@126.com', '16666666666', '', null, null, null, null, '0');
INSERT INTO `customer` VALUES ('5', '王明', '男', '29', 'wm@126.com', '18822222222', '', '2021-04-07 13:58:27', '2021-04-07 13:59:04', '1', '1', '0');
INSERT INTO `customer` VALUES ('6', '小红', '女', '22', 'xh@126.com', '17888888888', '', '2021-04-07 14:46:40', '2021-04-07 16:09:41', '1', '1', '0');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` bigint(20) unsigned NOT NULL COMMENT '主键',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父id',
  `resource_name` varchar(50) DEFAULT NULL COMMENT '资源名称',
  `resource_type` tinyint(4) DEFAULT NULL COMMENT '资源类型(0、目录 1、菜单 2、按钮)',
  `url` varchar(200) DEFAULT NULL COMMENT '请求地址',
  `code` varchar(100) DEFAULT NULL COMMENT '权限标识码',
  `sort` int(10) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', null, '系统管理', '0', null, null, '1');
INSERT INTO `resource` VALUES ('2', null, '客户管理', '0', null, null, '2');
INSERT INTO `resource` VALUES ('11', '1', '角色管理', '1', 'role/toList', null, '1');
INSERT INTO `resource` VALUES ('12', '1', '账号管理', '1', 'account/toList', null, '2');
INSERT INTO `resource` VALUES ('21', '2', '客户管理', '1', 'customer/toList', 'customer', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '创建人',
  `modified_account_id` bigint(20) unsigned DEFAULT NULL COMMENT '修改人',
  `deleted` tinyint(3) unsigned DEFAULT '0' COMMENT '逻辑删除标识(0、否 1、是)',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '练习角色', '练习角色', null, '2021-04-09 15:52:40', null, '2', '0');
INSERT INTO `role` VALUES ('3', '操作员1', '普通操作员', '2021-04-08 23:48:20', null, '1', null, '0');
INSERT INTO `role` VALUES ('4', '操作员', '普通操作员', '2021-04-08 23:51:00', null, '1', null, '0');
INSERT INTO `role` VALUES ('5', '王五', '基础操作员', '2021-04-09 13:55:20', '2021-04-09 15:27:20', '1', '1', '1');
INSERT INTO `role` VALUES ('6', '操作员2', '操作员2', '2021-04-09 15:55:39', null, '1', null, '0');
INSERT INTO `role` VALUES ('7', '操作员3', '操作员3', '2021-04-09 15:55:51', null, '1', null, '0');
INSERT INTO `role` VALUES ('8', '操作员4', '基础操作员', '2021-04-09 16:30:49', null, '1', null, '0');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `role_resource_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `resource_id` bigint(20) unsigned DEFAULT NULL COMMENT '资源id',
  PRIMARY KEY (`role_resource_id`) USING BTREE,
  KEY `FK_role_resource_role_id` (`role_id`),
  KEY `FK_role_rerce_resourc_idD2D9` (`resource_id`),
  CONSTRAINT `FK_role_rerce_resourc_idD2D9` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`),
  CONSTRAINT `FK_role_resource_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('6', '3', '1');
INSERT INTO `role_resource` VALUES ('7', '3', '12');
INSERT INTO `role_resource` VALUES ('8', '3', '2');
INSERT INTO `role_resource` VALUES ('9', '3', '21');
INSERT INTO `role_resource` VALUES ('10', '4', '1');
INSERT INTO `role_resource` VALUES ('11', '4', '11');
INSERT INTO `role_resource` VALUES ('12', '4', '2');
INSERT INTO `role_resource` VALUES ('13', '4', '21');
INSERT INTO `role_resource` VALUES ('92', '5', '2');
INSERT INTO `role_resource` VALUES ('93', '5', '21');
INSERT INTO `role_resource` VALUES ('98', '1', '1');
INSERT INTO `role_resource` VALUES ('99', '1', '11');
INSERT INTO `role_resource` VALUES ('100', '1', '12');
INSERT INTO `role_resource` VALUES ('101', '1', '2');
INSERT INTO `role_resource` VALUES ('102', '1', '21');
INSERT INTO `role_resource` VALUES ('103', '6', '1');
INSERT INTO `role_resource` VALUES ('104', '6', '11');
INSERT INTO `role_resource` VALUES ('105', '6', '12');
INSERT INTO `role_resource` VALUES ('106', '6', '2');
INSERT INTO `role_resource` VALUES ('107', '6', '21');
INSERT INTO `role_resource` VALUES ('108', '7', '1');
INSERT INTO `role_resource` VALUES ('109', '7', '11');
INSERT INTO `role_resource` VALUES ('110', '7', '12');
INSERT INTO `role_resource` VALUES ('111', '7', '2');
INSERT INTO `role_resource` VALUES ('112', '7', '21');
INSERT INTO `role_resource` VALUES ('113', '8', '2');
INSERT INTO `role_resource` VALUES ('114', '8', '21');
