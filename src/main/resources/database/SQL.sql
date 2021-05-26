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
