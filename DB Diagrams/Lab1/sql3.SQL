/*
Created: 31.03.2023
Modified: 31.03.2023
Model: Logical model
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Ciało niebieskie

CREATE TABLE `Ciało niebieskie`
(
  `Promien` Float(126),
  `Masa` Float(126),
  `Nazwa` Longtext NOT NULL,
  `Temperatura` Float(126)
)
;

ALTER TABLE `Ciało niebieskie` ADD PRIMARY KEY (`Nazwa`)
;

-- Table Księżyc

CREATE TABLE `Księżyc`
(
  `Promień orbity` Float(126),
  `Nazwa_r` Longtext,
  `Nazwa_h` Longtext NOT NULL
)
;

CREATE INDEX `IX_Krąży` ON `Księżyc` (`Nazwa_r`)
;

ALTER TABLE `Księżyc` ADD PRIMARY KEY (`Nazwa_h`)
;

-- Table Planeta

CREATE TABLE `Planeta`
(
  `Jasność` Float(126),
  `Promień orbity` Float(126),
  `Nazwa_h` Longtext NOT NULL,
  `Nazwa_r` Longtext
)
;

CREATE INDEX `IX_Krąży` ON `Planeta` (`Nazwa_r`)
;

ALTER TABLE `Planeta` ADD PRIMARY KEY (`Nazwa_h`)
;

-- Table Gwiazda

CREATE TABLE `Gwiazda`
(
  `Jasność` Float(126),
  `Nazwa_h` Longtext NOT NULL
)
;

ALTER TABLE `Gwiazda` ADD PRIMARY KEY (`Nazwa_h`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Księżyc` ADD CONSTRAINT `Krąży_k` FOREIGN KEY (`Nazwa_r`) REFERENCES `Planeta` (`Nazwa_h`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Planeta` ADD CONSTRAINT `Krąży_p` FOREIGN KEY (`Nazwa_r`) REFERENCES `Gwiazda` (`Nazwa_h`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

