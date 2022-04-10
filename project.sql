-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 13, 2017 at 05:09 PM
-- Server version: 5.5.57-0+deb8u1-log
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
`id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_13_111208_create_posts_table', 2),
(4, '2017_08_13_115401_add_user_id_to_posts', 3),
(5, '2017_08_13_124316_add_cover_image_to_posts', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` int(10) unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`, `user_id`, `cover_image`) VALUES
(6, 'Post One', '<p>This is Post One body</p>', '2017-08-13 11:43:14', '2017-08-13 11:43:14', 1, 'noimage.jpg'),
(7, 'Post Two', '<p>This is Post Two body</p>', '2017-08-13 11:48:18', '2017-08-13 11:48:18', 1, '270595_1502632098.jpg'),
(8, 'Post Three', '<p>This is Post Three body</p>', '2017-08-13 11:50:06', '2017-08-13 11:50:06', 1, '850259-math-wallpaper_1502632206.jpg'),
(9, 'Post Four', '<p>This is Post Four body</p>', '2017-08-13 11:50:25', '2017-08-13 11:50:25', 1, '3660259-atoms-wallpapers_1502632225.png'),
(10, 'Post Five', '<p>This is Post Five body</p>', '2017-08-13 11:50:43', '2017-08-13 11:50:43', 1, 'aperture_science_computer_wallpaper_1502632243.png'),
(11, 'Post Six', '<p>This is Post Six body</p>', '2017-08-13 11:50:57', '2017-08-13 11:50:57', 1, 'f59d2763f0efdbe12d481cf8e7fcf3a0_1502632257.jpg'),
(12, 'Post Seven', '<p>This is Post Seven body</p>', '2017-08-13 11:51:13', '2017-08-13 11:51:13', 1, 'gGb8X9A_1502632273.jpg'),
(13, 'Post Eight', '<p>This is Post Eight body</p>', '2017-08-13 11:51:27', '2017-08-13 11:51:27', 1, 'I-Believe-in-Science-agnosticism-38740972-1600-900_1502632287.jpg'),
(14, 'Post Nine', '<p>This is Post Nine body</p>', '2017-08-13 11:51:40', '2017-08-13 11:51:40', 1, 'mathematics_00337060_1502632300.jpg'),
(15, 'Post Ten', '<p>This is Post Ten body</p>', '2017-08-13 11:51:53', '2017-08-13 11:51:53', 1, 'math-wallpaper-8_1502632313.jpg'),
(16, 'Post Eleven', '<p>This is Post Eleven body</p>', '2017-08-13 11:53:40', '2017-08-13 11:53:40', 1, 'pi-day-3-14-22-7-wallpaper-hd-background_1502632420.jpg'),
(18, 'Post Two Edited', '<p>This is Post One body</p>', '2017-08-13 11:55:08', '2017-08-13 11:58:20', 2, 'vpb7Zx_1502632508.jpg'),
(19, 'Post Two', '<p>This is Post One body</p>', '2017-08-13 11:43:14', '2017-08-13 11:55:27', 2, 'noimage.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@test.test', '$2y$10$A73JrdEyckWAoFX2ehMdoeUyMfmj8wTHRDSgsdaBW5wknuNhlzq3O', 'M11AtQOOZzwIKdHyRhpF10ZVsrqNtlvotIpHvTSSbp2SBkvCp7zcvbQGhxWz', '2017-08-13 09:08:28', '2017-08-13 09:08:28'),
(2, 'test2', 'test2@test.test', '$2y$10$oNLO.FXJUzEwHotH6Yuw.uk8Qu8xcbq3yPisUcUCUHw/qDANVkayu', 'qwpliH8Jd4w5tzTAZDohD0OZnkKHAVBjap9MUv1sPBAtkUgpThIsPx7yjJc2', '2017-08-13 10:14:32', '2017-08-13 10:14:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
 ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
