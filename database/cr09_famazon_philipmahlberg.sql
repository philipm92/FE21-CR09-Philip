-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2021 at 03:20 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_famazon_philipmahlberg`
--
CREATE DATABASE IF NOT EXISTS `cr09_famazon_philipmahlberg` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_famazon_philipmahlberg`;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `cityID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `ZIP` int(10) NOT NULL,
  `areaCode` int(11) NOT NULL,
  `FK_countryID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`cityID`, `name`, `ZIP`, `areaCode`, `FK_countryID`) VALUES
(1, 'Vienna', 1230, 1, 1),
(2, 'Korneuburg', 2100, 2262, 1),
(3, 'Stockerau', 2000, 2266, 1);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `companyID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `FK_cityID` int(10) UNSIGNED DEFAULT NULL,
  `phoneNumber` int(11) NOT NULL DEFAULT 123456789
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`companyID`, `name`, `street`, `FK_cityID`, `phoneNumber`) VALUES
(1, 'Tech Seller e.U.', '751 Yeager St.', 1, 1846119072),
(2, 'Company B', '3362 Savin Trl.', 1, 2147483647),
(3, 'Wood GMBH', '1773 Forest Park Ave', 3, 2147483647),
(4, 'Blueberry Data AG', '10992 Bayberry Trl.', 2, 1918973539),
(5, 'Valuable CS 5', '4225 Canbury St.', 1, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `comp_prod`
--

CREATE TABLE `comp_prod` (
  `compProdID` int(10) UNSIGNED NOT NULL,
  `FK_companyID` int(10) UNSIGNED DEFAULT NULL,
  `FK_productID` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comp_prod`
--

INSERT INTO `comp_prod` (`compProdID`, `FK_companyID`, `FK_productID`, `quantity`) VALUES
(1, 1, 4, 5),
(2, 2, 2, 100),
(3, 3, 2, 100),
(4, 3, 3, 17),
(5, 4, 7, 4),
(6, 5, 5, 2),
(7, 4, 3, 3),
(8, 1, 3, 3),
(9, 5, 9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `countryID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countryID`, `name`, `code`) VALUES
(1, 'Austria', 43),
(2, 'Germany', 49),
(3, 'Switzerland', 41),
(4, 'Italy', 39),
(5, 'Brazil', 55);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(10) UNSIGNED NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `street` varchar(20) NOT NULL,
  `FK_cityID` int(10) UNSIGNED DEFAULT NULL,
  `phoneNumber` int(25) NOT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `firstname`, `lastname`, `gender`, `username`, `password`, `email`, `street`, `FK_cityID`, `phoneNumber`, `birthday`) VALUES
(11, 'Tricia', 'Dire', 'F', 'immaturelypresupposed', 'K7,en<(XHs', 'gleamingsmerge@cabinetmakers.com', '751 Yeager St', 2, 1846119072, '1977-12-08'),
(12, 'Deandrea', 'Lichtenwalter', 'M', 'underlaytravel', '3nf&4U+,Aa', 'Minoanoncoming@punchlinepurples.com', '3362 Savin Trl', 1, 2147483647, '1979-12-14'),
(13, 'Caroyln', 'Colligan', 'M', 'divertshirttails', 'j(Jz3ThE>j', 'gladiolassquealing@defaultingorthodoxy.net', '1773 Forest Park Ave', 3, 2147483647, '1989-09-03'),
(14, 'Wilbur', 'Session', 'M', 'Statenroilsnonalcoholic', 'M,:\"$x8xs_', 'sentimentalisms@execratingbrine.info', '10992 Bayberry Trl', 2, 1918973539, '1991-09-13'),
(15, 'Dewitt', 'Walt', 'F', 'drinkingsElliotts', '>5V!g*$b_K', 'fowledfirefighter@transmissible.org', '4225 Canbury St', 1, 2147483647, '1992-05-27');

-- --------------------------------------------------------

--
-- Table structure for table `custom_prod`
--

