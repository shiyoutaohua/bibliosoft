/*
Navicat MySQL Data Transfer

Source Server         : MySQL5.7 @MIPro
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ly

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-03-09 23:13:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_ISBN` varchar(20) DEFAULT NULL,
  `b_title` varchar(50) NOT NULL,
  `b_author` varchar(120) DEFAULT NULL,
  `b_tag` varchar(120) DEFAULT NULL,
  `b_press` varchar(50) NOT NULL,
  `b_publishDate` date DEFAULT NULL,
  `b_location` varchar(255) NOT NULL,
  `b_status` varchar(6) DEFAULT '',
  PRIMARY KEY (`b_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '9787547011478 ', '世有桃花', '安意如', '文学|古典|美文', '万卷出版社', '2010-08-02', '四楼|社会科学阅览室（一）|18号书架|2层3列', '借出');
INSERT INTO `book` VALUES ('2', '9787121263866', '云计算（第三版）', '刘鹏', '计算机|云计算|大数据', '中国工信出版社', '2015-08-03', '三楼|自然科学阅览室（三）|6号书架|3层1列', '借出');
INSERT INTO `book` VALUES ('3', '9787111597729', 'Java编程的逻辑', '马俊昌', '计算机|Java', '机械工业出版社', '2018-01-02', '四楼|社会科学阅览室（一）|18号书架|2层6列', '在馆');
INSERT INTO `book` VALUES ('4', '9787511553263', '听什么歌都像在唱自己', '网页云音乐', '文学', '人民日报出版社', '2018-03-09', '四楼|社会科学阅览室（一）|18号书架|2层5列', '在馆');
INSERT INTO `book` VALUES ('18', '9787511553263', '听什么歌都像在唱自己', '网易云音乐 编', '网易云音乐|短评', '人民日报出版社', '2018-03-01', '四楼|社会科学阅览室（一）|18号书架|2层5列', '在馆');
INSERT INTO `book` VALUES ('5', '9787302467946', '看透JavaScript', '韩路彪', '编程|javascript', '清华大学出版社', '2017-09-01', '三楼|自然科学阅览室（三）|6号书架|3层4列', '在馆');

-- ----------------------------
-- Table structure for loan
-- ----------------------------
DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_bookId` int(11) DEFAULT NULL,
  `l_userId` int(11) DEFAULT NULL,
  `l_lendingDate` date DEFAULT NULL,
  `l_status` varchar(2) DEFAULT NULL,
  `l_fine` int(11) DEFAULT '0',
  PRIMARY KEY (`l_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of loan
-- ----------------------------
INSERT INTO `loan` VALUES ('1', '1', '2015001', '2018-11-01', '正常', '0');
INSERT INTO `loan` VALUES ('2', '2', '2015001', '2018-10-02', '逾期', '0');
INSERT INTO `loan` VALUES ('3', '3', '2015001', '2018-09-04', '已还', '0');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_userId` int(11) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `log_type` varchar(40) DEFAULT NULL,
  `log_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', '1001', '2018-11-11 15:26:30', '删除书籍', '书籍信息(编号-书名-作者-出版社)');
INSERT INTO `log` VALUES ('5', '1001', '2018-11-11 22:05:28', '删除书籍', '书籍信息(12---)');
INSERT INTO `log` VALUES ('6', '1001', '2018-11-11 22:06:30', '删除书籍', '书籍信息(13---)');
INSERT INTO `log` VALUES ('7', '1001', '2018-11-11 22:13:20', '删除书籍', '书籍信息(14---https://api.douban.com/v2/book/isbn/undefined)');
INSERT INTO `log` VALUES ('8', '1001', '2018-11-11 22:23:29', '删除书籍', '书籍信息(15---https://api.douban.com/v2/book/isbn/undefined)');
INSERT INTO `log` VALUES ('9', '1001', '2018-11-11 22:23:40', '删除书籍', '书籍信息(16-听什么歌都像在唱自己-网易云音乐 编-人民日报出版社)');

-- ----------------------------
-- Table structure for note
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_userId` int(11) DEFAULT NULL,
  `n_head` varchar(255) DEFAULT NULL,
  `n_body` varchar(255) NOT NULL,
  `n_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('1', '1000', 'Hello ! 萌新~', '嗨,终于等到你!', '2018-11-10 23:03:20');
INSERT INTO `note` VALUES ('4', '1001', 'hhh', '```', '2018-11-13 13:00:59');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_bookId` int(11) NOT NULL,
  `o_userId` int(11) NOT NULL,
  `o_orderTime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('10', '3', '2015001', '2018-11-14 01:42:18');
INSERT INTO `order` VALUES ('9', '3', '2015001', '2018-11-14 01:42:18');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `p_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `p_key` varchar(50) NOT NULL,
  `p_value` varchar(50) NOT NULL,
  `p_note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', 'overdueFine ', '100', '逾期罚金，默认1￥/天');
INSERT INTO `profile` VALUES ('2', 'maxLendingTime', '30', '最大借阅时间，默认30天');
INSERT INTO `profile` VALUES ('3', 'deposit', '30000', '创建账户保证金，默认300￥');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(20) NOT NULL,
  `u_password` varchar(20) NOT NULL,
  `u_level` tinyint(4) NOT NULL COMMENT '0 : 超级管理员 | 1 : 图书管理员 | 2 : 读者',
  `u_name` varchar(30) NOT NULL,
  `u_email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1000', '123', '0', 'Admin', 'qingyuehanxi@icloud.com');
INSERT INTO `user` VALUES ('2015001', '123', '2', 'Reader1', '815059819@qq.com');
INSERT INTO `user` VALUES ('2015002', '123', '2', 'Reader2', '2015002@mail.com');
INSERT INTO `user` VALUES ('2015003', '123', '2', 'Reader3', '2015003@mail.com');
INSERT INTO `user` VALUES ('1001', '123', '1', 'Librarian1', 'Librarian1@mail.com');
INSERT INTO `user` VALUES ('2015004', '123', '2', 'Reader4', '2015004@mail.com');
INSERT INTO `user` VALUES ('1003', '123', '1', 'Librarian3', '1309079081@qq.com');
INSERT INTO `user` VALUES ('2015005', '123', '2', '小可', '723667939@qq.com');
