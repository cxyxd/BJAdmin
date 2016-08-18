/*
Navicat MySQL Data Transfer

Source Server         : localhostMysql
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : bjadmin

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-11-10 17:24:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appclient
-- ----------------------------
DROP TABLE IF EXISTS `appclient`;
CREATE TABLE `appclient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `idCard` varchar(20) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `trueName` varchar(5) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `companyId` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appclient
-- ----------------------------

-- ----------------------------
-- Table structure for complain
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` int(11) DEFAULT NULL,
  `msg` varchar(100) DEFAULT NULL,
  `clientName` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `customerName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of complain
-- ----------------------------
INSERT INTO `complain` VALUES ('17', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  `clientName` varchar(20) DEFAULT NULL,
  `landline` varchar(15) DEFAULT NULL,
  `leader1_info` varchar(100) DEFAULT NULL,
  `leader2_info` varchar(100) DEFAULT NULL,
  `leader3_info` varchar(100) DEFAULT NULL,
  `phone1` varchar(15) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `record` varchar(20) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `postalCode` varchar(15) DEFAULT NULL,
  `cus_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for market
-- ----------------------------
DROP TABLE IF EXISTS `market`;
CREATE TABLE `market` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `opponentId` int(12) DEFAULT NULL,
  `productName` varchar(20) DEFAULT NULL,
  `leaveFacPrice` varchar(10) DEFAULT NULL,
  `freight` varchar(10) DEFAULT NULL,
  `truePrice` varchar(10) DEFAULT NULL,
  `sellPrice` varchar(10) DEFAULT NULL,
  `clientId` varchar(15) DEFAULT NULL,
  `clientName` varchar(20) DEFAULT NULL,
  `policy` varchar(30) DEFAULT NULL,
  `distance` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market
-- ----------------------------

-- ----------------------------
-- Table structure for opponent
-- ----------------------------
DROP TABLE IF EXISTS `opponent`;
CREATE TABLE `opponent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `scale` varchar(10) DEFAULT NULL,
  `clientName` varchar(20) DEFAULT NULL,
  `opp_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opponent
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `companyName` varchar(20) DEFAULT NULL,
  `appCount` int(11) DEFAULT NULL,
  `companyMsg` varchar(50) DEFAULT NULL,
  `usedCount` int(11) DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `trueName` varchar(5) DEFAULT NULL,
  `branchId` int(11) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `idCard` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `area` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', 'zong', '123123', '毕加数据有限公司', '5000', '211高校呦55', '0', '2020-11-26', '', '', '袁乾浩', '11', '11', '', '女', '3', null);
INSERT INTO `user` VALUES ('12', 'wangjun', '123123', '西电', '5', null, '1', null, null, '18392062458', null, '12', '11', null, null, '2', null);
INSERT INTO `user` VALUES ('13', 'ywy1', '123123', '西电', null, null, null, null, '', '', '', '12', '11', '610402155841526584', '男', '1', '西安 北区');

-- ----------------------------
-- Table structure for version
-- ----------------------------
DROP TABLE IF EXISTS `version`;
CREATE TABLE `version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `versionMsg` varchar(30) DEFAULT NULL,
  `path` varchar(80) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of version
-- ----------------------------
INSERT INTO `version` VALUES ('1', '这是测试文件', 'http://localhost:8600/BJAdmin/apps/BJAdmin-version-1.apk', '2015-11-10 17:22:14');

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `customerId` int(12) DEFAULT NULL,
  `customerName` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `clientId` varchar(10) DEFAULT NULL,
  `clientName` varchar(20) DEFAULT NULL,
  `msg` varchar(80) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit
-- ----------------------------
