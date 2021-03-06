/*
Navicat MySQL Data Transfer

Source Server         : alicentos
Source Server Version : 50723
Source Host           : 39.108.90.113:3306
Source Database       : messageboard

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2018-09-10 12:53:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_u` varchar(255) NOT NULL,
  `to_u` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `senddate` datetime NOT NULL,
  `feedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'admin', 'pupil', '没水了', '包租公怎么又停水了', '买矿泉水', '2018-09-03 15:05:09', '2018-09-03 14:05:11');
INSERT INTO `message` VALUES ('2', 'admin', 'pupil', '拥有最大的『数组中的最小值』的那些数组', '1`', 'nullasdasd', '2018-09-05 18:36:21', '2018-09-05 18:36:46');
INSERT INTO `message` VALUES ('3', 'admin', 'pupil', 'RE:嘤嘤嘤', '1', 'sdfsdfsdfsdfsdf', '2018-09-05 18:36:27', '2018-09-06 20:42:23');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_u` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `permission` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '2');
INSERT INTO `user` VALUES ('2', 'pupil', 'pupil', '1');
INSERT INTO `user` VALUES ('3', '路人甲', '123456', '1');
INSERT INTO `user` VALUES ('4', 'pupil', 'pupil', '1');
