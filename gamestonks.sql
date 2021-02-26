/*
	Name: Dev Patel
	Date: 2/12/2021
	ZID : Z1912837
*/
DROP TABLE IF EXISTS  `BuyorSell`,  `Gets`,  `Hold`,  `Handles`, `Connects`, `Stock`,  `Exchanges`,  `Orders`, `Account`,  `Banktransaction`,  `Bank`, `Customer` ;

CREATE TABLE `Customer`
(
    `SSN`		  CHAR(9)  NOT NULL PRIMARY KEY,
    `ID`        VARCHAR(15) NOT NULL,
    `Name`      VARcHAR(20) NOT NULL,
  	`Password`  VARCHAR(20) NOT NULL
  );
  
CREATE TABLE `Bank`
(
    `ID`       VARCHAR(15) NOT NULL PRIMARY KEY,
    `Deposit`   DECIMAL(5,2) NULL,
    `Withdraw`  DECIMAL(5,2) NULL
 );

CREATE TABLE `Banktransaction`
(
   `TransactionID`  VARCHAR(15) NOT NULL PRIMARY KEY,
   `Canceled`       VARCHAR(10) NULL,
   `Approved`       VARCHAR(10) NULL,
   `Pending`        VARCHAR(10) NULL
);

CREATE TABLE `Account`
(
    `AccountNo`    VARCHAR(12) NOT NULL,
    `RoutingNo`    VARCHAR(9)  NULL,
    `SSN`           CHAR(9)  NOT NULL,
    PRIMARY KEY (`AccountNo`,`SSN`),
    FOREIGN KEY (`SSN`)  REFERENCES `Customer`(`SSN`)
);

CREATE TABLE `Orders`
(
  `OrderID`   VARCHAR(15)  NOT NULL,
  `Buyprice`  DECIMAL(5,2) NULL,
  `Status`    VARCHAR(20)  NULL,
  `Sellprice` DECIMAL(5,2) NULL,
  `SSN`         CHAR(9)  NOT NULL,
  PRIMARY KEY (`OrderID`,`SSN`),
  FOREIGN KEY (`SSN`)  REFERENCES `Customer`(`SSN`)
);

CREATE TABLE `Exchanges`
(
  `ExchangeID`  VARCHAR(15) NOT NULL,
   `AccountNo`    VARCHAR(12) NOT NULL,
  PRIMARY KEY (`ExchangeID`, `AccountNo`),
  FOREIGN KEY (`AccountNo`) REFERENCES `Account`(`AccountNo`)
);

CREATE TABLE `Stock` 
(
  `Symbol`      CHAR(20)  NOT NULL PRIMARY KEY,
  `CompanyName` VARCHAR(15) NOT NULL,
  `Price`      Decimal(5,2)   NULL 
);

CREATE TABLE `Connects`
(
  `Data`     VARCHAR(30)  NOT NULL,
  `AccountNo`  VARCHAR(12) NOT NULL,
  `ID`        VARCHAR(15) NOT NULL,
  PRIMARY KEY (`AccountNo`, `ID`),
  FOREIGN KEY (`AccountNo`) REFERENCES `Account`(`AccountNo`),
  FOREIGN KEY (`ID`)   REFERENCES `Bank`(`ID`)
);

CREATE TABLE `Handles`
(
  `Data`     VARCHAR(30)  NOT NULL,
  `ID`        VARCHAR(15) NOT NULL,
  `TransactionID`  VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID`,`TransactionID`),
  FOREIGN KEY (`ID`)  REFERENCES `Bank`(`ID`),
  FOREIGN KEY (`TransactionID`)  REFERENCES `Banktransaction`(`TransactionID`)
);

CREATE TABLE `Hold`
(
  `Data`   VARCHAR(30) NOT NULL,
  `ExchangeID`  VARCHAR(15) NOT NULL,
  `Symbol`      CHAR(20)  NOT NULL,
  PRIMARY KEY (`Symbol`,`ExchangeID`),
  FOREIGN KEY (`Symbol`) REFERENCES `Stock`(`Symbol`),
  FOREIGN KEY (`ExchangeID`) REFERENCES `Exchanges`(`ExchangeID`)
);

CREATE TABLE `Gets`
(
  `Data`   VARcHAR(30) NOT NULL,
  `Symbol`      CHAR(20)  NOT NULL,
  `OrderID`   VARCHAR(15)  NOT NULL,
  primary key(`Symbol`,`OrderID`),
  FOREIGN KEY (`Symbol`) REFERENCES `Stock`(`Symbol`),
  FOREIGN KEY (`OrderID`) REFERENCES `Orders`(`OrderID`)
);

CREATE TABLE `BuyorSell`
(
  `Data`  VARCHAR(30) NOT NULL,
  `OrderID`   VARCHAR(15)  NOT NULL,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (`OrderID`) REFERENCES `Orders`(`OrderID`)
);


