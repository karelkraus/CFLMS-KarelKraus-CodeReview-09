-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Sob 07. lis 2020, 09:46
-- Verze serveru: 10.4.14-MariaDB
-- Verze PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `cr09_karel_kraus_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_karel_kraus_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_karel_kraus_delivery`;

-- --------------------------------------------------------

--
-- Struktura tabulky `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `fk_country` varchar(2) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `address`
--

INSERT INTO `address` (`address_id`, `fk_country`, `street`, `city`, `zip_code`) VALUES
(1, 'AT', 'Laxenburger Straße 10', 'Wien', '1100'),
(2, 'AT', 'Post Favoriten Straße 22', 'Wien', '1100'),
(3, 'CZ', 'Vodickova 34', 'Prague', '11000'),
(4, 'CZ', 'Post Jermanova', 'Prague', '12000'),
(5, 'GB', '147 Brixton Road', 'London', 'SW9 6LZ'),
(6, 'GB', 'Post 87 Greenwich Street', 'London', 'W8 5QG'),
(7, 'AT', 'Pilgrimgasse 45', 'Wien', '1200'),
(8, 'CZ', 'Plavecka 11', 'Prague', '12000'),
(9, 'GB', '92 Baker Street', 'London', 'WR9 6CZ');

-- --------------------------------------------------------

--
-- Struktura tabulky `country`
--

CREATE TABLE `country` (
  `country_id` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `country`
--

INSERT INTO `country` (`country_id`) VALUES
('AT'),
('CZ'),
('GB');

-- --------------------------------------------------------

--
-- Struktura tabulky `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `employee`
--

INSERT INTO `employee` (`employee_id`, `fk_address`, `first_name`, `last_name`) VALUES
(1, 7, 'Sebastian', 'Kurz'),
(2, 8, 'Vaclav', 'Klaus'),
(3, 9, 'Boris', 'Johnson');

-- --------------------------------------------------------

--
-- Struktura tabulky `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `fk_sender` int(11) DEFAULT NULL,
  `fk_receiver` int(11) DEFAULT NULL,
  `fk_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `item`
--

INSERT INTO `item` (`item_id`, `fk_sender`, `fk_receiver`, `fk_type`) VALUES
(1, 1, 2, 'Small Letter'),
(2, 2, 1, 'Large Package'),
(3, 3, 2, 'Money Transfer'),
(4, 2, 3, 'Medium Letter'),
(5, 1, 3, 'Small Package'),
(6, 3, 1, 'Extra-Large Package');

-- --------------------------------------------------------

--
-- Struktura tabulky `location`
--

CREATE TABLE `location` (
  `deposite_date` date NOT NULL,
  `fk_item` int(11) DEFAULT NULL,
  `fk_employee` int(11) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `location`
--

INSERT INTO `location` (`deposite_date`, `fk_item`, `fk_employee`, `fk_address`) VALUES
('2020-07-01', 1, 1, 2),
('2020-07-31', 3, 3, 6),
('2020-08-05', 2, 2, 4),
('2020-08-17', 4, 2, 4),
('2020-09-15', 5, 1, 2),
('2020-10-06', 6, 3, 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `person`
--

CREATE TABLE `person` (
  `person_id` int(11) NOT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `person`
--

INSERT INTO `person` (`person_id`, `fk_address`, `first_name`, `last_name`) VALUES
(1, 1, 'Helmut', 'Göthe'),
(2, 3, 'Stanislav', 'Balbin'),
(3, 5, 'George', 'Stewart'),
(4, 1, 'Gerhard', 'Lautner');

-- --------------------------------------------------------

--
-- Struktura tabulky `status`
--

CREATE TABLE `status` (
  `delivery_date` date NOT NULL,
  `fk_deposite_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `status`
--

INSERT INTO `status` (`delivery_date`, `fk_deposite_date`) VALUES
('2020-07-07', '2020-07-01'),
('2020-08-07', '2020-07-31'),
('2020-08-12', '2020-08-05'),
('2020-08-24', '2020-08-17'),
('2020-09-25', '2020-09-15'),
('2020-10-16', '2020-10-06');

-- --------------------------------------------------------

--
-- Struktura tabulky `type`
--

CREATE TABLE `type` (
  `type_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `type`
--

INSERT INTO `type` (`type_id`) VALUES
('Extra-Large Package'),
('Large Letter'),
('Large Package'),
('Medium Letter'),
('Medium Package'),
('Money Transfer'),
('Small Letter'),
('Small Package');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_country` (`fk_country`);

--
-- Klíče pro tabulku `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Klíče pro tabulku `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Klíče pro tabulku `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_sender` (`fk_sender`),
  ADD KEY `fk_receiver` (`fk_receiver`),
  ADD KEY `fk_type` (`fk_type`);

--
-- Klíče pro tabulku `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`deposite_date`),
  ADD KEY `fk_item` (`fk_item`),
  ADD KEY `fk_employee` (`fk_employee`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Klíče pro tabulku `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_id`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Klíče pro tabulku `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`delivery_date`),
  ADD KEY `fk_deposite_date` (`fk_deposite_date`);

--
-- Klíče pro tabulku `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`fk_country`) REFERENCES `country` (`country_id`);

--
-- Omezení pro tabulku `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`);

--
-- Omezení pro tabulku `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`fk_sender`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`fk_receiver`) REFERENCES `person` (`person_id`),
  ADD CONSTRAINT `item_ibfk_4` FOREIGN KEY (`fk_type`) REFERENCES `type` (`type_id`);

--
-- Omezení pro tabulku `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_item`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`fk_employee`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `location_ibfk_3` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`);

--
-- Omezení pro tabulku `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`);

--
-- Omezení pro tabulku `status`
--
ALTER TABLE `status`
  ADD CONSTRAINT `status_ibfk_1` FOREIGN KEY (`fk_deposite_date`) REFERENCES `location` (`deposite_date`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
