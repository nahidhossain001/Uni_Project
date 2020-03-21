-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2018 at 03:08 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shushthonaki`
--

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `id` int(11) NOT NULL,
  `generic_name` varchar(255) DEFAULT NULL,
  `image` tinyblob,
  `manufacturer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `generic_name`, `image`, `manufacturer`, `name`, `price`, `quantity`, `type`) VALUES
(1, 'paracetamol ', NULL, 'Square Pharmaceuticals Ltd.', 'ace 500mg', 0.8, 500, 'tablet'),
(5, 'losartan potassium inn 25mg', NULL, 'Square Pharmaceuticals Ltd.', 'angilock', 2.5, 200, 'tablet'),
(6, 'lactulose USP 3.35gm', NULL, 'Aristopharma Ltd.', 'avolac', 100, 100, 'oral solution'),
(7, 'ambroxol hydrochloride BP 6mg/ml', NULL, 'Kumudini Pharma Ltd.', 'amboxol', 20, 80, 'drop'),
(8, 'Amoxycillin 250mg', NULL, 'Sonear Laboratories Ltd.', 'amocap', 3.5, 150, 'capsule'),
(9, 'Paracetamol 120mg', NULL, 'Aexim Pharmaceuticals Ltd.', 'archi', 12, 50, 'suspension'),
(10, 'vitamin-b complex', NULL, 'Renata Limited	', 'beconex', 0.6, 80, 'capsule'),
(11, 'vitamin-b complex	', NULL, 'Square Pharmaceuticals Ltd.', 'b-50 forte', 39.6, 100, 'Injection'),
(12, 'Diltiazem hydrochloride', NULL, 'IBN SINA Pharmaceutical Industry Ltd.', 'cardil 30mg', 2, 60, 'tablet'),
(13, 'metformin hydrochloride', NULL, 'Square Pharmaceuticals Ltd.', 'comet 500mg', 2, 200, 'tablet'),
(14, 'metformin hydrochloride', NULL, 'Square Pharmaceuticals Ltd.', 'comet 750mg', 2.5, 100, 'tablet'),
(15, 'hydrocortisone sodium succinate', NULL, 'Opsonin Pharma Limited', 'cotson 100mg', 50, 25, 'Injection'),
(16, 'paracetamol bp', NULL, 'Square Pharmaceuticals Ltd.', 'ace plus 500mg', 2, 300, 'tablet'),
(17, 'Paracetamol', NULL, 'Beximco Pharmaceuticals Ltd', 'napa 500mg', 0.8, 500, 'tablet');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `address`, `email`, `mobile`, `password`, `username`) VALUES
(1, 'sad', 'dasd', 'add', '11', '1111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
