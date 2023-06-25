-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 25 Cze 2023, 10:02
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `model1`
--
CREATE DATABASE IF NOT EXISTS `model1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `model1`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guests`
--

CREATE TABLE `guests` (
  `Phone` varchar(9) DEFAULT NULL,
  `LoginID` varchar(30) NOT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Fname` varchar(30) DEFAULT NULL,
  `Lname` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `guests`
--

INSERT INTO `guests` (`Phone`, `LoginID`, `Address`, `Password`, `Fname`, `Lname`, `Email`) VALUES
('123456123', 'a1', 'a1', 'a1', 'Adam', 'Nowak', 'anowak@gmail.com'),
('234567234', 'a2', 'a2', 'a2', 'Bartosz', 'Jakubiec', 'bjakubiec@gmail.com'),
('345678345', 'a3', 'a3', 'a3', 'Kuba', 'Gutowski', 'kgutowski@gmail.com'),
('a4', 'a4', 'a4', 'a4', 'Katarzyna ', 'Przerwa', 'kprzerwa@gmail.com'),
(NULL, 'login1', NULL, NULL, 'Kamil', 'Sos', NULL),
(NULL, 'login2', NULL, NULL, 'Adam', 'Przerwa', NULL),
(NULL, 'login3', NULL, NULL, NULL, NULL, NULL),
(NULL, 'login4', NULL, NULL, NULL, NULL, NULL),
(NULL, 'login5', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `reservations`
--

CREATE TABLE `reservations` (
  `CheckOut` date DEFAULT NULL,
  `CheckIn` date DEFAULT NULL,
  `ResNumber` bigint(20) NOT NULL,
  `LoginID` varchar(30) DEFAULT NULL,
  `Number` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `reservations`
--

INSERT INTO `reservations` (`CheckOut`, `CheckIn`, `ResNumber`, `LoginID`, `Number`) VALUES
(NULL, '2023-05-12', 1, 'login1', 1),
(NULL, '2023-05-11', 2, 'login1', 2),
(NULL, '2023-04-12', 3, 'login2', 3),
(NULL, '2023-05-16', 4, 'login3', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rooms`
--

CREATE TABLE `rooms` (
  `Number` bigint(20) NOT NULL,
  `Level` bigint(20) DEFAULT NULL,
  `Style` varchar(30) DEFAULT NULL,
  `View` varchar(30) DEFAULT NULL,
  `Beds` bigint(20) DEFAULT NULL,
  `Smoking` tinyint(1) DEFAULT NULL,
  `LoginID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rooms`
--

INSERT INTO `rooms` (`Number`, `Level`, `Style`, `View`, `Beds`, `Smoking`, `LoginID`) VALUES
(1, NULL, NULL, NULL, NULL, 0, 'login1'),
(2, NULL, NULL, NULL, NULL, 1, 'login1'),
(3, NULL, NULL, NULL, NULL, 1, 'login2'),
(4, NULL, NULL, NULL, NULL, 0, 'login4');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`LoginID`);

--
-- Indeksy dla tabeli `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ResNumber`),
  ADD KEY `IX_Book` (`LoginID`),
  ADD KEY `IX_Reserve` (`Number`);

--
-- Indeksy dla tabeli `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`Number`),
  ADD KEY `IX_Request` (`LoginID`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `Book` FOREIGN KEY (`LoginID`) REFERENCES `guests` (`LoginID`),
  ADD CONSTRAINT `Reserve` FOREIGN KEY (`Number`) REFERENCES `rooms` (`Number`);

--
-- Ograniczenia dla tabeli `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `Request` FOREIGN KEY (`LoginID`) REFERENCES `guests` (`LoginID`);
--
-- Baza danych: `model2`
--
CREATE DATABASE IF NOT EXISTS `model2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `model2`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `assigned to`
--

CREATE TABLE `assigned to` (
  `startDate` date DEFAULT NULL,
  `assigned_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `projName` varchar(30) DEFAULT NULL,
  `proj_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `assigned to`
--

INSERT INTO `assigned to` (`startDate`, `assigned_id`, `employee_id`, `projName`, `proj_id`) VALUES
(NULL, 1, 1, 'n1', 1),
(NULL, 2, 1, 'n2', 2),
(NULL, 3, 2, 'n2', 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dependantname`
--

