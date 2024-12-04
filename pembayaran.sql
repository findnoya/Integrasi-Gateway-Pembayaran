-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2024 at 07:08 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pembayaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `status1` varchar(15) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `transaction_id`, `total_price`, `created_at`, `status1`) VALUES
(24, 1, 7300, '0000-00-00', 'pending'),
(25, 1, 7300, '0000-00-00', 'pending'),
(26, 1, 7300, '0000-00-00', 'pending'),
(27, 1, 7300, '0000-00-00', 'pending'),
(28, 1, 7300, '0000-00-00', 'pending'),
(29, 1, 7300, '0000-00-00', 'pending'),
(30, 1, 7300, '0000-00-00', 'pending'),
(31, 1, 7300, '0000-00-00', 'pending'),
(32, 1, 7300, '0000-00-00', 'pending'),
(33, 1, 7300, '0000-00-00', 'pending'),
(34, 1, 7300, '0000-00-00', 'pending'),
(35, 1, 7300, '0000-00-00', 'pending'),
(36, 1, 7300, '0000-00-00', 'pending'),
(37, 1, 7300, '0000-00-00', 'pending'),
(38, 1, 7300, '0000-00-00', 'pending'),
(39, 1, 7300, '0000-00-00', 'pending'),
(40, 1, 7300, '0000-00-00', 'pending'),
(41, 1, 7300, '0000-00-00', 'pending'),
(42, 1, 7300, '0000-00-00', 'pending'),
(43, 1, 7300, '0000-00-00', 'pending'),
(44, 1, 7300, '0000-00-00', 'pending');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status1` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
