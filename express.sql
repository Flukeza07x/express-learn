-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Mar 13, 2026 at 08:45 AM
-- Server version: 8.4.6
-- PHP Version: 8.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `express`
--

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `name`, `qty`, `price`) VALUES
(1, 'Wireless Mouse', 50, 555.00),
(2, 'Mechanical Keyboard', 30, 1200.00),
(3, 'Gaming Monitor 24\"', 15, 4500.00),
(4, 'USB-C Hub', 40, 850.00),
(5, 'Webcam 1080p', 25, 1500.00),
(6, 'Bluetooth Speaker', 20, 990.00),
(7, 'Laptop Stand', 35, 350.00),
(8, 'External Hard Drive 1TB', 12, 1800.00),
(9, 'Gaming Headset', 22, 1250.00),
(10, 'Mouse Pad RGB', 60, 290.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
