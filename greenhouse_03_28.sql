/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : greenhouse

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-03-28 10:38:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base` (
  `Base_id` int(11) NOT NULL AUTO_INCREMENT,
  `Base_name` varchar(40) DEFAULT NULL,
  `Base_address` varchar(60) DEFAULT NULL,
  `Base_lat` varchar(10) DEFAULT NULL,
  `Base_long` varchar(10) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Base_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of base
-- ----------------------------
INSERT INTO `base` VALUES ('85', '智慧农业基地', '江苏大学', '2333', '6666', '127', 'N');

-- ----------------------------
-- Table structure for control
-- ----------------------------
DROP TABLE IF EXISTS `control`;
CREATE TABLE `control` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Equip_id` int(11) DEFAULT NULL,
  `Con_stage` int(11) DEFAULT NULL,
  `Control_time` varchar(40) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of control
-- ----------------------------

-- ----------------------------
-- Table structure for controlmode
-- ----------------------------
DROP TABLE IF EXISTS `controlmode`;
CREATE TABLE `controlmode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GH_id` int(11) DEFAULT NULL,
  `Mode` int(11) DEFAULT NULL,
  `Change_time` varchar(40) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `End_time` datetime DEFAULT NULL,
  `Model` int(11) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of controlmode
-- ----------------------------

-- ----------------------------
-- Table structure for con_21
-- ----------------------------
DROP TABLE IF EXISTS `con_21`;
CREATE TABLE `con_21` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eqipid_35` double DEFAULT NULL,
  `eqipid_57` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of con_21
-- ----------------------------

-- ----------------------------
-- Table structure for con_22
-- ----------------------------
DROP TABLE IF EXISTS `con_22`;
CREATE TABLE `con_22` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eqipid_39` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of con_22
-- ----------------------------

-- ----------------------------
-- Table structure for con_23
-- ----------------------------
DROP TABLE IF EXISTS `con_23`;
CREATE TABLE `con_23` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eqipid_41` double DEFAULT NULL,
  `eqipid_42` double DEFAULT NULL,
  `eqipid_44` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of con_23
-- ----------------------------

-- ----------------------------
-- Table structure for con_24
-- ----------------------------
DROP TABLE IF EXISTS `con_24`;
CREATE TABLE `con_24` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eqipid_46` double DEFAULT NULL,
  `eqipid_48` double DEFAULT NULL,
  `eqipid_49` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of con_24
-- ----------------------------

-- ----------------------------
-- Table structure for con_25
-- ----------------------------
DROP TABLE IF EXISTS `con_25`;
CREATE TABLE `con_25` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eqipid_51` double DEFAULT NULL,
  `eqipid_52` double DEFAULT NULL,
  `eqipid_53` double DEFAULT NULL,
  `eqipid_54` double DEFAULT NULL,
  `eqipid_55` double DEFAULT NULL,
  `eqipid_56` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of con_25
-- ----------------------------

-- ----------------------------
-- Table structure for con_26
-- ----------------------------
DROP TABLE IF EXISTS `con_26`;
CREATE TABLE `con_26` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eqipid_36` double DEFAULT NULL,
  `eqipid_37` double DEFAULT NULL,
  `eqipid_38` double DEFAULT NULL,
  `eqipid_40` double DEFAULT NULL,
  `eqipid_43` double DEFAULT NULL,
  `eqipid_45` double DEFAULT NULL,
  `eqipid_47` double DEFAULT NULL,
  `eqipid_50` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of con_26
-- ----------------------------

-- ----------------------------
-- Table structure for con_27
-- ----------------------------
DROP TABLE IF EXISTS `con_27`;
CREATE TABLE `con_27` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eqipid_57` double DEFAULT NULL,
  `eqipid_58` double DEFAULT NULL,
  `eqipid_59` double DEFAULT NULL,
  `eqipid_60` double DEFAULT NULL,
  `eqipid_61` double DEFAULT NULL,
  `eqipid_62` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of con_27
-- ----------------------------

-- ----------------------------
-- Table structure for crop
-- ----------------------------
DROP TABLE IF EXISTS `crop`;
CREATE TABLE `crop` (
  `Crop_id` int(11) NOT NULL AUTO_INCREMENT,
  `Crop_name` varchar(40) DEFAULT NULL,
  `Crop_code` int(11) DEFAULT NULL,
  `Crop_type` varchar(40) DEFAULT NULL,
  `Crop_period` varchar(255) DEFAULT NULL,
  `Crop_date` varchar(255) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Crop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of crop
-- ----------------------------
INSERT INTO `crop` VALUES ('12', '大白菜a', '110', '蔬菜', '无', '2017-02-29', 'N');
INSERT INTO `crop` VALUES ('13', '苹果', '111', '水果', '无', '2017-02-27', 'N');
INSERT INTO `crop` VALUES ('17', '黑木耳', '3245', '65465', '4545', '2017-03-01', 'N');
INSERT INTO `crop` VALUES ('19', '西瓜', '18', '水果', null, '2017-03-01', 'N');
INSERT INTO `crop` VALUES ('22', '水芹', '85', '21', null, '2017-02-27', 'N');
INSERT INTO `crop` VALUES ('23', '青菜', '85', '21', null, '2017-02-27', 'N');
INSERT INTO `crop` VALUES ('28', '老番茄', '13', '22', null, '2017-03-28', 'N');
INSERT INTO `crop` VALUES ('29', '大青菜', '85', '21', null, '2017-02-27', 'N');
INSERT INTO `crop` VALUES ('30', '大白菜b', '110', '蔬菜', null, '2017-02-29', 'N');

-- ----------------------------
-- Table structure for cropgh
-- ----------------------------
DROP TABLE IF EXISTS `cropgh`;
CREATE TABLE `cropgh` (
  `GH_id` varchar(255) DEFAULT NULL,
  `Crop_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cropgh
-- ----------------------------
INSERT INTO `cropgh` VALUES ('21', '110');
INSERT INTO `cropgh` VALUES ('22', '111');
INSERT INTO `cropgh` VALUES ('24', '3245');
INSERT INTO `cropgh` VALUES ('23', '18');
INSERT INTO `cropgh` VALUES ('25', '85');
INSERT INTO `cropgh` VALUES ('26', '13');

