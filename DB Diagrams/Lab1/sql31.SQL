/*
Created: 14.04.2023
Modified: 14.04.2023
Model: Logical model
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Ciało niebieskie

CREATE TABLE `Ciało niebieskie`
(
  `Promień` Int(126),
  `Masa` Int(126),
  `Nazwa` varchar(250) NOT NULL,
  `Temperatura` Int(126)
)
;

ALTER TABLE `Ciało niebieskie` ADD PRIMARY KEY (`Nazwa`)
;

-- Table Księżyc

CREATE TABLE `Księżyc`
(
  `Promień orbity` Int(126),
  `RNazwa` varchar(250),
  `HNazwa` varchar(250) NOT NULL
)
;

CREATE INDEX `IX_Krąży` ON `Księżyc` (`RNazwa`)
;

ALTER TABLE `Księżyc` ADD PRIMARY KEY (`HNazwa`)
;

-- Table Planeta

CREATE TABLE `Planeta`
(
  `Jasność` Int(126),
  `Promień orbity` Int(126),
  `HNazwa` varchar(250) NOT NULL,
  `RNazwa` varchar(250)
)
;

CREATE INDEX `IX_Krąży` ON `Planeta` (`RNazwa`)
;

ALTER TABLE `Planeta` ADD PRIMARY KEY (`HNazwa`)
;

-- Table Gwiazda

CREATE TABLE `Gwiazda`
(
  `Jasność` Int(126),
  `Nazwa` varchar(250) NOT NULL
)
;

ALTER TABLE `Gwiazda` ADD PRIMARY KEY (`Nazwa`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Księżyc` ADD CONSTRAINT `KKrąży` FOREIGN KEY (`RNazwa`) REFERENCES `Planeta` (`HNazwa`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Planeta` ADD CONSTRAINT `PKrąży` FOREIGN KEY (`RNazwa`) REFERENCES `Gwiazda` (`Nazwa`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

