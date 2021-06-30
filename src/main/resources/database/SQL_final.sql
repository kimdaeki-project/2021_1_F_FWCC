-- 형수 =======================================================================================
-- member table -------------------------------------------------------------------------------
-- table create
CREATE TABLE `member` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `birth` varchar(100) NOT NULL,
  `smsAgree` bit(1) NOT NULL,
  `emailAgree` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- role table ---------------------------------------------------------------------------------
-- table create
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;


-- memberRole ---------------------------------------------------------------------------------
-- table create
CREATE TABLE `memberRole` (
  `username` varchar(100) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`username`,`id`),
  KEY `MR_id_FK_idx` (`id`),
  CONSTRAINT `MR_id_FK` FOREIGN KEY (`id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MR_username_FK` FOREIGN KEY (`username`) REFERENCES `member` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- address ------------------------------------------------------------------------------------
-- table create
CREATE TABLE `address` (
  `addrNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `addrName` varchar(100) DEFAULT NULL,
  `recipient` varchar(100) NOT NULL,
  `addrPhone` varchar(100) NOT NULL,
  `zipCode` varchar(100) NOT NULL,
  `basicAddr` varchar(200) NOT NULL,
  `detailAddr` varchar(200) DEFAULT NULL,
  `orderAddr` bit(1) DEFAULT NULL,
  `recentUse` bit(1) DEFAULT NULL,
  PRIMARY KEY (`addrNum`),
  KEY `ADDR_username_FK_idx` (`username`),
  CONSTRAINT `ADDR_username_FK` FOREIGN KEY (`username`) REFERENCES `member` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;


-- boardType -----------------------------------------------------------------------------------
-- table create
CREATE TABLE `boardType` (
  `typeNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`typeNum`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;


-- 이찬우 ====================================================
-- table create
-- productDivision

CREATE TABLE `productDivision` (
  `productDivNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `collab` varchar(100) DEFAULT NULL,
  `productType` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`productDivNum`)
);
-- product

CREATE TABLE `product` (
  `productNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `productTitle` varchar(100) DEFAULT NULL,
  `productPrice` bigint(20) DEFAULT NULL,
  `productDisRate` bigint(20) DEFAULT 0,
  `summary` longtext DEFAULT NULL,
  `productContents` longtext DEFAULT NULL,
  `finalPrice` bigint(20) DEFAULT NULL,
  `productMileage` bigint(20) DEFAULT NULL,
  `productSaleable` bit(1) DEFAULT b'0',
  `productDivNum` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`productNum`),
  KEY `PRODUCT_PDI_NUM_idx` (`productDivNum`),
  CONSTRAINT `PRODUCT_PDI_NUM` FOREIGN KEY (`productDivNum`) REFERENCES `productDivision` (`productDivNum`) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- productFiles

CREATE TABLE `productFiles` (
  `fileNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `productNum` bigint(20) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `oriName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNum`),
  KEY `PF_PN_FK_idx` (`productNum`),
  CONSTRAINT `PF_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `product` (`productNum`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- productInfo

CREATE TABLE `productInfo` (
  `pInfoNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `productNum` bigint(20) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `stock` bigint(20) DEFAULT 0,
  PRIMARY KEY (`pInfoNum`),
  KEY `PI_PN_FK_idx` (`productNum`),
  CONSTRAINT `PI_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `product` (`productNum`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- =====================================이리희=======================================================
---------------------------------------------------------- create table cart ---------------------------------------------------------------------
CREATE TABLE `fw01`.`cart` (
	`cartNum` BIGINT NOT NULL AUTO_INCREMENT,
	`productNum` BIGINT NOT NULL,
	`pInfoNum` BIGINT NOT NULL,
	`productCount` BIGINT NOT NULL,
	`username` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`cartNum`) USING BTREE,
	INDEX `CT_PN_FK` (`productNum`) USING BTREE,
	INDEX `CT_PI_FK` (`pInfoNum`) USING BTREE,
	INDEX `CT_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `CT_PI_FK` FOREIGN KEY (`pInfoNum`) REFERENCES `fw01`.`productinfo` (`pInfoNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `CT_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `fw01`.`product` (`productNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `CT_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

---------------------------------------------------------- create table couponsp -------------------------------------------------------

CREATE TABLE `fw01`.`couponsp` (
    `cuSpNum` BIGINT NOT NULL AUTO_INCREMENT,
    `cuName` VARCHAR(100) NOT NULL,
    `disRate` INT NOT NULL,
    PRIMARY KEY (cuSpNum) USING BTREE
)
;

---------------------------------------------------------- create table coupon ---------------------------------------------------------
CREATE TABLE `fw01`.`coupon` (
	`cuNum` BIGINT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(100) NOT NULL,
	`cuSpNum` BIGINT NOT NULL DEFAULT '1',
	`pubDate` DATE NOT NULL,
	`exDate` DATE NOT NULL,
	`userCheck` BIT NOT NULL DEFAULT b'0',
	PRIMARY KEY (`cuNum`) USING BTREE,
	INDEX `CU_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `CU_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `CU_CSN_FK` FOREIGN KEY (`cuSpNum`) REFERENCES `fw01`.`couponsp` (`cuSpNum`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

---------------------------------------------------------- create table orderlist ---------------------------------------------------------------------

CREATE TABLE `fw01`.`orderlist` (
	`orderNum` VARCHAR(100) NOT NULL,
	`totPrice` BIGINT NOT NULL,
	`spPrice` BIGINT NOT NULL,
	`cuNum` BIGINT,
	`username` VARCHAR(100) NOT NULL,
	`destination` VARCHAR(450) NOT NULL DEFAULT '',
	`orderDate` DATETIME NOT NULL,
	`orderState` BIGINT NOT NULL default '1',
	`orderMessage` TEXT NOT NULL,
	`orderName` VARCHAR(200),
	PRIMARY KEY (`orderNum`) USING BTREE,
	INDEX `OD_CN_FK` (`cuNum`) USING BTREE,
	INDEX `OD_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `OD_CN_FK` FOREIGN KEY (`cuNum`) REFERENCES `fw01`.`coupon` (`cuNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `OD_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

---------------------------------------------------------- create table purchase ---------------------------------------------------------------------

CREATE TABLE `fw01`.`purchase` (
	`purNum` BIGINT NOT NULL AUTO_INCREMENT,
	`productNum` BIGINT NOT NULL,
	`pInfoNum` BIGINT NOT NULL,
	`orderNum` VARCHAR(100) NOT NULL,
	`productCount` INT NOT NULL DEFAULT '0',
	`proPriceSum` BIGINT NOT NULL,
	PRIMARY KEY (`purNum`) USING BTREE,
	INDEX `PUR_PI_FK` (`pInfoNum`) USING BTREE,
	INDEX `PUR_PN_FK` (`productNum`) USING BTREE,
	INDEX `PUR_ON_FK` (`orderNum`) USING BTREE,
	CONSTRAINT `PUR_ON_FK` FOREIGN KEY (`orderNum`) REFERENCES `fw01`.`orderlist` (`orderNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `PUR_PI_FK` FOREIGN KEY (`pInfoNum`) REFERENCES `fw01`.`productinfo` (`pInfoNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `PUR_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `fw01`.`product` (`productNum`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

---------------------------------------------------------- create table mileage ---------------------------------------------------------------------

CREATE TABLE `fw01`.`mileage` (
	`mileNum` BIGINT NOT NULL AUTO_INCREMENT,
	`usedMile` BIGINT NOT NULL,
	`changeMile` BIGINT NOT NULL,
	`username` VARCHAR(100) NOT NULL,
	`orderNum` VARCHAR(100),
	`mileContents` VARCHAR(100) NOT NULL,
	`enabledMile` BIGINT NOT NULL,
	PRIMARY KEY (`mileNum`) USING BTREE,
	INDEX `MI_UN_FK` (`username`) USING BTREE,
	INDEX `MI_ON_FK` (`orderNum`) USING BTREE,
	CONSTRAINT `MI_ON_FK` FOREIGN KEY (`orderNum`) REFERENCES `fw01`.`orderlist` (`orderNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `MI_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

----------------------------------------admin table-----------------------------------------------

CREATE TABLE `fw01`.`admin` (
	`adminIdx` BIGINT NOT NULL AUTO_INCREMENT,
	`adminDate` DATE NOT NULL,
	`productNum` BIGINT NOT NULL DEFAULT '0',
	`sellCount` BIGINT NOT NULL DEFAULT '0',
	PRIMARY KEY (`adminIdx`) USING BTREE,
	INDEX `ADM_PN_FK` (`productNum`) USING BTREE,
	CONSTRAINT `ADM_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `fw01`.`product` (`productNum`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

-- notice ----------------------------------------------------------------------------------------
CREATE TABLE notice
(
    `num`       BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
    `writer`    VARCHAR(100)    NULL        COMMENT '쓴사람', 
    `regDate`   DATETIME        NULL        COMMENT '등록일', 
    `contents`  LONGTEXT        NULL        COMMENT '내용', 
    `hit`       BIGINT          NULL        COMMENT '조회수', 
    `title`     VARCHAR(100)    NULL        COMMENT '제목', 
    CONSTRAINT  PRIMARY KEY (num)
);

ALTER TABLE notice COMMENT 'notice';

ALTER TABLE notice
    ADD CONSTRAINT FK_notice_writer_member_username FOREIGN KEY (writer)
        REFERENCES member (username) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- noticeFiles ----------------------------------------------------------------------------------------
CREATE TABLE noticeFiles
(
    `fileNum`   BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '파일번호', 
    `num`       BIGINT          NULL        COMMENT '글번호', 
    `fileName`  VARCHAR(100)    NULL        COMMENT '파일이름', 
    `oriName`   VARCHAR(100)    NULL        COMMENT '오리진', 
    CONSTRAINT  PRIMARY KEY (fileNum)
);

ALTER TABLE noticeFiles
    ADD CONSTRAINT FK_noticeFiles_num_notice_num FOREIGN KEY (num)
        REFERENCES notice (num) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- noticeComment ----------------------------------------------------------------------------------------
CREATE TABLE noticeComment
(
    `commentNum`  BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '댓글번호', 
    `writer`      VARCHAR(100)    NULL        COMMENT '쓴사람', 
    `regDate`     DATETIME        NULL        COMMENT '등록일', 
    `contents`    LONGTEXT        NULL        COMMENT '내용', 
    `num`         BIGINT          NULL        COMMENT '글번호', 
    CONSTRAINT  PRIMARY KEY (commentNum)
);

ALTER TABLE noticeComment COMMENT 'notice댓글';

ALTER TABLE noticeComment
    ADD CONSTRAINT FK_noticeComment_num_notice_num FOREIGN KEY (num)
        REFERENCES notice (num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE noticeComment
    ADD CONSTRAINT FK_noticeComment_writer_member_username FOREIGN KEY (writer)
        REFERENCES member (username) ON DELETE RESTRICT ON UPDATE RESTRICT;



-- qna ----------------------------------------------------------------------------------------      
CREATE TABLE qna
(
    `num`         BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
    `productNum`  BIGINT          NULL        COMMENT '제품', 
    `title`       VARCHAR(100)    NULL        COMMENT '제목', 
    `writer`      VARCHAR(100)    NULL        COMMENT '쓴사람', 
    `regDate`     DATETIME        NULL        COMMENT '등록일', 
    `hit`         BIGINT          NULL        COMMENT '조회수', 
    `contents`    LONGTEXT        NULL        COMMENT '내용', 
    CONSTRAINT  PRIMARY KEY (num)
);

ALTER TABLE qna COMMENT 'qna';

ALTER TABLE qna
    ADD CONSTRAINT FK_qna_productNum_product_productNum FOREIGN KEY (productNum)
        REFERENCES product (productNum) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE qna
    ADD CONSTRAINT FK_qna_writer_member_username FOREIGN KEY (writer)
        REFERENCES member (username) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- qnaFiles ----------------------------------------------------------------------------------------         
CREATE TABLE qnaFiles
(
    `fileNum`   BIGINT         NOT NULL    AUTO_INCREMENT COMMENT '파일번호', 
    `num`       BIGINT         NULL        COMMENT '글번호', 
    `fileName`  VARCHAR(100)   NULL        COMMENT '파일이름', 
    `oriName`   VARCHAR(100)   NULL        COMMENT '오리진', 
    CONSTRAINT  PRIMARY KEY (fileNum)
);

ALTER TABLE qnaFiles
    ADD CONSTRAINT FK_qnaFiles_num_qna_num FOREIGN KEY (num)
        REFERENCES qna (num) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- qnaComment ------------------------------------------------------------------------
CREATE TABLE qnaComment
(
    `commentNum`  BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '댓글번호', 
    `writer`      VARCHAR(100)    NULL        COMMENT '쓴사람', 
    `regDate`     DATETIME        NULL        COMMENT '등록일', 
    `contents`    LONGTEXT        NULL        COMMENT '내용', 
    `num`         BIGINT          NULL        COMMENT '글번호', 
    CONSTRAINT  PRIMARY KEY (commentNum)
);

ALTER TABLE qnaComment COMMENT 'qna댓글';

ALTER TABLE qnaComment
    ADD CONSTRAINT FK_qnaComment_num_qna_num FOREIGN KEY (num)
        REFERENCES qna (num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE qnaComment
    ADD CONSTRAINT FK_qnaComment_writer_member_username FOREIGN KEY (writer)
        REFERENCES member (username) ON DELETE RESTRICT ON UPDATE RESTRICT;



-- review -------------------------------------------------------------------------        
CREATE TABLE review
(
    `num`       BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
    `title`     VARCHAR(100)    NULL        COMMENT '제목', 
    `writer`    VARCHAR(100)    NULL        COMMENT '쓴사람', 
    `regDate`   DATETIME        NULL        COMMENT '등록일', 
    `hit`       BIGINT          NULL        COMMENT '조회수', 
    `contents`  LONGTEXT        NULL        COMMENT '내용', 
    CONSTRAINT  PRIMARY KEY (num)
);

ALTER TABLE review COMMENT '리뷰테이블';

ALTER TABLE review
    ADD CONSTRAINT FK_review_writer_member_username FOREIGN KEY (writer)
        REFERENCES member (username) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- reviewFiles ----------------------------------------------------------------------
CREATE TABLE reviewFiles
(
    `fileNum`   BIGINT         NOT NULL    AUTO_INCREMENT COMMENT '파일번호', 
    `num`       BIGINT         NULL        COMMENT '글번호', 
    `fileName`  VARCHAR(100)   NULL        COMMENT '파일이름', 
    `oriName`   VARCHAR(100)   NULL        COMMENT '오리진', 
    CONSTRAINT  PRIMARY KEY (fileNum)
);

ALTER TABLE reviewFiles
    ADD CONSTRAINT FK_reviewFiles_num_review_num FOREIGN KEY (num)
        REFERENCES review (num) ON DELETE RESTRICT ON UPDATE RESTRICT;
 
-- reviewComment ----------------------------------------------------------------------        
CREATE TABLE reviewComment
(
    `commentNum`  BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '댓글번호', 
    `writer`      VARCHAR(100)    NULL        COMMENT '쓴사람', 
    `regDate`     DATETIME        NULL        COMMENT '등록일', 
    `contents`    LONGTEXT        NULL        COMMENT '내용', 
    `num`         BIGINT          NULL        COMMENT '글번호', 
    CONSTRAINT  PRIMARY KEY (commentNum)
);

ALTER TABLE reviewComment COMMENT '리뷰댓글';

ALTER TABLE reviewComment
    ADD CONSTRAINT FK_reviewComment_num_review_num FOREIGN KEY (num)
        REFERENCES review (num) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE reviewComment
    ADD CONSTRAINT FK_reviewComment_writer_member_username FOREIGN KEY (writer)
        REFERENCES member (username) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- lookbook ----------------------------------------------------------------------
CREATE TABLE lookbook
(
    `lookbookNum`  BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
    `division`     VARCHAR(10)     NULL        COMMENT '매체 종류', 
    `fileName`     VARCHAR(100)    NULL        COMMENT '파일이름', 
    `title`        varchar(100)    NULL        COMMENT '제목', 
    CONSTRAINT  PRIMARY KEY (lookbookNum)
);

ALTER TABLE lookbook COMMENT 'lookbook';

-- lookbookfile -----------------------------------------------------------

CREATE TABLE lookbookFiles
(
    `lookbookFileNum`  BIGINT          NOT NULL    AUTO_INCREMENT COMMENT '글번호', 
    `fileName`     VARCHAR(100)    NULL        COMMENT '파일이름',
	 `num`       BIGINT         NULL        COMMENT '글번호',  
    CONSTRAINT  PRIMARY KEY (lookbookFileNum)
);


ALTER TABLE lookbookFiles
    ADD CONSTRAINT FK_lookbookFiles_lbfn_lookbook_lbNum FOREIGN KEY (num)
        REFERENCES lookbook(lookbookNum) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- borad end ----------------------------------------------------------------------
