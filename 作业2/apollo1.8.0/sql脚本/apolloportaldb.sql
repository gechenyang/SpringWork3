/*
Navicat MySQL Data Transfer

Source Server         : localhost本地
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : apolloportaldb

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2022-07-07 09:41:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app
-- ----------------------------
DROP TABLE IF EXISTS `app`;
CREATE TABLE `app` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应用表';

-- ----------------------------
-- Records of app
-- ----------------------------
INSERT INTO `app` VALUES ('1', '12345', 'apollo-01', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2022-07-07 01:21:08', 'apollo', '2022-07-07 01:21:08');

-- ----------------------------
-- Table structure for appnamespace
-- ----------------------------
DROP TABLE IF EXISTS `appnamespace`;
CREATE TABLE `appnamespace` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(64) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应用namespace定义';

-- ----------------------------
-- Records of appnamespace
-- ----------------------------
INSERT INTO `appnamespace` VALUES ('1', 'application', '12345', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `appnamespace` VALUES ('2', 'config', '12345', 'properties', '\0', '新增配置', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');

-- ----------------------------
-- Table structure for authorities
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('1', 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='开放API消费者';

-- ----------------------------
-- Records of consumer
-- ----------------------------

-- ----------------------------
-- Table structure for consumeraudit
-- ----------------------------
DROP TABLE IF EXISTS `consumeraudit`;
CREATE TABLE `consumeraudit` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='consumer审计表';

-- ----------------------------
-- Records of consumeraudit
-- ----------------------------

-- ----------------------------
-- Table structure for consumerrole
-- ----------------------------
DROP TABLE IF EXISTS `consumerrole`;
CREATE TABLE `consumerrole` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_ConsumerId_RoleId` (`ConsumerId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='consumer和role的绑定表';

-- ----------------------------
-- Records of consumerrole
-- ----------------------------

-- ----------------------------
-- Table structure for consumertoken
-- ----------------------------
DROP TABLE IF EXISTS `consumertoken`;
CREATE TABLE `consumertoken` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Token` (`Token`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='consumer token表';

-- ----------------------------
-- Records of consumertoken
-- ----------------------------

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `IX_UserId` (`UserId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应用收藏表';

-- ----------------------------
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_TargetId_PermissionType` (`TargetId`(191),`PermissionType`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='permission表';

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'CreateApplication', 'SystemRole', '\0', 'apollo', '2022-07-07 01:11:27', 'apollo', '2022-07-07 01:11:27');
INSERT INTO `permission` VALUES ('2', 'CreateCluster', '12345', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('3', 'CreateNamespace', '12345', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('4', 'AssignRole', '12345', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('5', 'ManageAppMaster', '12345', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('6', 'ModifyNamespace', '12345+application', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('7', 'ReleaseNamespace', '12345+application', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('8', 'ModifyNamespace', '12345+application+DEV', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('9', 'ReleaseNamespace', '12345+application+DEV', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `permission` VALUES ('10', 'ModifyNamespace', '12345+config', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `permission` VALUES ('11', 'ReleaseNamespace', '12345+config', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `permission` VALUES ('12', 'ModifyNamespace', '12345+config+DEV', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `permission` VALUES ('13', 'ReleaseNamespace', '12345+config+DEV', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_RoleName` (`RoleName`(191)),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'CreateApplication+SystemRole', '\0', 'apollo', '2022-07-07 01:11:27', 'apollo', '2022-07-07 01:11:27');
INSERT INTO `role` VALUES ('2', 'Master+12345', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `role` VALUES ('3', 'ManageAppMaster+12345', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `role` VALUES ('4', 'ModifyNamespace+12345+application', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `role` VALUES ('5', 'ReleaseNamespace+12345+application', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `role` VALUES ('6', 'ModifyNamespace+12345+application+DEV', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `role` VALUES ('7', 'ReleaseNamespace+12345+application+DEV', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `role` VALUES ('8', 'ModifyNamespace+12345+config', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `role` VALUES ('9', 'ReleaseNamespace+12345+config', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `role` VALUES ('10', 'ModifyNamespace+12345+config+DEV', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `role` VALUES ('11', 'ReleaseNamespace+12345+config+DEV', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和权限的绑定表';

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES ('1', '1', '1', '\0', 'apollo', '2022-07-07 01:11:27', 'apollo', '2022-07-07 01:11:27');
INSERT INTO `rolepermission` VALUES ('2', '2', '2', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('3', '2', '3', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('4', '2', '4', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('5', '3', '5', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('6', '4', '6', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('7', '5', '7', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('8', '6', '8', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('9', '7', '9', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `rolepermission` VALUES ('10', '8', '10', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `rolepermission` VALUES ('11', '9', '11', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `rolepermission` VALUES ('12', '10', '12', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `rolepermission` VALUES ('13', '11', '13', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');

-- ----------------------------
-- Table structure for serverconfig
-- ----------------------------
DROP TABLE IF EXISTS `serverconfig`;
CREATE TABLE `serverconfig` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of serverconfig
-- ----------------------------
INSERT INTO `serverconfig` VALUES ('1', 'apollo.portal.envs', 'dev', '可支持的环境列表', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');
INSERT INTO `serverconfig` VALUES ('2', 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');
INSERT INTO `serverconfig` VALUES ('3', 'superAdmin', 'apollo', 'Portal超级管理员', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');
INSERT INTO `serverconfig` VALUES ('4', 'api.readTimeout', '10000', 'http接口read timeout', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');
INSERT INTO `serverconfig` VALUES ('5', 'consumer.token.salt', 'someSalt', 'consumer token salt', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');
INSERT INTO `serverconfig` VALUES ('6', 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');
INSERT INTO `serverconfig` VALUES ('7', 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');
INSERT INTO `serverconfig` VALUES ('8', 'apollo.portal.meta.servers', '{}', '各环境Meta Service列表', '\0', 'default', '2022-07-07 08:58:44', '', '2022-07-07 08:58:44');

-- ----------------------------
-- Table structure for userrole
-- ----------------------------
DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_UserId_RoleId` (`UserId`,`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和role的绑定表';

-- ----------------------------
-- Records of userrole
-- ----------------------------
INSERT INTO `userrole` VALUES ('1', 'apollo', '2', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `userrole` VALUES ('2', 'apollo', '4', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `userrole` VALUES ('3', 'apollo', '5', '\0', 'apollo', '2022-07-07 01:21:09', 'apollo', '2022-07-07 01:21:09');
INSERT INTO `userrole` VALUES ('4', 'apollo', '8', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');
INSERT INTO `userrole` VALUES ('5', 'apollo', '9', '\0', 'apollo', '2022-07-07 01:35:03', 'apollo', '2022-07-07 01:35:03');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户表';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', '1');
