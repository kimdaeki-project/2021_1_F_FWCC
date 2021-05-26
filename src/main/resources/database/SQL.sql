--찬우 데이터 테이블
-- product table 생성

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

-- productInfo table 생성
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

-- productFiles table 생성
    

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
