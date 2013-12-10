-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2013 at 01:30 AM
-- Server version: 5.5.27-log
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `simpleai`
--

-- --------------------------------------------------------

--
-- Table structure for table `analisa`
--

CREATE TABLE IF NOT EXISTS `analisa` (
  `hero_id` int(11) NOT NULL,
  `ciri_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ciri_hero`
--

CREATE TABLE IF NOT EXISTS `ciri_hero` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ciri_id` smallint(6) NOT NULL,
  `hero_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=40 ;

--
-- Dumping data for table `ciri_hero`
--

INSERT INTO `ciri_hero` (`id`, `ciri_id`, `hero_id`) VALUES
(1, 2, 1),
(3, 2, 2),
(4, 6, 2),
(5, 7, 2),
(6, 7, 1),
(7, 10, 1),
(8, 1, 3),
(9, 5, 3),
(10, 6, 3),
(11, 1, 4),
(12, 4, 4),
(13, 2, 5),
(14, 11, 5),
(15, 13, 5),
(16, 1, 6),
(17, 6, 6),
(18, 13, 6),
(19, 3, 7),
(20, 5, 7),
(21, 12, 7),
(22, 2, 8),
(23, 8, 8),
(24, 9, 8),
(25, 1, 10),
(26, 4, 10),
(27, 5, 10),
(28, 6, 10),
(29, 9, 10),
(30, 1, 11),
(31, 5, 11),
(32, 14, 11),
(33, 2, 9),
(34, 8, 9),
(35, 9, 9),
(36, 10, 9),
(37, 15, 9),
(38, 15, 8),
(39, 15, 4);

-- --------------------------------------------------------

--
-- Table structure for table `heroes`
--

CREATE TABLE IF NOT EXISTS `heroes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hero_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `hero_img` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `heroes`
--

INSERT INTO `heroes` (`id`, `hero_name`, `hero_img`, `created_at`, `updated_at`) VALUES
(1, 'Bloodseeker', 'bloodseeker.jpg', '2013-10-08 16:34:55', '2013-10-10 02:45:21'),
(2, 'Juggernaut', 'juggernaut.jpg', '2013-10-08 21:04:53', '2013-10-08 21:04:53'),
(3, 'Chaos Knight', 'chaosknight.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Lifestealer', 'lifestealer.jpg', '2013-10-10 12:44:28', '2013-10-10 12:44:28'),
(5, 'Lone Druid', 'lonedruid.jpg', '2013-10-10 12:44:44', '2013-10-10 12:44:44'),
(6, 'Lycanthrope', 'lycanthrope.jpg', '2013-10-10 12:45:00', '2013-10-10 12:45:00'),
(7, 'Crystal Maiden', 'crystalmaiden.jpg', '2013-10-10 12:45:55', '2013-10-10 12:45:55'),
(8, 'Phantom Lancer', 'phantomlancer.jpg', '2013-10-10 12:46:08', '2013-10-10 12:46:08'),
(9, 'Rikimaru', 'rikimaru.jpg', '2013-10-10 12:46:22', '2013-10-10 12:46:22'),
(10, 'Skeleton King', 'skeletonking.jpg', '2013-10-10 12:46:48', '2013-10-10 12:46:48'),
(11, 'Spirit Breaker', 'spiritbreaker.jpg', '2013-10-10 12:47:02', '2013-10-10 12:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2013_10_07_122047_create_heroes_table', 1),
('2013_10_07_122308_create_traits_table', 1),
('2013_10_07_124903_create_trait_hero_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `traits`
--

CREATE TABLE IF NOT EXISTS `traits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `trait` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `traits`
--

INSERT INTO `traits` (`id`, `trait`, `created_at`, `updated_at`) VALUES
(1, 'Memiliki Primary Attribute Strength', '2013-10-08 21:17:01', '2013-10-09 06:44:09'),
(2, 'Memiliki Primary Atribute Agility', '2013-10-09 03:32:28', '2013-10-09 03:32:28'),
(3, 'Memiliki Primary Attribute Intelligence', '2013-10-09 03:33:38', '2013-10-09 03:33:38'),
(4, 'Memiliki Kemampuan Lifesteal', '2013-10-09 03:34:22', '2013-10-09 03:34:22'),
(5, 'Memiliki Kemampuan untuk melumpuhkan musuh', '2013-10-09 03:35:11', '2013-10-09 03:35:11'),
(6, 'Memiliki Kemampuan Critical Hit', '2013-10-09 03:36:17', '2013-10-09 03:36:17'),
(7, 'Memiliki Kemampuan Penyembuhan', '2013-10-09 03:37:05', '2013-10-09 03:37:05'),
(8, 'Memiliki Kemampuan "Stealth"', '2013-10-09 03:38:11', '2013-10-09 03:38:11'),
(9, 'Memiliki Skill Ultimate Passive', '2013-10-09 03:39:13', '2013-10-09 03:39:13'),
(10, 'Memiliki kemampuan silent', '2013-10-09 04:01:00', '2013-10-09 04:01:00'),
(11, 'Memiliki Armor yang Tinggi', '2013-10-10 04:10:07', '2013-10-10 04:10:07'),
(12, 'Memiliki kemampuan regenerasi mana', '2013-10-10 04:10:21', '2013-10-10 04:10:21'),
(13, 'Memiliki Kemampuan Merubah Bentuk', '2013-10-10 05:49:39', '2013-10-10 05:49:39'),
(14, 'Memiliki Kemampuan Mengubah Kecepatan menjadi Damage', '2013-10-10 05:50:11', '2013-10-10 05:50:11'),
(15, 'Memiliki mekanisme untuk melarikan diri', '2013-10-10 05:59:29', '2013-10-10 05:59:29');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
