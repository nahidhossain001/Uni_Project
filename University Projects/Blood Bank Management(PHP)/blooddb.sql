-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2016 at 02:36 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blooddb`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_detail`
--

CREATE TABLE IF NOT EXISTS `address_detail` (
  `address` varchar(255) NOT NULL,
  `area` varchar(60) NOT NULL,
  `fb_link` varchar(255) DEFAULT NULL,
  `user_table_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_table_id`),
  KEY `fk_address_detail_user_table1_idx` (`user_table_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `address_detail`
--

INSERT INTO `address_detail` (`address`, `area`, `fb_link`, `user_table_id`) VALUES
('74/c/1, Monipuripara Tejgaon Dhaka-1215', 'farmgate', 'https://www.facebook.com/leonard.michael.9', 1),
('asdjfhj', 'saldfh', 'asjdfhash', 2),
('house of micheal', 'farmgate', 'www.fbidnai.com', 3),
('dfas', 'sdfs', 'sdfas', 4);

-- --------------------------------------------------------

--
-- Table structure for table `blood_group_table`
--

CREATE TABLE IF NOT EXISTS `blood_group_table` (
  `blood_type` varchar(3) NOT NULL,
  `user_table_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_table_id`),
  KEY `fk_blood_group_table_user_table_idx` (`user_table_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `blood_group_table`
--

INSERT INTO `blood_group_table` (`blood_type`, `user_table_id`) VALUES
('A+', 1),
('A+', 2),
('O+', 3),
('o-', 4);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `password` varchar(45) NOT NULL,
  `user_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  PRIMARY KEY (`user_table_id`,`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_login_user_table1_idx` (`user_table_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`password`, `user_table_id`, `username`) VALUES
('password', 1, 'username'),
('123', 2, 'Luiza '),
('12345', 3, 'Jean'),
('123', 4, 'dip20');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE IF NOT EXISTS `user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext NOT NULL,
  `phone` varchar(11) NOT NULL,
  `age` int(2) NOT NULL,
  `n_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`id`, `name`, `phone`, `age`, `n_id`) VALUES
(1, 'Leonard Michael Gomes Dip', '1851322273', 22, '199612'),
(2, 'Luiza Bithi', '019', 42, '154654'),
(3, 'Lydia Margaret ', '01977534207', 24, '12345678'),
(4, 'dipto', '44', 12, 'adf');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
