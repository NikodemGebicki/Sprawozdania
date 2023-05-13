/*
Created: 12.05.2023
Modified: 12.05.2023
Model: Logical model
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Księżyc

CREATE TABLE `Księżyc`
(
  `Promień` INT,
  `Masa` INT,
  `Nazwa_ksiezyca` varchar(40) NOT NULL,
  `Temperatura` INT,
  `Promień_ksiezyca` INT,
  `Nazwa_planety` varchar(40)
)
;

CREATE INDEX `IX_Krąży_Ksiezyc` ON `Księżyc` (`Nazwa_planety`)
;

ALTER TABLE `Księżyc` ADD PRIMARY KEY (`Nazwa_ksiezyca`)
;

-- Table Planeta

CREATE TABLE `Planeta`
(
  `Promień` INT,
  `Masa` INT,
  `Nazwa_planety` varchar(40) NOT NULL,
  `Temperatura` INT,
  `Jasność_planety` INT,
  `Promień_planety` INT,
  `Nazwa_gwiazdy` varchar(40)
)
;

CREATE INDEX `IX_Krąży_Planeta` ON `Planeta` (`Nazwa_gwiazdy`)
;

ALTER TABLE `Planeta` ADD PRIMARY KEY (`Nazwa_planety`)
;

-- Table Gwiazda

CREATE TABLE `Gwiazda`
(
  `Promień` INT,
  `Masa` INT,
  `Nazwa_gwiazdy` varchar(40) NOT NULL,
  `Temperatura` INT,
  `Jasność_gwiazdy` INT
)
;

ALTER TABLE `Gwiazda` ADD PRIMARY KEY (`Nazwa_gwiazdy`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Księżyc` ADD CONSTRAINT `Krąży_Ksiezyc` FOREIGN KEY (`Nazwa_planety`) REFERENCES `Planeta` (`Nazwa_planety`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Planeta` ADD CONSTRAINT `Krąży_Planeta` FOREIGN KEY (`Nazwa_gwiazdy`) REFERENCES `Gwiazda` (`Nazwa_gwiazdy`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

