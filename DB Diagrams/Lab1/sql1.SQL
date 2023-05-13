/*
Created: 24.03.2023
Modified: 24.03.2023
Model: Logical model
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Guests

CREATE TABLE `Guests`
(
  `Phone` Varchar(9),
  `LoginID` Varchar(30) NOT NULL,
  `Address` Varchar(30),
  `Password` Varchar(30),
  `Fname` Varchar(30),
  `Lname` Varchar(30),
  `Email` Varchar(30)
)
;

ALTER TABLE `Guests` ADD PRIMARY KEY (`LoginID`)
;

-- Table Rooms

CREATE TABLE `Rooms`
(
  `Number` Bigint NOT NULL,
  `Level` Bigint,
  `Style` Varchar(30),
  `View` Varchar(30),
  `Beds` Bigint,
  `Smoking` Bool,
  `LoginID` Varchar(30)
)
;

CREATE INDEX `IX_Request` ON `Rooms` (`LoginID`)
;

ALTER TABLE `Rooms` ADD PRIMARY KEY (`Number`)
;

-- Table Reservations

CREATE TABLE `Reservations`
(
  `CheckOut` Date,
  `CheckIn` Date,
  `ResNumber` Bigint NOT NULL,
  `LoginID` Varchar(30),
  `Number` Bigint
)
;

CREATE INDEX `IX_Book` ON `Reservations` (`LoginID`)
;

CREATE INDEX `IX_Reserve` ON `Reservations` (`Number`)
;

ALTER TABLE `Reservations` ADD PRIMARY KEY (`ResNumber`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Rooms` ADD CONSTRAINT `Request` FOREIGN KEY (`LoginID`) REFERENCES `Guests` (`LoginID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Reservations` ADD CONSTRAINT `Book` FOREIGN KEY (`LoginID`) REFERENCES `Guests` (`LoginID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Reservations` ADD CONSTRAINT `Reserve` FOREIGN KEY (`Number`) REFERENCES `Rooms` (`Number`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

