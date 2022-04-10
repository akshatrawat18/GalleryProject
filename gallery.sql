-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 16, 2017 at 07:36 PM
-- Server version: 5.5.57-0+deb8u1-log
-- PHP Version: 5.6.30-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gallery`
--

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE IF NOT EXISTS `galleries` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `description`, `cover_image`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'First Gallery', 'This is the description of the first gallery', '270595_1502892298.jpg', 1, '2017-08-16 12:04:58', '2017-08-16 12:04:58'),
(7, 'Second Gallery', 'This is the description of the second gallery', '850259-math-wallpaper_1502892320.jpg', 1, '2017-08-16 12:05:20', '2017-08-16 12:05:20'),
(8, 'Third Gallery', 'This is the description of the third gallery', '1712304_1502892341.png', 1, '2017-08-16 12:05:41', '2017-08-16 12:05:41'),
(9, 'Fourth Gallery', 'This is the description of the fourth gallery', '3660259-atoms-wallpapers_1502892361.png', 1, '2017-08-16 12:06:01', '2017-08-16 12:06:01'),
(10, 'Fifth Gallery', 'This is the description of the fifth gallery', 'aperture_science_computer_wallpaper_1502892386.png', 1, '2017-08-16 12:06:26', '2017-08-16 12:06:26'),
(11, 'Gallery Six', 'This is the description of gallery six', 'f59d2763f0efdbe12d481cf8e7fcf3a0_1502892540.jpg', 1, '2017-08-16 12:09:00', '2017-08-16 12:09:00'),
(12, 'Gallery Seven', 'This is the description of gallery seven', 'gGb8X9A_1502892567.jpg', 1, '2017-08-16 12:09:27', '2017-08-16 12:09:27'),
(13, 'Gallery Eight', 'This is the description of gallery eight', 'I-Believe-in-Science-agnosticism-38740972-1600-900_1502894683.jpg', 1, '2017-08-16 12:44:43', '2017-08-16 12:44:43'),
(14, 'Gallery Nine', 'This is the description of gallery nine', 'mathematics_00337060_1502894707.jpg', 1, '2017-08-16 12:45:07', '2017-08-16 12:45:07'),
(15, 'Gallery 10', 'This is the description of gallery 10', 'math-wallpaper-8_1502894794.jpg', 1, '2017-08-16 12:46:34', '2017-08-16 12:46:34'),
(16, 'Gallery 11', 'This is the description of gallery 11', 'pi-day-3-14-22-7-wallpaper-hd-background_1502894858.jpg', 1, '2017-08-16 12:47:38', '2017-08-16 12:47:38'),
(17, 'Gallery 12', '', '270595_1502894878.jpg', 1, '2017-08-16 12:47:58', '2017-08-16 12:47:58'),
(18, 'Gallery 13', 'This is the description of gallery 13', '3660259-atoms-wallpapers_1502894897.png', 1, '2017-08-16 12:48:17', '2017-08-16 12:48:17'),
(19, 'Hello There', '', 'f59d2763f0efdbe12d481cf8e7fcf3a0_1502894929.jpg', 1, '2017-08-16 12:48:49', '2017-08-16 12:48:49'),
(20, 'Hello Again', '', 'mathematics_00337060_1502894943.jpg', 1, '2017-08-16 12:49:03', '2017-08-16 12:49:03'),
(21, 'Private', '', 'f59d2763f0efdbe12d481cf8e7fcf3a0_1502894957.jpg', 1, '2017-08-16 12:49:17', '2017-08-16 12:49:17'),
(22, 'Family', '', 'pi-day-3-14-22-7-wallpaper-hd-background_1502894987.jpg', 1, '2017-08-16 12:49:47', '2017-08-16 12:49:47'),
(23, 'New', '', '3660259-atoms-wallpapers_1502895006.png', 1, '2017-08-16 12:50:06', '2017-08-16 12:50:06'),
(24, 'Friends', '', 'aperture_science_computer_wallpaper_1502895017.png', 1, '2017-08-16 12:50:17', '2017-08-16 12:50:17'),
(25, 'College', '', '850259-math-wallpaper_1502895029.jpg', 1, '2017-08-16 12:50:29', '2017-08-16 12:50:29'),
(26, 'School', '', 'f59d2763f0efdbe12d481cf8e7fcf3a0_1502895049.jpg', 1, '2017-08-16 12:50:49', '2017-08-16 12:50:49'),
(27, 'The new gallery', 'this is the new gallery', 'gGb8X9A_1502896575.jpg', 1, '2017-08-16 13:16:15', '2017-08-16 13:16:15'),
(28, 'Test Gallery', 'This is the test gallery', 'aperture_science_computer_wallpaper_1502896841.png', 1, '2017-08-16 13:20:41', '2017-08-16 13:20:41');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
`id` int(10) unsigned NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_08_15_232504_create_galleries_table', 1),
(4, '2017_08_15_232520_create_photos_table', 1);

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
-- Table structure for table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
`id` int(10) unsigned NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `description`, `image`, `gallery_name`, `gallery_id`, `created_at`, `updated_at`) VALUES
(8, 'This is image one', 'math-wallpaper-8_1502895295.jpg', 'First Gallery', 6, '2017-08-16 12:54:55', '2017-08-16 12:54:55'),
(9, '', 'f59d2763f0efdbe12d481cf8e7fcf3a0_1502895407.jpg', 'First Gallery', 6, '2017-08-16 12:56:47', '2017-08-16 12:56:47'),
(10, '', 'vpb7Zx_1502895419.jpg', 'First Gallery', 6, '2017-08-16 12:56:59', '2017-08-16 12:56:59'),
(11, '', 'gGb8X9A_1502895429.jpg', 'First Gallery', 6, '2017-08-16 12:57:09', '2017-08-16 12:57:09'),
(12, '', 'f59d2763f0efdbe12d481cf8e7fcf3a0_1502895440.jpg', 'First Gallery', 6, '2017-08-16 12:57:20', '2017-08-16 12:57:20'),
(13, '', 'mathematics_00337060_1502895571.jpg', 'First Gallery', 6, '2017-08-16 12:59:31', '2017-08-16 12:59:31'),
(14, '', '3660259-atoms-wallpapers_1502895582.png', 'First Gallery', 6, '2017-08-16 12:59:42', '2017-08-16 12:59:42'),
(15, '', '1712304_1502895592.png', 'First Gallery', 6, '2017-08-16 12:59:52', '2017-08-16 12:59:52'),
(16, '', '3660259-atoms-wallpapers_1502895606.png', 'First Gallery', 6, '2017-08-16 13:00:06', '2017-08-16 13:00:06'),
(17, '', 'aperture_science_computer_wallpaper_1502895627.png', 'First Gallery', 6, '2017-08-16 13:00:27', '2017-08-16 13:00:27'),
(18, '', 'math-wallpaper-8_1502895641.jpg', 'First Gallery', 6, '2017-08-16 13:00:41', '2017-08-16 13:00:41'),
(19, '', 'gGb8X9A_1502895654.jpg', 'First Gallery', 6, '2017-08-16 13:00:54', '2017-08-16 13:00:54'),
(20, '', '3660259-atoms-wallpapers_1502895667.png', 'First Gallery', 6, '2017-08-16 13:01:07', '2017-08-16 13:01:07'),
(21, '', 'mathematics_00337060_1502896161.jpg', 'Second Gallery', 7, '2017-08-16 13:09:00', '2017-08-16 13:09:34'),
(22, 'This is the new image', '1712304_1502896618.png', 'New', 23, '2017-08-16 13:16:58', '2017-08-16 13:16:58');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@test.test', '$2y$10$HlhVT7Z9BXkKl6zciXHN3.vQPttChH48Z8HB/0kWDrprz86MEB/rq', 'k0NLKZqOUbOcfxii0AI0D4e4okcMtFFLLtUshUzkiBsyPQ5GZESnl7bdxKiZ', '2017-08-16 02:27:02', '2017-08-16 02:27:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
 ADD PRIMARY KEY (`id`);

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
-- Indexes for table `photos`
--
ALTER TABLE `photos`
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
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
