-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2020 at 10:12 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_on_services`
--

CREATE TABLE `add_on_services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(256) NOT NULL,
  `room_type` varchar(256) NOT NULL,
  `rate` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `add_on_services`
--

INSERT INTO `add_on_services` (`service_id`, `service_name`, `room_type`, `rate`) VALUES
(1, 'Camp Fire', 'Single Bed', 500),
(2, 'Camp Fire', 'Double Bed', 500),
(3, 'Cooking', 'Single bed', 300),
(4, 'Cooking', 'Double bed', 300),
(5, 'Pickup', 'all', 0),
(6, 'Drop', 'all', 0),
(7, 'Hot Water', 'Double Bed', 100);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `mob_no` int(50) NOT NULL,
  `email_id` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminId`, `first_name`, `last_name`, `mob_no`, `email_id`, `password`) VALUES
(1, 'firdous', 'alam', 0, 'admin@gmIL.COM', '1233');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingId` int(50) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `booking_on` date NOT NULL,
  `booking_by` varchar(256) NOT NULL,
  `booking_by_admin_id` int(11) DEFAULT NULL,
  `booking_from` date NOT NULL,
  `booking_to` date NOT NULL,
  `booking_rate` int(50) NOT NULL,
  `booking_amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingId`, `property_id`, `user_id`, `booking_on`, `booking_by`, `booking_by_admin_id`, `booking_from`, `booking_to`, `booking_rate`, `booking_amount`) VALUES
(1, 1, 1, '2020-07-13', 'Website_user', 0, '2020-07-12', '2020-07-14', 500, 1500),
(2, 1, 1, '2020-07-13', 'Website_user', 0, '2020-07-12', '2020-07-14', 500, 1500),
(3, 0, 1, '2020-07-13', 'Website_user', 0, '2020-07-11', '2020-07-11', 700, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `booking_add_on`
--

CREATE TABLE `booking_add_on` (
  `booking_add_on_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_add_on`
--

INSERT INTO `booking_add_on` (`booking_add_on_id`, `booking_id`, `service_id`, `amount`) VALUES
(1, 3, 1, 5000),
(2, 3, 2, 300);

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `propertyId` int(11) NOT NULL,
  `property_name` varchar(256) NOT NULL,
  `property_details` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`propertyId`, `property_name`, `property_details`) VALUES
(1, '001', 'this is the test property');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `mob_no` int(10) NOT NULL,
  `email_id` varchar(256) NOT NULL,
  `social_id` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `first_name`, `last_name`, `mob_no`, `email_id`, `social_id`, `password`) VALUES
(1, 'undefined', 'undefined', 0, 'firdous.alam2058@gmail.com', '', '123'),
(2, 'Firdous', 'Alam', 0, 'firdous.alam.2058@gmail.com', 'string', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_on_services`
--
ALTER TABLE `add_on_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingId`);

--
-- Indexes for table `booking_add_on`
--
ALTER TABLE `booking_add_on`
  ADD PRIMARY KEY (`booking_add_on_id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`propertyId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_on_services`
--
ALTER TABLE `add_on_services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingId` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booking_add_on`
--
ALTER TABLE `booking_add_on`
  MODIFY `booking_add_on_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `propertyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