CREATE TABLE `dependantname` (
  `dependantName` varchar(30) DEFAULT NULL,
  `dependant_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `dependantname`
--

INSERT INTO `dependantname` (`dependantName`, `dependant_id`, `employee_id`) VALUES
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `employee`
--

CREATE TABLE `employee` (
  `employee_id` bigint(20) NOT NULL,
  `name_firstName` varchar(30) DEFAULT NULL,
  `name_lastName` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `employee`
--

INSERT INTO `employee` (`employee_id`, `name_firstName`, `name_lastName`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `project`
--

CREATE TABLE `project` (
  `projName` varchar(30) NOT NULL,
  `id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `project`
--

INSERT INTO `project` (`projName`, `id`) VALUES
('n1', 1),
('n2', 2),
('n3', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` bigint(20) NOT NULL,
  `licensePlateNo` varchar(30) NOT NULL,
  `make` varchar(30) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `vehicle`
--

INSERT INTO `vehicle` (`vehicle_id`, `licensePlateNo`, `make`, `employee_id`) VALUES
(1, 'aaa', NULL, 1),
(2, 'bbb', NULL, 2),
(3, 'ccc', NULL, 3),
(4, 'vbn', NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `assigned to`
--
ALTER TABLE `assigned to`
  ADD PRIMARY KEY (`assigned_id`),
  ADD KEY `IX_assign2` (`employee_id`),
  ADD KEY `IX_assign1` (`projName`),
  ADD KEY `projid` (`proj_id`);

--
-- Indeksy dla tabeli `dependantname`
--
ALTER TABLE `dependantname`
  ADD PRIMARY KEY (`dependant_id`),
  ADD KEY `IX_dependant` (`employee_id`);

--
-- Indeksy dla tabeli `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indeksy dla tabeli `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projName`);

--
-- Indeksy dla tabeli `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`licensePlateNo`,`vehicle_id`),
  ADD KEY `IX_drives` (`employee_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `assigned to`
--
ALTER TABLE `assigned to`
  ADD CONSTRAINT `assign1` FOREIGN KEY (`projName`) REFERENCES `project` (`projName`),
  ADD CONSTRAINT `assign2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Ograniczenia dla tabeli `dependantname`
--
ALTER TABLE `dependantname`
  ADD CONSTRAINT `dependant` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Ograniczenia dla tabeli `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `drives` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`);
--
-- Baza danych: `model3`
--
CREATE DATABASE IF NOT EXISTS `model3` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `model3`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ciało niebieskie`
--

CREATE TABLE `ciało niebieskie` (
  `Promień` int(126) DEFAULT NULL,
  `Masa` int(126) DEFAULT NULL,
  `Nazwa` varchar(250) NOT NULL,
  `Temperatura` int(126) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `ciało niebieskie`
--

INSERT INTO `ciało niebieskie` (`Promień`, `Masa`, `Nazwa`, `Temperatura`) VALUES
(11, 12, '1', 1),
(13, 14, '2', 2),
(34, 35, '3', 3),
(56, 57, '4', NULL),
(67, 68, '5', NULL),
(234, 123, '6', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gwiazda`
--

CREATE TABLE `gwiazda` (
  `Jasność` int(126) DEFAULT NULL,
  `Nazwa` varchar(250) NOT NULL,
  `HNazwa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `gwiazda`
--

INSERT INTO `gwiazda` (`Jasność`, `Nazwa`, `HNazwa`) VALUES
(12, '1', 1),
(86, '2', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `księżyc`
--

CREATE TABLE `księżyc` (
  `Promień orbity` int(126) DEFAULT NULL,
  `RNazwa` varchar(250) DEFAULT NULL,
  `HNazwa` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `księżyc`
--

INSERT INTO `księżyc` (`Promień orbity`, `RNazwa`, `HNazwa`) VALUES
(NULL, '2', '4'),
(NULL, '2', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `planeta`
--

CREATE TABLE `planeta` (
  `Jasność` int(126) DEFAULT NULL,
  `Promień orbity` int(126) DEFAULT NULL,
  `HNazwa` varchar(250) NOT NULL,
  `RNazwa` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `planeta`
--

INSERT INTO `planeta` (`Jasność`, `Promień orbity`, `HNazwa`, `RNazwa`) VALUES
(12, 13, '2', '1'),
(24, 25, '3', '1');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ciało niebieskie`
--
ALTER TABLE `ciało niebieskie`
  ADD PRIMARY KEY (`Nazwa`);

--
-- Indeksy dla tabeli `gwiazda`
--
ALTER TABLE `gwiazda`
  ADD PRIMARY KEY (`Nazwa`),
  ADD KEY `Hindex` (`HNazwa`);

--
-- Indeksy dla tabeli `księżyc`
--
ALTER TABLE `księżyc`
  ADD PRIMARY KEY (`HNazwa`),
  ADD KEY `IX_Krąży` (`RNazwa`);

--
-- Indeksy dla tabeli `planeta`
--
ALTER TABLE `planeta`
  ADD PRIMARY KEY (`HNazwa`),
  ADD KEY `IX_Krąży` (`RNazwa`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `księżyc`
--
ALTER TABLE `księżyc`
  ADD CONSTRAINT `KKrąży` FOREIGN KEY (`RNazwa`) REFERENCES `planeta` (`HNazwa`);

--
-- Ograniczenia dla tabeli `planeta`
--
ALTER TABLE `planeta`
  ADD CONSTRAINT `PKrąży` FOREIGN KEY (`RNazwa`) REFERENCES `gwiazda` (`Nazwa`);
--
-- Baza danych: `model3noup`
--
CREATE DATABASE IF NOT EXISTS `model3noup` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `model3noup`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `gwiazda`
--

CREATE TABLE `gwiazda` (
  `Promień` int(11) DEFAULT NULL,
  `Masa` int(11) DEFAULT NULL,
  `Nazwa_gwiazdy` varchar(40) NOT NULL,
  `Temperatura` int(11) DEFAULT NULL,
  `Jasność_gwiazdy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `gwiazda`
--

INSERT INTO `gwiazda` (`Promień`, `Masa`, `Nazwa_gwiazdy`, `Temperatura`, `Jasność_gwiazdy`) VALUES
(123, 123, 'a', 321, 321),
(123, 123, 'b', 321, 321);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `księżyc`
--

CREATE TABLE `księżyc` (
  `Promień` int(11) DEFAULT NULL,
  `Masa` int(11) DEFAULT NULL,
  `Nazwa_ksiezyca` varchar(40) NOT NULL,
  `Temperatura` int(11) DEFAULT NULL,
  `Promień_ksiezyca` int(11) DEFAULT NULL,
  `Nazwa_planety` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `księżyc`
--

INSERT INTO `księżyc` (`Promień`, `Masa`, `Nazwa_ksiezyca`, `Temperatura`, `Promień_ksiezyca`, `Nazwa_planety`) VALUES
(123, 123, 'e', 321, 321, 'c'),
(123, 123, 'f', 321, 321, 'c');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `planeta`
--

CREATE TABLE `planeta` (
  `Promień` int(11) DEFAULT NULL,
  `Masa` int(11) DEFAULT NULL,
  `Nazwa_planety` varchar(40) NOT NULL,
  `Temperatura` int(11) DEFAULT NULL,
  `Jasność_planety` int(11) DEFAULT NULL,
  `Promień_planety` int(11) DEFAULT NULL,
  `Nazwa_gwiazdy` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `planeta`
--

INSERT INTO `planeta` (`Promień`, `Masa`, `Nazwa_planety`, `Temperatura`, `Jasność_planety`, `Promień_planety`, `Nazwa_gwiazdy`) VALUES
(123, 123, 'c', 321, 321, 321, 'a'),
(123, 123, 'd', 321, 321, 321, 'a');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `gwiazda`
--
ALTER TABLE `gwiazda`
  ADD PRIMARY KEY (`Nazwa_gwiazdy`);

--
-- Indeksy dla tabeli `księżyc`
--
ALTER TABLE `księżyc`
  ADD PRIMARY KEY (`Nazwa_ksiezyca`),
  ADD KEY `IX_Krąży_Ksiezyc` (`Nazwa_planety`);

--
-- Indeksy dla tabeli `planeta`
--
ALTER TABLE `planeta`
  ADD PRIMARY KEY (`Nazwa_planety`),
  ADD KEY `IX_Krąży_Planeta` (`Nazwa_gwiazdy`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `księżyc`
--
ALTER TABLE `księżyc`
  ADD CONSTRAINT `Krąży_Ksiezyc` FOREIGN KEY (`Nazwa_planety`) REFERENCES `planeta` (`Nazwa_planety`);

--
-- Ograniczenia dla tabeli `planeta`
--
ALTER TABLE `planeta`
  ADD CONSTRAINT `Krąży_Planeta` FOREIGN KEY (`Nazwa_gwiazdy`) REFERENCES `gwiazda` (`Nazwa_gwiazdy`);
--
-- Baza danych: `model3onetable`
--
CREATE DATABASE IF NOT EXISTS `model3onetable` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE `model3onetable`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ciało niebieskie`
--

CREATE TABLE `ciało niebieskie` (
  `Promień` int(11) DEFAULT NULL,
  `Masa` int(11) DEFAULT NULL,
  `Nazwa` varchar(40) NOT NULL,
  `Temperatura` int(11) DEFAULT NULL,
  `Gwiazda_key` longtext DEFAULT NULL,
  `Planeta_key` longtext DEFAULT NULL,
  `Promień_ksiezyca` int(11) DEFAULT NULL,
  `Promień_planety` int(11) DEFAULT NULL,
  `Jasność_planety` int(11) DEFAULT NULL,
  `Jasność_gwiazdy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `ciało niebieskie`
--

INSERT INTO `ciało niebieskie` (`Promień`, `Masa`, `Nazwa`, `Temperatura`, `Gwiazda_key`, `Planeta_key`, `Promień_ksiezyca`, `Promień_planety`, `Jasność_planety`, `Jasność_gwiazdy`) VALUES
(123, 123, 'a', 44, NULL, NULL, NULL, NULL, NULL, 123),
(123, 123, 'b', 45, NULL, NULL, NULL, NULL, NULL, 34),
(123, 123, 'c', 32, NULL, NULL, NULL, NULL, NULL, 78),
(123, 123, 'd', 65, 'a', NULL, NULL, 345, 345, NULL),
(123, 123, 'e', 654, 'a', NULL, NULL, 456, 456, NULL),
(123, 123, 'f', 31, NULL, 'd', 56, NULL, NULL, NULL),
(123, 123, 'g', 34, NULL, 'd', 76, NULL, NULL, NULL);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `ciało niebieskie`
--
ALTER TABLE `ciało niebieskie`
  ADD PRIMARY KEY (`Nazwa`),
  ADD KEY `IX_Krąży_Ksiezyc_1` (`Gwiazda_key`(768)),
  ADD KEY `IX_Krąży_Planeta_1` (`Planeta_key`(768));
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