-- ----------------------------
-- Table structure for crop_fert
-- ----------------------------
DROP TABLE IF EXISTS `crop_fert`;
CREATE TABLE `crop_fert` (
  `Crop_no` varchar(20) DEFAULT NULL,
  `Fert_id` int(11) DEFAULT NULL,
  `Fert_num` varchar(20) DEFAULT NULL,
  `Fert_time` varchar(40) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of crop_fert
-- ----------------------------

-- ----------------------------
-- Table structure for crop_grouth_info
-- ----------------------------
DROP TABLE IF EXISTS `crop_grouth_info`;
CREATE TABLE `crop_grouth_info` (
  `gh_id` int(11) DEFAULT NULL COMMENT 'æ¸©å®¤id',
  `crop_name` varchar(255) DEFAULT NULL COMMENT 'ä½œç‰©åç§°',
  `crop_date` varchar(255) DEFAULT NULL COMMENT 'å®šæ¤æ—¥æœŸ',
  `crop_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'å† å¹…(é¢ç§¯)',
  `crop_height` varchar(255) DEFAULT NULL COMMENT 'æ ªé«˜',
  `crop_height_rate` varchar(255) DEFAULT NULL COMMENT 'æ ªé«˜ç”Ÿé•¿é€ŸçŽ‡',
  `crop_diameter` varchar(255) DEFAULT NULL COMMENT 'æžœå®žï¼ˆç›´å¾„ï¼‰',
  `crop_fruit_rate` varchar(255) DEFAULT NULL COMMENT 'æžœå®žç”Ÿé•¿é€ŸçŽ‡',
  `crop_stem_weight` varchar(255) DEFAULT NULL COMMENT 'èŒŽç²—',
  `crop_range_temperature` varchar(255) DEFAULT NULL COMMENT 'å† æ°”æ¸©å·®',
  `crop_nitrogen` varchar(255) DEFAULT NULL COMMENT 'æ°®',
  `crop_phosphorus` varchar(255) DEFAULT NULL COMMENT 'ç£·',
  `crop_kalium` varchar(255) DEFAULT NULL COMMENT 'é’¾'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of crop_grouth_info
-- ----------------------------
INSERT INTO `crop_grouth_info` VALUES ('25', '水芹', '2017-02-27', '200', '11', '12', '12', '12', '12', '245', '25', '254', '25');
INSERT INTO `crop_grouth_info` VALUES ('26', '草莓', '2017-03-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `crop_grouth_info` VALUES ('26', '老番茄', '2017-03-28', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `crop_grouth_info` VALUES ('26', '老番茄', '2017-03-28', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for crop_pest
-- ----------------------------
DROP TABLE IF EXISTS `crop_pest`;
CREATE TABLE `crop_pest` (
  `Crop_no` varchar(20) DEFAULT NULL,
  `Pest_id` int(11) DEFAULT NULL,
  `Pest_num` varchar(20) DEFAULT NULL,
  `Pest_time` varchar(40) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of crop_pest
-- ----------------------------

-- ----------------------------
-- Table structure for element
-- ----------------------------
DROP TABLE IF EXISTS `element`;
CREATE TABLE `element` (
  `Element_id` int(11) NOT NULL AUTO_INCREMENT,
  `Element_nam` varchar(20) DEFAULT NULL,
  `Shed_id` int(11) DEFAULT NULL,
  `Element_rate` int(11) DEFAULT NULL,
  `Element_type` int(20) DEFAULT NULL,
  `Element_unit` varchar(20) DEFAULT NULL,
  `Element_offset` varchar(20) DEFAULT NULL,
  `Data_type` varchar(20) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Element_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of element
-- ----------------------------
INSERT INTO `element` VALUES ('29', '空气温度', '21', '1', '26', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('30', '空气湿度', '21', '1', '26', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('31', '土壤温度', '21', '1', '26', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('32', '土壤水分', '21', '1', '26', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('33', 'CO2浓度', '21', '1', '26', 'ppm', '1', '1', 'N');
INSERT INTO `element` VALUES ('34', '光照度', '21', '1', '26', 'Lux', '1', '1', 'N');
INSERT INTO `element` VALUES ('35', '空气温度', '22', '1', '27', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('36', '空气湿度', '22', '1', '27', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('37', '土壤温度', '22', '1', '27', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('38', '土壤水分', '22', '1', '27', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('39', 'CO2浓度', '22', '1', '27', 'ppm', '1', '1', 'N');
INSERT INTO `element` VALUES ('40', '光照度', '22', '1', '27', 'Lux', '1', '1', 'N');
INSERT INTO `element` VALUES ('41', '空气温度', '23', '1', '28', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('42', '空气湿度', '23', '1', '28', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('43', '土壤温度', '23', '1', '28', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('44', '土壤水分', '23', '1', '28', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('45', 'CO2浓度', '23', '1', '28', 'ppm', '1', '1', 'N');
INSERT INTO `element` VALUES ('46', '光照度', '23', '1', '28', 'Lux', '1', '1', 'N');
INSERT INTO `element` VALUES ('47', '空气温度', '24', '1', '29', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('48', '空气湿度', '24', '1', '29', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('49', '土壤温度', '24', '1', '29', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('50', '土壤水分', '24', '1', '29', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('51', 'CO2浓度', '24', '1', '29', 'ppm', '1', '1', 'N');
INSERT INTO `element` VALUES ('52', '光照度', '24', '1', '29', 'Lux', '1', '1', 'N');
INSERT INTO `element` VALUES ('53', '空气温度', '25', '1', '30', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('54', '空气湿度', '25', '1', '30', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('55', '土壤温度', '25', '1', '30', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('56', '土壤水分', '25', '1', '30', '', '1', '1', 'N');
INSERT INTO `element` VALUES ('57', 'CO2浓度', '25', '1', '30', 'ppm', '1', '1', 'N');
INSERT INTO `element` VALUES ('58', '光照度', '25', '1', '30', 'Lux', '1', '1', 'N');
INSERT INTO `element` VALUES ('59', '空气温度', '26', '1', '31', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('60', '空气湿度', '26', '1', '31', '%', '1', '1', 'N');
INSERT INTO `element` VALUES ('61', '土壤温度', '26', '1', '31', '℃', '1', '1', 'N');
INSERT INTO `element` VALUES ('62', '土壤水分', '26', '1', '31', '', '1', '1', 'N');
INSERT INTO `element` VALUES ('63', 'CO2浓度', '26', '1', '31', 'ppm', '1', '1', 'N');
INSERT INTO `element` VALUES ('64', '光照度', '26', '1', '31', 'Lux', '1', '1', 'N');
INSERT INTO `element` VALUES ('65', 'EC', '27', '24', '32', 'mS/cm', '1', '2', 'N');
INSERT INTO `element` VALUES ('66', 'PH', '27', '24', '32', null, '1', '2', 'N');
INSERT INTO `element` VALUES ('67', '流量', '27', '24', '32', 'L/min', '1', '2', 'N');
INSERT INTO `element` VALUES ('68', '灌溉量', '27', '24', '32', 'L', '1', '2', 'N');
INSERT INTO `element` VALUES ('69', '冠幅(面积)', '25', '2', '33', 'm2', '1', '3', 'N');
INSERT INTO `element` VALUES ('70', '株高', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('71', '株高生长速率', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('72', '果实（直径）', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('73', '果实生长速率', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('74', '茎粗', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('75', '茎粗生长速率', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('76', '冠气温差', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('77', '氮', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('78', '磷', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('79', '钾', '25', '2', '33', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('80', '冠幅(面积)', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('81', '株高', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('82', '株高生长速率', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('83', '果实（直径）', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('84', '果实生长速率', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('85', '茎粗', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('86', '茎粗生长速率', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('87', '冠气温差', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('88', '氮', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('89', '磷', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('90', '钾', '26', '2', '34', 'm', '1', '3', 'N');
INSERT INTO `element` VALUES ('91', '空气温度', '28', '3', '35', '℃', '1', '4', 'N');
INSERT INTO `element` VALUES ('92', '空气湿度', '28', '3', '35', '%', '1', '4', 'N');
INSERT INTO `element` VALUES ('93', 'CO2浓度', '28', '3', '35', 'Ppm', '1', '4', 'N');
INSERT INTO `element` VALUES ('94', '光照度', '28', '3', '35', 'Lux', '1', '4', 'N');
INSERT INTO `element` VALUES ('95', '风速', '28', '3', '35', '米/秒', '1', '4', 'N');
INSERT INTO `element` VALUES ('96', '风向', '28', '3', '35', '度', '1', '4', 'N');
INSERT INTO `element` VALUES ('97', '雨量', '28', '3', '35', '有/无', '1', '4', 'N');
INSERT INTO `element` VALUES ('98', '累积施肥量', '21', '4', '36', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('99', '累积灌溉量', '21', '4', '36', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('100', '累积施肥量', '22', '4', '37', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('101', '累积灌溉量', '22', '4', '37', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('102', '累积施肥量', '23', '4', '38', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('103', '累积灌溉量', '23', '4', '38', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('104', '累积施肥量', '24', '4', '39', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('105', '累积灌溉量', '24', '4', '39', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('106', '累积施肥量', '25', '4', '40', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('107', '累积灌溉量', '25', '4', '40', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('108', '累积施肥量', '26', '4', '41', 'L', '1', '5', 'N');
INSERT INTO `element` VALUES ('109', '累积灌溉量', '26', '4', '41', 'L', '1', '5', 'N');

-- ----------------------------
-- Table structure for element_type
-- ----------------------------
DROP TABLE IF EXISTS `element_type`;
CREATE TABLE `element_type` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `GH_id` int(20) DEFAULT NULL,
  `Type` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of element_type
-- ----------------------------
INSERT INTO `element_type` VALUES ('32', '27', '灌溉');
INSERT INTO `element_type` VALUES ('31', '26', '气象');
INSERT INTO `element_type` VALUES ('30', '25', '气象');
INSERT INTO `element_type` VALUES ('26', '21', '气象');
INSERT INTO `element_type` VALUES ('27', '22', '气象');
INSERT INTO `element_type` VALUES ('28', '23', '气象');
INSERT INTO `element_type` VALUES ('29', '24', '气象');
INSERT INTO `element_type` VALUES ('33', '25', '作物');
INSERT INTO `element_type` VALUES ('34', '26', '作物');
INSERT INTO `element_type` VALUES ('35', '28', '室外气象');
INSERT INTO `element_type` VALUES ('36', '21', '灌溉');
INSERT INTO `element_type` VALUES ('37', '22', '灌溉');
INSERT INTO `element_type` VALUES ('38', '23', '灌溉');
INSERT INTO `element_type` VALUES ('39', '24', '灌溉');
INSERT INTO `element_type` VALUES ('40', '25', '灌溉');
INSERT INTO `element_type` VALUES ('41', '26', '灌溉');

-- ----------------------------
-- Table structure for fertilizer
-- ----------------------------
DROP TABLE IF EXISTS `fertilizer`;
CREATE TABLE `fertilizer` (
  `Fert_id` int(11) NOT NULL AUTO_INCREMENT,
  `Fert_name` varchar(40) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`Fert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of fertilizer
-- ----------------------------

-- ----------------------------
-- Table structure for gh5_cropinfo
-- ----------------------------
DROP TABLE IF EXISTS `gh5_cropinfo`;
CREATE TABLE `gh5_cropinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '温室id',
  `date` varchar(255) NOT NULL COMMENT '定植日期',
  `crop_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '冠幅(面积)',
  `crop_height` varchar(255) DEFAULT NULL COMMENT '株高',
  `crop_height_rate` varchar(255) DEFAULT NULL COMMENT '株高生长速率',
  `crop_diameter` varchar(255) DEFAULT NULL COMMENT '果实（直径）',
  `crop_fruit_rate` varchar(255) DEFAULT NULL COMMENT '果实生长速率',
  `crop_stem_weight` varchar(255) DEFAULT NULL COMMENT '茎粗',
  `crop_stem_rate` varchar(255) DEFAULT NULL COMMENT '茎生长速率',
  `crop_range_temperature` varchar(255) DEFAULT NULL COMMENT '冠气温差',
  `crop_nitrogen` varchar(255) DEFAULT NULL COMMENT '氮',
  `crop_phosphorus` varchar(255) DEFAULT NULL COMMENT '磷',
  `crop_kalium` varchar(255) DEFAULT NULL COMMENT '钾',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gh5_cropinfo
-- ----------------------------

-- ----------------------------
-- Table structure for gh_control_device
-- ----------------------------
DROP TABLE IF EXISTS `gh_control_device`;
CREATE TABLE `gh_control_device` (
  `gh_id` int(11) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥ÂºÂ¦id',
  `cd_producer` varchar(255) DEFAULT NULL COMMENT 'Ã¤ÂºÅ’Ã¦Â°Â§Ã¥Å’â€“Ã§Â¢Â³Ã¥Ââ€˜Ã§â€Å¸Ã¥â„¢Â¨',
  `working_mode` varchar(255) DEFAULT NULL COMMENT 'Ã¥Â·Â¥Ã¤Â½Å“Ã¦â€“Â¹Ã¥Â¼Â'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gh_control_device
-- ----------------------------

-- ----------------------------
-- Table structure for gh_id_name
-- ----------------------------
DROP TABLE IF EXISTS `gh_id_name`;
CREATE TABLE `gh_id_name` (
  `gh_id` int(11) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤id',
  `gh_name` varchar(255) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤Ã¦Â¨Â¡Ã¥Â¼Â'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gh_id_name
-- ----------------------------

-- ----------------------------
-- Table structure for gh_inner_environment
-- ----------------------------
DROP TABLE IF EXISTS `gh_inner_environment`;
CREATE TABLE `gh_inner_environment` (
  `gh_id` int(11) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤id',
  `air_temperature` varchar(255) DEFAULT NULL COMMENT 'Ã§Â©ÂºÃ¦Â°â€Ã¦Â¸Â©Ã¥ÂºÂ¦',
  `air_humidity` varchar(255) DEFAULT NULL COMMENT 'Ã§Â©ÂºÃ¦Â°â€Ã¦Â¹Â¿Ã¥ÂºÂ¦',
  `soil_temperature` varchar(255) DEFAULT NULL COMMENT 'Ã¥Å“Å¸Ã¥Â£Â¤Ã¦Â¸Â©Ã¥ÂºÂ¦',
  `soil_moisture` varchar(255) DEFAULT NULL COMMENT 'Ã¥Å“Å¸Ã¥Â£Â¤Ã¦Â°Â´Ã¥Ë†â€ ',
  `cd_thickness` varchar(255) DEFAULT NULL COMMENT 'Ã¤ÂºÅ’Ã¦Â°Â§Ã¥Å’â€“Ã§Â¢Â³Ã¦Âµâ€œÃ¥ÂºÂ¦',
  `illuminance` varchar(255) DEFAULT NULL COMMENT 'Ã¥â€¦â€°Ã§â€¦Â§Ã¥ÂºÂ¦'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gh_inner_environment
-- ----------------------------
INSERT INTO `gh_inner_environment` VALUES ('1', '1', '2', '3', '4', '5', '6');

-- ----------------------------
-- Table structure for gh_outer_meteorological
-- ----------------------------
DROP TABLE IF EXISTS `gh_outer_meteorological`;
CREATE TABLE `gh_outer_meteorological` (
  `base_id` int(11) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤id',
  `air_temperature` varchar(255) DEFAULT NULL COMMENT 'Ã§Â©ÂºÃ¦Â°â€Ã¦Â¸Â©Ã¥ÂºÂ¦',
  `air_humidity` varchar(255) DEFAULT NULL COMMENT 'Ã§Â©ÂºÃ¦Â°â€Ã¦Â¹Â¿Ã¥ÂºÂ¦',
  `cd_thickness` varchar(255) DEFAULT NULL COMMENT 'Ã¤ÂºÅ’Ã¦Â°Â§Ã¥Å’â€“Ã§Â¢Â³Ã¦Âµâ€œÃ¥ÂºÂ¦',
  `illuminance` varchar(255) DEFAULT NULL COMMENT 'Ã¥â€¦â€°Ã§â€¦Â§Ã¥ÂºÂ¦',
  `wind_speed` varchar(255) DEFAULT NULL COMMENT 'Ã©Â£Å½Ã©â‚¬Å¸',
  `wind_direction` varchar(255) DEFAULT NULL COMMENT 'Ã©Â£Å½Ã¥Ââ€˜',
  `rainfall` varchar(255) DEFAULT NULL COMMENT 'Ã©â€ºÂ¨Ã©â€¡Â'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gh_outer_meteorological
-- ----------------------------
INSERT INTO `gh_outer_meteorological` VALUES ('85', '-40', '5', '5000', '500', '15', '220', '1');

-- ----------------------------
-- Table structure for gh_setting_control
-- ----------------------------
DROP TABLE IF EXISTS `gh_setting_control`;
CREATE TABLE `gh_setting_control` (
  `gh_id` int(11) DEFAULT NULL,
  `crop_name` varchar(255) DEFAULT NULL,
  `crop_leaf` varbinary(255) DEFAULT NULL,
  `setting_time` varchar(255) DEFAULT NULL,
  `period_one_start` varchar(255) DEFAULT NULL,
  `period_one_end` varchar(255) DEFAULT NULL,
  `period_one_wd` varchar(255) DEFAULT NULL,
  `period_one_sd` varchar(255) DEFAULT NULL,
  `period_one_gzd` varchar(255) DEFAULT NULL,
  `period_one_nd` varbinary(255) DEFAULT NULL,
  `period_two_start` varchar(255) DEFAULT NULL,
  `period_two_end` varchar(255) DEFAULT NULL,
  `period_two_wd` varchar(255) DEFAULT NULL,
  `period_two_sd` varchar(255) DEFAULT NULL,
  `period_two_gzd` varchar(255) DEFAULT NULL,
  `period_two_nd` varchar(255) DEFAULT NULL,
  `period_three_start` varchar(255) DEFAULT NULL,
  `period_three_end` varchar(255) DEFAULT NULL,
  `period_three_wd` varchar(255) DEFAULT NULL,
  `period_three_sd` varchar(255) DEFAULT NULL,
  `period_three_gzd` varchar(255) DEFAULT NULL,
  `period_three_nd` varchar(255) DEFAULT NULL,
  `period_four_start` varchar(255) DEFAULT NULL,
  `period_four_end` varchar(255) DEFAULT NULL,
  `period_four_wd` varchar(255) DEFAULT NULL,
  `period_four_sd` varchar(255) DEFAULT NULL,
  `period_four_gzd` varchar(255) DEFAULT NULL,
  `period_four_nd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gh_setting_control
-- ----------------------------
INSERT INTO `gh_setting_control` VALUES ('21', '白菜', 0x33, '2017', '06', '04', '1', '5', '3', 0x34, '06', '04', '1', '5', '3', '4', '06', '04', '1', '5', '3', '4', '06', '04', '1', '5', '3', '4');
INSERT INTO `gh_setting_control` VALUES ('22', null, null, null, '04', '15', '1', '2', '3', 0x34, '04', '15', '1', '2', '3', '4', '04', '15', '1', '2', '3', '4', '04', '15', '1', '2', '3', '4');

-- ----------------------------
-- Table structure for greenhouse
-- ----------------------------
DROP TABLE IF EXISTS `greenhouse`;
CREATE TABLE `greenhouse` (
  `GH_id` int(11) NOT NULL AUTO_INCREMENT,
  `GH_code` varchar(10) DEFAULT NULL,
  `GH_area` varchar(10) DEFAULT NULL,
  `GH_build` varchar(40) DEFAULT NULL,
  `GH_type` int(11) DEFAULT NULL,
  `Cover` int(11) DEFAULT NULL,
  `Height` double DEFAULT NULL,
  `Span` double DEFAULT NULL,
  `Num_span` int(11) DEFAULT NULL,
  `Bay` double DEFAULT NULL,
  `Num_bay` int(11) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `Base_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  `control_mode` int(11) DEFAULT '2',
  PRIMARY KEY (`GH_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of greenhouse
-- ----------------------------
INSERT INTO `greenhouse` VALUES ('21', '001', '100', '2017-02-24 00:00:00.0', '1', '1', '10', '10', '10', '10', '10', '温室1号', '85', '128', 'N', '1');
INSERT INTO `greenhouse` VALUES ('22', '002', '100', '2017-02-24 00:00:00.0', '1', '1', '10', '10', '10', '10', '10', '温室2号', '85', '129', 'N', '2');
INSERT INTO `greenhouse` VALUES ('23', '003', '100', '2017-02-24 00:00:00.0', '1', '1', '10', '10', '10', '10', '10', '温室3号', '85', '130', 'N', '1');
INSERT INTO `greenhouse` VALUES ('24', '004', '100', '2017-02-24 00:00:00.0', '1', '1', '10', '10', '10', '10', '10', '温室4号', '85', '131', 'N', '2');
INSERT INTO `greenhouse` VALUES ('25', '005', '100', '2017-02-24 00:00:00.0', '1', '1', '10', '10', '10', '10', '10', '温室5号', '85', '132', 'N', '0');
INSERT INTO `greenhouse` VALUES ('26', '006', '100', '2017-02-24 00:00:00.0', '1', '1', '10', '10', '10', '10', '10', '温室6号', '85', '133', 'N', '2');
INSERT INTO `greenhouse` VALUES ('27', '007', '100', '2017-03-04 00:00:00.0', '2', '1', '10', '10', '10', '10', '10', '灌溉系统', '85', '135', 'N', '1');
INSERT INTO `greenhouse` VALUES ('28', '008', '100', '2017-03-11 00:00:00.0', '3', '1', '10', '10', '10', '10', '10', '基地气象信息', '85', '136', 'N', '2');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `ID` int(20) NOT NULL,
  `Mess_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `Message` varchar(255) DEFAULT NULL,
  `Mess_type` int(2) DEFAULT NULL,
  `Deal` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of information
-- ----------------------------

-- ----------------------------
-- Table structure for irrigation_fertilization_information
-- ----------------------------
DROP TABLE IF EXISTS `irrigation_fertilization_information`;
CREATE TABLE `irrigation_fertilization_information` (
  `base_id` int(11) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤id',
  `control_mode` varchar(255) DEFAULT NULL COMMENT 'Ã¦Å½Â§Ã¥Ë†Â¶Ã¦Â¨Â¡Ã¥Â¼Â',
  `fertilizer_status` varchar(255) DEFAULT NULL COMMENT 'Ã¦â€“Â½Ã¨â€šÂ¥Ã¦Å“ÂºÃ§Å Â¶Ã¦â‚¬Â',
  `gh_one_irrigation_status` varchar(255) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤1Ã§ÂÅ’Ã¦Âºâ€°Ã©Ëœâ‚¬Ã§Å Â¶Ã¦â‚¬Â',
  `gh_two_irrigation_status` varchar(255) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤2Ã§ÂÅ’Ã¦Âºâ€°Ã©Ëœâ‚¬Ã§Å Â¶Ã¦â‚¬Â',
  `gh_three_irrigation_status` varchar(255) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤3Ã§ÂÅ’Ã¦Âºâ€°Ã©Ëœâ‚¬Ã§Å Â¶Ã¦â‚¬Â',
  `gh_four_irrigation_status` varchar(255) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤4Ã§ÂÅ’Ã¦Âºâ€°Ã©Ëœâ‚¬Ã§Å Â¶Ã¦â‚¬Â',
  `gh_five_irrigation_status` varchar(255) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤5Ã§ÂÅ’Ã¦Âºâ€°Ã©Ëœâ‚¬Ã§Å Â¶Ã¦â‚¬Â',
  `gh_six_irrigation_status` varchar(255) DEFAULT NULL COMMENT 'Ã¦Â¸Â©Ã¥Â®Â¤6Ã§ÂÅ’Ã¦Âºâ€°Ã©Ëœâ‚¬Ã§Å Â¶Ã¦â‚¬Â',
  `EC` varchar(255) DEFAULT NULL COMMENT 'EC',
  `PH` varchar(255) DEFAULT NULL COMMENT 'PH',
  `flow` varchar(255) DEFAULT NULL COMMENT 'Ã¦ÂµÂÃ©â€¡Â',
  `irrigation_amount` varchar(255) DEFAULT NULL COMMENT 'Ã§ÂÅ’Ã¦Âºâ€°Ã©â€¡Â'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of irrigation_fertilization_information
-- ----------------------------
INSERT INTO `irrigation_fertilization_information` VALUES ('85', '1', '1', '0', '1', '0', '1', '1', '1', 'ec', 'ph', 'flow', '1G');

-- ----------------------------
-- Table structure for modelbase
-- ----------------------------
DROP TABLE IF EXISTS `modelbase`;
CREATE TABLE `modelbase` (
  `Model_id` int(11) NOT NULL AUTO_INCREMENT,
  `Model_name` varchar(40) DEFAULT NULL,
  `Monitor_type` int(11) DEFAULT NULL,
  `Monitor_path` varchar(40) DEFAULT NULL,
  `Function` varchar(20) DEFAULT NULL,
  `Input` varchar(40) DEFAULT NULL,
  `Output` varchar(40) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of modelbase
-- ----------------------------

-- ----------------------------
-- Table structure for monitor
-- ----------------------------
DROP TABLE IF EXISTS `monitor`;
CREATE TABLE `monitor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Element_id` int(11) DEFAULT NULL,
  `Monitor_num` double DEFAULT NULL,
  `Monitor_time` datetime DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of monitor
-- ----------------------------

-- ----------------------------
-- Table structure for mon_21_26
-- ----------------------------
DROP TABLE IF EXISTS `mon_21_26`;
CREATE TABLE `mon_21_26` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_29` double DEFAULT NULL,
  `eleid_30` double DEFAULT NULL,
  `eleid_31` double DEFAULT NULL,
  `eleid_32` double DEFAULT NULL,
  `eleid_33` double DEFAULT NULL,
  `eleid_34` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1055 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_21_26
-- ----------------------------
INSERT INTO `mon_21_26` VALUES ('1', '2017-02-28 10:00:00', '25.3', '65.3', '18.2', '21', '368', '36500');
INSERT INTO `mon_21_26` VALUES ('2', '2017-02-27 11:00:00', '26.1', '62', '18.2', '21', '368', '38000');
INSERT INTO `mon_21_26` VALUES ('3', '2017-02-27 12:00:00', '27.3', '58', '18.5', '21', '368', '41000');
INSERT INTO `mon_21_26` VALUES ('4', '2017-02-27 13:00:00', '28', '54', '18.6', '21', '360', '45000');
INSERT INTO `mon_21_26` VALUES ('5', '2017-02-27 14:00:00', '29', '51', '18.6', '21', '362', '48000');
INSERT INTO `mon_21_26` VALUES ('6', '2017-02-27 15:00:00', '28', '54', '18.6', '21', '365', '45000');
INSERT INTO `mon_21_26` VALUES ('7', '2017-02-27 16:00:00', '27.1', '55', '18.5', '21', '365', '25000');
INSERT INTO `mon_21_26` VALUES ('8', '2017-02-27 17:00:00', '26.2', '55', '18.5', '21', '368', '5000');
INSERT INTO `mon_21_26` VALUES ('9', '2017-02-27 18:00:00', '23.1', '58', '18.5', '21', '370', '0');
INSERT INTO `mon_21_26` VALUES ('10', '2017-02-27 19:00:00', '20', '60', '18.5', '21', '380', '0');
INSERT INTO `mon_21_26` VALUES ('796', '2017-03-08 17:46:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('797', '2017-03-08 17:47:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('798', '2017-03-08 18:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('799', '2017-03-08 18:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('800', '2017-03-08 18:30:01', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('801', '2017-03-08 18:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('802', '2017-03-08 19:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('803', '2017-03-08 19:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('804', '2017-03-08 19:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('805', '2017-03-08 19:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('806', '2017-03-08 20:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('807', '2017-03-08 20:15:01', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('808', '2017-03-08 20:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('809', '2017-03-08 20:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('810', '2017-03-08 21:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('811', '2017-03-08 21:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('812', '2017-03-08 21:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('813', '2017-03-08 21:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('814', '2017-03-08 22:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('815', '2017-03-08 22:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('816', '2017-03-08 22:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('817', '2017-03-08 22:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('818', '2017-03-08 23:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('819', '2017-03-08 23:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('820', '2017-03-08 23:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('821', '2017-03-08 23:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('822', '2017-03-09 00:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('823', '2017-03-09 00:15:01', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('824', '2017-03-09 00:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('825', '2017-03-09 00:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('826', '2017-03-09 01:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('827', '2017-03-09 01:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('828', '2017-03-09 01:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('829', '2017-03-09 01:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('830', '2017-03-09 02:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('831', '2017-03-09 02:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('832', '2017-03-09 02:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('833', '2017-03-09 02:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('834', '2017-03-09 03:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('835', '2017-03-09 03:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('836', '2017-03-09 03:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('837', '2017-03-09 03:45:01', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('838', '2017-03-09 04:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('839', '2017-03-09 04:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('840', '2017-03-09 04:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('841', '2017-03-09 04:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('842', '2017-03-09 05:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('843', '2017-03-09 05:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('844', '2017-03-09 05:30:01', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('845', '2017-03-09 05:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('846', '2017-03-09 06:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('847', '2017-03-09 06:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('848', '2017-03-09 06:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('849', '2017-03-09 06:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('850', '2017-03-09 07:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('851', '2017-03-09 07:15:01', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('852', '2017-03-09 07:30:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('853', '2017-03-09 07:45:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('854', '2017-03-09 08:00:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('855', '2017-03-09 08:15:00', '22', '80', '16', '16', '4353', '9041');
INSERT INTO `mon_21_26` VALUES ('856', '2017-03-09 08:30:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('857', '2017-03-09 08:45:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('858', '2017-03-09 09:15:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('859', '2017-03-09 09:30:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('860', '2017-03-09 09:45:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('861', '2017-03-09 10:00:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('862', '2017-03-09 16:59:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('863', '2017-03-09 17:00:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('864', '2017-03-09 17:01:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('865', '2017-03-09 17:02:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('866', '2017-03-09 17:03:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('867', '2017-03-10 08:08:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('868', '2017-03-10 08:09:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('869', '2017-03-10 08:10:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('870', '2017-03-10 08:11:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('871', '2017-03-10 08:12:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('872', '2017-03-10 08:13:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('873', '2017-03-10 08:14:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('874', '2017-03-10 08:15:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('875', '2017-03-10 08:16:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('876', '2017-03-10 08:17:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('877', '2017-03-10 08:18:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('878', '2017-03-10 08:19:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('879', '2017-03-10 08:21:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('880', '2017-03-10 08:22:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('881', '2017-03-10 08:23:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('882', '2017-03-10 08:24:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('883', '2017-03-10 08:25:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('884', '2017-03-10 08:26:01', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('885', '2017-03-10 08:27:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('886', '2017-03-10 08:28:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('887', '2017-03-10 08:29:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('888', '2017-03-10 08:30:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('889', '2017-03-10 08:31:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('890', '2017-03-10 08:32:01', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('891', '2017-03-10 08:33:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('892', '2017-03-10 08:34:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('893', '2017-03-10 08:35:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('894', '2017-03-10 08:36:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('895', '2017-03-10 08:37:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('896', '2017-03-10 08:38:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('897', '2017-03-10 08:39:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('898', '2017-03-10 08:40:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('899', '2017-03-10 08:41:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('900', '2017-03-10 08:42:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('901', '2017-03-10 08:43:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('902', '2017-03-10 08:44:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('903', '2017-03-10 08:45:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('904', '2017-03-10 08:46:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('905', '2017-03-10 08:47:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('906', '2017-03-10 08:48:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('907', '2017-03-10 08:49:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('908', '2017-03-10 08:50:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('909', '2017-03-10 08:51:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('910', '2017-03-10 08:52:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('911', '2017-03-10 08:53:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('912', '2017-03-10 08:54:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('913', '2017-03-10 08:55:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('914', '2017-03-10 08:56:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('915', '2017-03-10 08:57:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('916', '2017-03-10 08:58:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('917', '2017-03-10 08:59:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('918', '2017-03-10 09:00:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('919', '2017-03-10 09:01:01', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('920', '2017-03-10 09:02:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('921', '2017-03-10 09:03:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('922', '2017-03-10 09:04:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('923', '2017-03-10 09:05:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('924', '2017-03-10 09:06:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('925', '2017-03-10 09:07:01', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('926', '2017-03-10 09:08:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('927', '2017-03-10 09:09:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('928', '2017-03-10 09:10:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('929', '2017-03-10 09:11:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('930', '2017-03-10 09:12:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('931', '2017-03-10 09:13:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('932', '2017-03-10 09:14:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('933', '2017-03-10 09:15:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('934', '2017-03-10 09:16:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('935', '2017-03-10 09:17:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('936', '2017-03-10 09:18:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('937', '2017-03-10 09:19:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('938', '2017-03-10 09:20:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('939', '2017-03-10 09:21:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('940', '2017-03-10 09:22:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('941', '2017-03-10 09:23:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('942', '2017-03-10 09:24:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('943', '2017-03-10 09:25:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('944', '2017-03-10 09:26:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('945', '2017-03-10 09:27:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('946', '2017-03-10 09:28:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('947', '2017-03-10 09:29:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('948', '2017-03-10 09:30:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('949', '2017-03-10 09:31:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('950', '2017-03-10 09:32:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('951', '2017-03-10 09:33:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('952', '2017-03-10 09:34:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('953', '2017-03-10 09:35:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('954', '2017-03-10 09:37:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('955', '2017-03-10 09:38:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('956', '2017-03-10 09:39:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('957', '2017-03-10 09:40:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('958', '2017-03-10 09:41:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('959', '2017-03-10 09:42:01', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('960', '2017-03-10 09:43:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('961', '2017-03-10 09:44:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('962', '2017-03-10 09:45:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('963', '2017-03-10 09:46:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('964', '2017-03-10 09:47:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('965', '2017-03-10 09:48:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('966', '2017-03-10 09:49:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('967', '2017-03-10 09:50:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('968', '2017-03-10 09:51:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('969', '2017-03-10 09:52:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('970', '2017-03-10 09:53:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('971', '2017-03-10 09:54:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('972', '2017-03-10 09:55:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('973', '2017-03-10 09:56:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('974', '2017-03-10 09:57:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('975', '2017-03-10 09:58:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('976', '2017-03-10 09:59:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('977', '2017-03-10 10:00:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('978', '2017-03-10 10:01:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('979', '2017-03-10 10:02:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('980', '2017-03-10 10:03:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('981', '2017-03-10 10:04:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('982', '2017-03-10 10:05:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('983', '2017-03-10 10:06:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('984', '2017-03-10 10:07:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('985', '2017-03-10 10:08:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('986', '2017-03-10 10:09:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('987', '2017-03-10 10:10:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('988', '2017-03-10 10:12:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('989', '2017-03-10 10:13:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('990', '2017-03-10 10:14:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('991', '2017-03-10 10:15:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('992', '2017-03-10 10:16:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('993', '2017-03-10 10:17:01', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('994', '2017-03-10 10:18:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('995', '2017-03-10 10:19:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('996', '2017-03-10 10:20:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('997', '2017-03-10 10:21:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('998', '2017-03-10 10:22:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('999', '2017-03-10 10:23:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1000', '2017-03-10 10:24:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1001', '2017-03-10 10:25:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1002', '2017-03-10 10:26:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1003', '2017-03-10 10:27:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1004', '2017-03-10 10:28:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1005', '2017-03-10 10:29:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1006', '2017-03-10 10:30:00', '21', '88', '18', '19', '513', '4944');
INSERT INTO `mon_21_26` VALUES ('1007', '2017-03-10 14:25:02', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1008', '2017-03-10 14:49:13', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1009', '2017-03-10 14:49:14', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1010', '2017-03-10 14:49:15', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1011', '2017-03-10 14:49:16', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1012', '2017-03-10 14:49:17', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1013', '2017-03-10 14:49:17', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1014', '2017-03-10 14:49:18', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1015', '2017-03-10 14:49:19', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1016', '2017-03-10 14:49:20', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1017', '2017-03-10 14:49:20', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1018', '2017-03-10 14:49:21', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1019', '2017-03-10 14:49:22', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1020', '2017-03-10 14:49:23', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1021', '2017-03-10 14:49:24', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1022', '2017-03-10 14:49:24', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1023', '2017-03-10 14:49:25', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1024', '2017-03-10 14:49:26', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1025', '2017-03-10 14:50:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1026', '2017-03-10 14:51:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1027', '2017-03-10 14:52:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1028', '2017-03-10 14:53:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1029', '2017-03-10 14:54:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1030', '2017-03-10 14:55:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1031', '2017-03-10 14:56:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1032', '2017-03-10 14:57:01', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1033', '2017-03-10 14:58:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1034', '2017-03-10 14:59:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1035', '2017-03-10 15:00:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1036', '2017-03-10 15:01:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1037', '2017-03-10 15:02:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1038', '2017-03-10 15:03:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1039', '2017-03-10 15:04:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1040', '2017-03-10 15:05:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1041', '2017-03-10 15:06:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1042', '2017-03-10 15:07:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1043', '2017-03-10 15:08:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1044', '2017-03-10 15:09:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1045', '2017-03-10 15:10:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1046', '2017-03-10 15:11:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1047', '2017-03-10 15:12:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1048', '2017-03-10 15:13:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1049', '2017-03-10 15:14:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1050', '2017-03-10 15:15:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1051', '2017-03-10 15:16:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1052', '2017-03-10 15:17:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1053', '2017-03-10 15:18:00', '0', '0', '0', '0', '0', '0');
INSERT INTO `mon_21_26` VALUES ('1054', '2017-03-10 15:19:00', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for mon_21_26_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_21_26_current`;
CREATE TABLE `mon_21_26_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_29` double DEFAULT NULL,
  `eleid_30` double DEFAULT NULL,
  `eleid_31` double DEFAULT NULL,
  `eleid_32` double DEFAULT NULL,
  `eleid_33` double DEFAULT NULL,
  `eleid_34` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_21_26_current
-- ----------------------------
INSERT INTO `mon_21_26_current` VALUES ('1', '2017-02-27 10:00:00', '13', '12', '9', '21', '15', '16');
INSERT INTO `mon_21_26_current` VALUES ('2', '2017-02-27 11:00:00', '3', '4', '5', '6', '7', '8');

-- ----------------------------
-- Table structure for mon_21_36
-- ----------------------------
DROP TABLE IF EXISTS `mon_21_36`;
CREATE TABLE `mon_21_36` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_98` double DEFAULT NULL,
  `eleid_99` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_21_36
-- ----------------------------
INSERT INTO `mon_21_36` VALUES ('1', '2017-02-27 10:00:00', '1', '1');

-- ----------------------------
-- Table structure for mon_21_36_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_21_36_current`;
CREATE TABLE `mon_21_36_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_98` double DEFAULT NULL,
  `eleid_99` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_21_36_current
-- ----------------------------
INSERT INTO `mon_21_36_current` VALUES ('1', '2017-02-27 10:00:00', '1', '1');

-- ----------------------------
-- Table structure for mon_22_27
-- ----------------------------
DROP TABLE IF EXISTS `mon_22_27`;
CREATE TABLE `mon_22_27` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_35` double DEFAULT NULL,
  `eleid_36` double DEFAULT NULL,
  `eleid_37` double DEFAULT NULL,
  `eleid_38` double DEFAULT NULL,
  `eleid_39` double DEFAULT NULL,
  `eleid_40` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_22_27
-- ----------------------------
INSERT INTO `mon_22_27` VALUES ('1', '2017-02-27 10:00:00', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for mon_22_27_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_22_27_current`;
CREATE TABLE `mon_22_27_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_35` double DEFAULT NULL,
  `eleid_36` double DEFAULT NULL,
  `eleid_37` double DEFAULT NULL,
  `eleid_38` double DEFAULT NULL,
  `eleid_39` double DEFAULT NULL,
  `eleid_40` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_22_27_current
-- ----------------------------
INSERT INTO `mon_22_27_current` VALUES ('1', '2017-02-27 10:00:00', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for mon_22_37
-- ----------------------------
DROP TABLE IF EXISTS `mon_22_37`;
CREATE TABLE `mon_22_37` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_100` double DEFAULT NULL,
  `eleid_101` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_22_37
-- ----------------------------
INSERT INTO `mon_22_37` VALUES ('1', '2017-02-27 10:00:00', '1', '1');

-- ----------------------------
-- Table structure for mon_22_37_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_22_37_current`;
CREATE TABLE `mon_22_37_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_100` double DEFAULT NULL,
  `eleid_101` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_22_37_current
-- ----------------------------
INSERT INTO `mon_22_37_current` VALUES ('1', '2017-02-27 10:00:00', '1', '1');

-- ----------------------------
-- Table structure for mon_23_28
-- ----------------------------
DROP TABLE IF EXISTS `mon_23_28`;
CREATE TABLE `mon_23_28` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_41` double DEFAULT NULL,
  `eleid_42` double DEFAULT NULL,
  `eleid_43` double DEFAULT NULL,
  `eleid_44` double DEFAULT NULL,
  `eleid_45` double DEFAULT NULL,
  `eleid_46` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_23_28
-- ----------------------------
INSERT INTO `mon_23_28` VALUES ('1', '2017-02-27 11:00:00', '1', '2', '3', '4', '5', '6');

-- ----------------------------
-- Table structure for mon_23_28_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_23_28_current`;
CREATE TABLE `mon_23_28_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_41` double DEFAULT NULL,
  `eleid_42` double DEFAULT NULL,
  `eleid_43` double DEFAULT NULL,
  `eleid_44` double DEFAULT NULL,
  `eleid_45` double DEFAULT NULL,
  `eleid_46` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_23_28_current
-- ----------------------------
INSERT INTO `mon_23_28_current` VALUES ('1', '2017-02-27 11:00:00', '1', '2', '3', '4', '5', '6');

-- ----------------------------
-- Table structure for mon_23_38
-- ----------------------------
DROP TABLE IF EXISTS `mon_23_38`;
CREATE TABLE `mon_23_38` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_102` double DEFAULT NULL,
  `eleid_103` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_23_38
-- ----------------------------
INSERT INTO `mon_23_38` VALUES ('1', '2017-02-27 11:00:00', '1', '2');

-- ----------------------------
-- Table structure for mon_23_38_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_23_38_current`;
CREATE TABLE `mon_23_38_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_102` double DEFAULT NULL,
  `eleid_103` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_23_38_current
-- ----------------------------
INSERT INTO `mon_23_38_current` VALUES ('1', '2017-02-27 11:00:00', '1', '2');

-- ----------------------------
-- Table structure for mon_24_29
-- ----------------------------
DROP TABLE IF EXISTS `mon_24_29`;
CREATE TABLE `mon_24_29` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_47` double DEFAULT NULL,
  `eleid_48` double DEFAULT NULL,
  `eleid_49` double DEFAULT NULL,
  `eleid_50` double DEFAULT NULL,
  `eleid_51` double DEFAULT NULL,
  `eleid_52` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_24_29
-- ----------------------------
INSERT INTO `mon_24_29` VALUES ('1', '2017-02-27 11:00:00', '2', '3', '4', '5', '6', '7');

-- ----------------------------
-- Table structure for mon_24_29_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_24_29_current`;
CREATE TABLE `mon_24_29_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_47` double DEFAULT NULL,
  `eleid_48` double DEFAULT NULL,
  `eleid_49` double DEFAULT NULL,
  `eleid_50` double DEFAULT NULL,
  `eleid_51` double DEFAULT NULL,
  `eleid_52` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_24_29_current
-- ----------------------------
INSERT INTO `mon_24_29_current` VALUES ('1', '2017-02-27 11:00:00', '2', '3', '4', '5', '6', '7');

-- ----------------------------
-- Table structure for mon_24_39
-- ----------------------------
DROP TABLE IF EXISTS `mon_24_39`;
CREATE TABLE `mon_24_39` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_104` double DEFAULT NULL,
  `eleid_105` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_24_39
-- ----------------------------
INSERT INTO `mon_24_39` VALUES ('1', '2017-02-27 11:00:00', '2', '3');

-- ----------------------------
-- Table structure for mon_24_39_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_24_39_current`;
CREATE TABLE `mon_24_39_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_104` double DEFAULT NULL,
  `eleid_105` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_24_39_current
-- ----------------------------
INSERT INTO `mon_24_39_current` VALUES ('1', '2017-02-27 11:00:00', '2', '3');

-- ----------------------------
-- Table structure for mon_25_30
-- ----------------------------
DROP TABLE IF EXISTS `mon_25_30`;
CREATE TABLE `mon_25_30` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_53` double DEFAULT NULL,
  `eleid_54` double DEFAULT NULL,
  `eleid_55` double DEFAULT NULL,
  `eleid_56` double DEFAULT NULL,
  `eleid_57` double DEFAULT NULL,
  `eleid_58` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_25_30
-- ----------------------------
INSERT INTO `mon_25_30` VALUES ('1', '2017-02-27 11:00:00', '5', '6', '7', '8', '9', '10');

-- ----------------------------
-- Table structure for mon_25_30_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_25_30_current`;
CREATE TABLE `mon_25_30_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_53` double DEFAULT NULL,
  `eleid_54` double DEFAULT NULL,
  `eleid_55` double DEFAULT NULL,
  `eleid_56` double DEFAULT NULL,
  `eleid_57` double DEFAULT NULL,
  `eleid_58` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_25_30_current
-- ----------------------------
INSERT INTO `mon_25_30_current` VALUES ('1', '2017-02-27 11:00:00', '5', '6', '7', '8', '9', '10');

-- ----------------------------
-- Table structure for mon_25_33
-- ----------------------------
DROP TABLE IF EXISTS `mon_25_33`;
CREATE TABLE `mon_25_33` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_69` double DEFAULT NULL,
  `eleid_70` double DEFAULT NULL,
  `eleid_71` double DEFAULT NULL,
  `eleid_72` double DEFAULT NULL,
  `eleid_73` double DEFAULT NULL,
  `eleid_74` double DEFAULT NULL,
  `eleid_75` double DEFAULT NULL,
  `eleid_76` double DEFAULT NULL,
  `eleid_77` double DEFAULT NULL,
  `eleid_78` double DEFAULT NULL,
  `eleid_79` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_25_33
-- ----------------------------
INSERT INTO `mon_25_33` VALUES ('1', '2017-02-27 11:00:00', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10');

-- ----------------------------
-- Table structure for mon_25_33_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_25_33_current`;
CREATE TABLE `mon_25_33_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_69` double DEFAULT NULL,
  `eleid_70` double DEFAULT NULL,
  `eleid_71` double DEFAULT NULL,
  `eleid_72` double DEFAULT NULL,
  `eleid_73` double DEFAULT NULL,
  `eleid_74` double DEFAULT NULL,
  `eleid_75` double DEFAULT NULL,
  `eleid_76` double DEFAULT NULL,
  `eleid_77` double DEFAULT NULL,
  `eleid_78` double DEFAULT NULL,
  `eleid_79` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_25_33_current
-- ----------------------------
INSERT INTO `mon_25_33_current` VALUES ('1', '2017-02-27 11:00:00', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10');

-- ----------------------------
-- Table structure for mon_25_40
-- ----------------------------
DROP TABLE IF EXISTS `mon_25_40`;
CREATE TABLE `mon_25_40` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_106` double DEFAULT NULL,
  `eleid_107` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_25_40
-- ----------------------------
INSERT INTO `mon_25_40` VALUES ('1', '2017-02-27 11:00:00', '5', '6');

-- ----------------------------
-- Table structure for mon_25_40_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_25_40_current`;
CREATE TABLE `mon_25_40_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_106` double DEFAULT NULL,
  `eleid_107` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_25_40_current
-- ----------------------------
INSERT INTO `mon_25_40_current` VALUES ('1', '2017-02-27 11:00:00', '5', '6');

-- ----------------------------
-- Table structure for mon_26_31
-- ----------------------------
DROP TABLE IF EXISTS `mon_26_31`;
CREATE TABLE `mon_26_31` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_59` double DEFAULT NULL,
  `eleid_60` double DEFAULT NULL,
  `eleid_61` double DEFAULT NULL,
  `eleid_62` double DEFAULT NULL,
  `eleid_63` double DEFAULT NULL,
  `eleid_64` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_26_31
-- ----------------------------
INSERT INTO `mon_26_31` VALUES ('1', '2017-02-27 11:00:00', '12', '23', '3', '23', '12', '11');

-- ----------------------------
-- Table structure for mon_26_31_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_26_31_current`;
CREATE TABLE `mon_26_31_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_59` double DEFAULT NULL,
  `eleid_60` double DEFAULT NULL,
  `eleid_61` double DEFAULT NULL,
  `eleid_62` double DEFAULT NULL,
  `eleid_63` double DEFAULT NULL,
  `eleid_64` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_26_31_current
-- ----------------------------
INSERT INTO `mon_26_31_current` VALUES ('1', '2017-02-27 11:00:00', '12', '23', '3', '23', '12', '11');

-- ----------------------------
-- Table structure for mon_26_34
-- ----------------------------
DROP TABLE IF EXISTS `mon_26_34`;
CREATE TABLE `mon_26_34` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_80` double DEFAULT NULL,
  `eleid_81` double DEFAULT NULL,
  `eleid_82` double DEFAULT NULL,
  `eleid_83` double DEFAULT NULL,
  `eleid_84` double DEFAULT NULL,
  `eleid_85` double DEFAULT NULL,
  `eleid_86` double DEFAULT NULL,
  `eleid_87` double DEFAULT NULL,
  `eleid_88` double DEFAULT NULL,
  `eleid_89` double DEFAULT NULL,
  `eleid_90` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_26_34
-- ----------------------------
INSERT INTO `mon_26_34` VALUES ('1', '2017-02-27 11:00:00', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11');

-- ----------------------------
-- Table structure for mon_26_34_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_26_34_current`;
CREATE TABLE `mon_26_34_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_80` double DEFAULT NULL,
  `eleid_81` double DEFAULT NULL,
  `eleid_82` double DEFAULT NULL,
  `eleid_83` double DEFAULT NULL,
  `eleid_84` double DEFAULT NULL,
  `eleid_85` double DEFAULT NULL,
  `eleid_86` double DEFAULT NULL,
  `eleid_87` double DEFAULT NULL,
  `eleid_88` double DEFAULT NULL,
  `eleid_89` double DEFAULT NULL,
  `eleid_90` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_26_34_current
-- ----------------------------
INSERT INTO `mon_26_34_current` VALUES ('1', '2017-02-27 11:00:00', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11');

-- ----------------------------
-- Table structure for mon_26_41
-- ----------------------------
DROP TABLE IF EXISTS `mon_26_41`;
CREATE TABLE `mon_26_41` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_108` double DEFAULT NULL,
  `eleid_109` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_26_41
-- ----------------------------
INSERT INTO `mon_26_41` VALUES ('1', '2017-02-27 11:00:00', '12', '23');

-- ----------------------------
-- Table structure for mon_26_41_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_26_41_current`;
CREATE TABLE `mon_26_41_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_108` double DEFAULT NULL,
  `eleid_109` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_26_41_current
-- ----------------------------
INSERT INTO `mon_26_41_current` VALUES ('1', '2017-02-27 11:00:00', '12', '23');

-- ----------------------------
-- Table structure for mon_27_32
-- ----------------------------
DROP TABLE IF EXISTS `mon_27_32`;
CREATE TABLE `mon_27_32` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_65` double DEFAULT NULL,
  `eleid_66` double DEFAULT NULL,
  `eleid_67` double DEFAULT NULL,
  `eleid_68` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_27_32
-- ----------------------------
INSERT INTO `mon_27_32` VALUES ('1', '2017-03-04 11:00:00', '10.5', '7', '200', '400');

-- ----------------------------
-- Table structure for mon_27_32_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_27_32_current`;
CREATE TABLE `mon_27_32_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_65` double DEFAULT NULL,
  `eleid_66` double DEFAULT NULL,
  `eleid_67` double DEFAULT NULL,
  `eleid_68` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_27_32_current
-- ----------------------------
INSERT INTO `mon_27_32_current` VALUES ('1', '2017-03-04 11:00:00', '10.5', '7', '200', '400');
INSERT INTO `mon_27_32_current` VALUES ('2', '2017-03-04 14:00:00', '1', '2', '3', '4');

-- ----------------------------
-- Table structure for mon_28_35
-- ----------------------------
DROP TABLE IF EXISTS `mon_28_35`;
CREATE TABLE `mon_28_35` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_91` double DEFAULT NULL,
  `eleid_92` double DEFAULT NULL,
  `eleid_93` double DEFAULT NULL,
  `eleid_94` double DEFAULT NULL,
  `eleid_95` double DEFAULT NULL,
  `eleid_96` double DEFAULT NULL,
  `eleid_97` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_28_35
-- ----------------------------
INSERT INTO `mon_28_35` VALUES ('1', '2017-02-27 10:00:00', '12', '11', '9', '21', '15', '16', '1');

-- ----------------------------
-- Table structure for mon_28_35_current
-- ----------------------------
DROP TABLE IF EXISTS `mon_28_35_current`;
CREATE TABLE `mon_28_35_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `control_time` datetime DEFAULT NULL,
  `eleid_91` double DEFAULT NULL,
  `eleid_92` double DEFAULT NULL,
  `eleid_93` double DEFAULT NULL,
  `eleid_94` double DEFAULT NULL,
  `eleid_95` double DEFAULT NULL,
  `eleid_96` double DEFAULT NULL,
  `eleid_97` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_28_35_current
-- ----------------------------
INSERT INTO `mon_28_35_current` VALUES ('1', '2017-02-27 10:00:00', '12', '11', '9', '21', '15', '16', '1');

-- ----------------------------
-- Table structure for pesticides
-- ----------------------------
DROP TABLE IF EXISTS `pesticides`;
CREATE TABLE `pesticides` (
  `Pest_id` int(11) NOT NULL AUTO_INCREMENT,
  `Pest_name` varchar(40) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Pest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of pesticides
-- ----------------------------

-- ----------------------------
-- Table structure for projectman
-- ----------------------------
DROP TABLE IF EXISTS `projectman`;
CREATE TABLE `projectman` (
  `Project_id` int(11) NOT NULL AUTO_INCREMENT,
  `Project_name` varchar(40) DEFAULT NULL,
  `Project_type` int(11) DEFAULT NULL,
  `Model_id` int(11) DEFAULT NULL,
  `Father` int(11) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of projectman
-- ----------------------------

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `Record_id` int(11) NOT NULL AUTO_INCREMENT,
  `Crop_no` int(11) DEFAULT NULL,
  `Crop_caption` varchar(255) DEFAULT NULL,
  `Record_time` datetime DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `Record_user` varchar(20) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for setup_con
-- ----------------------------
DROP TABLE IF EXISTS `setup_con`;
CREATE TABLE `setup_con` (
  `Equip_id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Type` varchar(40) NOT NULL,
  `Control` int(11) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `GH_id` int(11) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Equip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of setup_con
-- ----------------------------
INSERT INTO `setup_con` VALUES ('35', '外遮阳电机', '气象', '1', '展开和收起，电机停止由行程开关控制', '21', 'N');
INSERT INTO `setup_con` VALUES ('36', '外遮阳电机', '气象', '1', '开启和关闭', '26', 'N');
INSERT INTO `setup_con` VALUES ('37', '天窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '26', 'N');
INSERT INTO `setup_con` VALUES ('38', '侧窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '26', 'N');
INSERT INTO `setup_con` VALUES ('39', '外遮阳电机', '气象', '1', '展开和收起，电机停止由行程开关控制', '22', 'N');
INSERT INTO `setup_con` VALUES ('40', '内遮阳', '气象', '1', '展开和收起，电机停止由行程开关控制', '26', 'N');
INSERT INTO `setup_con` VALUES ('41', '外遮阳电机', '气象', '1', '展开和收起，电机停止由行程开关控制', '23', 'N');
INSERT INTO `setup_con` VALUES ('42', '天窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '23', 'N');
INSERT INTO `setup_con` VALUES ('43', '风机', '气象', '1', '开启和关闭', '26', 'N');
INSERT INTO `setup_con` VALUES ('44', '侧窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '23', 'N');
INSERT INTO `setup_con` VALUES ('45', '湿帘水泵', '气象', '1', '开启和关闭', '26', 'N');
INSERT INTO `setup_con` VALUES ('46', '外遮阳电机', '气象', '1', '展开和收起，电机停止由行程开关控制', '24', 'N');
INSERT INTO `setup_con` VALUES ('47', '隔墙卷膜', '气象', '1', '开启和关闭', '26', 'N');
INSERT INTO `setup_con` VALUES ('48', '天窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '24', 'N');
INSERT INTO `setup_con` VALUES ('49', '侧窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '24', 'N');
INSERT INTO `setup_con` VALUES ('50', '天面喷淋、室内喷雾水泵', '气象', '1', '开启和关闭', '26', 'N');
INSERT INTO `setup_con` VALUES ('51', '外遮阳电机', '气象', '1', '展开和收起，电机停止由行程开关控制', '25', 'N');
INSERT INTO `setup_con` VALUES ('52', '天窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '25', 'N');
INSERT INTO `setup_con` VALUES ('53', '侧窗', '气象', '1', '展开和收起，电机停止由行程开关控制', '25', 'N');
INSERT INTO `setup_con` VALUES ('54', '内遮阳', '气象', '1', '展开和收起，电机停止由行程开关控制', '25', 'N');
INSERT INTO `setup_con` VALUES ('55', '风机', '气象', '1', '开启和关闭', '25', 'N');
INSERT INTO `setup_con` VALUES ('56', '湿帘水泵', '气象', '1', '开启和关闭', '25', 'N');
INSERT INTO `setup_con` VALUES ('57', '施肥机', '灌溉', '1', '开启和关闭', '27', 'N');
INSERT INTO `setup_con` VALUES ('58', '灌溉泵', '灌溉', '1', '开启和关闭', '27', 'N');
INSERT INTO `setup_con` VALUES ('59', '混肥灌', '灌溉', '1', '开启和关闭', '27', 'N');
INSERT INTO `setup_con` VALUES ('60', 'EC传感器', '灌溉', '1', '开启和关闭', '27', 'N');
INSERT INTO `setup_con` VALUES ('61', 'PH传感器', '灌溉', '1', '开启和关闭', '27', 'N');
INSERT INTO `setup_con` VALUES ('62', '余液回收器', '灌溉', '1', '开启和关闭', '27', 'N');
INSERT INTO `setup_con` VALUES ('63', 'CO2发生器', '气象', '1', '开启和关闭', '21', 'N');
INSERT INTO `setup_con` VALUES ('64', 'CO2发生器', '气象', '1', '开启和关闭', '22', 'N');
INSERT INTO `setup_con` VALUES ('65', 'CO2发生器', '气象', '1', '开启和关闭', '23', 'N');
INSERT INTO `setup_con` VALUES ('66', 'CO2发生器', '气象', '1', '开启和关闭', '24', 'N');
INSERT INTO `setup_con` VALUES ('67', 'CO2发生器', '气象', '1', '开启和关闭', '25', 'N');
INSERT INTO `setup_con` VALUES ('68', 'CO2发生器', '气象', '1', '开启和关闭', '26', 'N');

-- ----------------------------
-- Table structure for shed_crop
-- ----------------------------
DROP TABLE IF EXISTS `shed_crop`;
CREATE TABLE `shed_crop` (
  `Crop_no` varchar(20) NOT NULL,
  `Shed_id` int(11) DEFAULT NULL,
  `Crop_id` int(11) DEFAULT NULL,
  `Crop_area` double DEFAULT NULL,
  `Crop_num` double DEFAULT NULL,
  `Soil_id` int(11) DEFAULT NULL,
  `Crop_time` datetime DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Crop_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of shed_crop
-- ----------------------------

-- ----------------------------
-- Table structure for soil
-- ----------------------------
DROP TABLE IF EXISTS `soil`;
CREATE TABLE `soil` (
  `Soil_id` int(11) NOT NULL AUTO_INCREMENT,
  `Soil_name` varchar(40) DEFAULT NULL,
  `Soil_type` varchar(40) DEFAULT NULL,
  `Remark` varchar(255) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Soil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of soil
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_realname` varchar(20) DEFAULT NULL,
  `User_mobile` varchar(20) DEFAULT NULL,
  `User_type` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(40) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  `sec_password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Username` (`Username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sysadmin', '18761996926', '3', 'sysadmin', '123456', null, 'N', '123456');
INSERT INTO `user` VALUES ('127', '王纪章', '18761996920', '2', 'baseadmin', '123456', '1', 'N', null);
INSERT INTO `user` VALUES ('128', '管理员1', '18761996921', '1', 'gh_1', '123456', '127', 'N', '654321');
INSERT INTO `user` VALUES ('129', '管理员2', '18761996922', '1', 'gh_2', '123456', '127', 'N', '654321');
INSERT INTO `user` VALUES ('130', '管理员3', '18761996923', '1', 'gh_3', '123456', '127', 'N', '654321');
INSERT INTO `user` VALUES ('131', '管理员4', '18761996924', '1', 'gh_4', '123456', '127', 'N', '654321');
INSERT INTO `user` VALUES ('132', '管理员5', '18761996925', '1', 'gh_5', '123456', '127', 'N', '654321');
INSERT INTO `user` VALUES ('133', '管理员6', '18761996926', '1', 'gh_6', '123456', '127', 'N', '654321');
INSERT INTO `user` VALUES ('134', '访客1', null, '0', 'visitor_1', '111111', '128', 'N', null);
INSERT INTO `user` VALUES ('135', '灌溉系统', '18761996927', '1', 'irrigation', '123456', '127', 'N', '654321');
INSERT INTO `user` VALUES ('136', '气象信息', '18761996928', '1', 'meteorological', '123456', '127', 'N', '654321');
