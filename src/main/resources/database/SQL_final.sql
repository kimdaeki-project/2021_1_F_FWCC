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
) 
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
) 

-- productFiles

CREATE TABLE `productFiles` (
  `fileNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `productNum` bigint(20) DEFAULT NULL,
  `fileName` varchar(100) DEFAULT NULL,
  `oriName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`fileNum`),
  KEY `PF_PN_FK_idx` (`productNum`),
  CONSTRAINT `PF_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `product` (`productNum`) ON DELETE CASCADE ON UPDATE CASCADE
) 

-- productInfo

CREATE TABLE `productInfo` (
  `pInfoNum` bigint(20) NOT NULL AUTO_INCREMENT,
  `productNum` bigint(20) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `stock` bigint(20) DEFAULT 0,
  PRIMARY KEY (`pInfoNum`),
  KEY `PI_PN_FK_idx` (`productNum`),
  CONSTRAINT `PI_PN_FK` FOREIGN KEY (`productNum`) REFERENCES `product` (`productNum`) ON DELETE CASCADE ON UPDATE CASCADE
) 