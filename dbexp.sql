/*
Navicat MySQL Data Transfer

Source Server         : dataBaseExp
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : dbexp

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-07-03 12:05:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actin
-- ----------------------------
DROP TABLE IF EXISTS `actin`;
CREATE TABLE `actin` (
  `ACTID` int(11) NOT NULL,
  `FID` int(11) NOT NULL,
  `ISLEADING` enum('Y','N') DEFAULT NULL,
  `GRADE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ACTID`,`FID`),
  KEY `actin_fid_film` (`FID`),
  CONSTRAINT `actin_actid_actor` FOREIGN KEY (`ACTID`) REFERENCES `actor` (`ACTID`),
  CONSTRAINT `actin_fid_film` FOREIGN KEY (`FID`) REFERENCES `film` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actin
-- ----------------------------
INSERT INTO `actin` VALUES ('1', '1', 'Y', '81');
INSERT INTO `actin` VALUES ('2', '1', 'Y', '72');
INSERT INTO `actin` VALUES ('3', '1', 'Y', '84');
INSERT INTO `actin` VALUES ('4', '1', 'Y', '64');
INSERT INTO `actin` VALUES ('5', '2', 'Y', '67');
INSERT INTO `actin` VALUES ('6', '2', 'Y', '84');
INSERT INTO `actin` VALUES ('7', '2', 'Y', '49');
INSERT INTO `actin` VALUES ('8', '2', 'Y', '88');
INSERT INTO `actin` VALUES ('9', '3', 'Y', '92');
INSERT INTO `actin` VALUES ('10', '3', 'Y', '73');
INSERT INTO `actin` VALUES ('10', '4', 'Y', '73');
INSERT INTO `actin` VALUES ('11', '3', 'Y', '67');
INSERT INTO `actin` VALUES ('11', '4', 'Y', '67');
INSERT INTO `actin` VALUES ('12', '3', 'N', '80');
INSERT INTO `actin` VALUES ('12', '4', 'N', '80');
INSERT INTO `actin` VALUES ('13', '3', 'N', '62');
INSERT INTO `actin` VALUES ('14', '3', 'N', '83');
INSERT INTO `actin` VALUES ('14', '4', 'N', '83');
INSERT INTO `actin` VALUES ('15', '7', 'Y', '91');
INSERT INTO `actin` VALUES ('16', '7', 'Y', '78');
INSERT INTO `actin` VALUES ('17', '8', 'Y', '90');
INSERT INTO `actin` VALUES ('17', '9', 'Y', '90');
INSERT INTO `actin` VALUES ('18', '8', 'Y', '85');
INSERT INTO `actin` VALUES ('18', '9', 'Y', '85');
INSERT INTO `actin` VALUES ('19', '8', 'Y', '92');
INSERT INTO `actin` VALUES ('19', '9', 'Y', '92');
INSERT INTO `actin` VALUES ('20', '10', 'Y', '78');
INSERT INTO `actin` VALUES ('20', '11', 'Y', '70');
INSERT INTO `actin` VALUES ('21', '11', 'Y', '85');
INSERT INTO `actin` VALUES ('22', '10', 'Y', '75');

-- ----------------------------
-- Table structure for actor
-- ----------------------------
DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `ACTID` int(11) NOT NULL,
  `ANAME` char(30) DEFAULT NULL,
  `SEX` char(30) DEFAULT NULL,
  `BYEAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ACTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actor
-- ----------------------------
INSERT INTO `actor` VALUES ('1', '张译', '男', '1978');
INSERT INTO `actor` VALUES ('2', '黄景瑜', '男', '1992');
INSERT INTO `actor` VALUES ('3', '海清', '女', '1978');
INSERT INTO `actor` VALUES ('4', '杜江', '男', '1985');
INSERT INTO `actor` VALUES ('5', '章子怡', '女', '1979');
INSERT INTO `actor` VALUES ('6', '张震', '男', '1976');
INSERT INTO `actor` VALUES ('7', '黄晓明', '男', '1977');
INSERT INTO `actor` VALUES ('8', '王力宏', '男', '1976');
INSERT INTO `actor` VALUES ('9', '梁朝伟', '男', '1962');
INSERT INTO `actor` VALUES ('10', '白百何', '女', '1984');
INSERT INTO `actor` VALUES ('11', '井柏然', '男', '1989');
INSERT INTO `actor` VALUES ('12', '曾志伟', '男', '1953');
INSERT INTO `actor` VALUES ('13', '柳岩', '女', '1980');
INSERT INTO `actor` VALUES ('14', '吴君如', '女', '1965');
INSERT INTO `actor` VALUES ('15', '刘德华', '男', '1961');
INSERT INTO `actor` VALUES ('16', '姚晨', '女', '1979');
INSERT INTO `actor` VALUES ('17', '宋慧乔', '女', '1982');
INSERT INTO `actor` VALUES ('18', '章子怡', '女', '1979');
INSERT INTO `actor` VALUES ('19', '金城武', '男', '1973');
INSERT INTO `actor` VALUES ('20', '吴京', '男', '1974');
INSERT INTO `actor` VALUES ('21', '卢靖姗', '女', '1985');
INSERT INTO `actor` VALUES ('22', '余男', '女', '1978');
INSERT INTO `actor` VALUES ('999', '李自己', '男', '1998');

-- ----------------------------
-- Table structure for film
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `FID` int(11) NOT NULL AUTO_INCREMENT,
  `FNAME` char(30) DEFAULT NULL,
  `FTYPE` char(10) DEFAULT NULL,
  `DNAME` char(30) DEFAULT NULL,
  `LENGTH` int(11) DEFAULT NULL,
  `IS3D` enum('Y','N') NOT NULL DEFAULT 'N',
  `GRADE` int(11) DEFAULT NULL,
  `release` datetime DEFAULT NULL,
  PRIMARY KEY (`FID`),
  UNIQUE KEY `FID` (`FID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('1', '红海行动', '动作/剧情', '林超贤', '138', 'Y', '92', '2018-02-16 00:00:00');
INSERT INTO `film` VALUES ('2', '无问西东', '剧情/爱情/战争', '李芳芳', '138', 'N', '71', '2018-01-12 00:00:00');
INSERT INTO `film` VALUES ('3', '捉妖记2', '喜剧/奇幻/动作', '许诚毅', '110', 'N', '59', '2018-02-16 00:00:00');
INSERT INTO `film` VALUES ('4', '捉妖记', '喜剧/奇幻/动作', '许诚毅', '118', 'Y', '72', '2015-07-16 00:00:00');
INSERT INTO `film` VALUES ('5', '唐人街探案2', '喜剧/动作/悬疑', '陈思诚', '120', 'N', '71', '2018-02-16 00:00:00');
INSERT INTO `film` VALUES ('6', '美人鱼', '喜剧/奇幻/爱情', '周星驰', '93', 'Y', '74', '2016-01-08 00:00:00');
INSERT INTO `film` VALUES ('7', '风暴', '动作/犯罪/剧情', '袁锦麟', '109', 'N', '66', '2013-12-12 00:00:00');
INSERT INTO `film` VALUES ('8', '太平轮（上）', '爱情/剧情/战争', '吴宇森', '128', 'N', '58', '2014-12-02 00:00:00');
INSERT INTO `film` VALUES ('9', '太平轮·彼岸', '情/历史/战争', '吴宇森', '126', 'N', '62', '2015-07-30 00:00:00');
INSERT INTO `film` VALUES ('10', '战狼', '动作/战争', '吴京', '90', 'N', '82', '2015-04-02 00:00:00');
INSERT INTO `film` VALUES ('11', '战狼2', '动作/战争', '吴京', '123', 'Y', '92', '2017-07-27 00:00:00');
INSERT INTO `film` VALUES ('12', '疯狂的石头', '犯罪/喜剧', '', '98', 'N', null, '2006-06-30 00:00:00');
INSERT INTO `film` VALUES ('13', '追捕', '动作/剧情', '吴宇森', '100', 'N', '65', '2017-11-24 00:00:00');
INSERT INTO `film` VALUES ('14', '幸福马上来', '喜剧', '冯巩', '100', 'N', null, '2018-06-08 00:00:00');

-- ----------------------------
-- Table structure for show
-- ----------------------------
DROP TABLE IF EXISTS `show`;
CREATE TABLE `show` (
  `FID` int(11) NOT NULL,
  `TID` int(11) NOT NULL,
  `PRICE` int(11) DEFAULT NULL,
  `YEAR` int(11) DEFAULT NULL,
  `MONTH` int(11) DEFAULT NULL,
  PRIMARY KEY (`FID`,`TID`),
  KEY `show_tid_theater` (`TID`),
  CONSTRAINT `show_fid_film` FOREIGN KEY (`FID`) REFERENCES `film` (`FID`),
  CONSTRAINT `show_tid_theater` FOREIGN KEY (`TID`) REFERENCES `theater` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of show
-- ----------------------------
INSERT INTO `show` VALUES ('1', '1', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '2', '40', '2018', '2');
INSERT INTO `show` VALUES ('1', '3', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '4', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '5', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '6', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '7', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '8', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '9', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '10', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '11', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '12', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '13', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '14', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '15', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '16', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '17', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '18', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '19', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '20', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '21', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '22', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '23', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '24', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '25', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '26', '40', '2018', '2');
INSERT INTO `show` VALUES ('1', '27', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '28', '40', '2018', '2');
INSERT INTO `show` VALUES ('1', '29', '40', '2018', '2');
INSERT INTO `show` VALUES ('1', '30', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '31', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '32', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '33', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '34', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '35', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '36', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '37', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '38', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '39', '40', '2018', '2');
INSERT INTO `show` VALUES ('1', '40', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '41', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '42', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '43', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '44', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '45', '70', '2018', '2');
INSERT INTO `show` VALUES ('1', '46', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '47', '50', '2018', '2');
INSERT INTO `show` VALUES ('1', '48', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '49', '80', '2018', '2');
INSERT INTO `show` VALUES ('1', '50', '60', '2018', '2');
INSERT INTO `show` VALUES ('1', '51', '30', '2018', '2');
INSERT INTO `show` VALUES ('1', '52', '40', '2018', '2');
INSERT INTO `show` VALUES ('1', '53', '40', '2018', '2');
INSERT INTO `show` VALUES ('1', '54', '30', '2018', '2');
INSERT INTO `show` VALUES ('2', '1', '80', '2018', '1');
INSERT INTO `show` VALUES ('2', '2', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '3', '50', '2018', '1');
INSERT INTO `show` VALUES ('2', '4', '50', '2018', '1');
INSERT INTO `show` VALUES ('2', '5', '70', '2018', '2');
INSERT INTO `show` VALUES ('2', '6', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '7', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '8', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '9', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '10', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '11', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '12', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '13', '50', '2018', '1');
INSERT INTO `show` VALUES ('2', '14', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '15', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '16', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '17', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '18', '80', '2018', '1');
INSERT INTO `show` VALUES ('2', '19', '50', '2018', '1');
INSERT INTO `show` VALUES ('2', '20', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '21', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '22', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '23', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '24', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '25', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '26', '80', '2018', '1');
INSERT INTO `show` VALUES ('2', '27', '50', '2018', '1');
INSERT INTO `show` VALUES ('2', '28', '80', '2018', '1');
INSERT INTO `show` VALUES ('2', '29', '80', '2018', '1');
INSERT INTO `show` VALUES ('2', '30', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '31', '80', '2018', '1');
INSERT INTO `show` VALUES ('2', '32', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '33', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '34', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '35', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '36', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '37', '50', '2018', '1');
INSERT INTO `show` VALUES ('2', '38', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '39', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '40', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '41', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '42', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '43', '80', '2018', '1');
INSERT INTO `show` VALUES ('2', '44', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '45', '50', '2018', '1');
INSERT INTO `show` VALUES ('2', '46', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '47', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '48', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '49', '40', '2018', '1');
INSERT INTO `show` VALUES ('2', '50', '70', '2018', '1');
INSERT INTO `show` VALUES ('2', '51', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '52', '60', '2018', '1');
INSERT INTO `show` VALUES ('2', '53', '30', '2018', '1');
INSERT INTO `show` VALUES ('2', '54', '50', '2018', '1');
INSERT INTO `show` VALUES ('3', '1', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '2', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '3', '70', '2018', '2');
INSERT INTO `show` VALUES ('3', '4', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '5', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '6', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '7', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '8', '30', '2018', '2');
INSERT INTO `show` VALUES ('3', '9', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '10', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '11', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '12', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '13', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '14', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '15', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '16', '80', '2018', '2');
INSERT INTO `show` VALUES ('3', '17', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '18', '70', '2018', '2');
INSERT INTO `show` VALUES ('3', '19', '70', '2018', '2');
INSERT INTO `show` VALUES ('3', '20', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '21', '30', '2018', '2');
INSERT INTO `show` VALUES ('3', '22', '30', '2018', '2');
INSERT INTO `show` VALUES ('3', '23', '80', '2018', '2');
INSERT INTO `show` VALUES ('3', '24', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '25', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '26', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '27', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '28', '70', '2018', '2');
INSERT INTO `show` VALUES ('3', '29', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '30', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '31', '80', '2018', '2');
INSERT INTO `show` VALUES ('3', '32', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '33', '70', '2018', '2');
INSERT INTO `show` VALUES ('3', '34', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '35', '30', '2018', '2');
INSERT INTO `show` VALUES ('3', '36', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '37', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '38', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '39', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '40', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '41', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '42', '80', '2018', '2');
INSERT INTO `show` VALUES ('3', '43', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '44', '30', '2018', '2');
INSERT INTO `show` VALUES ('3', '45', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '46', '40', '2018', '2');
INSERT INTO `show` VALUES ('3', '47', '30', '2018', '2');
INSERT INTO `show` VALUES ('3', '48', '70', '2018', '2');
INSERT INTO `show` VALUES ('3', '49', '50', '2018', '2');
INSERT INTO `show` VALUES ('3', '50', '30', '2018', '2');
INSERT INTO `show` VALUES ('3', '51', '70', '2018', '2');
INSERT INTO `show` VALUES ('3', '52', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '53', '60', '2018', '2');
INSERT INTO `show` VALUES ('3', '54', '50', '2018', '2');
INSERT INTO `show` VALUES ('4', '1', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '2', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '3', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '4', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '5', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '6', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '7', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '8', '60', '2015', '7');
INSERT INTO `show` VALUES ('4', '9', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '10', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '11', '60', '2015', '7');
INSERT INTO `show` VALUES ('4', '12', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '13', '80', '2015', '7');
INSERT INTO `show` VALUES ('4', '14', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '15', '60', '2015', '7');
INSERT INTO `show` VALUES ('4', '16', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '17', '60', '2015', '7');
INSERT INTO `show` VALUES ('4', '18', '60', '2015', '7');
INSERT INTO `show` VALUES ('4', '19', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '20', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '21', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '22', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '23', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '24', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '25', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '26', '60', '2015', '7');
INSERT INTO `show` VALUES ('4', '27', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '28', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '29', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '30', '80', '2015', '7');
INSERT INTO `show` VALUES ('4', '31', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '32', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '33', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '34', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '35', '30', '2015', '7');
INSERT INTO `show` VALUES ('4', '36', '30', '2015', '7');
INSERT INTO `show` VALUES ('4', '37', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '38', '30', '2015', '7');
INSERT INTO `show` VALUES ('4', '39', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '40', '30', '2015', '7');
INSERT INTO `show` VALUES ('4', '41', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '42', '80', '2015', '7');
INSERT INTO `show` VALUES ('4', '43', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '44', '60', '2015', '7');
INSERT INTO `show` VALUES ('4', '45', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '46', '80', '2015', '7');
INSERT INTO `show` VALUES ('4', '47', '80', '2015', '7');
INSERT INTO `show` VALUES ('4', '48', '80', '2015', '7');
INSERT INTO `show` VALUES ('4', '49', '70', '2015', '7');
INSERT INTO `show` VALUES ('4', '50', '40', '2015', '7');
INSERT INTO `show` VALUES ('4', '51', '30', '2015', '7');
INSERT INTO `show` VALUES ('4', '52', '50', '2015', '7');
INSERT INTO `show` VALUES ('4', '53', '80', '2015', '7');
INSERT INTO `show` VALUES ('4', '54', '70', '2015', '7');
INSERT INTO `show` VALUES ('5', '1', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '2', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '3', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '4', '40', '2018', '2');
INSERT INTO `show` VALUES ('5', '5', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '6', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '7', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '8', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '9', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '10', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '11', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '12', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '13', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '14', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '15', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '16', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '17', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '18', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '19', '80', '2018', '2');
INSERT INTO `show` VALUES ('5', '20', '80', '2018', '2');
INSERT INTO `show` VALUES ('5', '21', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '22', '80', '2018', '2');
INSERT INTO `show` VALUES ('5', '23', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '24', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '25', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '26', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '27', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '28', '30', '2018', '2');
INSERT INTO `show` VALUES ('5', '29', '40', '2018', '2');
INSERT INTO `show` VALUES ('5', '30', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '31', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '32', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '33', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '34', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '35', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '36', '40', '2018', '2');
INSERT INTO `show` VALUES ('5', '37', '30', '2018', '2');
INSERT INTO `show` VALUES ('5', '38', '30', '2018', '2');
INSERT INTO `show` VALUES ('5', '39', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '40', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '41', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '42', '80', '2018', '2');
INSERT INTO `show` VALUES ('5', '43', '80', '2018', '2');
INSERT INTO `show` VALUES ('5', '44', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '45', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '46', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '47', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '48', '70', '2018', '2');
INSERT INTO `show` VALUES ('5', '49', '80', '2018', '2');
INSERT INTO `show` VALUES ('5', '50', '80', '2018', '2');
INSERT INTO `show` VALUES ('5', '51', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '52', '60', '2018', '2');
INSERT INTO `show` VALUES ('5', '53', '50', '2018', '2');
INSERT INTO `show` VALUES ('5', '54', '50', '2018', '2');
INSERT INTO `show` VALUES ('6', '1', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '2', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '3', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '4', '60', '2016', '1');
INSERT INTO `show` VALUES ('6', '5', '80', '2016', '1');
INSERT INTO `show` VALUES ('6', '6', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '7', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '8', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '9', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '10', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '11', '80', '2016', '1');
INSERT INTO `show` VALUES ('6', '12', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '13', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '14', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '15', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '16', '60', '2016', '1');
INSERT INTO `show` VALUES ('6', '17', '30', '2016', '1');
INSERT INTO `show` VALUES ('6', '18', '30', '2016', '1');
INSERT INTO `show` VALUES ('6', '19', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '20', '30', '2016', '1');
INSERT INTO `show` VALUES ('6', '21', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '22', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '23', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '24', '60', '2016', '1');
INSERT INTO `show` VALUES ('6', '25', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '26', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '27', '80', '2016', '1');
INSERT INTO `show` VALUES ('6', '28', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '29', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '30', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '31', '30', '2016', '1');
INSERT INTO `show` VALUES ('6', '32', '80', '2016', '1');
INSERT INTO `show` VALUES ('6', '33', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '34', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '35', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '36', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '37', '80', '2016', '1');
INSERT INTO `show` VALUES ('6', '38', '80', '2016', '1');
INSERT INTO `show` VALUES ('6', '39', '30', '2016', '1');
INSERT INTO `show` VALUES ('6', '40', '60', '2016', '1');
INSERT INTO `show` VALUES ('6', '41', '60', '2016', '1');
INSERT INTO `show` VALUES ('6', '42', '60', '2016', '1');
INSERT INTO `show` VALUES ('6', '43', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '44', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '45', '70', '2016', '1');
INSERT INTO `show` VALUES ('6', '46', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '47', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '48', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '49', '30', '2016', '1');
INSERT INTO `show` VALUES ('6', '50', '40', '2016', '1');
INSERT INTO `show` VALUES ('6', '51', '60', '2016', '1');
INSERT INTO `show` VALUES ('6', '52', '50', '2016', '1');
INSERT INTO `show` VALUES ('6', '53', '30', '2016', '1');
INSERT INTO `show` VALUES ('6', '54', '40', '2016', '1');
INSERT INTO `show` VALUES ('7', '1', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '2', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '3', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '4', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '5', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '6', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '7', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '8', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '9', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '10', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '11', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '12', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '13', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '14', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '15', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '16', '80', '2013', '12');
INSERT INTO `show` VALUES ('7', '17', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '18', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '19', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '20', '80', '2013', '12');
INSERT INTO `show` VALUES ('7', '21', '80', '2013', '12');
INSERT INTO `show` VALUES ('7', '22', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '23', '80', '2013', '12');
INSERT INTO `show` VALUES ('7', '24', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '25', '80', '2013', '12');
INSERT INTO `show` VALUES ('7', '26', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '27', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '28', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '29', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '30', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '31', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '32', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '33', '30', '2013', '12');
INSERT INTO `show` VALUES ('7', '34', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '35', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '36', '80', '2013', '12');
INSERT INTO `show` VALUES ('7', '37', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '38', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '39', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '40', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '41', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '42', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '43', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '44', '80', '2013', '12');
INSERT INTO `show` VALUES ('7', '45', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '46', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '47', '40', '2013', '12');
INSERT INTO `show` VALUES ('7', '48', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '49', '70', '2013', '12');
INSERT INTO `show` VALUES ('7', '50', '30', '2013', '12');
INSERT INTO `show` VALUES ('7', '51', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '52', '50', '2013', '12');
INSERT INTO `show` VALUES ('7', '53', '60', '2013', '12');
INSERT INTO `show` VALUES ('7', '54', '40', '2013', '12');
INSERT INTO `show` VALUES ('8', '1', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '2', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '3', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '4', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '5', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '6', '30', '2014', '12');
INSERT INTO `show` VALUES ('8', '7', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '8', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '9', '30', '2014', '12');
INSERT INTO `show` VALUES ('8', '10', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '11', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '12', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '13', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '14', '80', '2014', '12');
INSERT INTO `show` VALUES ('8', '15', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '16', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '17', '30', '2014', '12');
INSERT INTO `show` VALUES ('8', '18', '80', '2014', '12');
INSERT INTO `show` VALUES ('8', '19', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '20', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '21', '30', '2014', '12');
INSERT INTO `show` VALUES ('8', '22', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '23', '80', '2014', '12');
INSERT INTO `show` VALUES ('8', '24', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '25', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '26', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '27', '30', '2014', '12');
INSERT INTO `show` VALUES ('8', '28', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '29', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '30', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '31', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '32', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '33', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '34', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '35', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '36', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '37', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '38', '80', '2014', '12');
INSERT INTO `show` VALUES ('8', '39', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '40', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '41', '30', '2014', '12');
INSERT INTO `show` VALUES ('8', '42', '80', '2014', '12');
INSERT INTO `show` VALUES ('8', '43', '60', '2014', '12');
INSERT INTO `show` VALUES ('8', '44', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '45', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '46', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '47', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '48', '40', '2014', '12');
INSERT INTO `show` VALUES ('8', '49', '70', '2014', '12');
INSERT INTO `show` VALUES ('8', '50', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '51', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '52', '50', '2014', '12');
INSERT INTO `show` VALUES ('8', '53', '30', '2014', '12');
INSERT INTO `show` VALUES ('8', '54', '70', '2014', '12');
INSERT INTO `show` VALUES ('9', '1', '80', '2015', '7');
INSERT INTO `show` VALUES ('9', '2', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '3', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '4', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '5', '60', '2015', '7');
INSERT INTO `show` VALUES ('9', '6', '80', '2015', '7');
INSERT INTO `show` VALUES ('9', '7', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '8', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '9', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '10', '60', '2015', '7');
INSERT INTO `show` VALUES ('9', '11', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '12', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '13', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '14', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '15', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '16', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '17', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '18', '80', '2015', '7');
INSERT INTO `show` VALUES ('9', '19', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '20', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '21', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '22', '80', '2015', '7');
INSERT INTO `show` VALUES ('9', '23', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '24', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '25', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '26', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '27', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '28', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '29', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '30', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '31', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '32', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '33', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '34', '60', '2015', '7');
INSERT INTO `show` VALUES ('9', '35', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '36', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '37', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '38', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '39', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '40', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '41', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '42', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '43', '80', '2015', '7');
INSERT INTO `show` VALUES ('9', '44', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '45', '60', '2015', '7');
INSERT INTO `show` VALUES ('9', '46', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '47', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '48', '70', '2015', '7');
INSERT INTO `show` VALUES ('9', '49', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '50', '40', '2015', '7');
INSERT INTO `show` VALUES ('9', '51', '50', '2015', '7');
INSERT INTO `show` VALUES ('9', '52', '30', '2015', '7');
INSERT INTO `show` VALUES ('9', '53', '60', '2015', '7');
INSERT INTO `show` VALUES ('9', '54', '70', '2015', '7');
INSERT INTO `show` VALUES ('10', '1', '30', '2015', '4');
INSERT INTO `show` VALUES ('10', '2', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '3', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '4', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '5', '80', '2015', '4');
INSERT INTO `show` VALUES ('10', '6', '50', '2015', '4');
INSERT INTO `show` VALUES ('10', '7', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '8', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '9', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '10', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '11', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '12', '80', '2015', '4');
INSERT INTO `show` VALUES ('10', '13', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '14', '30', '2015', '4');
INSERT INTO `show` VALUES ('10', '15', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '16', '80', '2015', '4');
INSERT INTO `show` VALUES ('10', '17', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '18', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '19', '50', '2015', '4');
INSERT INTO `show` VALUES ('10', '20', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '21', '80', '2015', '4');
INSERT INTO `show` VALUES ('10', '22', '50', '2015', '4');
INSERT INTO `show` VALUES ('10', '23', '30', '2015', '4');
INSERT INTO `show` VALUES ('10', '24', '30', '2015', '4');
INSERT INTO `show` VALUES ('10', '25', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '26', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '27', '50', '2015', '4');
INSERT INTO `show` VALUES ('10', '28', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '29', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '30', '30', '2015', '4');
INSERT INTO `show` VALUES ('10', '31', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '32', '50', '2015', '4');
INSERT INTO `show` VALUES ('10', '33', '50', '2015', '4');
INSERT INTO `show` VALUES ('10', '34', '50', '2015', '4');
INSERT INTO `show` VALUES ('10', '35', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '36', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '37', '30', '2015', '4');
INSERT INTO `show` VALUES ('10', '38', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '39', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '40', '80', '2015', '4');
INSERT INTO `show` VALUES ('10', '41', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '42', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '43', '30', '2015', '4');
INSERT INTO `show` VALUES ('10', '44', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '45', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '46', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '47', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '48', '70', '2015', '4');
INSERT INTO `show` VALUES ('10', '49', '40', '2015', '4');
INSERT INTO `show` VALUES ('10', '50', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '51', '80', '2015', '4');
INSERT INTO `show` VALUES ('10', '52', '80', '2015', '4');
INSERT INTO `show` VALUES ('10', '53', '60', '2015', '4');
INSERT INTO `show` VALUES ('10', '54', '70', '2015', '4');
INSERT INTO `show` VALUES ('11', '1', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '2', '80', '2017', '7');
INSERT INTO `show` VALUES ('11', '3', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '4', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '5', '80', '2017', '7');
INSERT INTO `show` VALUES ('11', '6', '80', '2017', '7');
INSERT INTO `show` VALUES ('11', '7', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '8', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '9', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '10', '30', '2017', '7');
INSERT INTO `show` VALUES ('11', '11', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '12', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '13', '80', '2017', '7');
INSERT INTO `show` VALUES ('11', '14', '30', '2017', '7');
INSERT INTO `show` VALUES ('11', '15', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '16', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '17', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '18', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '19', '30', '2017', '7');
INSERT INTO `show` VALUES ('11', '20', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '21', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '22', '80', '2017', '7');
INSERT INTO `show` VALUES ('11', '23', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '24', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '25', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '26', '30', '2017', '7');
INSERT INTO `show` VALUES ('11', '27', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '28', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '29', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '30', '30', '2017', '7');
INSERT INTO `show` VALUES ('11', '31', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '32', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '33', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '34', '30', '2017', '7');
INSERT INTO `show` VALUES ('11', '35', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '36', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '37', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '38', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '39', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '40', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '41', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '42', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '43', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '44', '50', '2017', '7');
INSERT INTO `show` VALUES ('11', '45', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '46', '40', '2017', '7');
INSERT INTO `show` VALUES ('11', '47', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '48', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '49', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '50', '80', '2017', '7');
INSERT INTO `show` VALUES ('11', '51', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '52', '70', '2017', '7');
INSERT INTO `show` VALUES ('11', '53', '60', '2017', '7');
INSERT INTO `show` VALUES ('11', '54', '70', '2017', '7');
INSERT INTO `show` VALUES ('12', '1', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '2', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '3', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '4', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '5', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '6', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '7', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '8', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '9', '30', '2006', '6');
INSERT INTO `show` VALUES ('12', '10', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '11', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '12', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '13', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '14', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '15', '30', '2006', '6');
INSERT INTO `show` VALUES ('12', '16', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '17', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '18', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '19', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '20', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '21', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '22', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '23', '30', '2006', '6');
INSERT INTO `show` VALUES ('12', '24', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '25', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '26', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '27', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '28', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '29', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '30', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '31', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '32', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '33', '30', '2006', '6');
INSERT INTO `show` VALUES ('12', '34', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '35', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '36', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '37', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '38', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '39', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '40', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '41', '60', '2006', '6');
INSERT INTO `show` VALUES ('12', '42', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '43', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '44', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '45', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '46', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '47', '80', '2006', '6');
INSERT INTO `show` VALUES ('12', '48', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '49', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '50', '40', '2006', '6');
INSERT INTO `show` VALUES ('12', '51', '30', '2006', '6');
INSERT INTO `show` VALUES ('12', '52', '50', '2006', '6');
INSERT INTO `show` VALUES ('12', '53', '70', '2006', '6');
INSERT INTO `show` VALUES ('12', '54', '80', '2006', '6');

-- ----------------------------
-- Table structure for theater
-- ----------------------------
DROP TABLE IF EXISTS `theater`;
CREATE TABLE `theater` (
  `TID` int(11) NOT NULL,
  `TNAME` char(100) DEFAULT NULL,
  `TAREA` char(50) DEFAULT NULL,
  `ADDRESS` char(200) DEFAULT NULL,
  PRIMARY KEY (`TID`),
  UNIQUE KEY `TID` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of theater
-- ----------------------------
INSERT INTO `theater` VALUES ('1', '金逸国际影城南湖店', '洪山区', '武昌区丁字桥南路518号南国南湖城市广场3楼');
INSERT INTO `theater` VALUES ('2', '洪山天河影城', '洪山区', '湖北省洪山区珞瑜路6号');
INSERT INTO `theater` VALUES ('3', '光谷正华银兴影城', '洪山区', '洪山区民族大道158号光谷时间广场3楼');
INSERT INTO `theater` VALUES ('4', '华谊兄弟光谷天地影院', '洪山区', '洪山区关山大道光谷天地F1区三楼');
INSERT INTO `theater` VALUES ('5', '巨幕影城光谷广场资本大厦店', '洪山区', '洪山区光谷广场光谷资本大厦四楼');
INSERT INTO `theater` VALUES ('6', 'CGV星聚汇影院光谷店', '洪山区', '东湖新技术开发区光谷步行街4期德国风情街8号楼3F');
INSERT INTO `theater` VALUES ('7', '华夏国际影城鲁广店', '洪山区', '东湖高新技术开发区珞喻路 726 号');
INSERT INTO `theater` VALUES ('8', 'CGV国际影城', '洪山区', '湖北青山区和平大道809号奥山世纪广场3楼');
INSERT INTO `theater` VALUES ('9', '天河欢乐汇影城', '洪山区', '书城路18号欢乐汇大楼5层');
INSERT INTO `theater` VALUES ('10', '银兴菲林佰港城店', '洪山区', '北港村文治街武昌府维佳佰港城广场四楼');
INSERT INTO `theater` VALUES ('11', '幸福蓝海国际影城雄楚店', '洪山区', '雄楚大道888号金地中心城雄楚一号4楼');
INSERT INTO `theater` VALUES ('12', '耀莱成龙国际影城', '洪山区', '珞喻路889号融众国际大厦6-7层');
INSERT INTO `theater` VALUES ('13', '万达影城春树里店', '武昌区', '武昌区中北路166号岳家嘴东湖春树里购物中心四层');
INSERT INTO `theater` VALUES ('14', '洪山礼堂', '武昌区', '武昌区洪山路81号');
INSERT INTO `theater` VALUES ('15', '洪山礼堂银兴电影城', '武昌区', '水果湖洪山路81号洪山礼堂');
INSERT INTO `theater` VALUES ('16', '金逸国际影城店', '武昌区', '湖北省武昌徐东大街18号销品茂5楼');
INSERT INTO `theater` VALUES ('17', '湖北剧院银兴影城', '武昌区', '武昌区阅马场湖北剧院一楼、四楼');
INSERT INTO `theater` VALUES ('18', '江汉环球电影城', '武昌区', '武昌区司门口解放路464号原江汉剧场户部巷对面');
INSERT INTO `theater` VALUES ('19', '亚贸兴汇影城', '武昌区', '武昌区武珞路628号亚贸广场购物中心6楼');
INSERT INTO `theater` VALUES ('20', '横店影视电影城武昌店', '武昌区', '张之洞路南国首义汇广场南三楼');
INSERT INTO `theater` VALUES ('21', '金逸国际影城中南店', '武昌区', '武昌区武昌武珞路442号');
INSERT INTO `theater` VALUES ('22', '银兴菲林影城福克茂店', '武昌区', '湖北武昌区友谊大道团结村路福客茂五楼');
INSERT INTO `theater` VALUES ('23', '银兴菲林国际影城群星城店', '武昌区', '徐东大街120号群星城五楼');
INSERT INTO `theater` VALUES ('24', '星美国际影城漫时区店', '武昌区', '友谊大道福星惠誉漫时区3栋3楼星美国际影城');
INSERT INTO `theater` VALUES ('25', '卢米埃凯德181影城', '武昌区', '武昌区中北路23号凯德广场1818中心七楼');
INSERT INTO `theater` VALUES ('26', '华夏国际影城后湖百步亭店', '江岸区', '江岸区后湖大道268号新生活摩尔城3楼');
INSERT INTO `theater` VALUES ('27', '中影国际影城东购店', '江岸区', '江岸区二七路汉口东部购物公园C2栋4楼');
INSERT INTO `theater` VALUES ('28', 'CGV星星国际影城', '江岸区', '江岸区芦沟桥路28号 天地11号楼');
INSERT INTO `theater` VALUES ('29', '奥斯卡上东汇影城', '江岸区', '湖北武昌区江岸区黄浦路68号，上东汇广场6楼，161医院旁');
INSERT INTO `theater` VALUES ('30', '城市广场摩尔国际电影城', '江岸区', '后湖大道111号汉口城市广场A座3楼');
INSERT INTO `theater` VALUES ('31', '银兴乐天电影城', '江汉区', '江汉区万松园路100号西园步行街三楼');
INSERT INTO `theater` VALUES ('32', '武商摩尔国际电影城', '江汉区', '江汉区解放大道690号7、8楼');
INSERT INTO `theater` VALUES ('33', '万达影城菱角湖店', '江汉区', '江汉区新华西路唐家墩5号，菱角湖万达广场娱乐楼四层');
INSERT INTO `theater` VALUES ('34', '万达国际电影城', '江汉区', '江汉区交通路1号万达商业广场C座二层');
INSERT INTO `theater` VALUES ('35', '环艺电影城', '江汉区', '中山大道608号新民众乐园4楼');
INSERT INTO `theater` VALUES ('36', '金逸国际影城杨汊湖店', '江汉区', '江汉区姑嫂树路12号，南国北都城市广场3F');
INSERT INTO `theater` VALUES ('37', '泛海国际影城', '江汉区', '云彩路198号泛海城市购物中心五层');
INSERT INTO `theater` VALUES ('38', '银兴乐天影城江夏店', '江夏区', '江夏大道128号附1号中央大街2号楼4层');
INSERT INTO `theater` VALUES ('39', '大地数字影院宜家', '江夏区', '江夏区兴新街宜佳广场四楼');
INSERT INTO `theater` VALUES ('40', '大地影院江夏店', '江夏区', '江夏区兴新街136号宜佳广场四楼东侧');
INSERT INTO `theater` VALUES ('41', '高德国际影城', '江夏区', '文华路37号中百广场6楼');
INSERT INTO `theater` VALUES ('42', '金逸国际影城武胜路店', '硚口区', '兰州市安宁区安宁西路3号康桥国际购物中心5层');
INSERT INTO `theater` VALUES ('43', '橙天嘉禾南国西汇影城', '硚口区', '解放大道387号汉口宗关水厂南国西汇城市广场二期5楼');
INSERT INTO `theater` VALUES ('44', '金逸IMAX荟聚店', '硚口区', '长宜路1号荟聚购物中心4层金逸影城');
INSERT INTO `theater` VALUES ('45', '武商众圆摩尔国际电影城', '青山区', '和平大道959号武商众圆广场4—5楼');
INSERT INTO `theater` VALUES ('46', '金逸国际影城王家湾店', '汉阳区', '汉阳区王家湾龙阳大道特6号摩尔城C区5楼');
INSERT INTO `theater` VALUES ('47', '汉阳天河国际影城', '汉阳区', '汉阳大道687号，汉商21购物娱乐中心三楼');
INSERT INTO `theater` VALUES ('48', '大地影院-汉阳新世界', '汉阳区', '汉阳区鹦鹉大道27号新世界百货5楼');
INSERT INTO `theater` VALUES ('49', '百老汇影院', '汉阳区', '龙阳大道58号汉阳人信汇商业中心A座4层');
INSERT INTO `theater` VALUES ('50', '金逸国际影城吴家山北冰洋店', '东西湖区', '吴家山四明路北冰洋城市广场4楼');
INSERT INTO `theater` VALUES ('51', 'CGV星聚汇影城金银潭店', '东西湖区', '将军路街道办事处金银潭大道1号永旺梦乐城三层');
INSERT INTO `theater` VALUES ('52', '横店电影城汇和店', '东西湖区', '东西湖区花园中路轨道交通2号线常青花园地铁站汇和城购物中心五楼');
INSERT INTO `theater` VALUES ('53', '大地数字影院湘隆时代广场', '蔡甸区', '沌口经济技术开发区宁康路湘隆时代广场B1栋5楼');
INSERT INTO `theater` VALUES ('54', '华谊兄弟黄陂影城', '黄陂区', '黄陂区黄陂大道387号黄陂广场C座');

-- ----------------------------
-- Table structure for theatercount
-- ----------------------------
DROP TABLE IF EXISTS `theatercount`;
CREATE TABLE `theatercount` (
  `tid` int(11) NOT NULL,
  `Num` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  CONSTRAINT `tid_theaterCount` FOREIGN KEY (`tid`) REFERENCES `theater` (`TID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of theatercount
-- ----------------------------
INSERT INTO `theatercount` VALUES ('1', '12');
INSERT INTO `theatercount` VALUES ('2', '12');
INSERT INTO `theatercount` VALUES ('3', '12');
INSERT INTO `theatercount` VALUES ('4', '12');
INSERT INTO `theatercount` VALUES ('5', '12');
INSERT INTO `theatercount` VALUES ('6', '12');
INSERT INTO `theatercount` VALUES ('7', '12');
INSERT INTO `theatercount` VALUES ('8', '12');
INSERT INTO `theatercount` VALUES ('9', '12');
INSERT INTO `theatercount` VALUES ('10', '12');
INSERT INTO `theatercount` VALUES ('11', '12');
INSERT INTO `theatercount` VALUES ('12', '12');
INSERT INTO `theatercount` VALUES ('13', '12');
INSERT INTO `theatercount` VALUES ('14', '12');
INSERT INTO `theatercount` VALUES ('15', '12');
INSERT INTO `theatercount` VALUES ('16', '12');
INSERT INTO `theatercount` VALUES ('17', '12');
INSERT INTO `theatercount` VALUES ('18', '12');
INSERT INTO `theatercount` VALUES ('19', '12');
INSERT INTO `theatercount` VALUES ('20', '12');
INSERT INTO `theatercount` VALUES ('21', '12');
INSERT INTO `theatercount` VALUES ('22', '12');
INSERT INTO `theatercount` VALUES ('23', '12');
INSERT INTO `theatercount` VALUES ('24', '12');
INSERT INTO `theatercount` VALUES ('25', '12');
INSERT INTO `theatercount` VALUES ('26', '12');
INSERT INTO `theatercount` VALUES ('27', '12');
INSERT INTO `theatercount` VALUES ('28', '12');
INSERT INTO `theatercount` VALUES ('29', '12');
INSERT INTO `theatercount` VALUES ('30', '12');
INSERT INTO `theatercount` VALUES ('31', '12');
INSERT INTO `theatercount` VALUES ('32', '12');
INSERT INTO `theatercount` VALUES ('33', '12');
INSERT INTO `theatercount` VALUES ('34', '12');
INSERT INTO `theatercount` VALUES ('35', '12');
INSERT INTO `theatercount` VALUES ('36', '12');
INSERT INTO `theatercount` VALUES ('37', '12');
INSERT INTO `theatercount` VALUES ('38', '12');
INSERT INTO `theatercount` VALUES ('39', '12');
INSERT INTO `theatercount` VALUES ('40', '12');
INSERT INTO `theatercount` VALUES ('41', '12');
INSERT INTO `theatercount` VALUES ('42', '12');
INSERT INTO `theatercount` VALUES ('43', '12');
INSERT INTO `theatercount` VALUES ('44', '12');
INSERT INTO `theatercount` VALUES ('45', '12');
INSERT INTO `theatercount` VALUES ('46', '12');
INSERT INTO `theatercount` VALUES ('47', '12');
INSERT INTO `theatercount` VALUES ('48', '12');
INSERT INTO `theatercount` VALUES ('49', '12');
INSERT INTO `theatercount` VALUES ('50', '12');
INSERT INTO `theatercount` VALUES ('51', '12');
INSERT INTO `theatercount` VALUES ('52', '12');
INSERT INTO `theatercount` VALUES ('53', '12');
INSERT INTO `theatercount` VALUES ('54', '12');

-- ----------------------------
-- View structure for earlestshow
-- ----------------------------
DROP VIEW IF EXISTS `earlestshow`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `earlestshow` AS select `x`.`FID` AS `fid`,`x`.`TID` AS `tid`,`y`.`minY` AS `minYear`,min(`x`.`MONTH`) AS `minMonth` from (`dbexp`.`show` `x` join (select `dbexp`.`show`.`FID` AS `fid`,min(`dbexp`.`show`.`YEAR`) AS `minY` from `dbexp`.`show` group by `dbexp`.`show`.`FID`) `y`) where ((`x`.`FID` = `y`.`fid`) and (`x`.`YEAR` = `y`.`minY`)) group by `x`.`FID`,`x`.`TID`,`y`.`minY` ;

-- ----------------------------
-- View structure for leading80
-- ----------------------------
DROP VIEW IF EXISTS `leading80`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `leading80` AS select `a`.`ACTID` AS `ACTID`,`a`.`ANAME` AS `ANAME`,`a`.`BYEAR` AS `BYEAR`,count(0) AS `NumOfLeading`,max(`film`.`GRADE`) AS `MaxFilmGrade` from ((`actor` `a` join `actin` on((`actin`.`ACTID` = `a`.`ACTID`))) join `film` on((`film`.`FID` = `actin`.`FID`))) where ((`a`.`BYEAR` >= 1980) and (`a`.`BYEAR` < 1990)) group by `a`.`ACTID`,`a`.`ANAME`,`a`.`BYEAR` ;

-- ----------------------------
-- Procedure structure for createTheaterCount
-- ----------------------------
DROP PROCEDURE IF EXISTS `createTheaterCount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createTheaterCount`()
BEGIN 
	create TABLE if not EXISTS theaterCount(tid int PRIMARY KEY,Num int,
					CONSTRAINT `tid_theaterCount` FOREIGN KEY (tid) REFERENCES `theater`(tid));
	DELETE from theaterCount;
	INSERT into theaterCount (SELECT tid,COUNT(*) from `show` GROUP BY TID);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for NumOfYearAnniversary
-- ----------------------------
DROP FUNCTION IF EXISTS `NumOfYearAnniversary`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NumOfYearAnniversary`(`year` int ,actid int) RETURNS int(11)
RETURN (SELECT count(*) 
				from earlestshow INNER JOIN actin on actin.fid = earlestshow.fid 
				where actin.ACTID = actid and earlestshow.minMonth = `year`)
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ACTIN_GRADE_RANGE_INSERT`;
DELIMITER ;;
CREATE TRIGGER `ACTIN_GRADE_RANGE_INSERT` BEFORE INSERT ON `actin` FOR EACH ROW BEGIN 
  DECLARE msg varchar(128);
  IF NEW.grade > 100 or NEW.grade < 0 OR new.grade<>NULL
  THEN
     SET msg = concat('Trigger Constraint ACTIN_GRADE_RANGE_INSERT violated: ', cast(NEW.grade as char));
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
  END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `ACTIN_GRADE_RANGE_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `ACTIN_GRADE_RANGE_UPDATE` BEFORE UPDATE ON `actin` FOR EACH ROW BEGIN 
  DECLARE msg varchar(128);
  IF NEW.grade > 100 or NEW.grade < 0 OR new.grade<>NULL
  THEN
     SET msg = concat('Trigger Constraint ACTIN_GRADE_RANGE_UPDATE violated: ', cast(NEW.grade as char));
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
  END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `FILM_GRADE_RANGE_INSERT`;
DELIMITER ;;
CREATE TRIGGER `FILM_GRADE_RANGE_INSERT` BEFORE INSERT ON `film` FOR EACH ROW BEGIN 
  DECLARE msg varchar(128);
  IF NEW.grade > 100 or NEW.grade < 0 OR new.grade<>NULL
  THEN
     SET msg = concat('Trigger Constraint FILM_GRADE_RANGE_INSERT violated: ', cast(NEW.grade as char));
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
  END IF;

END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `FILM_GRADE_RANGE_UPDATE`;
DELIMITER ;;
CREATE TRIGGER `FILM_GRADE_RANGE_UPDATE` BEFORE UPDATE ON `film` FOR EACH ROW BEGIN 
  DECLARE msg varchar(128);
  IF NEW.grade > 100 or NEW.grade < 0 OR new.grade<>NULL
  THEN
     SET msg = concat('Trigger Constraint FILM_GRADE_RANGE_UPDATE violated: ', cast(NEW.grade as char));
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
  END IF;

END
;;
DELIMITER ;
