-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 09. Nov 2019 um 16:19
-- Server-Version: 10.4.6-MariaDB
-- PHP-Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_ricarda_nadler_carrental`
--
CREATE DATABASE IF NOT EXISTS `cr09_ricarda_nadler_carrental` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_ricarda_nadler_carrental`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `additional_fees`
--

CREATE TABLE `additional_fees` (
  `add_fee_id` int(8) UNSIGNED NOT NULL,
  `add_fee_late_return` int(11) DEFAULT NULL,
  `add_fee_damage` int(11) DEFAULT NULL,
  `add_fee_empty_fuel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `additional_fees`
--

INSERT INTO `additional_fees` (`add_fee_id`, `add_fee_late_return`, `add_fee_damage`, `add_fee_empty_fuel`) VALUES
(1, 0, 0, 0),
(2, 0, 0, 100),
(3, 0, 100, 100),
(4, 100, 100, 100),
(5, 100, 100, 0),
(6, 100, 0, 0),
(7, 0, 100, 0),
(8, 200, 200, 200);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(8) UNSIGNED NOT NULL,
  `agency_name` varchar(30) DEFAULT NULL,
  `agency_location` int(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `agency`
--

INSERT INTO `agency` (`agency_id`, `agency_name`, `agency_location`) VALUES
(13, 'Best Car Rental', 8),
(19, 'Fab Holiday', 7),
(20, 'Europe Car', 10),
(21, 'Budget Car', 9),
(22, 'Prime Car', 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `car_plate` varchar(30) NOT NULL,
  `car_type` varchar(30) DEFAULT NULL,
  `car_owner_id` int(8) UNSIGNED DEFAULT NULL,
  `car_price` int(11) DEFAULT NULL,
  `car_model` varchar(30) DEFAULT NULL,
  `car_year` int(11) DEFAULT NULL,
  `car_color` varchar(30) DEFAULT NULL,
  `car_seatno` int(11) DEFAULT NULL,
  `car_status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`car_plate`, `car_type`, `car_owner_id`, `car_price`, `car_model`, `car_year`, `car_color`, `car_seatno`, `car_status`) VALUES
