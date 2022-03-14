CREATE TABLE admin  (
  adminId int UNIQUE NOT NULL,
  password varchar(20) NOT NULL
);

INSERT INTO admin VALUES (1000, '123456');

--------------------------

CREATE TABLE document  (
  DocumentID serial ,
  title varchar(30) NOT NULL,
  publisher varchar(50) NOT NULL,
  publisherDate date NOT NULL,
  publisherAddress varchar(20) NOT NULL,
  PRIMARY KEY (DocumentID)
);

INSERT INTO document VALUES (1, '数理统计', '武汉大学出版社', '2016-07-06', '武汉');
INSERT INTO document VALUES (2, '数据库', '工业出版社', '2020-12-08', '武汉');
INSERT INTO document VALUES (3, '聚类', '机械出版社', '2020-10-14', '武汉');
INSERT INTO document VALUES (4, '童年', ' 国际文化出版社', '1998-09-21', '北京');
INSERT INTO document VALUES (5, '数据库内核', '武汉大学出版社', '2020-12-15', '武汉');
INSERT INTO document VALUES (6, '数据库查询优化', '清华大学出版社', '2020-12-02', '北京');

--------------------------

CREATE TABLE book  (
  DocumentID int UNIQUE NOT NULL,
  AuthorName varchar(30) NOT NULL,
  ISBN varchar(20) NOT NULL,
  CONSTRAINT book_ibfk_1 FOREIGN KEY (DocumentID) REFERENCES document (DocumentID) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO book VALUES (1, '王西静', '978-7-307-13471-3');
INSERT INTO book VALUES (4, '马克西姆.高尔基', '978-7-5125-0897-2');

--------------------------

CREATE TABLE library(
  LibId serial NOT NULL,
  BranchName varchar(20) NOT NULL,
  BranchLocation varchar(20) NOT NULL,
  PRIMARY KEY (LibId)
);

INSERT INTO library VALUES (1, '大厅-西侧书架', '计算机学院B602');
INSERT INTO library VALUES (2, '大厅-东侧书架', '计算机学院B602');
INSERT INTO library VALUES (3, '会议室书架', '计算机学院B602');

--------------------------

CREATE TABLE copy  (
  IndexID serial NOT NULL PRIMARY KEY,
  DocumentID int NOT NULL,
  LibId int NOT NULL,
  state int NOT NULL,
  CONSTRAINT copy_ibfk_1 FOREIGN KEY (DocumentID) REFERENCES document (DocumentID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT copy_ibfk_2 FOREIGN KEY (LibId) REFERENCES library (LibId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO copy VALUES (101, 1, 1, 1);
INSERT INTO copy VALUES (102, 1, 1, 1);
INSERT INTO copy VALUES (103, 1, 2, 1);
INSERT INTO copy VALUES (104, 1, 2, 0);
INSERT INTO copy VALUES (105, 1, 1, 1);
INSERT INTO copy VALUES (201, 2, 3, 1);
INSERT INTO copy VALUES (202, 2, 2, 1);
INSERT INTO copy VALUES (203, 2, 1, 1);
INSERT INTO copy VALUES (204, 2, 1, 1);
INSERT INTO copy VALUES (205, 2, 2, 1);
INSERT INTO copy VALUES (206, 2, 2, 1);
INSERT INTO copy VALUES (301, 3, 3, 1);
INSERT INTO copy VALUES (302, 3, 3, 1);
INSERT INTO copy VALUES (303, 3, 1, 1);
INSERT INTO copy VALUES (304, 3, 2, 1);
INSERT INTO copy VALUES (305, 3, 2, 1);
INSERT INTO copy VALUES (306, 3, 3, 1);
INSERT INTO copy VALUES (307, 3, 1, 1);
INSERT INTO copy VALUES (308, 3, 3, 1);
INSERT INTO copy VALUES (309, 3, 1, 1);
INSERT INTO copy VALUES (401, 4, 2, 1);
INSERT INTO copy VALUES (402, 4, 3, 1);
INSERT INTO copy VALUES (403, 4, 3, 1);
INSERT INTO copy VALUES (404, 4, 2, 1);
INSERT INTO copy VALUES (405, 4, 3, 1);
INSERT INTO copy VALUES (406, 4, 1, 1);
INSERT INTO copy VALUES (407, 4, 2, 1);
INSERT INTO copy VALUES (501, 5, 3, 1);
INSERT INTO copy VALUES (502, 5, 1, 1);
INSERT INTO copy VALUES (503, 5, 2, 1);
INSERT INTO copy VALUES (504, 5, 3, 1);
INSERT INTO copy VALUES (505, 5, 3, 1);
INSERT INTO copy VALUES (601, 6, 2, 1);
INSERT INTO copy VALUES (602, 6, 3, 1);
INSERT INTO copy VALUES (603, 6, 1, 1);
INSERT INTO copy VALUES (604, 6, 1, 1);
INSERT INTO copy VALUES (605, 6, 2, 1);
INSERT INTO copy VALUES (606, 6, 3, 1);

--------------------------

CREATE TABLE reader  (
  readerID serial NOT NULL,
  name varchar(10) NOT NULL,
  type varchar(10) NOT NULL,
  PhoneNumber varchar(20) NOT NULL,
  address varchar(50) NOT NULL,
  password varchar(20) NOT NULL,
  PRIMARY KEY (readerID)
);

INSERT INTO reader VALUES (20212020, '康楷晨', '学生', '12345678910', '信息学部十八舍', '123456');
INSERT INTO reader VALUES (20212021, '贺宇阳', '学生', '18163091317', '信息学部十八舍', '123456');
INSERT INTO reader VALUES (20212022, '郝渊科', '学生', '18583929123', '信息学部十八舍', '123456');
INSERT INTO reader VALUES (20212023, '陈叶培', '学生', '15927293841', '信息学部十八舍', '123456');

--------------------------

CREATE TABLE borrow  (
  ReaderID int NOT NULL,
  IndexID int NOT NULL,
  BDatetime date NOT NULL,
  RDatetime date NOT NULL,
  documentID int NOT NULL,
  fine numeric(10, 2),
  CONSTRAINT borrow_ibfk_1 FOREIGN KEY (ReaderID) REFERENCES reader (readerID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT borrow_ibfk_2 FOREIGN KEY (IndexID) REFERENCES copy (IndexID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT borrow_ibfk_3 FOREIGN KEY (documentID) REFERENCES document (DocumentID) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO borrow VALUES (20212021, 101, '2021-11-10', '2021-12-16', 1, 1.20);
INSERT INTO borrow VALUES (20212021, 201, '2021-12-23', NULL, 2, NULL);
INSERT INTO borrow VALUES (20212021, 501, '2021-12-23', '2021-12-23', 5, NULL);
INSERT INTO borrow VALUES (20212021, 301, '2021-11-05', '2021-12-15', 3, 2.00);
INSERT INTO borrow VALUES (20212021, 401, '2021-10-13', '2021-11-17', 4, 0.80);
INSERT INTO borrow VALUES (20212020, 101, '2021-10-07', '2021-11-09', 1, 0.40);
INSERT INTO borrow VALUES (20212020, 601, '2021-09-14', '2021-09-24', 6, NULL);
INSERT INTO borrow VALUES (20212022, 301, '2021-12-16', '2021-12-23', 3, NULL);
INSERT INTO borrow VALUES (20212023, 202, '2021-12-23', '2021-12-23', 2, NULL);
INSERT INTO borrow VALUES (20212022, 203, '2021-12-23', '2021-12-23', 2, NULL);

--------------------------

CREATE TABLE conference(
  DocumentID int(0) NULL DEFAULT NULL,
  Conferencedate date NULL DEFAULT NULL,
  Conferencelocation varchar(20)   NULL DEFAULT NULL,
  ProceedingEditor varchar(20)   NULL DEFAULT NULL,
  INDEX `DocumentID`(`DocumentID`) USING BTREE,
  CONSTRAINT `conference_ibfk_1` FOREIGN KEY (`DocumentID`) REFERENCES document (`DocumentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
)；

INSERT INTO conference VALUES (2, '2021-12-16', '北京', '李四');
INSERT INTO conference VALUES (5, '2021-12-16', '武汉', '李某');

--------------------------

CREATE TABLE journalvolume  (
  `DocumentID` int(0) NULL DEFAULT NULL,
  `JournalName` varchar(20) NULL DEFAULT NULL,
  `JournalEditor` varchar(20) NULL DEFAULT NULL,
  `scope` varchar(20) NULL DEFAULT NULL,
  `VolumeEditor` varchar(20) NULL DEFAULT NULL,
  `VolumeName` varchar(20) NULL DEFAULT NULL,
  INDEX `DocumentID`(`DocumentID`) USING BTREE,
  CONSTRAINT journalvolume_ibfk_1 FOREIGN KEY (`DocumentID`) REFERENCES `document` (`DocumentID`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO journalvolume VALUES (3, '数据挖掘', '王五', '数据分析', '张强', '数据聚类');
INSERT INTO journalvolume VALUES (6, '软件学报', '李某', '数据库', '张某', '数据管理');

--------------------------

CREATE TABLE reserve(
  ReaderID int NOT NULL,
  IndexID int NOT NULL,
  BeserveTime date NOT NULL,
  DocumentID int NOT NULL,
  CONSTRAINT reserve_ibfk_1 FOREIGN KEY (ReaderID) REFERENCES reader (readerID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT reserve_ibfk_2 FOREIGN KEY (IndexID) REFERENCES copy (IndexID) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO reserve VALUES (20212023, 201, '2021-12-22', 2);
INSERT INTO reserve VALUES (20212021, 601, '2021-12-23', 6);

--------------------------

CREATE TABLE store(
  TotalNumber int NOT NULL,
  DocumentID int NOT NULL,
  LibId int NOT NULL,
  CONSTRAINT store_ibfk_1 FOREIGN KEY (DocumentID) REFERENCES document (DocumentID) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT store_ibfk_2 FOREIGN KEY (LibId) REFERENCES library (LibId) ON DELETE RESTRICT ON UPDATE RESTRICT
);

---------------------------

CREATE TABLE paper(
    PaperId serial,
    PaperTitle text,
    PaperAuthor text,
    PaperDate text,
    PaperConferenceOrJournalName text,
    PaperIssue text,
    PaperVolume text,
    PaperPage text,
    PaperDOI text,
);

INSERT INTO paper VALUES (1,'Efficient and effective similar subtrajectory search with deep reinforcement learning',
'Zheng Wang','August 2020','VLDB','12','13','2312-2325','10.14778/3407790.3407827');

INSERT INTO paper VALUES (2,'Parallel training of knowledge graph embedding models: a comparison of techniques',
'Adrian Kochsiek','November 2021','VLDB','15','3','633-645','10.14778/3494124.3494144');

INSERT INTO paper VALUES (3,'The next 50 years in database indexing or: the case for automatically generated index structures',
'Jens Dittrich','November 2021','VLDB','15','3','527-540','10.14778/3494124.3494136');

INSERT INTO paper VALUES (4,'Reimagining chess with AlphaZero',
'Nenad Tomašev','February 2022','Communications of the ACM','65','2','60-66','10.1145/3460349');

INSERT INTO paper VALUES (5,'Practical Wavelet Tree Construction',
'Patrick Dinklage','December 2021','ACM Journal of Experimental Algorithmics','-','26','1-67','10.1145/3457197');

