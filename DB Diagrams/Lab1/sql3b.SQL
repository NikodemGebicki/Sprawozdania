/*
Created: 21.04.2023
Modified: 21.04.2023
Model: Logical model
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Księżyc

CREATE TABLE `Księżyc`
(
  `Promień` Float(126),
  `Masa` Float(126),
  `Ksiezyc_Nazwa` Longtext NOT NULL,
  `Temperatura` Float(126),
  `Promień orbity` Float(126),
  `Nazwa_planeta` Longtext
)
;

CREATE INDEX `IX_Krąży` ON `Księżyc` (`Nazwa_planeta`)
;

ALTER TABLE `Księżyc` ADD PRIMARY KEY (`Ksiezyc_Nazwa`)
;

-- Table Planeta

CREATE TABLE `Planeta`
(
  `Promień` Float(126),
  `Masa` Float(126),
  `Planeta_Nazwa` Longtext NOT NULL,
  `Temperatura` Float(126),
  `Jasność` Float(126),
  `Promień orbity` Float(126),
  `Nazwa_gwiazda` Longtext
)
;

CREATE INDEX `IX_Krąży` ON `Planeta` (`Nazwa_gwiazda`)
;

ALTER TABLE `Planeta` ADD PRIMARY KEY (`Planeta_Nazwa`)
;

-- Table Gwiazda

CREATE TABLE `Gwiazda`
(
  `Promień` Float(126),
  `Masa` Float(126),
  `Gwiazda_Nazwa` Longtext NOT NULL,
  `Temperatura` Float(126),
  `Jasność` Float(126)
)
;

ALTER TABLE `Gwiazda` ADD PRIMARY KEY (`Gwiazda_Nazwa`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Księżyc` ADD CONSTRAINT `Krąży_ksiezyc` FOREIGN KEY (`Nazwa_planeta`) REFERENCES `Planeta` (`Planeta_Nazwa`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Planeta` ADD CONSTRAINT `Krąży_planeta` FOREIGN KEY (`Nazwa_gwiazda`) REFERENCES `Gwiazda` (`Gwiazda_Nazwa`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

