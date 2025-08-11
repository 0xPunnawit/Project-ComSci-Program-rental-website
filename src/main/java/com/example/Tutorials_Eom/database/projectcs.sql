-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2025 at 03:10 PM
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
-- Database: `projectcs`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(6) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(37, 'C'),
(34, 'C++'),
(35, 'Java'),
(40, 'Python');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(6) NOT NULL,
  `user_id` int(6) DEFAULT NULL,
  `product_id` int(6) DEFAULT NULL,
  `amount` decimal(6,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('CANCELLED','COMPLETED','PENDING') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `amount`, `order_date`, `status`) VALUES
(83, 15, 31, 1.00, '2025-01-26 10:56:26', 'COMPLETED'),
(84, 15, 31, 1.00, '2025-02-03 12:31:59', 'COMPLETED'),
(87, 15, 31, 1.00, '2025-02-19 18:04:46', 'COMPLETED'),
(88, 155, 31, 1.00, '2025-02-24 14:50:12', 'COMPLETED'),
(89, 156, 31, 1.00, '2025-02-24 15:06:54', 'COMPLETED'),
(90, 15, 31, 1.00, '2025-02-24 16:25:55', 'COMPLETED'),
(91, 15, 31, 1.00, '2025-02-24 16:26:28', 'COMPLETED'),
(92, 15, 31, 1.00, '2025-03-18 18:21:31', 'COMPLETED'),
(93, 157, 31, 1.00, '2025-03-19 10:41:11', 'COMPLETED'),
(94, 15, 31, 1.00, '2025-06-04 17:10:29', 'COMPLETED'),
(95, 158, 31, 1.00, '2025-06-05 09:29:02', 'COMPLETED'),
(96, 15, 31, 1.00, '2025-06-12 17:45:47', 'COMPLETED'),
(97, 15, 31, 1.00, '2025-06-12 17:45:54', 'COMPLETED'),
(98, 157, 31, 1.00, '2025-06-12 18:09:22', 'COMPLETED'),
(99, 15, 31, 1.00, '2025-07-07 13:26:56', 'COMPLETED'),
(101, 15, 33, 1.00, '2025-07-09 06:48:37', 'COMPLETED'),
(102, 15, 31, 1.00, '2025-08-08 15:40:51', 'COMPLETED'),
(103, 15, 31, 1.00, '2025-08-11 12:30:20', 'COMPLETED'),
(104, 15, 31, 1.00, '2025-08-11 13:05:55', 'COMPLETED');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(6) NOT NULL,
  `category_id` int(6) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `description` varchar(40) DEFAULT NULL,
  `products_price` decimal(6,2) NOT NULL,
  `product_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('CLOSE_SALE','OPEN_SALE','STOP_SALE') NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `rental_days` int(6) DEFAULT 1,
  `file_program` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `products_price`, `product_created_at`, `status`, `file_path`, `rental_days`, `file_program`) VALUES
(31, 35, 'โปรแกรมตั้งเวลาปิดคอม ', 'พัฒนาโดยใช้ java jdk', 1.00, '2025-01-26 10:15:31', 'OPEN_SALE', 'https://www.youtube.com/embed/A5wtpz7HxDs?si=B_hrK_1ah8N8ut6E', 3, 'javatime.rar'),
(33, 37, 'โปรแกรมลบไฟล์ขยะ', 'เขียนโดย C  Run โปรแกรม ลบไฟล์ AUTO', 1.00, '2025-01-26 14:42:43', 'STOP_SALE', '', 1, 'rufus-4.9.exe');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(6) NOT NULL,
  `user_id` int(6) DEFAULT NULL,
  `amount` decimal(6,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `transaction_reference` varchar(255) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('FAILED','PENDING','SUCCESS') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `user_id`, `amount`, `payment_method`, `transaction_reference`, `transaction_date`, `status`) VALUES
(27, 15, 100.00, 'Bank', '015035153312CTF09997', '2025-02-19 17:56:32', 'SUCCESS'),
(28, 155, 100.00, 'Bank', '015037103540BPP07065', '2025-02-24 14:49:34', 'SUCCESS'),
(29, 156, 700.00, 'Bank', '015034105437BPP07422', '2025-02-24 15:06:37', 'SUCCESS'),
(30, 156, 3.00, 'Bank', '435322918405I000024B9790', '2025-02-24 15:09:32', 'SUCCESS'),
(31, 156, 90.00, 'Bank', '202502081PJ6rPIZ36zae4lao', '2025-02-24 15:10:03', 'SUCCESS'),
(32, 156, 4.48, 'Bank', '202412182203674388', '2025-02-24 15:10:43', 'SUCCESS'),
(33, 157, 100.00, 'Bank', '015062124510CTF04518', '2025-03-19 10:41:03', 'SUCCESS'),
(34, 158, 3.00, 'Bank', '202506058JsoiNRdvmbYUWh54', '2025-06-04 17:23:21', 'SUCCESS'),
(35, 15, 3.00, 'Bank', '0451905o62i0mqtiTFrj', '2025-07-09 06:57:18', 'SUCCESS'),
(36, 15, 4.00, 'Bank', '2025070924CJq0fUIBA9smjJp', '2025-07-09 07:01:22', 'SUCCESS');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(100) NOT NULL,
  `tel` varchar(10) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `fname` varchar(120) DEFAULT NULL,
  `lname` varchar(120) DEFAULT NULL,
  `wallet` decimal(6,2) NOT NULL DEFAULT 0.00,
  `wallet_last_updated` timestamp NULL DEFAULT current_timestamp(),
  `hwid` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `role` enum('PERSON','ADMIN') NOT NULL DEFAULT 'PERSON'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `tel`, `email`, `fname`, `lname`, `wallet`, `wallet_last_updated`, `hwid`, `created_at`, `role`) VALUES
(15, 'AA1', 'de5c07f32a81f72f70c54be8633b993be4233bac2726bb5c7f0da80bcc32f8e0', 'AA1', 'AA1@gmail.com', 'Punnawit', 'Rodsai', 1474.94, '2025-08-11 13:05:55', 'D8-BB-C1-64-37-EF', '2024-12-01 16:33:40', 'PERSON'),
(154, 'admin01', '0876dfca6d6fedf99b2ab87b6e2fed4bd4051ede78a8a9135b500b2e94d99b88', '4313342458', 'Admin01@gmail.com', 'Admin', 'Admin', 0.00, NULL, 'D8-BB-C1-64-37-EF', '2025-02-23 09:25:52', 'ADMIN'),
(155, 'Gaiyasit', 'c730ff761f9a11f47bf1a93b20636e2f0eec6c7472e5e18b097b48362e6a1854', '0886645323', 'gaiyasit.gae@mail.pbru.ac.th', 'Gaiyasit', 'Gaeonet', 99.00, '2025-02-24 14:50:12', NULL, '2025-02-24 14:48:54', 'PERSON'),
(156, 'Santisuk', '84ea71daa26b5f295877691e6aa4f41b25ce82c0ce4edad9dbaf3f6676742e5e', '0876555533', 'Santisuk@gmail.com', 'Santisuk', 'Seaosam', 796.48, '2025-02-24 15:10:43', 'D8-BB-C1-64-37-EF', '2025-02-24 15:05:43', 'PERSON'),
(157, 'Phuree', 'eaabeffbdb5a85e5c01a189c3899936f7653a52e7089f4dd9599c6e779330e4a', '0984743821', 'Phuree.thi@mail.pbru.ac.th', 'Phuree', 'Thimthae', 98.00, '2025-06-12 18:09:22', 'D8-BB-C1-64-37-EF', '2025-03-19 10:36:51', 'PERSON'),
(158, 'Sitthipon', '81c2384d6bb468e649abe4f4793cf33c576c7b3f0ca15dc40a333c4e3c1cf1c4', '0928978432', 'Sitthipon@gmail.com', 'Sitthipon', 'Arunrat', 2.00, '2025-06-05 09:29:02', NULL, '2025-06-04 17:22:48', 'PERSON'),
(159, 'Chirapakorn', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '0842869032', 'chirapakorn11149@gmail.com', 'Chirapakorn', 'Thongkaisan', 0.00, NULL, NULL, '2025-07-08 01:26:49', 'PERSON'),
(160, 'kazuto', '36b5c83e5e693ab01808e396b0eb167e4148e2744a0f1f8e8171e8f556b5f406', '0969987814', 'chadayu.koe@mail.pbru.ac.th', 'Chadayu', 'Koetsantas', 0.00, NULL, NULL, '2025-07-08 01:29:25', 'PERSON');

-- --------------------------------------------------------

--
-- Table structure for table `user_products`
--

CREATE TABLE `user_products` (
  `user_products_id` int(6) NOT NULL,
  `user_id` int(6) DEFAULT NULL,
  `product_id` int(6) DEFAULT NULL,
  `status` enum('ACTIVATE','DEACTIVATE') NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_products`
