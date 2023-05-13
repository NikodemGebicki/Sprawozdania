/*
Created: 31.03.2023
Modified: 31.03.2023
Model: Logical model
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Employee

CREATE TABLE `Employee`
(
  `id` Bigint NOT NULL,
  `name_firstName` Varchar(30),
  `name_lastName` Varchar(30)
)
;

ALTER TABLE `Employee` ADD PRIMARY KEY (`id`)
;

-- Table Vehicle

CREATE TABLE `Vehicle`
(
  `id` Bigint NOT NULL,
  `licensePlateNo` Varchar(30) NOT NULL,
  `make` Varchar(30),
  `id` Bigint
)
;

CREATE INDEX `IX_drives` ON `Vehicle` (`id`)
;

ALTER TABLE `Vehicle` ADD PRIMARY KEY (`licensePlateNo`, `id`)
;

-- Table Project

CREATE TABLE `Project`
(
  `projName` Varchar(30) NOT NULL,
  `id` Bigint
)
;

ALTER TABLE `Project` ADD PRIMARY KEY (`projName`)
;

-- Table assigned to

CREATE TABLE `assigned to`
(
  `startDate` Date,
  `id` Bigint NOT NULL,
  `id` Bigint,
  `projName` Varchar(30)
)
;

CREATE INDEX `IX_assign2` ON `assigned to` (`id`)
;

CREATE INDEX `IX_assign1` ON `assigned to` (`projName`)
;

ALTER TABLE `assigned to` ADD PRIMARY KEY (`id`)
;

-- Table dependantName

CREATE TABLE `dependantName`
(
  `dependantName` Varchar(30),
  `id` Bigint NOT NULL,
  `id` Bigint
)
;

CREATE INDEX `IX_dependant` ON `dependantName` (`id`)
;

ALTER TABLE `dependantName` ADD PRIMARY KEY (`id`)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Vehicle` ADD CONSTRAINT `drives` FOREIGN KEY (`id`) REFERENCES `Employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `assigned to` ADD CONSTRAINT `assign2` FOREIGN KEY (`id`) REFERENCES `Employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `assigned to` ADD CONSTRAINT `assign1` FOREIGN KEY (`projName`) REFERENCES `Project` (`projName`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `dependantName` ADD CONSTRAINT `dependant` FOREIGN KEY (`id`) REFERENCES `Employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

