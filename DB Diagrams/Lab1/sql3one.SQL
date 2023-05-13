/*
Created: 12.05.2023
Modified: 12.05.2023
Model: Logical model
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Ciało niebieskie

CREATE TABLE `Ciało niebieskie`
(
  `Promień` INT,
  `Masa` INT,
  `Nazwa` varchar(40) NOT NULL,
  `Temperatura` INT,
  `Gwiazda_key` Longtext,
  `Planeta_key` Longtext,
  `Promień_ksiezyca` INT,
  `Promień_planety` INT,
  `Jasność_planety` INT,
  `Jasność_gwiazdy` INT
)
;

CREATE INDEX `IX_Krąży_Ksiezyc_1` ON `Ciało niebieskie` (`Gwiazda_key`)
;

CREATE INDEX `IX_Krąży_Planeta_1` ON `Ciało niebieskie` (`Planeta_key`)
;

ALTER TABLE `Ciało niebieskie` ADD PRIMARY KEY (`Nazwa`)
;