CREATE TABLE `custom_prod` (
  `FK_customerID` int(10) UNSIGNED NOT NULL,
  `FK_compProdID` int(10) UNSIGNED NOT NULL,
  `FK_orderID` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT 1,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custom_prod`
--

INSERT INTO `custom_prod` (`FK_customerID`, `FK_compProdID`, `FK_orderID`, `quantity`, `date`) VALUES
(11, 3, 1, 15, '2021-08-07'),
(11, 5, 1, 2, '2021-08-05'),
(11, 9, 1, 1, '2021-08-07'),
(12, 1, 2, 1, '2021-06-06'),
(12, 2, 2, 40, '2021-06-08'),
(12, 6, 2, 1, '2021-06-08'),
(13, 1, 4, 1, '2020-11-01'),
(13, 9, 4, 2, '2020-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_services`
--

CREATE TABLE `delivery_services` (
  `deliveryID` int(10) UNSIGNED NOT NULL,
  `name` enum('Post','DHL','DPD','Famazon Delivery') DEFAULT 'Famazon Delivery',
  `street` varchar(50) DEFAULT NULL,
  `FK_cityID` int(10) UNSIGNED DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT 123456789
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery_services`
--

INSERT INTO `delivery_services` (`deliveryID`, `name`, `street`, `FK_cityID`, `phoneNumber`) VALUES
(1, 'Famazon Delivery', 'Not Amazon Street 6/8', 1, 123456789),
(2, 'DPD', 'Another Shipping Company 29/7', 3, 123456789),
(3, 'DHL', 'Dis Hollow Local Store 7/31', 2, 123456789),
(4, 'Post', 'Prior South Street 12/30', 1, 123456789);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderID` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `FK_paymentID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `date`, `FK_paymentID`) VALUES
(1, '2021-08-08', 3),
(2, '2021-06-08', 4),
(4, '2020-11-03', 2);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `paymentID` int(10) UNSIGNED NOT NULL,
  `type` enum('PayPal','Credit Card','Gift Card','Direct Debit') DEFAULT 'Direct Debit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `type`) VALUES
(1, 'Direct Debit'),
(2, 'Gift Card'),
(3, 'Credit Card'),
(4, 'PayPal');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `name`, `price`) VALUES
(1, 'rubber band', 1),
(2, 'air freshener', 2),
(3, 'candle', 4),
(4, '4K Monitor', 289),
(5, 'bread', 3),
(6, 'lamp', 7),
(7, 'perfume', 10),
(8, 'ice cube tray', 3),
(9, 'computer', 1900),
(10, 'leg warmers', 13),
(11, 'greeting card', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ships_orders`
--

CREATE TABLE `ships_orders` (
  `shipmentID` int(10) UNSIGNED NOT NULL,
  `FK_orderID` int(10) UNSIGNED DEFAULT NULL,
  `FK_deliveryID` int(10) UNSIGNED DEFAULT NULL,
  `dateShipped` date NOT NULL,
  `dateArrived` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ships_orders`
--

INSERT INTO `ships_orders` (`shipmentID`, `FK_orderID`, `FK_deliveryID`, `dateShipped`, `dateArrived`) VALUES
(1, 1, 1, '2021-08-09', '2021-08-13'),
(2, 2, 3, '2021-06-08', '2021-06-09'),
(3, 4, 4, '2020-11-05', '2020-11-08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cityID`),
  ADD KEY `FK_countryID` (`FK_countryID`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`companyID`),
  ADD KEY `FK_cityID` (`FK_cityID`);

--
-- Indexes for table `comp_prod`
--
ALTER TABLE `comp_prod`
  ADD PRIMARY KEY (`compProdID`),
  ADD KEY `FK_companyID` (`FK_companyID`),
  ADD KEY `FK_productID` (`FK_productID`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `FK_cityID` (`FK_cityID`);

--
-- Indexes for table `custom_prod`
--
ALTER TABLE `custom_prod`
  ADD PRIMARY KEY (`FK_customerID`,`FK_compProdID`),
  ADD KEY `FK_compProdID` (`FK_compProdID`),
  ADD KEY `FK_orderID` (`FK_orderID`);

--
-- Indexes for table `delivery_services`
--
ALTER TABLE `delivery_services`
  ADD PRIMARY KEY (`deliveryID`),
  ADD KEY `FK_cityID` (`FK_cityID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `FK_paymentID` (`FK_paymentID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `ships_orders`
--
ALTER TABLE `ships_orders`
  ADD PRIMARY KEY (`shipmentID`),
  ADD KEY `FK_orderID` (`FK_orderID`),
  ADD KEY `FK_deliveryID` (`FK_deliveryID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `cityID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `companyID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `comp_prod`
--
ALTER TABLE `comp_prod`
  MODIFY `compProdID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `countryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `delivery_services`
--
ALTER TABLE `delivery_services`
  MODIFY `deliveryID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `paymentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ships_orders`
--
ALTER TABLE `ships_orders`
  MODIFY `shipmentID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`FK_countryID`) REFERENCES `countries` (`countryID`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`FK_cityID`) REFERENCES `cities` (`cityID`) ON DELETE CASCADE;

--
-- Constraints for table `comp_prod`
--
ALTER TABLE `comp_prod`
  ADD CONSTRAINT `comp_prod_ibfk_1` FOREIGN KEY (`FK_companyID`) REFERENCES `companies` (`companyID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comp_prod_ibfk_2` FOREIGN KEY (`FK_productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`FK_cityID`) REFERENCES `cities` (`cityID`) ON DELETE CASCADE;

--
-- Constraints for table `custom_prod`
--
ALTER TABLE `custom_prod`
  ADD CONSTRAINT `custom_prod_ibfk_1` FOREIGN KEY (`FK_customerID`) REFERENCES `customers` (`customerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_prod_ibfk_2` FOREIGN KEY (`FK_compProdID`) REFERENCES `comp_prod` (`compProdID`) ON DELETE CASCADE,
  ADD CONSTRAINT `custom_prod_ibfk_3` FOREIGN KEY (`FK_orderID`) REFERENCES `orders` (`orderID`);

--
-- Constraints for table `delivery_services`
--
ALTER TABLE `delivery_services`
  ADD CONSTRAINT `delivery_services_ibfk_1` FOREIGN KEY (`FK_cityID`) REFERENCES `cities` (`cityID`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`FK_paymentID`) REFERENCES `payments` (`paymentID`) ON DELETE CASCADE;

--
-- Constraints for table `ships_orders`
--
ALTER TABLE `ships_orders`
  ADD CONSTRAINT `ships_orders_ibfk_1` FOREIGN KEY (`FK_orderID`) REFERENCES `orders` (`orderID`) ON DELETE CASCADE,
  ADD CONSTRAINT `ships_orders_ibfk_2` FOREIGN KEY (`FK_deliveryID`) REFERENCES `delivery_services` (`deliveryID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
