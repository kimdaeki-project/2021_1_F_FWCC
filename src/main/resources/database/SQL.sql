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
values('username1', 'password1', 'name1', 'phone1', 'email1', '21-05-26', true, true, true);
insert into member(username, password, name, phone, email, birth, smsAgree, emailAgree, enabled)
values('username2', 'password2', 'name2', 'phone2', 'email2', '21-05-26', true, true, true);
insert into member(username, password, name, phone, email, birth, smsAgree, emailAgree, enabled)
values('username3', 'password3', 'name3', 'phone3', 'email3', '21-05-26', true, true, true);
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
	`cartNum` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`productNum` BIGINT(20) NOT NULL,
	`pInfoNum` BIGINT(20) NOT NULL,
	`productCount` BIGINT(20) NOT NULL,
	`username` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`cartNum`) USING BTREE,
	INDEX `CT_PN_FK` (`productNum`) USING BTREE,
	INDEX `CT_PI_FK` (`pInfoNum`) USING BTREE,
	INDEX `CT_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `CT_PI_FK` FOREIGN KEY (`pInfoNum`) REFERENCES `fw01`.`productinfo` (`pInfoNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `CT_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `fw01`.`product` (`productNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `CT_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
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
	`cuNum` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`disRate` INT(11) NOT NULL,
	`pubDate` DATE NOT NULL,
	`exDate` DATE NOT NULL,
	`cuName` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`cuNum`) USING BTREE,
	INDEX `CU_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `CU_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
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
	`orderNum` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`totPrice` BIGINT(20) NOT NULL,
	`spPrice` BIGINT(20) NOT NULL,
	`cuNum` BIGINT(20) NOT NULL,
	`username` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`destination` VARCHAR(450) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`orderNum`) USING BTREE,
	INDEX `OD_CN_FK` (`cuNum`) USING BTREE,
	INDEX `OD_UN_FK` (`username`) USING BTREE,
	CONSTRAINT `OD_CN_FK` FOREIGN KEY (`cuNum`) REFERENCES `fw01`.`coupon` (`cuNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `OD_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

------------------------------------- orderlist 더미데이터 -----------------------------------------------

INSERT INTO orderlist (orderNum, totPrice, spPrice, cuNum, username, destination)
VALUES('123-123', 100000, 100000, 1, 'admin', 'test1');
INSERT INTO orderlist (orderNum, totPrice, spPrice, cuNum, username, destination)
VALUES('234-234', 10000, 9000, 1, 'admin', 'test2');

---------------------------------------------------------- create table purchase ---------------------------------------------------------------------

CREATE TABLE `fw01`.`purchase` (
	`purNum` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`productNum` BIGINT(20) NOT NULL,
	`pInfoNum` BIGINT(20) NOT NULL,
	`orderNum` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`productCount` INT(11) NOT NULL DEFAULT '0',
	`proPriceSum` BIGINT(20) NOT NULL,
	PRIMARY KEY (`purNum`) USING BTREE,
	INDEX `PUR_PI_FK` (`pInfoNum`) USING BTREE,
	INDEX `PUR_PN_FK` (`productNum`) USING BTREE,
	INDEX `PUR_ON_FK` (`orderNum`) USING BTREE,
	CONSTRAINT `PUR_ON_FK` FOREIGN KEY (`orderNum`) REFERENCES `fw01`.`orderlist` (`orderNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `PUR_PI_FK` FOREIGN KEY (`pInfoNum`) REFERENCES `fw01`.`productinfo` (`pInfoNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `PUR_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `fw01`.`product` (`productNum`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
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
	`mileNum` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`usedMile` BIGINT(20) NOT NULL,
	`unableMile` BIGINT(20) NOT NULL,
	`username` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`orderNum` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`mileContents` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`enabledMile` BIGINT(20) NOT NULL,
	PRIMARY KEY (`mileNum`) USING BTREE,
	INDEX `MI_UN_FK` (`username`) USING BTREE,
	INDEX `MI_ON_FK` (`orderNum`) USING BTREE,
	CONSTRAINT `MI_ON_FK` FOREIGN KEY (`orderNum`) REFERENCES `fw01`.`orderlist` (`orderNum`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `MI_UN_FK` FOREIGN KEY (`username`) REFERENCES `fw01`.`member` (`username`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

------------------------------------- mileage 더미데이터 -----------------------------------------------

INSERT INTO mileage(mileNum, usedMile, unableMile, username, orderNum, mileContents, enabledMile)
VALUES(0, 0, 0, 'admin', '123-123', 'testing', 0);
INSERT INTO mileage(mileNum, usedMile, unableMile, username, orderNum, mileContents, enabledMile)
VALUES(0, 1000, 0, 'admin', '234-234', 'testing', 0);