-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2013 at 04:32 PM
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

--
-- Dumping data for table `analisa`
--

INSERT INTO `analisa` (`hero_id`, `ciri_id`) VALUES
(3, 5),
(3, 6),
(4, 4),
(6, 6),
(6, 13),
(10, 4),
(10, 5),
(10, 6),
(10, 9),
(11, 5),
(11, 14),
(4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `analisa_hasil`
--

CREATE TABLE IF NOT EXISTS `analisa_hasil` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_konsul` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `kode_penyakit` char(4) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `analisa_hasil`
--

INSERT INTO `analisa_hasil` (`id`, `id_konsul`, `nama`, `kelamin`, `alamat`, `pekerjaan`, `kode_penyakit`, `tanggal`) VALUES
(1, 1, 'Ilham', 'P', 'Jl. Gajah Mada', 'Petani', '2', '2010-01-11 09:46:23'),
(2, 4, 'ihi', 'P', 'kuhhih', 'ghujhj', '1', '2010-01-11 15:24:18'),
(3, 8, 'Dona', 'P', 'palemban', 'asfdasdas', '2', '2010-01-11 15:44:04'),
(4, 9, 'rere', 'P', 'asdsa', 'asdas', '2', '2010-01-11 15:47:13'),
(5, 10, 'sad', 'P', 'asdsa', 'dsadsa', '2', '2010-01-11 15:50:48'),
(6, 11, 'cuit', 'W', 'saS', 'SAS', '2', '2010-01-11 22:56:38'),
(7, 12, 'tes', 'P', 'dgf', 'vvb', '2', '2010-01-11 22:58:13'),
(8, 13, 'xcv', 'P', 'vx', 'vcxv', '2', '2010-01-11 23:02:46'),
(9, 14, 'weeee', 'P', 'cccccccc', 'vvvvvvvvvv', '2', '2010-01-13 20:15:17'),
(10, 15, 'fghg', 'P', 'gfdgfhy', 'gdfyt', '1', '2010-01-13 20:20:12'),
(11, 16, 'fdgf', 'P', 'trt', 'tyet', '5', '2010-01-13 20:24:34'),
(12, 17, 'hnmkj', 'P', 'tryk', 'rhymj', '1', '2010-01-13 20:34:57'),
(13, 18, 'dgty', 'P', 'fgg', 'g', '2', '2010-01-13 20:36:51'),
(14, 20, 'asdfasfda', 'P', 'sfasdfsfdasfdas', 'asdfasfd', '2', '2010-01-13 22:49:12'),
(15, 21, 'dfasd', 'P', 'asdfdf', 'asdfasf', '10', '2010-01-13 22:57:55');

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
-- Table structure for table `pakar`
--

CREATE TABLE IF NOT EXISTS `pakar` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pakar`
--

INSERT INTO `pakar` (`username`, `password`) VALUES
('eci', '1111'),
('dewi', '2222');

-- --------------------------------------------------------

--
-- Table structure for table `tbsaran`
--

CREATE TABLE IF NOT EXISTS `tbsaran` (
  `no` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `saran` varchar(100) NOT NULL,
  `kritik` varchar(100) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `tbsaran`
--

INSERT INTO `tbsaran` (`no`, `nama`, `email`, `saran`, `kritik`) VALUES
(1, 'cuit', 'ecicuitt@yahoo.com', 'bagusss......', 'katek.........'),
(2, 'jfhsdjd', 'ecicuitt@yahoo.com', 'sdfs', 'kdsjfkds'),
(3, 'sadada', 'dewi@yahoo.com', 'csacsacsa', 'dddasdad'),
(4, 'rabu', 'ecicuitt@yahoo.com', 'fnjksdjfllllll', 'jgkfdjglfd'),
(5, 'dewi', 'ecicuitt@yahoo.com', 'dsnfksa', 'jdfkjl;kg;rlhlllllllllllll'),
(6, 'esgfd', 'ecicuitt@yahoo.com', 'fdkngkdjg', 'jgjklfdh'),
(7, 'jdnskd', 'ecicuitt@yahoo.com', ',dsmfks', 'mkdsmvld'),
(8, 'dvsfh', 'ecicuitt@yahoo.com', 'bfjh', 'fsdfs'),
(9, 'renrk', 'ecicuitt@yahoo.com', 'nkvnsk', 'fklwe'),
(10, 'bjll;l;;l,m', 'ecicuitt@yahoo.com', 'dgfh', 'gmnk,m'),
(11, 'ghg', 'ecicuitt@yahoo.com', 'dggggggggggg', 'ffffffffffffff'),
(12, 'aaaaaaaaaaa', 'ecicuitt@yahoo.com', 'dsdddddddddddddddddddd', 'rrrrrrrrrrrrrrrrrrrrr'),
(13, 'bbbbbbbbbb', 'ecicuitt@yahoo.com', 'ddddddddddddddd', 'dddddddddddddddd'),
(14, 'hdjshd', 'ecicuitt@yahoo.com', 'nfdsm', 'md,sf');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_jawab`
--

CREATE TABLE IF NOT EXISTS `tmp_jawab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_konsul` int(11) NOT NULL,
  `kode_gejala` int(11) NOT NULL,
  `jawaban` enum('YA','TIDAK') NOT NULL,
  `intime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Dumping data for table `tmp_jawab`
--

INSERT INTO `tmp_jawab` (`id`, `id_konsul`, `kode_gejala`, `jawaban`, `intime`) VALUES
(1, 10, 1, 'YA', '2010-01-11 15:50:48'),
(2, 10, 2, 'TIDAK', '2010-01-11 15:50:52'),
(3, 10, 3, 'TIDAK', '2010-01-11 15:51:03'),
(4, 10, 4, 'TIDAK', '2010-01-11 15:51:07'),
(5, 10, 5, 'TIDAK', '2010-01-11 15:51:11'),
(6, 10, 6, 'TIDAK', '2010-01-11 15:51:14'),
(7, 10, 7, 'TIDAK', '2010-01-11 15:51:17'),
(8, 10, 8, 'YA', '2010-01-11 15:51:24'),
(9, 10, 3, 'TIDAK', '2010-01-11 15:51:35'),
(10, 10, 4, 'YA', '2010-01-11 15:51:37'),
(11, 11, 1, 'YA', '2010-01-11 22:56:38'),
(12, 11, 2, 'YA', '2010-01-11 22:56:40'),
(13, 11, 6, 'YA', '2010-01-11 22:56:41'),
(14, 12, 1, 'YA', '2010-01-11 22:58:13'),
(15, 12, 2, 'YA', '2010-01-11 22:58:14'),
(16, 12, 6, 'TIDAK', '2010-01-11 22:58:17'),
(17, 12, 7, 'YA', '2010-01-11 22:58:20'),
(18, 13, 1, 'YA', '2010-01-11 23:02:46'),
(19, 13, 2, 'YA', '2010-01-11 23:02:48'),
(20, 13, 6, 'YA', '2010-01-11 23:02:49'),
(21, 14, 1, 'YA', '2010-01-13 20:15:17'),
(22, 14, 2, 'YA', '2010-01-13 20:16:13'),
(23, 14, 6, 'TIDAK', '2010-01-13 20:16:17'),
(24, 14, 7, 'TIDAK', '2010-01-13 20:16:20'),
(25, 14, 8, 'TIDAK', '2010-01-13 20:16:26'),
(26, 14, 7, 'TIDAK', '2010-01-13 20:16:56'),
(27, 14, 8, 'YA', '2010-01-13 20:17:24'),
(28, 15, 1, 'TIDAK', '2010-01-13 20:20:10'),
(29, 15, 2, 'YA', '2010-01-13 20:20:12'),
(30, 15, 6, 'YA', '2010-01-13 20:20:53'),
(31, 15, 2, 'YA', '2010-01-13 20:20:55'),
(32, 15, 6, 'YA', '2010-01-13 20:20:56'),
(33, 15, 2, 'YA', '2010-01-13 20:20:57'),
(34, 15, 6, 'TIDAK', '2010-01-13 20:21:01'),
(35, 15, 7, 'YA', '2010-01-13 20:21:02'),
(36, 16, 1, 'TIDAK', '2010-01-13 20:21:51'),
(37, 16, 2, 'TIDAK', '2010-01-13 20:21:55'),
(38, 16, 3, 'TIDAK', '2010-01-13 20:21:59'),
(39, 16, 4, 'TIDAK', '2010-01-13 20:22:13'),
(40, 16, 5, 'TIDAK', '2010-01-13 20:22:17'),
(41, 16, 6, 'TIDAK', '2010-01-13 20:22:30'),
(42, 16, 7, 'TIDAK', '2010-01-13 20:22:33'),
(43, 16, 8, 'TIDAK', '2010-01-13 20:22:37'),
(44, 16, 9, 'TIDAK', '2010-01-13 20:22:49'),
(45, 16, 10, 'TIDAK', '2010-01-13 20:22:52'),
(46, 16, 11, 'TIDAK', '2010-01-13 20:22:56'),
(47, 16, 12, 'TIDAK', '2010-01-13 20:23:23'),
(48, 16, 13, 'TIDAK', '2010-01-13 20:23:26'),
(49, 16, 14, 'TIDAK', '2010-01-13 20:23:30'),
(50, 16, 15, 'TIDAK', '2010-01-13 20:23:46'),
(51, 16, 16, 'TIDAK', '2010-01-13 20:23:49'),
(52, 16, 17, 'TIDAK', '2010-01-13 20:23:53'),
(53, 16, 18, 'TIDAK', '2010-01-13 20:23:56'),
(54, 16, 19, 'TIDAK', '2010-01-13 20:24:07'),
(55, 16, 20, 'TIDAK', '2010-01-13 20:24:10'),
(56, 16, 21, 'TIDAK', '2010-01-13 20:24:13'),
(57, 16, 22, 'YA', '2010-01-13 20:24:34'),
(58, 16, 2, 'YA', '2010-01-13 20:24:37'),
(59, 16, 22, 'YA', '2010-01-13 20:24:44'),
(60, 16, 2, 'YA', '2010-01-13 20:25:06'),
(61, 16, 6, 'YA', '2010-01-13 20:25:38'),
(62, 17, 1, 'TIDAK', '2010-01-13 20:34:43'),
(63, 17, 2, 'TIDAK', '2010-01-13 20:34:45'),
(64, 17, 3, 'TIDAK', '2010-01-13 20:34:48'),
(65, 17, 4, 'TIDAK', '2010-01-13 20:34:52'),
(66, 17, 5, 'TIDAK', '2010-01-13 20:34:55'),
(67, 17, 6, 'YA', '2010-01-13 20:34:57'),
(68, 17, 2, 'YA', '2010-01-13 20:36:01'),
(69, 17, 6, 'YA', '2010-01-13 20:36:03'),
(70, 17, 2, 'YA', '2010-01-13 20:36:04'),
(71, 17, 6, 'YA', '2010-01-13 20:36:05'),
(72, 17, 2, 'YA', '2010-01-13 20:36:06'),
(73, 17, 6, 'YA', '2010-01-13 20:36:07'),
(74, 17, 2, 'TIDAK', '2010-01-13 20:36:10'),
(75, 17, 3, 'YA', '2010-01-13 20:36:16'),
(76, 18, 1, 'YA', '2010-01-13 20:36:51'),
(77, 18, 2, 'TIDAK', '2010-01-13 20:36:54'),
(78, 18, 3, 'TIDAK', '2010-01-13 20:37:00'),
(79, 18, 4, 'TIDAK', '2010-01-13 20:37:06'),
(80, 18, 5, 'TIDAK', '2010-01-13 20:37:09'),
(81, 18, 6, 'TIDAK', '2010-01-13 20:37:13'),
(82, 18, 7, 'YA', '2010-01-13 20:37:15'),
(83, 18, 1, 'YA', '2010-01-13 20:37:31'),
(84, 18, 2, 'YA', '2010-01-13 20:37:34'),
(85, 20, 1, 'YA', '2010-01-13 22:49:12'),
(86, 20, 2, 'YA', '2010-01-13 22:49:16'),
(87, 20, 6, 'YA', '2010-01-13 22:49:19'),
(88, 21, 1, 'TIDAK', '2010-01-13 22:57:45'),
(89, 21, 2, 'TIDAK', '2010-01-13 22:57:49'),
(90, 21, 3, 'YA', '2010-01-13 22:57:55'),
(91, 21, 1, 'TIDAK', '2010-01-13 22:57:59'),
(92, 21, 2, 'TIDAK', '2010-01-13 22:58:02'),
(93, 21, 3, 'TIDAK', '2010-01-13 22:58:06'),
(94, 21, 4, 'YA', '2010-01-13 22:58:07'),
(95, 21, 1, 'TIDAK', '2010-01-13 22:58:19'),
(96, 21, 2, 'TIDAK', '2010-01-13 22:58:22'),
(97, 21, 3, 'TIDAK', '2010-01-13 22:58:28'),
(98, 21, 4, 'YA', '2010-01-13 22:58:30'),
(99, 21, 1, 'YA', '2010-01-13 22:58:32');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_pasien`
--

CREATE TABLE IF NOT EXISTS `tmp_pasien` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `tmp_pasien`
--

INSERT INTO `tmp_pasien` (`id`, `nama`, `kelamin`, `alamat`, `pekerjaan`, `tanggal`) VALUES
(1, 'Ilham', 'P', 'Jl. Gajah Mada', 'Petani', '2010-01-11 09:46:19'),
(2, 'fdas', 'P', 'asdasd', 'asdsad', '2010-01-11 09:48:00'),
(3, 'sadc', 'P', 'sadas', 'sadsa', '2010-01-11 09:49:11'),
(4, 'ihi', 'P', 'kuhhih', 'ghujhj', '2010-01-11 15:24:04'),
(5, 'khih', 'P', 'kjbjkk', 'kjlojoij', '2010-01-11 15:25:46'),
(6, 'jhjkkhjkhjk', 'P', 'nhjklnhjk', 'jkhjkhk', '2010-01-11 15:26:28'),
(7, 'jbkj', 'P', 'jkhnkj', 'hjlhjoki', '2010-01-11 15:27:02'),
(8, 'Dona', 'P', 'palemban', 'asfdasdas', '2010-01-11 15:41:51'),
(9, 'rere', 'P', 'asdsa', 'asdas', '2010-01-11 15:47:09'),
(10, 'sad', 'P', 'asdsa', 'dsadsa', '2010-01-11 15:50:44'),
(11, 'cuit', 'W', 'saS', 'SAS', '2010-01-11 22:56:33'),
(12, 'tes', 'P', 'dgf', 'vvb', '2010-01-11 22:58:09'),
(13, 'xcv', 'P', 'vx', 'vcxv', '2010-01-11 23:02:43'),
(14, 'weeee', 'P', 'cccccccc', 'vvvvvvvvvv', '2010-01-13 20:15:04'),
(15, 'fghg', 'P', 'gfdgfhy', 'gdfyt', '2010-01-13 20:19:13'),
(16, 'fdgf', 'P', 'trt', 'tyet', '2010-01-13 20:21:37'),
(17, 'hnmkj', 'P', 'tryk', 'rhymj', '2010-01-13 20:34:21'),
(18, 'dgty', 'P', 'fgg', 'g', '2010-01-13 20:36:34'),
(19, 'hgj1', 'P', 'gh', 'rfgj', '2010-01-13 20:38:14'),
(20, 'asdfasfda', 'P', 'sfasdfsfdasfdas', 'asdfasfd', '2010-01-13 22:48:54'),
(21, 'dfasd', 'P', 'asdfdf', 'asdfasf', '2010-01-13 22:51:00'),
(22, 'test', 'P', '1', '1', '2013-10-07 08:24:47'),
(23, 'test', 'P', '1', '1', '2013-10-07 08:25:31'),
(24, 'test', 'P', '1', '1', '2013-10-07 08:26:28');

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

-- --------------------------------------------------------

--
-- Table structure for table `t_gejala`
--

CREATE TABLE IF NOT EXISTS `t_gejala` (
  `kode_gejala` int(4) NOT NULL AUTO_INCREMENT,
  `gejala` varchar(100) NOT NULL,
  PRIMARY KEY (`kode_gejala`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `t_gejala`
--

INSERT INTO `t_gejala` (`kode_gejala`, `gejala`) VALUES
(1, 'Timbul bintik-bintik bulat\r\n'),
(2, 'Gatal'),
(3, 'Demam ringan'),
(4, 'Bercak kecoklatan'),
(5, 'Mula-mula berupa komedo'),
(6, 'Bercak putih\r\n'),
(7, 'Bintik putih berisi massa seperti nasi'),
(8, 'nyeri/berdenyut-denyut'),
(9, 'Lesu\r\n'),
(10, 'kelopak mata bengkak dan sukar dibuka'),
(11, 'Anoreksia'),
(12, 'Ditutupi sisik halus'),
(13, 'Luka-luka kecil\r\n'),
(14, 'Terdapat fistel'),
(15, 'Mengering dan menjadi krusta'),
(16, 'Radang kemerahan'),
(17, 'Skuamasi (cekungan pada kulit)'),
(18, 'Hiperpigmentasi (kelebihan pigmen)'),
(19, 'kesemutan'),
(20, 'Tidak gatal'),
(21, 'Pelebaran pembuluh darah'),
(22, 'Badan berbau busuk'),
(23, 'Nyeri otot'),
(24, 'Eritema'),
(25, 'Pembengkakan'),
(26, 'Terlihat vesikula yang menyerupai titik embun'),
(27, 'Panas'),
(28, 'Benjolan merah yang membesar'),
(29, 'Benjolan berisi nanah setelah beberapa hari'),
(30, 'Permukaan kasar'),
(31, 'Timbul benjolan'),
(32, 'Malaise (rasa tidak enak badan)');

-- --------------------------------------------------------

--
-- Table structure for table `t_penyakit`
--

CREATE TABLE IF NOT EXISTS `t_penyakit` (
  `kode_penyakit` int(4) NOT NULL AUTO_INCREMENT,
  `penyakit` varchar(60) NOT NULL,
  `solusi` text NOT NULL,
  PRIMARY KEY (`kode_penyakit`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `t_penyakit`
--

INSERT INTO `t_penyakit` (`kode_penyakit`, `penyakit`, `solusi`) VALUES
(1, 'Tinea Verikolor(Panu)', 'Salep Whitfield/larutan natrium tiosulfur 20% dioleskan setiap hari. obat-obat anti jamur, misal : golongan imidazol (ekonazol, tolsiktat).salep salisil sulfur (salep 2/4), salisil spiritus, tiosulfatnatrikus (25%). Obat-obat baru seperti\r\nselenium sulfida 2% dalam shampo, derivatimidasol seperti ketokonasol, isokonasol, toksilat dalam bentuk krim atau larutan dengan konsentrasi 1-2%.'),
(2, 'Impertigo Krustosa', 'menjaga kebersihan kulit dengan mandi pakai sabun 2 kali sehari. jika kusta banyak dilepaskan dengan H2O2 atau diberi salep antibiotik seperti kloramfenikol 2% dan teramisin 3%.'),
(3, 'Lupus Eritematosus Diskoid', 'Preparat kortikosteroid seperti hidrokortison 1-2%. '),
(4, 'Keratosis Seboroika', 'Bedah listrik : elektro koagulasi. Bedah beku : N20. Bedah Kimia dengan triklora setat 50%.  '),
(5, 'Pemfigus Foliaseus', 'Kortikosteroid, misal : prednison 60-120mg/hari, antibiotik, deksametason.'),
(6, 'Moluskus Kontagiosum', 'Mengeluarkan massa yang mengandung moluskus dengan alat seperti eks traktor komedo atau dengan elektrokauterisasi (bedah beku).'),
(7, 'Dermatitis Solaris', 'Menghindari panas matahari yang terik, memberikan krim tabir matahari (sunscreen), diberikan preparat kotikosteroid topikal seperti krim hidrokortison 1-2%.'),
(8, 'Miliaria (Keringat Buntet)', 'Jangan Minum alkohol, makanan pedas, bedak kocok yang bersifat mendinginkan mengandung bahan antipruritus seperti bedak salisil 2%,'),
(9, 'Ektima', 'Salep kloramfenikol 2% antibiotik sistemik penisilin 600000-1,5 juta.\r\n'),
(10, 'Selulitis', 'Penisilin dosis tinggi 1,2-2,4 juta unit selama 14-21 hari. antibiotik seperti golongan sefalos porin. kompres dengan antiseptik seperti povidon-yodium 5-10%.'),
(11, 'Erisipelas', 'Antipiretik dan analgestik. penisilin 0,6-1,5 mega unit selama 5-10 hari. kompres dengan larutan asam borat 3%.'),
(12, 'Varisela (Cacar Air)', 'Pengobatan dangan antipiretik dan analgesik. untuk menghilangkan rasa gatal diberikan sedativa untuk mencegah/meringankan diberikan intramuskular.'),
(13, 'Herpes Zoster Oftalmik (Cacar Api)', 'Analgetik untuk menghilangkan nyeri jika desertai infeksi sekunder diberikan antibiotik obat asiklovir diberikan 3 hari pertama sejak lesi muncul.'),
(14, 'Veruka Filiformis (Kutil)', 'Dilakukan Macam-macam terapi topikal: bahan kaustik, misal : larutan Ag NO3 25%, asam triklorosetat 50% dan fenollikuifaktum. bedah beku mis : CO2 N2, N2O. bedah Skapel, bedah laser, bedah listrik.'),
(15, 'Efelid (Freckles)', 'Pencegahan terhadap sinar matahari. hidrokortison 2-5% dalam salep/krim peeling dengan fenol. '),
(16, 'Acne Vulgaris', 'Hindari makanan yang mengandung lemak. sulfur 2-10%. tetrasiklin 3-4 kali sehari 250mg.'),
(17, 'Dermatomiositis', 'Memakai proteksi terhadap sinar matahari dengan memakai tabir surya. obat-obat kostikosteroid anti inflamasi.'),
(18, 'Acne Rosasea', 'Memakai proteksi terhadap sinar matahari dengan memakai tabir surya. obat-obat kostikosteroid anti inflamasi.'),
(19, 'Lepra (Kusta)', 'Pengobatan Kombinasi DDS dan rifampisin.'),
(20, 'Furunkel (satu mata), Karbunkel (banyak mata)', 'Kompres hangat dengan handuk selama 15 menit. jaga kebersihan dengan mandi tiap hari. oleskan cairan antibiotika seperti cetrimide atau acriflavine untuk mencegah infeksi bakteri.');

-- --------------------------------------------------------

--
-- Table structure for table `t_relasi`
--

CREATE TABLE IF NOT EXISTS `t_relasi` (
  `kode_penyakit` int(4) NOT NULL,
  `kode_gejala` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_relasi`
--

INSERT INTO `t_relasi` (`kode_penyakit`, `kode_gejala`) VALUES
(1, 2),
(1, 6),
(1, 12),
(2, 1),
(2, 2),
(2, 15),
(3, 1),
(3, 2),
(3, 17),
(4, 1),
(4, 2),
(4, 4),
(5, 2),
(5, 17),
(5, 22),
(6, 1),
(6, 7),
(7, 2),
(7, 16),
(7, 17),
(7, 18),
(8, 2),
(8, 24),
(8, 26),
(9, 2),
(9, 15),
(10, 1),
(10, 3),
(10, 14),
(10, 31),
(10, 32),
(11, 3),
(11, 13),
(11, 18),
(11, 32),
(12, 1),
(12, 2),
(12, 3),
(13, 3),
(13, 8),
(13, 9),
(13, 10),
(14, 4),
(14, 30),
(14, 31),
(15, 4),
(15, 8),
(15, 27),
(16, 1),
(16, 2),
(16, 5),
(17, 9),
(17, 23),
(17, 24),
(17, 25),
(18, 1),
(18, 21),
(18, 24),
(19, 6),
(19, 12),
(19, 19),
(19, 20),
(20, 8),
(20, 28),
(20, 29),
(1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
