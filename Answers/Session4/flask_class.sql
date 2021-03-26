-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 26, 2021 at 09:57 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flask_class`
--

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `college_id` int(11) NOT NULL,
  `college_name` varchar(20) COLLATE utf8mb4_persian_ci NOT NULL,
  `CITY` varchar(20) COLLATE utf8mb4_persian_ci NOT NULL,
  `PROFESSOR_NAME` varchar(50) COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`college_id`, `college_name`, `CITY`, `PROFESSOR_NAME`) VALUES
(1, 'MATH', 'TEHRAN', 'HASANI'),
(2, 'PHYSICS', 'MASHHAD', 'ZAKER'),
(3, 'LANGUAGE', 'MASHHAD', 'MAFTOUN'),
(4, 'INDUSTRIES', 'TEHRAN', 'SADEGHIAN'),
(5, 'CHEMISTRY', 'TEHRAN', 'ASHRAFI ZADEH'),
(6, 'MATERIALS', 'TABRIZ', 'ABUTALEBI'),
(7, 'ELECTRIC', 'TEHRAN', 'JALALI'),
(10, 'COMPUTER', 'TEHRAN', 'JAHED MOTLAGH'),
(11, 'ARCHITECTURE', 'YAZD', 'NOGHREH KAR'),
(12, 'RELIGON', 'GHOM', 'KARIMI'),
(13, 'CIVIL', 'TEHRAN', 'AFANDI ZADE');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(50) COLLATE utf8mb4_persian_ci NOT NULL,
  `unit` int(11) NOT NULL,
  `collage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `college_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `PROFESSOR_NAME` varchar(50) COLLATE utf8mb4_persian_ci NOT NULL,
  `term` char(3) COLLATE utf8mb4_persian_ci NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(50) COLLATE utf8mb4_persian_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_persian_ci NOT NULL,
  `average` float UNSIGNED NOT NULL,
  `college_id` int(11) NOT NULL
) ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_name`, `city`, `average`, `college_id`) VALUES
(71133848, 'MOHAMADI', 'TEHRAN', 17, 10),
(72130502, 'VAKILI', 'ESFAHAN', 14, 10),
(72203305, 'ALINAGHI ZADEH', 'MASHHAD', 16, 1),
(72210211, 'KEYVAN', 'ZAHEDAN', 13, 5),
(72210212, 'NAVIDI', 'SHIRAZ', 18, 4),
(72210213, 'NASHERI', 'SANANDAJ', 16, 11),
(73120504, 'KAMANI', 'YAZD', 18, 4),
(73166801, 'AHMADI', 'KERMAN', 15, 5),
(73172297, 'SHAHABI', 'KERMAN', 17, 10),
(74182532, 'JAVADI', 'TEHRAN', 17, 5),
(74209836, 'HOSEYN ZADE', 'TABRIZ', 12, 6),
(955361005, 'kasra ', 'tehran', 17, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `collage_id` (`collage_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`student_id`,`course_id`,`term`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `collage_id_collage` (`college_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`collage_id`) REFERENCES `college` (`college_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `collage_id_collage` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
