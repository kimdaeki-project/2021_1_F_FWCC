-- 찬우 데이터 테이블 =========================================================================

-- product table 생성 -------------------------------------------------------------------------
CREATE TABLE `fw01`.`product` (
  `productNum` BIGINT NOT NULL AUTO_INCREMENT,
  `productTitle` VARCHAR(100) NULL,
  `productPrice` INT NULL,
  `productDisRate` INT NULL DEFAULT 0,
  `productContents` LONGTEXT NULL,
  `collab` VARCHAR(100) NULL,
  `productType` VARCHAR(100) NULL,
  PRIMARY KEY (`productNum`));
  
-- product table dummydata
  insert into product(productTitle, productPrice,productContents,collab,productType)
values('productTitle1',10000,'productContensts1','collaboration','top-short');
insert into product(productTitle, productPrice,productContents,collab,productType)
values('productTitle2',20000,'productContensts2','none','bottom-short');
insert into product(productTitle, productPrice,productContents,collab,productType)
values('productTitle3',30000,'productContensts3','nont','top-long');

-- productInfo table 생성 ---------------------------------------------------------------------
CREATE TABLE `fw01`.`productInfo` (
  `pInfoNum` BIGINT NOT NULL AUTO_INCREMENT,
  `productNum` BIGINT NULL,
  `size` VARCHAR(10) NULL,
  `stock` BIGINT NULL DEFAULT 0,
  PRIMARY KEY (`pInfoNum`),
  INDEX `PI_PN_FK_idx` (`productNum` ASC) VISIBLE,
  CONSTRAINT `PI_PN_FK`
    FOREIGN KEY (`productNum`)
    REFERENCES `fw01`.`product` (`productNum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
-- productInfo table dummydata
    insert into productInfo (productNum, size, stock)
values(1,'s',10);
insert into productInfo (productNum, size, stock)
values(1,'m',20);
insert into productInfo (productNum, size, stock)
values(1,'l',30);
insert into productInfo (productNum, size, stock)
values(1,'xl',40);
insert into productInfo (productNum, size, stock)
values(2,'s',50);
insert into productInfo (productNum, size, stock)
values(2,'m',60);
insert into productInfo (productNum, size, stock)
values(2,'l',70);
insert into productInfo (productNum, size, stock)
values(2,'xl',80);
insert into productInfo (productNum, size, stock)
values(3,'s',90);
insert into productInfo (productNum, size, stock)
values(3,'m',100);
insert into productInfo (productNum, size, stock)
values(3,'l',110);
insert into productInfo (productNum, size, stock)
values(3,'xl',120);

-- productFiles table 생성 --------------------------------------------------------------
CREATE TABLE `fw01`.`productFiles` (
  `fileNum` BIGINT NOT NULL AUTO_INCREMENT,
  `productNum` BIGINT NULL,
  `fileName` VARCHAR(100) NULL,
  `oriName` VARCHAR(100) NULL,
  PRIMARY KEY (`fileNum`),
  INDEX `PF_PN_FK_idx` (`productNum` ASC) VISIBLE,
  CONSTRAINT `PF_PN_FK`
    FOREIGN KEY (`productNum`)
    REFERENCES `fw01`.`product` (`productNum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
-- productFiles table dummydata
insert into productFiles (productNum,fileName, oriName)
values(1,'fileName1','oriName1');
insert into productFiles (productNum,fileName, oriName)
values(2,'fileName2','oriName1');
insert into productFiles (productNum,fileName, oriName)
values(3,'fileName3','oriName1');
insert into productFiles (productNum,fileName, oriName)
values(1,'fileName1-2','oriName1-2');
insert into productFiles (productNum,fileName, oriName)
values(2,'fileName2-2','oriName2-2');
insert into productFiles (productNum,fileName, oriName)
values(3,'fileName3-2','oriName3-2');
insert into productFiles (productNum,fileName, oriName)
values(1,'fileName1-3','oriName1-3');
insert into productFiles (productNum,fileName, oriName)
values(2,'fileName2-3','oriName2-3');
insert into productFiles (productNum,fileName, oriName)
values(3,'fileName3-3','oriName3-3');

-- 형수 데이터 테이블 =======================================================================================
-- member table -----------------------------------------------------------------------------------
-- member table create
CREATE TABLE `fw01`.`member` (
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `birth` DATE NOT NULL,
  `smsAgree` BIT NOT NULL,		-- 0: 미동의
  `emailAgree` BIT NOT NULL,	-- 0: 미동의
  `enabled` BIT NOT NULL,		-- 0: 비활성화
  PRIMARY KEY (`username`));
  
-- insert dummy data
insert into member(username, password, name, phone, email, birth, smsAgree, emailAgree, enabled)
values('username1', 'password1', 'name1', 'phone1', 'email1', curdate(), true, true, true);
insert into member(username, password, name, phone, email, birth, smsAgree, emailAgree, enabled)
values('username2', 'password2', 'name2', 'phone2', 'email2', curdate(), true, true, true);
insert into member(username, password, name, phone, email, birth, smsAgree, emailAgree, enabled)
values('username3', 'password3', 'name3', 'phone3', 'email3', curdate(), true, true, true);
-- admin
insert into member(username, password, name, phone, email, birth, smsAgree, emailAgree, enabled)
values('admin', 'admin', 'admin', '01099999999', 'admin@gmail.com', '21-05-26', true, true, true);

-- role table -----------------------------------------------------------------------------------
-- role table create
CREATE TABLE `fw01`.`role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(100) NULL,
  PRIMARY KEY (`id`));
  
-- insert dummy data
insert into role(id, roleName)
values(0, 'ROLE_ADMIN');
insert into role(id, roleName)
values(0, 'ROLE_MEMBER');

-- memberRole table -----------------------------------------------------------------------------------
-- memberRole table create
CREATE TABLE `fw01`.`memberRole` (
  `username` VARCHAR(100) NOT NULL,
  `id` BIGINT NOT NULL,
  PRIMARY KEY (`username`, `id`),
  INDEX `MR_id_FK_idx` (`id` ASC) VISIBLE,
  CONSTRAINT `MR_username_FK`
    FOREIGN KEY (`username`)
    REFERENCES `fw01`.`member` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MR_id_FK`
    FOREIGN KEY (`id`)
    REFERENCES `fw01`.`role` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- insert dummy data
insert into memberRole(username, id)
values('username1', 2);
insert into memberRole(username, id)
values('username2', 2);
insert into memberRole(username, id)
values('username3', 2);
-- admin
insert into memberRole(username, id)
values('admin', 1);
insert into memberRole(username, id)
values('admin', 2);

-- address table -----------------------------------------------------------------------------------
-- address table create
CREATE TABLE `fw01`.`address` (
  `addrNum` BIGINT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NULL,
  `addrName` VARCHAR(100) NULL,
  `recipient` VARCHAR(100) NOT NULL,
  `addrPhone` VARCHAR(100) NOT NULL,
  `zipCode` VARCHAR(100) NOT NULL,
  `basicAddr` VARCHAR(200) NOT NULL,
  `detailAddr` VARCHAR(200) NULL,
  PRIMARY KEY (`addrNum`),
  INDEX `ADDR_username_FK_idx` (`username` ASC) VISIBLE,
  CONSTRAINT `ADDR_username_FK`
    FOREIGN KEY (`username`)
    REFERENCES `fw01`.`member` (`username`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- insert dummy data
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username1', 'addrName1', 'recipient1', 'addrPhone1', 'zipCode1', 'basicAddr1', 'detailAddr1');
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username1', 'addrName2', 'recipient2', 'addrPhone2', 'zipCode2', 'basicAddr2', 'detailAddr2');
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username1', 'addrName3', 'recipient3', 'addrPhone3', 'zipCode3', 'basicAddr3', 'detailAddr3');
--
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username2', 'addrName1', 'recipient1', 'addrPhone1', 'zipCode1', 'basicAddr1', 'detailAddr1');
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username2', 'addrName2', 'recipient2', 'addrPhone2', 'zipCode2', 'basicAddr2', 'detailAddr2');
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username2', 'addrName3', 'recipient3', 'addrPhone3', 'zipCode3', 'basicAddr3', 'detailAddr3');
--
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username3', 'addrName1', 'recipient1', 'addrPhone1', 'zipCode1', 'basicAddr1', 'detailAddr1');
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username3', 'addrName2', 'recipient2', 'addrPhone2', 'zipCode2', 'basicAddr2', 'detailAddr2');
insert into address(addrNum, username, addrName, recipient, addrPhone, zipCode, basicAddr, detailAddr)
values(0, 'username3', 'addrName3', 'recipient3', 'addrPhone3', 'zipCode3', 'basicAddr3', 'detailAddr3');


=====================================이리희=======================================================
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

------------------------------------- cart 더미데이터 -----------------------------------------------
INSERT INTO cart (cartNum, productNum, pInfoNum, productCount, username)
VALUES(0, 1, 1, 1, 'admin');
INSERT INTO cart (cartNum, productNum, pInfoNum, productCount, username)
VALUES(0, 1, 2, 1, 'admin');
INSERT INTO cart (cartNum, productNum, pInfoNum, productCount, username)
VALUES(0, 2, 5, 1, 'admin');
INSERT INTO cart (cartNum, productNum, pInfoNum, productCount, username)
VALUES(0, 2, 6, 1, 'admin');
INSERT INTO cart (cartNum, productNum, pInfoNum, productCount, username)
VALUES(0, 3, 9, 1, 'admin');
INSERT INTO cart (cartNum, productNum, pInfoNum, productCount, username)
VALUES(0, 3, 10, 1, 'admin');

---------------------------------------------------------- create table coupon ---------------------------------------------------------------------

CREATE TABLE `fw01`.`coupon` (
	`cuNum` BIGINT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(100) NOT NULL,
	`disRate` INT NOT NULL,
	`pubDate` DATE NOT NULL,
	`exDate` DATE NOT NULL,
	`cuName` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`cuNum`) USING BTREE,
	INDEX `CU_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `CU_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

------------------------------------- coupon 더미데이터 -----------------------------------------------

INSERT INTO coupon (cuNum, username, disRate, pubDate, exDate, cuName)
VALUES(0, 'admin', 0, NOW(), NOW(), 'null');
INSERT INTO coupon (cuNum, username, disRate, pubDate, exDate, cuName)
VALUES(0, 'admin', 10, NOW(), NOW(), 'test1');
INSERT INTO coupon (cuNum, username, disRate, pubDate, exDate, cuName)
VALUES(0, 'admin', 20, NOW(), NOW(), 'test2');
INSERT INTO coupon (cuNum, username, disRate, pubDate, exDate, cuName)
VALUES(0, 'admin', 30, NOW(), NOW(), 'test3');
INSERT INTO coupon (cuNum, username, disRate, pubDate, exDate, cuName)
VALUES(0, 'admin', 40, NOW(), NOW(), 'test4');

---------------------------------------------------------- create table orderlist ---------------------------------------------------------------------

CREATE TABLE `fw01`.`orderlist` (
	`orderNum` VARCHAR(100) NOT NULL,
	`totPrice` BIGINT NOT NULL,
	`spPrice` BIGINT NOT NULL,
	`cuNum` BIGINT NOT NULL,
	`username` VARCHAR(100) NOT NULL,
	`destination` VARCHAR(450) NOT NULL DEFAULT '',
	`orderDate` DATETIME NOT NULL,
	PRIMARY KEY (`orderNum`) USING BTREE,
	INDEX `OD_CN_FK` (`cuNum`) USING BTREE,
	INDEX `OD_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `OD_CN_FK` FOREIGN KEY (`cuNum`) REFERENCES `fw01`.`coupon` (`cuNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `OD_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

------------------------------------- orderlist 더미데이터 -----------------------------------------------

INSERT INTO orderlist (orderNum, totPrice, spPrice, cuNum, username, destination, orderDate)
VALUES('123-123', 100000, 100000, 1, 'admin', 'test1', sysdate());
INSERT INTO orderlist (orderNum, totPrice, spPrice, cuNum, username, destination, orderDate)
VALUES('234-234', 10000, 9000, 1, 'admin', 'test2', sysdate());

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

------------------------------------- purchase 더미데이터 -----------------------------------------------

INSERT INTO purchase(purNum, productNum, pInfoNum, orderNum, productCount, proPriceSum)
VALUES(0, 1, 1, '123-123', 2, 20000);
INSERT INTO purchase(purNum, productNum, pInfoNum, orderNum, productCount, proPriceSum)
VALUES(0, 2, 5, '123-123', 1, 20000);
INSERT INTO purchase(purNum, productNum, pInfoNum, orderNum, productCount, proPriceSum)
VALUES(0, 3, 9, '123-123', 2, 60000);
INSERT INTO purchase(purNum, productNum, pInfoNum, orderNum, productCount, proPriceSum)
VALUES(0, 1, 2, '234-234', 1, 10000);

---------------------------------------------------------- create table mileage ---------------------------------------------------------------------

CREATE TABLE `fw01`.`mileage` (
	`mileNum` BIGINT NOT NULL AUTO_INCREMENT,
	`usedMile` BIGINT NOT NULL,
	`unableMile` BIGINT NOT NULL,
	`username` VARCHAR(100) NOT NULL,
	`orderNum` VARCHAR(100) NOT NULL,
	`mileContents` VARCHAR(100) NOT NULL,
	`enabledMile` BIGINT NOT NULL,
	PRIMARY KEY (`mileNum`) USING BTREE,
	INDEX `MI_UN_FK` (`username`) USING BTREE,
	INDEX `MI_ON_FK` (`orderNum`) USING BTREE,
	CONSTRAINT `MI_ON_FK` FOREIGN KEY (`orderNum`) REFERENCES `fw01`.`orderlist` (`orderNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `MI_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
;

------------------------------------- mileage 더미데이터 -----------------------------------------------

INSERT INTO mileage(mileNum, usedMile, unableMile, username, orderNum, mileContents, enabledMile)
VALUES(0, 0, 0, 'admin', '123-123', 'testing', 0);
INSERT INTO mileage(mileNum, usedMile, unableMile, username, orderNum, mileContents, enabledMile)
VALUES(0, 1000, 0, 'admin', '234-234', 'testing', 0);

--한철 --------------------------------------------------------------------------------------------
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

INSERT INTO notice(title,writer,regDate,contents,hit)
VALUES('title1','username1',NOW(),'contents1',0);
INSERT INTO notice(title,writer,regDate,contents,hit)
VALUES('title2','username2',NOW(),'contents2',0);
INSERT INTO notice(title,writer,regDate,contents,hit)
VALUES('title3','username3',NOW(),'contents3',0);

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
        
INSERT INTO noticeFiles(num,fileName,oriName)
VALUES(1,'fileName1','oriName1');
INSERT INTO noticeFiles(num,fileName,oriName)
VALUES(2,'fileName2','oriName2');
INSERT INTO noticeFiles(num,fileName,oriName)
VALUES(3,'fileName3','oriName3');

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
        
INSERT INTO noticeComment(writer,regDate,contents,num)
VALUES('username1',NOW(),'contetns1',1);
INSERT INTO noticeComment(writer,regDate,contents,num)
VALUES('username2',NOW(),'contetns2',2);
INSERT INTO noticeComment(writer,regDate,contents,num)
VALUES('username3',NOW(),'contetns3',3);



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

INSERT INTO qna(productNum,title,writer,regDate,hit,contents)
VALUES(1,'title1','username1',NOW(),1,'contents1');
INSERT INTO qna(productNum,title,writer,regDate,hit,contents)
VALUES(2,'title2','username2',NOW(),2,'contents2');
INSERT INTO qna(productNum,title,writer,regDate,hit,contents)
VALUES(3,'title3','username3',NOW(),3,'contents3');

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

INSERT INTO qnaFiles(num,fileName,oriName)
VALUES(1,'fileName1','oriName1');
INSERT INTO qnaFiles(num,fileName,oriName)
VALUES(2,'fileName2','oriName2');
INSERT INTO qnaFiles(num,fileName,oriName)
VALUES(3,'fileName3','oriName3');


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

INSERT INTO qnaComment(writer,regDate,contents,num)
VALUES('username1',NOW(),'contetns1',1);
INSERT INTO qnaComment(writer,regDate,contents,num)
VALUES('username2',NOW(),'contetns2',2);
INSERT INTO qnaComment(writer,regDate,contents,num)
VALUES('username3',NOW(),'contetns3',3);



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
        
INSERT INTO review(title,writer,regDate,contents,hit)
VALUES('title1','username1',NOW(),'contents1',0);
INSERT INTO review(title,writer,regDate,contents,hit)
VALUES('title2','username2',NOW(),'contents2',0);
INSERT INTO review(title,writer,regDate,contents,hit)
VALUES('title3','username3',NOW(),'contents3',0);

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

INSERT INTO reviewFiles(num,fileName,oriName)
VALUES(1,'fileName1','oriName1');
INSERT INTO reviewFiles(num,fileName,oriName)
VALUES(2,'fileName2','oriName2');
INSERT INTO reviewFiles(num,fileName,oriName)
VALUES(3,'fileName3','oriName3');
 
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

INSERT INTO reviewComment(writer,regDate,contents,num)
VALUES('username1',NOW(),'contetns1',1);
INSERT INTO reviewComment(writer,regDate,contents,num)
VALUES('username2',NOW(),'contetns2',2);
INSERT INTO reviewComment(writer,regDate,contents,num)
VALUES('username3',NOW(),'contetns3',3);



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

INSERT INTO lookbook(division,fileName,title)
VALUES('p','fileName1','title1');
INSERT INTO lookbook(division,fileName,title)
VALUES('p','fileName2','title12');
INSERT INTO lookbook(division,fileName,title)
VALUES('v','fileName3','title3');
-- borad end ----------------------------------------------------------------------