--

INSERT INTO `user_products` (`user_products_id`, `user_id`, `product_id`, `status`, `start_date`, `end_date`) VALUES
(41, 15, 31, 'DEACTIVATE', '2025-01-26 10:56:26', '2025-01-29 10:56:26'),
(42, 15, 31, 'DEACTIVATE', '2025-02-03 12:31:59', '2025-02-06 12:31:59'),
(45, 15, 31, 'DEACTIVATE', '2025-02-19 18:04:46', '2025-02-23 18:04:46'),
(46, 155, 31, 'DEACTIVATE', '2025-02-24 14:50:12', '2025-02-27 14:50:12'),
(47, 156, 31, 'DEACTIVATE', '2025-02-24 15:06:54', '2025-02-27 15:06:54'),
(48, 15, 31, 'DEACTIVATE', '2025-02-24 16:25:55', '2025-02-24 16:25:55'),
(49, 15, 31, 'DEACTIVATE', '2025-02-24 16:26:28', '2025-02-24 16:26:28'),
(50, 15, 31, 'DEACTIVATE', '2025-03-18 18:21:31', '2025-03-21 18:21:31'),
(51, 157, 31, 'DEACTIVATE', '2025-03-19 10:41:11', '2025-03-22 10:41:11'),
(52, 15, 31, 'DEACTIVATE', '2025-06-04 17:10:29', '2025-06-07 17:10:29'),
(53, 158, 31, 'DEACTIVATE', '2025-06-05 09:29:02', '2025-06-08 09:29:02'),
(54, 15, 31, 'DEACTIVATE', '2025-06-12 17:45:47', '2025-06-15 17:45:47'),
(55, 15, 31, 'DEACTIVATE', '2025-06-12 17:45:54', '2025-06-15 17:45:54'),
(56, 157, 31, 'DEACTIVATE', '2025-06-12 18:09:23', '2025-06-15 18:09:23'),
(57, 15, 31, 'DEACTIVATE', '2025-07-07 13:26:56', '2025-07-10 13:26:56'),
(59, 15, 33, 'DEACTIVATE', '2025-07-09 06:48:37', '2025-07-10 06:48:37'),
(60, 15, 31, 'ACTIVATE', '2025-08-08 15:40:51', '2025-08-11 15:40:51'),
(61, 15, 31, 'ACTIVATE', '2025-08-11 12:30:20', '2025-08-14 12:30:20'),
(62, 15, 31, 'ACTIVATE', '2025-08-11 13:05:55', '2025-08-14 13:05:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `unique_name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `FK1cf90etcu98x1e6n9aks3tel3` (`category_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `username_2` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `username_3` (`username`),
  ADD UNIQUE KEY `tel` (`tel`);

--
-- Indexes for table `user_products`
--
ALTER TABLE `user_products`
  ADD PRIMARY KEY (`user_products_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `user_products`
--
ALTER TABLE `user_products`
  MODIFY `user_products_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK1cf90etcu98x1e6n9aks3tel3` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_products`
--
ALTER TABLE `user_products`
  ADD CONSTRAINT `user_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
