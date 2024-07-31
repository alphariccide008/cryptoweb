-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 30, 2024 at 07:39 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crypto_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminreg`
--

CREATE TABLE `adminreg` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(20) NOT NULL,
  `admin_pwd` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adminreg`
--

INSERT INTO `adminreg` (`admin_id`, `admin_username`, `admin_pwd`) VALUES
(1, 'admin1@gmail.com', 'scrypt:32768:8:1$gF93ttSb8saDJCpS$39ccd8cced83903c0af383f5170b5d48746dc5439ff51861d4ee91629ed6837f7e4d75cd050709cd1fb591048903ccf3cf836a5deedb793a7c10548a5f2c7f0c');

-- --------------------------------------------------------

--
-- Table structure for table `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alembic_version`
--

INSERT INTO `alembic_version` (`version_num`) VALUES
('af364acee157');

-- --------------------------------------------------------

--
-- Table structure for table `balance`
--

CREATE TABLE `balance` (
  `balance_id` int(11) NOT NULL,
  `btc_balance` varchar(64) NOT NULL,
  `eth_balance` varchar(64) NOT NULL,
  `freezed_balance` varchar(64) NOT NULL,
  `balance_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `balance`
--

INSERT INTO `balance` (`balance_id`, `btc_balance`, `eth_balance`, `freezed_balance`, `balance_user_id`) VALUES
(2, '10,000', '7,200', '2,900', 4),
(3, '0.000014', '0.000014', '120,000', 5);

-- --------------------------------------------------------

--
-- Table structure for table `check`
--

CREATE TABLE `check` (
  `check_id` int(11) NOT NULL,
  `check_name` varchar(64) NOT NULL,
  `check_amount` decimal(10,0) NOT NULL,
  `check_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL,
  `trans_name` varchar(64) NOT NULL,
  `trans_amount` decimal(10,0) NOT NULL,
  `trans_filename` varchar(64) NOT NULL,
  `trans_plan` varchar(64) NOT NULL,
  `trans_status` varchar(64) NOT NULL,
  `trans_action` varchar(64) NOT NULL,
  `trans_date` datetime DEFAULT NULL,
  `trans_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `trans_name`, `trans_amount`, `trans_filename`, `trans_plan`, `trans_status`, `trans_action`, `trans_date`, `trans_user_id`) VALUES
(3, 'BTCXXXXXXXXX', '1000', '3718869african woman.jpg', 'Basic Top-up', 'Confirmed', 'credit', '2024-07-26 11:33:30', 4),
(4, 'ETHXXXXXXXXX', '3000', '1723895beautyafrica.jpg', 'Pro plan', 'Confirmed', 'Credit', '2024-07-26 11:53:20', 4),
(5, 'ETHXXXXXXXXX', '3000', '1513893ape-653705_1280.jpg', 'Starters Plan', 'Confirmed', 'Credit', '2024-07-26 11:53:56', 4),
(7, 'USDTXXXXXXXX', '1000', 'Default.png', 'Withdrawal', 'Processing', 'Debit', '2024-07-29 18:10:18', 5),
(8, 'BTCXXXXXXXXX', '10000', '27065424thsec.jpg', 'Starters Plan', 'Confirmed', 'Credit', '2024-07-29 21:00:41', 5),
(9, 'ETHXXXXXXXXX', '1000', '644776beautyafrica.jpg', 'Pro plan', 'Pending Confirmation', 'Credit', '2024-07-29 21:01:16', 5);

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL,
  `upload_date` datetime DEFAULT NULL,
  `upload_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(64) NOT NULL,
  `lname` varchar(64) NOT NULL,
  `address` varchar(200) NOT NULL,
  `city` varchar(64) NOT NULL,
  `zipcode` varchar(64) NOT NULL,
  `regdate` datetime DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `ssn` varchar(50) DEFAULT NULL,
  `password` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fname`, `lname`, `address`, `city`, `zipcode`, `regdate`, `email`, `ssn`, `password`) VALUES
(4, 'james', 'runny', 'street', 'lagos', '12834', '2024-07-26 11:01:47', 'admin2@gmail.com', '0987654333', 'scrypt:32768:8:1$9930iErunfqQ2iqX$c0a5715bedc56bd8948c19496b445ae2e2914531ffab6933c274dee6f915f702186f3eaa66f4b4284b7e52397516e3ac82ed31b8218ac35c4868cd19f1c70728'),
(5, 'jimmy', 'berney', 'street', 'lagos', '12839', '2024-07-26 13:14:30', 'admin3@gmail.com', '0987654323', 'scrypt:32768:8:1$QbQ44xAsmAgbz6Jo$af9cbfbff8829aba9b7a210f81c0d9cb00de9e9a55ccb08400ef162ba9693045da000d5b2d292dd5a5e1729895c8a0165126a9852a37202c9be7980ccede74fe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminreg`
--
ALTER TABLE `adminreg`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_username` (`admin_username`);

--
-- Indexes for table `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indexes for table `balance`
--
ALTER TABLE `balance`
  ADD PRIMARY KEY (`balance_id`),
  ADD KEY `balance_user_id` (`balance_user_id`);

--
-- Indexes for table `check`
--
ALTER TABLE `check`
  ADD PRIMARY KEY (`check_id`),
  ADD KEY `check_user_id` (`check_user_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_user_id` (`trans_user_id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`upload_id`),
  ADD KEY `upload_user_id` (`upload_user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminreg`
--
ALTER TABLE `adminreg`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `balance`
--
ALTER TABLE `balance`
  MODIFY `balance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `check`
--
ALTER TABLE `check`
  MODIFY `check_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `balance`
--
ALTER TABLE `balance`
  ADD CONSTRAINT `balance_ibfk_1` FOREIGN KEY (`balance_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `check`
--
ALTER TABLE `check`
  ADD CONSTRAINT `check_ibfk_1` FOREIGN KEY (`check_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`trans_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `upload_ibfk_1` FOREIGN KEY (`upload_user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
