/*
 Navicat Premium Data Transfer

 Source Server         : mysqlkkc
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 23/12/2021 16:38:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminId` int(0) NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1000, '123456');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `DocumentID` int(0) NULL DEFAULT NULL,
  `AuthorName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ISBN` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `DocumentID`(`DocumentID`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`DocumentID`) REFERENCES `document` (`DocumentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '三体', '987654');
INSERT INTO `book` VALUES (4, 'James', '159874');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow`  (
  `ReaderID` int(0) NULL DEFAULT NULL,
  `IndexID` int(0) NULL DEFAULT NULL,
  `BDatetime` date NULL DEFAULT NULL,
  `RDatetime` date NULL DEFAULT NULL,
  `documentID` int(0) NULL DEFAULT NULL,
  `fine` decimal(10, 2) NULL DEFAULT NULL,
  INDEX `ReaderID`(`ReaderID`) USING BTREE,
  INDEX `IndexID`(`IndexID`) USING BTREE,
  CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`ReaderID`) REFERENCES `reader` (`readerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`IndexID`) REFERENCES `copy` (`IndexID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES (20212021, 101, '2021-11-10', '2021-12-16', 1, 1.20);
INSERT INTO `borrow` VALUES (20212021, 201, '2021-12-23', NULL, 2, NULL);
INSERT INTO `borrow` VALUES (20212021, 501, '2021-12-23', '2021-12-23', 5, NULL);
INSERT INTO `borrow` VALUES (20212021, 301, '2021-11-05', '2021-12-15', 3, 2.00);
INSERT INTO `borrow` VALUES (20212021, 401, '2021-10-13', '2021-11-17', 4, 0.80);
INSERT INTO `borrow` VALUES (20212020, 101, '2021-10-07', '2021-11-09', 1, 0.40);
INSERT INTO `borrow` VALUES (20212020, 601, '2021-09-14', '2021-09-24', 6, NULL);
INSERT INTO `borrow` VALUES (20212022, 301, '2021-12-16', '2021-12-23', 3, NULL);
INSERT INTO `borrow` VALUES (20212023, 701, '2021-12-23', '2021-12-23', 7, NULL);
INSERT INTO `borrow` VALUES (20212024, 801, '2021-12-23', '2021-12-23', 8, NULL);
INSERT INTO `borrow` VALUES (20212025, 901, '2021-12-23', '2021-12-23', 9, NULL);
INSERT INTO `borrow` VALUES (20212026, 1001, '2021-12-23', '2021-12-23', 10, NULL);
INSERT INTO `borrow` VALUES (20212027, 1101, '2021-12-23', '2021-12-23', 11, NULL);
INSERT INTO `borrow` VALUES (20212028, 1201, '2021-12-23', '2021-12-23', 12, NULL);
INSERT INTO `borrow` VALUES (20212029, 1301, '2021-12-23', '2021-12-23', 13, NULL);
INSERT INTO `borrow` VALUES (20212030, 1401, '2021-12-23', '2021-12-23', 14, NULL);
INSERT INTO `borrow` VALUES (20212031, 1501, '2021-12-23', '2021-12-23', 15, NULL);
INSERT INTO `borrow` VALUES (20212032, 1601, '2021-12-23', '2021-12-23', 16, NULL);
INSERT INTO `borrow` VALUES (20212033, 1701, '2021-12-23', '2021-12-23', 17, NULL);
INSERT INTO `borrow` VALUES (20212034, 1801, '2021-12-23', '2021-12-23', 18, NULL);
INSERT INTO `borrow` VALUES (20212025, 103, '2021-12-23', '2021-12-23', 1, NULL);
INSERT INTO `borrow` VALUES (20212022, 303, '2021-12-23', '2021-12-23', 3, NULL);
INSERT INTO `borrow` VALUES (20212022, 103, '2021-12-22', '2021-12-22', 1, NULL);
INSERT INTO `borrow` VALUES (20212022, 301, '2021-12-23', '2021-12-23', 3, NULL);
INSERT INTO `borrow` VALUES (20212022, 502, '2021-12-23', '2021-12-23', 5, NULL);
INSERT INTO `borrow` VALUES (20212022, 601, '2021-12-23', '2021-12-23', 6, NULL);
INSERT INTO `borrow` VALUES (20212021, 502, '2021-12-22', '2021-12-22', 5, NULL);

-- ----------------------------
-- Table structure for conference
-- ----------------------------
DROP TABLE IF EXISTS `conference`;
CREATE TABLE `conference`  (
  `DocumentID` int(0) NULL DEFAULT NULL,
  `Conferencedate` date NULL DEFAULT NULL,
  `Conferencelocation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ProceedingEditor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `DocumentID`(`DocumentID`) USING BTREE,
  CONSTRAINT `conference_ibfk_1` FOREIGN KEY (`DocumentID`) REFERENCES `document` (`DocumentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conference
-- ----------------------------
INSERT INTO `conference` VALUES (2, '2021-12-16', '北京', '李四');
INSERT INTO `conference` VALUES (5, '2021-12-16', '武汉', '李某');

-- ----------------------------
-- Table structure for copy
-- ----------------------------
DROP TABLE IF EXISTS `copy`;
CREATE TABLE `copy`  (
  `IndexID` int(0) NOT NULL AUTO_INCREMENT,
  `DocumentID` int(0) NOT NULL,
  `libID` int(0) NOT NULL,
  `state` int(0) NOT NULL,
  PRIMARY KEY (`IndexID`) USING BTREE,
  INDEX `DocumentID`(`DocumentID`) USING BTREE,
  INDEX `libID`(`libID`) USING BTREE,
  CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`DocumentID`) REFERENCES `document` (`DocumentID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`libID`) REFERENCES `library` (`libID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of copy
-- ----------------------------
INSERT INTO `copy` VALUES (101, 1, 1, 1);
INSERT INTO `copy` VALUES (102, 1, 1, 1);
INSERT INTO `copy` VALUES (103, 1, 2, 1);
INSERT INTO `copy` VALUES (201, 2, 2, 0);
INSERT INTO `copy` VALUES (202, 2, 1, 1);
INSERT INTO `copy` VALUES (301, 3, 3, 1);
INSERT INTO `copy` VALUES (302, 3, 2, 1);
INSERT INTO `copy` VALUES (303, 3, 1, 1);
INSERT INTO `copy` VALUES (401, 4, 1, 1);
INSERT INTO `copy` VALUES (402, 4, 2, 1);
INSERT INTO `copy` VALUES (501, 5, 2, 1);
INSERT INTO `copy` VALUES (502, 5, 3, 1);
INSERT INTO `copy` VALUES (601, 6, 3, 1);
INSERT INTO `copy` VALUES (701, 7, 1, 1);
INSERT INTO `copy` VALUES (702, 7, 2, 1);
INSERT INTO `copy` VALUES (703, 7, 2, 1);
INSERT INTO `copy` VALUES (704, 7, 3, 1);
INSERT INTO `copy` VALUES (801, 8, 1, 1);
INSERT INTO `copy` VALUES (802, 8, 3, 1);
INSERT INTO `copy` VALUES (901, 9, 1, 1);
INSERT INTO `copy` VALUES (902, 9, 2, 1);
INSERT INTO `copy` VALUES (903, 9, 3, 1);
INSERT INTO `copy` VALUES (904, 9, 3, 1);
INSERT INTO `copy` VALUES (1001, 10, 2, 1);
INSERT INTO `copy` VALUES (1002, 10, 3, 1);
INSERT INTO `copy` VALUES (1101, 11, 1, 1);
INSERT INTO `copy` VALUES (1201, 12, 2, 1);
INSERT INTO `copy` VALUES (1301, 13, 3, 1);
INSERT INTO `copy` VALUES (1401, 14, 1, 1);
INSERT INTO `copy` VALUES (1501, 15, 2, 1);
INSERT INTO `copy` VALUES (1601, 16, 3, 1);
INSERT INTO `copy` VALUES (1701, 17, 3, 1);
INSERT INTO `copy` VALUES (1801, 18, 2, 1);
INSERT INTO `copy` VALUES (1802, 18, 3, 1);
INSERT INTO `copy` VALUES (1901, 19, 1, 1);
INSERT INTO `copy` VALUES (2001, 20, 1, 1);
INSERT INTO `copy` VALUES (2002, 20, 2, 1);
INSERT INTO `copy` VALUES (2003, 20, 3, 1);

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document`  (
  `DocumentID` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publisher` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publisherDate` date NULL DEFAULT NULL,
  `publisherAddress` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`DocumentID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES (1, '数理统计', '武汉大学出版社', '2016-07-06', '123');
INSERT INTO `document` VALUES (2, '数据库', '工业出版社', '2020-12-08', '321');
INSERT INTO `document` VALUES (3, '聚类', '机械出版社', '2020-10-14', '654');
INSERT INTO `document` VALUES (4, '童年', ' 国际文化出版社', '1998-09-21', '北京');
INSERT INTO `document` VALUES (5, '数据库内核', '武汉大学出版社', '2020-12-15', '武汉');
INSERT INTO `document` VALUES (6, '数据库查询优化', '清华大学出版社', '2020-12-02', '北京');
INSERT INTO `document` VALUES (7, 'test1', 'test1', '2020-12-23', 'test1');
INSERT INTO `document` VALUES (8, 'test2', 'test2', '2020-12-23', 'test2');
INSERT INTO `document` VALUES (9, 'test3', 'test3', '2020-12-23', 'test3');
INSERT INTO `document` VALUES (10, 'test4', 'test4', '2020-12-23', 'test4');
INSERT INTO `document` VALUES (11, 'test5', 'test5', '2020-12-23', 'test5');
INSERT INTO `document` VALUES (12, 'test6', 'test6', '2020-12-23', 'test6');
INSERT INTO `document` VALUES (13, 'test7', 'test7', '2020-12-23', 'test7');
INSERT INTO `document` VALUES (14, 'test8', 'test8', '2020-12-23', 'test8');
INSERT INTO `document` VALUES (15, 'test9', 'test9', '2020-12-23', 'test9');
INSERT INTO `document` VALUES (16, 'test10', 'test10', '2020-12-23', 'test10');
INSERT INTO `document` VALUES (17, 'test11', 'test11', '2020-12-23', 'test11');
INSERT INTO `document` VALUES (18, 'test12', 'test12', '2020-12-23', 'test12');
INSERT INTO `document` VALUES (19, 'test13', 'test13', '2020-12-23', 'test13');
INSERT INTO `document` VALUES (20, 'test14', 'test14', '2020-12-23', 'test14');

-- ----------------------------
-- Table structure for journalvolume
-- ----------------------------
DROP TABLE IF EXISTS `journalvolume`;
CREATE TABLE `journalvolume`  (
  `DocumentID` int(0) NULL DEFAULT NULL,
  `JournalName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `JournalEditor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `scope` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `VolumeEditor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `VolumeName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  INDEX `DocumentID`(`DocumentID`) USING BTREE,
  CONSTRAINT `journalvolume_ibfk_1` FOREIGN KEY (`DocumentID`) REFERENCES `document` (`DocumentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of journalvolume
-- ----------------------------
INSERT INTO `journalvolume` VALUES (3, '数据挖掘', '王五', '数据分析', '张强', '数据聚类');
INSERT INTO `journalvolume` VALUES (6, '软件学报', '李某', '数据库', '张某', '数据管理');

-- ----------------------------
-- Table structure for library
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library`  (
  `libID` int(0) NOT NULL AUTO_INCREMENT,
  `BranchName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `BranchLocation` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`libID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES (1, '信息学部图书馆', '信息学部');
INSERT INTO `library` VALUES (2, '工学部图书馆', '工学部');
INSERT INTO `library` VALUES (3, '总图书馆', '文理学部');
INSERT INTO `library` VALUES (4, '医学部图书馆', '医学部');

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader`  (
  `readerID` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`readerID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES (20212020, '康楷晨', '学生', '12345678910', '信息学部十八舍', '123456');
INSERT INTO `reader` VALUES (20212021, '贺宇阳', '学生', '18163091317', '信息学部十八舍', '123456');
INSERT INTO `reader` VALUES (20212022, 'test0', '学生', 'test0', 'test0', '123456');
INSERT INTO `reader` VALUES (20212023, 'test1', '学生', 'test1', 'test1', '123456');
INSERT INTO `reader` VALUES (20212024, 'test2', 'test2', 'test2', 'test2', '123456');
INSERT INTO `reader` VALUES (20212025, 'test3', 'test3', 'test3', 'test3', '123456');
INSERT INTO `reader` VALUES (20212026, 'test4', 'test4', 'test4', 'test4', '123456');
INSERT INTO `reader` VALUES (20212027, 'test5', 'test5', 'test5', 'test5', '123456');
INSERT INTO `reader` VALUES (20212028, 'test6', 'test6', 'test6', 'test6', '123456');
INSERT INTO `reader` VALUES (20212029, 'test7', 'test7', 'test7', 'test7', '123456');
INSERT INTO `reader` VALUES (20212030, 'test8', 'test8', 'test8', 'test8', '123456');
INSERT INTO `reader` VALUES (20212031, 'test9', 'test9', 'test9', 'test9', '123456');
INSERT INTO `reader` VALUES (20212032, 'test10', 'test10', 'test10', 'test10', '123456');
INSERT INTO `reader` VALUES (20212033, 'test11', 'test11', 'test11', 'test11', '123456');
INSERT INTO `reader` VALUES (20212034, 'test12', 'test12', 'test12', 'test12', '123456');

-- ----------------------------
-- Table structure for reserve
-- ----------------------------
DROP TABLE IF EXISTS `reserve`;
CREATE TABLE `reserve`  (
  `ReaderID` int(0) NULL DEFAULT NULL,
  `IndexID` int(0) NULL DEFAULT NULL,
  `BeserveTime` date NULL DEFAULT NULL,
  `DocumentID` int(0) NULL DEFAULT NULL,
  INDEX `ReaderID`(`ReaderID`) USING BTREE,
  INDEX `IndexID`(`IndexID`) USING BTREE,
  CONSTRAINT `reserve_ibfk_1` FOREIGN KEY (`ReaderID`) REFERENCES `reader` (`readerID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `reserve_ibfk_2` FOREIGN KEY (`IndexID`) REFERENCES `copy` (`IndexID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reserve
-- ----------------------------
INSERT INTO `reserve` VALUES (20212021, 201, '2021-12-22', 2);
INSERT INTO `reserve` VALUES (20212021, 601, '2021-12-23', 6);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `TotalNumber` int(0) NULL DEFAULT NULL,
  `DocumentID` int(0) NULL DEFAULT NULL,
  `libID` int(0) NULL DEFAULT NULL,
  INDEX `DocumentID`(`DocumentID`) USING BTREE,
  INDEX `libID`(`libID`) USING BTREE,
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`DocumentID`) REFERENCES `document` (`DocumentID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `store_ibfk_2` FOREIGN KEY (`libID`) REFERENCES `library` (`libID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
