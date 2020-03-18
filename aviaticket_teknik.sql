-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2020 at 03:22 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aviaticket_teknik`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_control`
--

CREATE TABLE `access_control` (
  `id` int(11) NOT NULL,
  `user_level_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `content` text,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_control`
--

INSERT INTO `access_control` (`id`, `user_level_id`, `module_id`, `content`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'a', 1, '2018-10-10 02:28:44', '2018-10-10 02:28:44'),
(2, 1, 2, 'a', 1, '2018-10-10 02:28:44', '2018-10-10 02:28:44'),
(3, 1, 3, 'a', 1, '2018-10-10 02:28:44', '2018-10-10 02:28:44'),
(4, 2, 1, 'a', 1, '2018-10-10 02:28:49', '2018-10-10 02:28:49'),
(5, 2, 2, 'a', 1, '2018-10-10 02:28:49', '2018-10-10 02:28:49'),
(6, 2, 3, 'a', 1, '2018-10-10 02:28:49', '2018-10-10 02:28:49'),
(7, 3, 1, 'v', 1, '2018-10-10 02:28:54', '2018-10-10 02:28:54'),
(8, 3, 2, 'v', 1, '2018-10-10 02:28:54', '2018-10-10 02:28:54'),
(9, 3, 3, 'v', 1, '2018-10-10 02:28:54', '2018-10-10 02:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `assignee`
--

CREATE TABLE `assignee` (
  `id` int(11) NOT NULL,
  `name` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(45) DEFAULT NULL,
  `active` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignee`
--

INSERT INTO `assignee` (`id`, `name`, `created_at`, `updated_at`, `user_modified`, `active`) VALUES
(1, 'donny', '2020-02-05 01:12:26', '2020-02-05 01:12:26', 'donny', 1),
(2, 'effie', '2020-02-05 01:12:31', '2020-02-05 01:12:31', 'donny', 1),
(3, 'nat', '2020-02-05 03:56:50', '2020-02-05 03:56:50', 'donny', 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(45) NOT NULL,
  `active` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_modified` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `active`, `created_at`, `updated_at`, `user_modified`) VALUES
(1, 'Category 1', 1, '2020-02-05 01:25:05', '2020-02-05 01:25:05', 'donny'),
(2, 'Category 2', 1, '2020-02-05 01:25:20', '2020-02-05 01:25:20', 'donny'),
(3, 'Category 3', 1, '2020-02-05 01:25:31', '2020-02-05 01:25:31', 'donny');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `comment` text NOT NULL,
  `type` enum('log','comment') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `attachment` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `username`, `comment`, `type`, `created_at`, `updated_at`, `ticket_id`, `attachment`) VALUES
(1, 'donny', 'Komen', 'comment', '2020-02-05 03:56:02', '2020-02-05 03:56:02', 1, NULL),
(2, 'nat', 'Komen 2', 'comment', '2020-02-05 03:57:57', '2020-02-05 03:57:57', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_library`
--

CREATE TABLE `media_library` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `user_created` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media_library`
--

INSERT INTO `media_library` (`id`, `name`, `type`, `url`, `size`, `user_created`, `created_at`, `updated_at`) VALUES
(0, 'noprofileimage', 'png', 'img/noprofileimage.png', '1159', 1, '2017-05-29 19:56:03', '2017-05-29 19:56:03');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `slug` varchar(20) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `slug`, `active`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'Master User Level', 'users-level', 1, 1, '2017-10-17 07:07:07', '2017-10-17 07:43:43'),
(2, 'Master User', 'users-user', 1, 1, '2017-10-17 07:16:51', '2017-10-17 07:49:30'),
(3, 'Media Library', 'media-library', 1, 1, '2017-10-17 07:19:28', '2018-06-03 05:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `value` text,
  `user_modified` varchar(30) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'web_title', 'AVIA Ticket (TEKNIK)', 'Donny', '2017-06-13 00:27:16', '2020-02-04 08:41:36'),
(2, 'logo', 'img/logo.png', '1', '2017-06-13 00:27:16', '2018-06-03 05:58:24'),
(3, 'email_admin', 'admin@admin.com', 'Oei Donny', '2017-06-13 00:27:16', '2019-08-02 02:18:38'),
(4, 'web_description', '', 'Donny', '2017-07-23 23:56:28', '2020-02-04 08:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `attachment_1` varchar(100) DEFAULT NULL,
  `attachment_2` varchar(100) DEFAULT NULL,
  `attachment_3` varchar(100) DEFAULT NULL,
  `prioritas` varchar(45) DEFAULT NULL,
  `start` date DEFAULT NULL,
  `assignee` varchar(50) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_jawab` varchar(50) DEFAULT NULL,
  `user_modified` varchar(50) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `user_created` varchar(50) DEFAULT NULL,
  `active` int(1) NOT NULL,
  `no_ticket` varchar(45) DEFAULT NULL,
  `user_request_close` varchar(45) DEFAULT NULL,
  `request_close_date` datetime DEFAULT NULL,
  `user_close` varchar(45) DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `reldag` varchar(45) DEFAULT NULL,
  `SPK` varchar(45) DEFAULT NULL,
  `FACode` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `judul`, `keterangan`, `attachment_1`, `attachment_2`, `attachment_3`, `prioritas`, `start`, `assignee`, `category_id`, `created_at`, `updated_at`, `user_jawab`, `user_modified`, `status`, `user_created`, `active`, `no_ticket`, `user_request_close`, `request_close_date`, `user_close`, `close_date`, `reldag`, `SPK`, `FACode`) VALUES
(1, 'Tes Ticket Teknik', 'Deskripsi Tiket', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-05 03:39:15', '2020-02-05 03:39:15', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00001', NULL, NULL, NULL, NULL, 'donny', NULL, NULL),
(2, 'Tes Ticket Teknik', 'Tes Ticket Teknik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-06 03:28:39', '2020-02-06 03:28:39', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00002', NULL, NULL, NULL, NULL, 'donny', NULL, NULL),
(3, 'Tes Ticket Teknik', 'Tes Ticket Teknik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-06 03:30:41', '2020-02-06 03:30:41', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00003', NULL, NULL, NULL, NULL, 'donny', '00015', NULL),
(4, 'Tes Ticket Teknik', 'Tes Ticket Teknik', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-17 08:08:44', '2020-02-17 08:08:44', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00004', NULL, NULL, NULL, NULL, 'donny', NULL, 'PV00567'),
(5, 'Ngetes multiple Ticket', 'Tes multiple ticket email', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-17 08:56:56', '2020-02-17 08:56:56', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00005', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00001'),
(6, 'Tes Ticket Try Catch', 'Tes Ticket Try Catch', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-20 01:35:06', '2020-02-20 01:35:06', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00006', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00005'),
(7, 'Tes Ticket Teknik', 'Tes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 09:11:30', '2020-02-28 09:11:30', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00007', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00006'),
(8, 'New Ticket Tes', 'Ticket Tes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 09:16:04', '2020-02-28 09:16:04', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00008', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00016'),
(9, 'Tes', 'AAA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 09:23:47', '2020-02-28 09:23:47', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00009', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00016'),
(10, 'Ngetes Ngetes Ticket', 'Ngetes Ticket', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 09:28:01', '2020-02-28 09:28:01', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00010', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00009'),
(11, 'Etes Etes', 'Etes Etes Etes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 09:35:22', '2020-02-28 09:35:22', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00011', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00019'),
(12, 'Etes', 'Etes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-02-28 09:36:10', '2020-02-28 09:36:10', NULL, 'donny', 1, 'donny', 1, 'donny-2002-00012', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00006'),
(13, 'New Ticket', 'Ngetes Ticket email baru', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-02 06:14:13', '2020-03-02 06:14:13', NULL, 'donny', 1, 'donny', 1, 'donny-2003-00001', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00006'),
(14, 'Tes Ticket Teknik', 'Tes Ticket', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-02 06:17:16', '2020-03-02 06:17:16', NULL, 'donny', 1, 'donny', 1, 'donny-2003-00002', NULL, NULL, NULL, NULL, 'donny', NULL, 'PREIT00001'),
(15, 'Ngetes Ticket', 'OTHERS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-02 07:59:50', '2020-03-02 07:59:50', NULL, 'donny', 1, 'donny', 1, 'donny-2003-00003', NULL, NULL, NULL, NULL, 'donny', NULL, 'OTHERS-RND');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_level_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `avatar_id` int(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` text,
  `phone` text,
  `gender` enum('male','female','other') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` int(1) NOT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `last_activity` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_level_id`, `firstname`, `lastname`, `avatar_id`, `email`, `address`, `phone`, `gender`, `birthdate`, `username`, `password`, `active`, `user_modified`, `last_activity`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super', 'Admin', 0, 'superadmin@admin.com', 'Jl Madura xxxxxxx', '08383xxxxxxx', 'male', '1986-07-25', 'superadmin', '$2y$10$TkX/dDYrtvIEXidPOag5T.V8qbyluUHJg5ssBjKe6WlVqpItuN8uy', 1, 1, '2019-01-03 03:54:50', '2017-03-13 20:51:35', '2019-01-03 03:54:50'),
(2, 2, 'Admin', 'Admin', 0, 'admin@admin.com', NULL, NULL, 'male', NULL, 'admin', '$2y$10$PQaUY4b0YsSo5qAuK8Cc.OB.WeEJHrJJ0FDgk6YE9xhXboVRou3We', 1, 1, '2019-01-02 03:17:02', '2017-04-19 14:29:01', '2019-01-02 03:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_levels`
--

CREATE TABLE `user_levels` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `active` int(1) DEFAULT NULL,
  `user_modified` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_levels`
--

INSERT INTO `user_levels` (`id`, `name`, `active`, `user_modified`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 1, 1, '2017-06-28 06:18:17', '2017-06-28 06:18:17'),
(2, 'Admin', 1, 1, '2018-06-02 15:59:51', '2018-06-02 15:59:51'),
(3, 'User', 1, 1, '2018-06-03 04:19:49', '2018-06-03 04:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `user_ticket`
--

CREATE TABLE `user_ticket` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text,
  `reldag` varchar(45) DEFAULT NULL,
  `tipe` varchar(10) DEFAULT NULL,
  `user_level` varchar(15) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_modified` varchar(15) NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `email_kabag` varchar(100) DEFAULT NULL,
  `no_HP` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_ticket`
--

INSERT INTO `user_ticket` (`id`, `username`, `password`, `reldag`, `tipe`, `user_level`, `name`, `email`, `created_at`, `updated_at`, `user_modified`, `last_activity`, `area`, `email_kabag`, `no_HP`) VALUES
(1, 'donny', '', 'donny', 'AD', 'USER', 'Donny', 'it_2@avianbrands.com', '2019-09-06 08:17:44', '2020-03-02 06:11:24', 'donny', '2020-03-02 13:11:24', NULL, 'donny@avian.com', '081339999297'),
(2, 'adi', '', 'adi', 'AD', 'VSUPER', 'Adi', 'it_1@avianbrands.com', '2019-09-06 08:21:59', '2020-01-17 00:28:00', 'donny', '2020-01-17 07:28:00', NULL, NULL, NULL),
(3, 'ysa', '', 'ysa', 'AD', 'VSUPER', 'Yenny', 'it_5@avianbrands.com', '2019-09-06 08:22:13', '2020-01-29 03:13:18', 'donny', '2020-01-29 10:13:18', '', NULL, NULL),
(4, 'effie', NULL, 'effie', 'AD', 'VSUPER', 'Effie', 'it_3@avianbrands.com', '2020-02-05 01:07:46', '2020-02-05 01:07:57', 'donny', NULL, NULL, NULL, NULL),
(5, 'nat', NULL, 'nat', 'AD', 'VADM', 'Natalia', 'it_4@avianbrands.com', '2020-02-05 03:56:44', '2020-02-05 03:59:00', 'donny', '2020-02-05 10:58:35', NULL, NULL, NULL),
(6, 'ozkadon', 'e807f1fcf82d132f9bb018ca6738a19f', 'ozkadon', 'AGEN', 'USER', 'Oei Donny', 'it_2@avianbrands.com', '2020-02-06 04:07:28', '2020-02-28 08:36:46', 'donny', '2020-02-06 15:37:07', NULL, 'it_5@avianbrands.com', '083837777297');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_control`
--
ALTER TABLE `access_control`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignee`
--
ALTER TABLE `assignee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_library`
--
ALTER TABLE `media_library`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_ticket`
--
ALTER TABLE `user_ticket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_control`
--
ALTER TABLE `access_control`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `assignee`
--
ALTER TABLE `assignee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media_library`
--
ALTER TABLE `media_library`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_ticket`
--
ALTER TABLE `user_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
