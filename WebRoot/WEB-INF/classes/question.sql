/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50530
Source Host           : localhost:3306
Source Database       : mydb

Target Server Type    : MYSQL
Target Server Version : 50530
File Encoding         : 65001

Date: 2014-09-05 19:45:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `f_id` int(10) NOT NULL AUTO_INCREMENT,
  `f_roleid` bigint(20) DEFAULT NULL,
  `f_rolename` varchar(255) DEFAULT NULL,
  `f_title` varchar(255) DEFAULT NULL,
  `f_answer_1` varchar(255) DEFAULT NULL,
  `f_answer_2` varchar(255) DEFAULT NULL,
  `f_answer_3` varchar(255) DEFAULT NULL,
  `f_answer_4` varchar(255) DEFAULT NULL,
  `f_correct_index` tinyint(3) DEFAULT NULL,
  `f_publish_time` datetime DEFAULT NULL,
  `f_like` int(10) DEFAULT NULL,
  `f_icon` int(10) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', null, null, '机动车与机动车发生财产损失事故，当事人对事实及成因无争议的，可自行协商处理损害赔偿事宜，填写______。', '知情人证明', '道路交通事故损害赔偿协议书', '当事人的报告', '赔偿费用发票', null, null, null, null);
INSERT INTO `question` VALUES ('2', null, null, '牵引故障机动车时，牵引车和被牵引车均应当开启______。', '前大灯', '左转向灯', '右转向灯', '危险报警闪光灯', null, null, null, null);
INSERT INTO `question` VALUES ('3', null, null, '机动车在设有最高限速标志的道路上行驶时，______。', '不得超过标明的最高时速', '允许超过标明最高时速的10%', '可以超过车辆的最高设计时速', '必须按规定的最高车速行驶', null, null, null, null);