('A122', 'Kombi', 19, 200, 'BMW', 2019, 'blue', 4, 'free'),
('A123', 'Kombi', 13, 150, 'Seat', 2018, 'red', 4, 'free'),
('A124', 'Kombi', 22, 300, 'VW', 2017, 'grey', 4, 'free'),
('B125', 'Kombi', 20, 250, 'Audi', 2019, 'blue', 4, 'booked'),
('C126', 'Kombi', 21, 200, 'Volvo', 2018, 'black', 4, 'free');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car_make`
--

CREATE TABLE `car_make` (
  `car_make_id` int(8) UNSIGNED NOT NULL,
  `fk_car_model` varchar(30) DEFAULT NULL,
  `fk_make_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car_make`
--

INSERT INTO `car_make` (`car_make_id`, `fk_car_model`, `fk_make_id`) VALUES
(1, 'BMW', 1),
(2, 'BMW', 2),
(3, 'Seat', 3),
(4, 'VW', 5),
(5, 'VW', 6),
(6, 'Seat', 4),
(7, 'Audi', 7),
(8, 'Audi', 9),
(9, 'Volvo', 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(8) UNSIGNED NOT NULL,
  `customer_first_name` varchar(30) DEFAULT NULL,
  `customer_last_name` varchar(30) DEFAULT NULL,
  `custober_dob` date DEFAULT NULL,
  `customer_gender` varchar(6) DEFAULT NULL,
  `customer_street` varchar(40) DEFAULT NULL,
  `customer_streeno` int(11) DEFAULT NULL,
  `customer_email` varchar(60) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `fk_customer_zip` int(11) DEFAULT NULL,
  `fk_login_id` int(8) UNSIGNED DEFAULT NULL
) ;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_first_name`, `customer_last_name`, `custober_dob`, `customer_gender`, `customer_street`, `customer_streeno`, `customer_email`, `customer_phone`, `fk_customer_zip`, `fk_login_id`) VALUES
(13, 'Susanne', 'Maier', '1977-08-02', 'female', 'Hauptstrasse', 12, 'susanne.maier@gmx.at', '12345666', 1220, 1),
(14, 'Peter', 'Huber', '1988-07-03', 'male', 'Hauptstrasse', 22, 'huber@gmx.at', '12345666', 1010, 2),
(15, 'Thomas', 'Muster', '1990-10-02', 'male', 'Singerstrasse', 111, 'th-mu@gmx.at', '12345666', 2170, 3),
(16, 'Alexander', 'Bayer', '1960-08-10', 'male', 'Lastenweg', 2, 'alex_b@gmx.at', '12345666', 2230, 4),
(17, 'Nicole', 'Neumayr', '1950-12-24', 'female', 'Rugierstrasse', 133, 'niki_neu@gmx.at', '12345666', 1220, 5),
(18, 'Maria', 'Lenz', '1983-09-14', 'female', 'Blumengasse', 88, 'maria_lenz@gmx.at', '12345666', 6833, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `damage`
--

CREATE TABLE `damage` (
  `damage_id` int(8) UNSIGNED NOT NULL,
  `damage_amount` int(11) DEFAULT NULL,
  `fk_car_plate` varchar(30) DEFAULT NULL,
  `damage_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `damage`
--

INSERT INTO `damage` (`damage_id`, `damage_amount`, `fk_car_plate`, `damage_date`) VALUES
(1, 200, 'A122', '2019-08-06'),
(2, 100, 'A124', '2019-11-06'),
(3, 100, 'B125', '2018-08-08'),
(4, 100, 'B125', '2019-08-06'),
(5, 100, 'C126', '2019-11-06');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(8) UNSIGNED NOT NULL,
  `driver_first_name` varchar(30) DEFAULT NULL,
  `driver_last_name` varchar(30) DEFAULT NULL,
  `driver_dob` date DEFAULT NULL,
  `driver_licenseno` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_first_name`, `driver_last_name`, `driver_dob`, `driver_licenseno`) VALUES
(1, 'Susanne', 'Maier', '1990-12-03', '12345'),
(2, 'Peter', 'Huber', '1984-11-05', '12346'),
(3, 'Tim', 'Justus', '1990-05-23', '1666345'),
(4, 'Mia', 'Jung', '1970-04-25', '123455'),
(5, 'Toni', 'Bunt', '1986-12-03', '43534534');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `driver_rental`
--

CREATE TABLE `driver_rental` (
  `driver_rental_id` int(8) UNSIGNED NOT NULL,
  `fk_driver_id` int(8) UNSIGNED DEFAULT NULL,
  `fk_rental_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `driver_rental`
--

INSERT INTO `driver_rental` (`driver_rental_id`, `fk_driver_id`, `fk_rental_id`) VALUES
(1, 4, 4),
(2, 2, 5),
(3, 1, 7),
(4, 3, 8),
(5, 5, 9),
(6, 2, 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `emp_no` int(10) UNSIGNED NOT NULL,
  `emp_first_name` varchar(30) DEFAULT NULL,
  `emp_last_name` varchar(30) DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `emp_start_date` date DEFAULT NULL,
  `emp_end_date` date DEFAULT NULL,
  `fk_location_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`emp_no`, `emp_first_name`, `emp_last_name`, `emp_dob`, `emp_start_date`, `emp_end_date`, `fk_location_id`) VALUES
(1, 'Hans', 'Maier', '1987-03-03', '2002-01-01', '0000-00-00', 6),
(2, 'Tanja', 'Maier', '1987-03-03', '2002-01-01', '0000-00-00', 6),
(3, 'Franziska', 'Mayer', '1987-03-03', '2002-01-01', '0000-00-00', 7),
(4, 'Julia', 'Maier', '1988-03-03', '2003-01-01', '0000-00-00', 7),
(5, 'Thomas', 'Gernot', '1977-11-03', '2002-01-01', '0000-00-00', 8),
(6, 'Gernot', 'Sabel', '1983-03-03', '2003-01-01', '0000-00-00', 8),
(7, 'Dominik', 'Schmid', '1960-12-12', '2002-01-01', '0000-00-00', 9),
(8, 'Philipp', 'Schmidt', '1987-03-03', '2003-01-01', '0000-00-00', 9),
(9, 'Hannah', 'Brockhaus', '1986-05-31', '2002-01-01', '0000-00-00', 10),
(10, 'Magdalena', 'Baier', '1995-10-27', '2003-01-01', '0000-00-00', 10);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_amount` int(11) DEFAULT NULL,
  `fk_add_fee_id` int(8) UNSIGNED DEFAULT NULL,
  `fk_rental_id` int(8) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `invoice_amount`, `fk_add_fee_id`, `fk_rental_id`) VALUES
(1, NULL, 1, 4),
(2, NULL, 5, 7),
(3, NULL, 1, 5),
(4, NULL, 4, 6),
(5, NULL, 5, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `location`
--

CREATE TABLE `location` (
  `location_id` int(8) UNSIGNED NOT NULL,
  `location_street` varchar(30) DEFAULT NULL,
  `location_streetno` int(11) DEFAULT NULL,
  `location_zip` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `location`
--

INSERT INTO `location` (`location_id`, `location_street`, `location_streetno`, `location_zip`) VALUES
(6, 'Hauptstrasse', 2, 1010),
(7, 'Hasibederstrasse', 33, 1220),
(8, 'Brunngasse', 133, 2170),
(9, 'Waldweg', 98, 2230),
(10, 'Treietstrasse', 117, 6833);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `make`
--

CREATE TABLE `make` (
  `make_id` int(8) UNSIGNED NOT NULL,
  `make_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `make`
--

INSERT INTO `make` (`make_id`, `make_name`) VALUES
(1, '3er'),
(2, '4er'),
(3, 'Ibiza'),
(4, 'Tolouse'),
(5, 'Golf'),
(6, 'Tiguan'),
(7, 'A2'),
(8, 'Limousine'),
(9, 'A3');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `manager`
--

CREATE TABLE `manager` (
  `fk_emp_no` int(10) UNSIGNED NOT NULL,
  `manager_start_date` date DEFAULT NULL,
  `manager_end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `manager`
--

INSERT INTO `manager` (`fk_emp_no`, `manager_start_date`, `manager_end_date`) VALUES
(2, '2010-11-27', NULL),
(4, '2005-01-08', NULL),
(5, '2002-04-02', NULL),
(7, '2019-11-04', NULL),
(9, '2019-01-08', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rental`
--

CREATE TABLE `rental` (
  `rental_id` int(8) UNSIGNED NOT NULL,
  `rental_pick_up_date` date DEFAULT NULL,
  `rental_expected_return_date` date DEFAULT NULL,
  `rental_actual_return_date` date DEFAULT NULL,
  `rental_pick_up_location` int(8) UNSIGNED DEFAULT NULL,
  `rental_return_location` int(8) UNSIGNED DEFAULT NULL,
  `fk_login_id` int(8) UNSIGNED DEFAULT NULL,
  `rental_type` varchar(20) DEFAULT NULL,
  `rental_late` tinyint(1) DEFAULT NULL,
  `fk_car_plate` varchar(30) DEFAULT NULL,
  `rental_expected_days` int(11) DEFAULT NULL,
  `rental_actual_days` int(11) DEFAULT NULL,
  `rental_fee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `rental`
--

INSERT INTO `rental` (`rental_id`, `rental_pick_up_date`, `rental_expected_return_date`, `rental_actual_return_date`, `rental_pick_up_location`, `rental_return_location`, `fk_login_id`, `rental_type`, `rental_late`, `fk_car_plate`, `rental_expected_days`, `rental_actual_days`, `rental_fee`) VALUES
(4, '2019-09-01', '2019-10-08', '2019-10-08', 6, 7, 4, 'short', 0, 'A122', 37, 37, NULL),
(5, '2019-09-01', '2019-10-08', '2019-10-09', 8, 8, 2, 'short', 0, 'A123', 37, 38, NULL),
(6, '2019-10-01', '2019-10-08', '2019-10-09', 8, 8, 6, 'short', 0, 'A122', 7, 8, NULL),
(7, '2019-09-01', '2019-09-08', '2019-09-08', 7, 7, 5, 'short', 0, 'B125', 7, 7, NULL),
(8, '2019-10-01', '2019-10-08', '2019-10-08', 6, 7, 1, 'short', 0, 'A124', 7, 7, NULL),
(9, '2019-07-01', '2019-10-08', '2019-10-08', 9, 10, 3, 'long', 0, 'C126', 99, 99, NULL),
(10, '2019-10-01', '2019-10-08', '2019-10-08', 6, 7, NULL, 'short', 0, 'C126', 7, 7, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_login`
--

CREATE TABLE `user_login` (
  `login_id` int(8) UNSIGNED NOT NULL,
  `login_username` varchar(30) DEFAULT NULL,
  `login_password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `user_login`
--

INSERT INTO `user_login` (`login_id`, `login_username`, `login_password`) VALUES
(1, 'susannemaier', '12345678'),
(2, 'huber@gmx.at', '14445678'),
(3, 'tommuster', '55555678'),
(4, 'alxb', '1234567998'),
(5, 'niki', '1234567558'),
(6, 'maryl', '12345das678');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zip`
--

CREATE TABLE `zip` (
  `zip` int(11) NOT NULL,
  `zip_city` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `zip`
--

INSERT INTO `zip` (`zip`, `zip_city`) VALUES
(1010, 'Vienna'),
(1220, 'Vienna'),
(2170, 'Poysdorf'),
(2230, 'Gänserndorf'),
(6833, 'Klaus'),
(6855, 'Weiler');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `additional_fees`
--
ALTER TABLE `additional_fees`
  ADD PRIMARY KEY (`add_fee_id`);

--
-- Indizes für die Tabelle `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `agency_location` (`agency_location`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_plate`),
  ADD UNIQUE KEY `car_owner_id` (`car_owner_id`),
  ADD UNIQUE KEY `car_model` (`car_model`),
  ADD UNIQUE KEY `car_owner_id_2` (`car_owner_id`),
  ADD UNIQUE KEY `car_owner_id_3` (`car_owner_id`);

--
-- Indizes für die Tabelle `car_make`
--
ALTER TABLE `car_make`
  ADD PRIMARY KEY (`car_make_id`),
  ADD KEY `fk_make_id` (`fk_make_id`),
  ADD KEY `fk_car_model` (`fk_car_model`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`),
  ADD UNIQUE KEY `fk_login_id` (`fk_login_id`),
  ADD KEY `fk_customer_zip` (`fk_customer_zip`);

--
-- Indizes für die Tabelle `damage`
--
ALTER TABLE `damage`
  ADD PRIMARY KEY (`damage_id`),
  ADD KEY `fk_car_plate` (`fk_car_plate`);

--
-- Indizes für die Tabelle `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indizes für die Tabelle `driver_rental`
--
ALTER TABLE `driver_rental`
  ADD PRIMARY KEY (`driver_rental_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_rental_id` (`fk_rental_id`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_no`),
  ADD KEY `fk_location_id` (`fk_location_id`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `fk_rental_id` (`fk_rental_id`),
  ADD KEY `fk_add_fee_id` (`fk_add_fee_id`);

--
-- Indizes für die Tabelle `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD UNIQUE KEY `location_zip` (`location_zip`);

--
-- Indizes für die Tabelle `make`
--
ALTER TABLE `make`
  ADD PRIMARY KEY (`make_id`);

--
-- Indizes für die Tabelle `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`fk_emp_no`),
  ADD UNIQUE KEY `fk_emp_no` (`fk_emp_no`);

--
-- Indizes für die Tabelle `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`rental_id`),
  ADD UNIQUE KEY `fk_login_id` (`fk_login_id`),
  ADD UNIQUE KEY `fk_login_id_2` (`fk_login_id`),
  ADD KEY `rental_pick_up_location` (`rental_pick_up_location`),
  ADD KEY `rental_return_location` (`rental_return_location`),
  ADD KEY `fk_car_plate` (`fk_car_plate`);

--
-- Indizes für die Tabelle `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `login_username` (`login_username`);

--
-- Indizes für die Tabelle `zip`
--
ALTER TABLE `zip`
  ADD PRIMARY KEY (`zip`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `additional_fees`
--
ALTER TABLE `additional_fees`
  MODIFY `add_fee_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `car_make`
--
ALTER TABLE `car_make`
  MODIFY `car_make_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `damage`
--
ALTER TABLE `damage`
  MODIFY `damage_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `driver_rental`
--
ALTER TABLE `driver_rental`
  MODIFY `driver_rental_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_no` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `make`
--
ALTER TABLE `make`
  MODIFY `make_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `rental`
--
ALTER TABLE `rental`
  MODIFY `rental_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `user_login`
--
ALTER TABLE `user_login`
  MODIFY `login_id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`agency_location`) REFERENCES `location` (`location_id`);

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_owner_id`) REFERENCES `agency` (`agency_id`);

--
-- Constraints der Tabelle `car_make`
--
ALTER TABLE `car_make`
  ADD CONSTRAINT `car_make_ibfk_1` FOREIGN KEY (`fk_make_id`) REFERENCES `make` (`make_id`),
  ADD CONSTRAINT `car_make_ibfk_2` FOREIGN KEY (`fk_car_model`) REFERENCES `car` (`car_model`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_customer_zip`) REFERENCES `zip` (`zip`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_login_id`) REFERENCES `user_login` (`login_id`);

--
-- Constraints der Tabelle `damage`
--
ALTER TABLE `damage`
  ADD CONSTRAINT `damage_ibfk_1` FOREIGN KEY (`fk_car_plate`) REFERENCES `car` (`car_plate`);

--
-- Constraints der Tabelle `driver_rental`
--
ALTER TABLE `driver_rental`
  ADD CONSTRAINT `driver_rental_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `driver_rental_ibfk_2` FOREIGN KEY (`fk_rental_id`) REFERENCES `rental` (`rental_id`);

--
-- Constraints der Tabelle `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints der Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_rental_id`) REFERENCES `rental` (`rental_id`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_add_fee_id`) REFERENCES `additional_fees` (`add_fee_id`);

--
-- Constraints der Tabelle `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`location_zip`) REFERENCES `zip` (`zip`);

--
-- Constraints der Tabelle `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`fk_emp_no`) REFERENCES `employees` (`emp_no`);

--
-- Constraints der Tabelle `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`fk_login_id`) REFERENCES `user_login` (`login_id`),
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`rental_pick_up_location`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`rental_return_location`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `rental_ibfk_4` FOREIGN KEY (`fk_car_plate`) REFERENCES `car` (`car_plate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
