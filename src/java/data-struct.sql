-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 07 Août 2017 à 15:24
-- Version du serveur :  10.1.8-MariaDB
-- Version de PHP :  5.6.14

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `kt_fst_2`
--

-- --------------------------------------------------------

--
-- Structure de la table `artderweiterverarbeitung`
--

CREATE TABLE `artderweiterverarbeitung` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `auflage`
--

CREATE TABLE `auflage` (
  `ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `auflage`
--

INSERT INTO `auflage` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
(1, '50', '50.00'),
(2, '100', '100.00'),
(3, '150', '150.00'),
(4, '200', '200.00'),
(5, '500', '500.00'),
(6, '750', '750.00'),
(7, '1000', '1000.00'),
(8, '1250', '1250.00'),
(9, '1500', '1500.00'),
(10, '1750', '1750.00'),
(11, '2000', '2000.00'),
(12, '2500', '2500.00'),
(13, '3000', '3000.00'),
(14, '3500', '3500.00'),
(15, '4000', '4000.00'),
(16, '4500', '4500.00'),
(17, '5000', '5000.00'),
(18, '5500', '5500.00'),
(19, '6000', '6000.00'),
(20, '6500', '6500.00'),
(21, '7000', '7000.00'),
(22, '7500', '7500.00'),
(23, '8000', '8000.00'),
(24, '8500', '8500.00'),
(25, '9000', '9000.00'),
(26, '9500', '9500.00'),
(27, '10000', '10000.00');

-- --------------------------------------------------------

--
-- Structure de la table `auflageseitencovermatrix`
--

CREATE TABLE `auflageseitencovermatrix` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `AUFLAGE_ID` int(11) DEFAULT NULL,
  `BAUKASTEN_ID` bigint(20) DEFAULT NULL,
  `COVER_ID` varchar(255) DEFAULT NULL,
  `FARBIGKEIT_ID` varchar(255) DEFAULT NULL,
  `FORMATAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `SEITEN_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `auflageseitencovermatrix`
--

INSERT INTO `auflageseitencovermatrix` (`ID`, `PRICE`, `AUFLAGE_ID`, `BAUKASTEN_ID`, `COVER_ID`, `FARBIGKEIT_ID`, `FORMATAUSWAEHLEN_ID`, `SEITEN_ID`) VALUES
(4, '0.00', 1, 1502, 'Softcover', '4/4 c', 'A4', 78),
(5, '0.00', 1, 1502, 'Softcover', '4/4 c', 'A4', 79),
(6, '10.07', 1, 1502, 'Softcover', '4/4 c', 'A4', 80),
(7, '12.32', 1, 1502, 'Softcover', '4/4 c', 'A4', 81),
(8, '15.07', 1, 1502, 'Softcover', '4/4 c', 'A4', 82),
(9, '18.10', 1, 1502, 'Softcover', '4/4 c', 'A4', 83),
(10, '20.99', 1, 1502, 'Softcover', '4/4 c', 'A4', 84),
(11, '31.00', 1, 1502, 'Softcover', '4/4 c', 'A4', 85),
(12, '35.05', 1, 1502, 'Softcover', '4/4 c', 'A4', 86),
(13, '44.77', 1, 1502, 'Softcover', '4/4 c', 'A4', 87),
(14, '64.71', 1, 1502, 'Softcover', '4/4 c', 'A4', 88),
(15, '77.99', 1, 1502, 'Softcover', '4/4 c', 'A4', 89),
(16, '91.52', 1, 1502, 'Softcover', '4/4 c', 'A4', 90),
(17, '106.78', 1, 1502, 'Softcover', '4/4 c', 'A4', 91),
(18, '118.22', 1, 1502, 'Softcover', '4/4 c', 'A4', 92),
(19, '133.54', 1, 1502, 'Softcover', '4/4 c', 'A4', 93),
(20, '154.55', 1, 1502, 'Softcover', '4/4 c', 'A4', 94),
(21, '168.08', 1, 1502, 'Softcover', '4/4 c', 'A4', 95),
(22, '181.94', 1, 1502, 'Softcover', '4/4 c', 'A4', 96),
(23, '196.02', 1, 1502, 'Softcover', '4/4 c', 'A4', 97),
(24, '211.46', 1, 1502, 'Softcover', '4/4 c', 'A4', 98),
(25, '224.10', 1, 1502, 'Softcover', '4/4 c', 'A4', 99),
(26, '235.44', 1, 1502, 'Softcover', '4/4 c', 'A4', 100),
(27, '249.16', 1, 1502, 'Softcover', '4/4 c', 'A4', 101),
(28, '270.00', 1, 1502, 'Softcover', '4/4 c', 'A4', 102),
(29, '284.04', 1, 1502, 'Softcover', '4/4 c', 'A4', 103),
(30, '305.30', 1, 1502, 'Softcover', '4/4 c', 'A4', 104),
(31, '314.97', 1, 1502, 'Softcover', '4/4 c', 'A4', 105),
(32, '325.89', 1, 1502, 'Softcover', '4/4 c', 'A4', 106),
(33, '339.82', 1, 1502, 'Softcover', '4/4 c', 'A4', 107),
(34, '353.76', 1, 1502, 'Softcover', '4/4 c', 'A4', 108),
(35, '367.70', 1, 1502, 'Softcover', '4/4 c', 'A4', 109),
(36, '385.92', 1, 1502, 'Softcover', '4/4 c', 'A4', 110),
(37, '406.29', 1, 1502, 'Softcover', '4/4 c', 'A4', 111),
(38, '420.22', 1, 1502, 'Softcover', '4/4 c', 'A4', 112),
(39, '434.16', 1, 1502, 'Softcover', '4/4 c', 'A4', 113),
(40, '453.46', 1, 1502, 'Softcover', '4/4 c', 'A4', 114),
(41, '463.10', 1, 1502, 'Softcover', '4/4 c', 'A4', 115),
(42, '481.33', 1, 1502, 'Softcover', '4/4 c', 'A4', 116),
(43, '490.98', 1, 1502, 'Softcover', '4/4 c', 'A4', 117),
(44, '515.52', 1, 1502, 'Softcover', '4/4 c', 'A4', 118),
(45, '522.58', 1, 1502, 'Softcover', '4/4 c', 'A4', 119),
(46, '3.18', 1, 1502, 'Softcover', '4/4 c', 'A5', 78),
(47, '6.36', 1, 1502, 'Softcover', '4/4 c', 'A5', 79),
(48, '5.57', 1, 1502, 'Softcover', '4/4 c', 'A5', 80),
(49, '7.07', 1, 1502, 'Softcover', '4/4 c', 'A5', 81),
(50, '8.89', 1, 1502, 'Softcover', '4/4 c', 'A5', 82),
(51, '11.08', 1, 1502, 'Softcover', '4/4 c', 'A5', 83),
(52, '13.43', 1, 1502, 'Softcover', '4/4 c', 'A5', 84),
(53, '19.84', 1, 1502, 'Softcover', '4/4 c', 'A5', 85),
(54, '22.43', 1, 1502, 'Softcover', '4/4 c', 'A5', 86),
(55, '28.65', 1, 1502, 'Softcover', '4/4 c', 'A5', 87),
(56, '41.42', 1, 1502, 'Softcover', '4/4 c', 'A5', 88),
(57, '49.91', 1, 1502, 'Softcover', '4/4 c', 'A5', 89),
(58, '58.57', 1, 1502, 'Softcover', '4/4 c', 'A5', 90),
(59, '68.34', 1, 1502, 'Softcover', '4/4 c', 'A5', 91),
(60, '75.66', 1, 1502, 'Softcover', '4/4 c', 'A5', 92),
(61, '85.47', 1, 1502, 'Softcover', '4/4 c', 'A5', 93),
(62, '98.91', 1, 1502, 'Softcover', '4/4 c', 'A5', 94),
(63, '107.57', 1, 1502, 'Softcover', '4/4 c', 'A5', 95),
(64, '116.44', 1, 1502, 'Softcover', '4/4 c', 'A5', 96),
(65, '125.45', 1, 1502, 'Softcover', '4/4 c', 'A5', 97),
(66, '135.33', 1, 1502, 'Softcover', '4/4 c', 'A5', 98),
(67, '143.42', 1, 1502, 'Softcover', '4/4 c', 'A5', 99),
(68, '150.68', 1, 1502, 'Softcover', '4/4 c', 'A5', 100),
(69, '159.46', 1, 1502, 'Softcover', '4/4 c', 'A5', 101),
(70, '172.80', 1, 1502, 'Softcover', '4/4 c', 'A5', 102),
(71, '181.79', 1, 1502, 'Softcover', '4/4 c', 'A5', 103),
(72, '195.39', 1, 1502, 'Softcover', '4/4 c', 'A5', 104),
(73, '201.58', 1, 1502, 'Softcover', '4/4 c', 'A5', 105),
(74, '208.57', 1, 1502, 'Softcover', '4/4 c', 'A5', 106),
(75, '217.49', 1, 1502, 'Softcover', '4/4 c', 'A5', 107),
(76, '226.41', 1, 1502, 'Softcover', '4/4 c', 'A5', 108),
(77, '235.33', 1, 1502, 'Softcover', '4/4 c', 'A5', 109),
(78, '246.99', 1, 1502, 'Softcover', '4/4 c', 'A5', 110),
(79, '260.02', 1, 1502, 'Softcover', '4/4 c', 'A5', 111),
(80, '268.94', 1, 1502, 'Softcover', '4/4 c', 'A5', 112),
(81, '277.86', 1, 1502, 'Softcover', '4/4 c', 'A5', 113),
(82, '290.21', 1, 1502, 'Softcover', '4/4 c', 'A5', 114),
(83, '296.39', 1, 1502, 'Softcover', '4/4 c', 'A5', 115),
(84, '308.05', 1, 1502, 'Softcover', '4/4 c', 'A5', 116),
(85, '314.22', 1, 1502, 'Softcover', '4/4 c', 'A5', 117),
(86, '329.94', 1, 1502, 'Softcover', '4/4 c', 'A5', 118),
(87, '334.45', 1, 1502, 'Softcover', '4/4 c', 'A5', 119),
(88, '2.29', 1, 1502, 'Softcover', '4/4 c', 'A6', 78),
(89, '4.58', 1, 1502, 'Softcover', '4/4 c', 'A6', 79),
(90, '2.90', 1, 1502, 'Softcover', '4/4 c', 'A6', 80),
(91, '3.71', 1, 1502, 'Softcover', '4/4 c', 'A6', 81),
(92, '4.71', 1, 1502, 'Softcover', '4/4 c', 'A6', 82),
(93, '5.93', 1, 1502, 'Softcover', '4/4 c', 'A6', 83),
(94, '7.25', 1, 1502, 'Softcover', '4/4 c', 'A6', 84),
(95, '10.71', 1, 1502, 'Softcover', '4/4 c', 'A6', 85),
(96, '12.11', 1, 1502, 'Softcover', '4/4 c', 'A6', 86),
(97, '15.47', 1, 1502, 'Softcover', '4/4 c', 'A6', 87),
(98, '22.36', 1, 1502, 'Softcover', '4/4 c', 'A6', 88),
(99, '26.95', 1, 1502, 'Softcover', '4/4 c', 'A6', 89),
(100, '31.63', 1, 1502, 'Softcover', '4/4 c', 'A6', 90),
(101, '36.90', 1, 1502, 'Softcover', '4/4 c', 'A6', 91),
(102, '40.86', 1, 1502, 'Softcover', '4/4 c', 'A6', 92),
(103, '46.15', 1, 1502, 'Softcover', '4/4 c', 'A6', 93),
(104, '53.41', 1, 1502, 'Softcover', '4/4 c', 'A6', 94),
(105, '58.09', 1, 1502, 'Softcover', '4/4 c', 'A6', 95),
(106, '62.88', 1, 1502, 'Softcover', '4/4 c', 'A6', 96),
(107, '67.74', 1, 1502, 'Softcover', '4/4 c', 'A6', 97),
(108, '73.08', 1, 1502, 'Softcover', '4/4 c', 'A6', 98),
(109, '77.45', 1, 1502, 'Softcover', '4/4 c', 'A6', 99),
(110, '81.37', 1, 1502, 'Softcover', '4/4 c', 'A6', 100),
(111, '86.11', 1, 1502, 'Softcover', '4/4 c', 'A6', 101),
(112, '93.31', 1, 1502, 'Softcover', '4/4 c', 'A6', 102),
(113, '98.16', 1, 1502, 'Softcover', '4/4 c', 'A6', 103),
(114, '105.51', 1, 1502, 'Softcover', '4/4 c', 'A6', 104),
(115, '108.86', 1, 1502, 'Softcover', '4/4 c', 'A6', 105),
(116, '112.63', 1, 1502, 'Softcover', '4/4 c', 'A6', 106),
(117, '117.44', 1, 1502, 'Softcover', '4/4 c', 'A6', 107),
(118, '122.26', 1, 1502, 'Softcover', '4/4 c', 'A6', 108),
(119, '127.08', 1, 1502, 'Softcover', '4/4 c', 'A6', 109),
(120, '133.37', 1, 1502, 'Softcover', '4/4 c', 'A6', 110),
(121, '140.41', 1, 1502, 'Softcover', '4/4 c', 'A6', 111),
(122, '145.23', 1, 1502, 'Softcover', '4/4 c', 'A6', 112),
(123, '150.05', 1, 1502, 'Softcover', '4/4 c', 'A6', 113),
(124, '156.71', 1, 1502, 'Softcover', '4/4 c', 'A6', 114),
(125, '160.05', 1, 1502, 'Softcover', '4/4 c', 'A6', 115),
(126, '166.35', 1, 1502, 'Softcover', '4/4 c', 'A6', 116),
(127, '169.68', 1, 1502, 'Softcover', '4/4 c', 'A6', 117),
(128, '178.17', 1, 1502, 'Softcover', '4/4 c', 'A6', 118),
(129, '180.60', 1, 1502, 'Softcover', '4/4 c', 'A6', 119),
(130, '0.00', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 78),
(131, '0.00', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 79),
(132, '5.87', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 80),
(133, '7.38', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 81),
(134, '9.20', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 82),
(135, '11.36', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 83),
(136, '13.64', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 84),
(137, '20.15', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 85),
(138, '22.78', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 86),
(139, '29.10', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 87),
(140, '42.06', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 88),
(141, '50.69', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 89),
(142, '59.49', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 90),
(143, '69.41', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 91),
(144, '76.84', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 92),
(145, '86.80', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 93),
(146, '100.46', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 94),
(147, '109.25', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 95),
(148, '118.26', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 96),
(149, '127.41', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 97),
(150, '137.45', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 98),
(151, '145.67', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 99),
(152, '153.04', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 100),
(153, '161.95', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 101),
(154, '175.50', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 102),
(155, '184.63', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 103),
(156, '198.45', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 104),
(157, '204.73', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 105),
(158, '211.83', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 106),
(159, '220.89', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 107),
(160, '229.94', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 108),
(161, '239.00', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 109),
(162, '250.85', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 110),
(163, '264.09', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 111),
(164, '273.15', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 112),
(165, '282.20', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 113),
(166, '294.75', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 114),
(167, '301.02', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 115),
(168, '312.86', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 116),
(169, '319.13', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 117),
(170, '335.09', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 118),
(171, '339.68', 1, 1502, 'Softcover', '4/4 c', 'E5PLUS', 119),
(172, '0.00', 1, 1502, 'Softcover', '4/4 c', 'F1926', 78),
(173, '0.00', 1, 1502, 'Softcover', '4/4 c', 'F1926', 79),
(174, '9.88', 1, 1502, 'Softcover', '4/4 c', 'F1926', 80),
(175, '12.31', 1, 1502, 'Softcover', '4/4 c', 'F1926', 81),
(176, '15.20', 1, 1502, 'Softcover', '4/4 c', 'F1926', 82),
(177, '18.59', 1, 1502, 'Softcover', '4/4 c', 'F1926', 83),
(178, '21.93', 1, 1502, 'Softcover', '4/4 c', 'F1926', 84),
(179, '32.40', 1, 1502, 'Softcover', '4/4 c', 'F1926', 85),
(180, '36.63', 1, 1502, 'Softcover', '4/4 c', 'F1926', 86),
(181, '46.78', 1, 1502, 'Softcover', '4/4 c', 'F1926', 87),
(182, '67.63', 1, 1502, 'Softcover', '4/4 c', 'F1926', 88),
(183, '81.50', 1, 1502, 'Softcover', '4/4 c', 'F1926', 89),
(184, '95.64', 1, 1502, 'Softcover', '4/4 c', 'F1926', 90),
(185, '111.59', 1, 1502, 'Softcover', '4/4 c', 'F1926', 91),
(186, '123.53', 1, 1502, 'Softcover', '4/4 c', 'F1926', 92),
(187, '139.55', 1, 1502, 'Softcover', '4/4 c', 'F1926', 93),
(188, '161.50', 1, 1502, 'Softcover', '4/4 c', 'F1926', 94),
(189, '175.64', 1, 1502, 'Softcover', '4/4 c', 'F1926', 95),
(190, '190.13', 1, 1502, 'Softcover', '4/4 c', 'F1926', 96),
(191, '204.84', 1, 1502, 'Softcover', '4/4 c', 'F1926', 97),
(192, '220.98', 1, 1502, 'Softcover', '4/4 c', 'F1926', 98),
(193, '234.18', 1, 1502, 'Softcover', '4/4 c', 'F1926', 99),
(194, '246.03', 1, 1502, 'Softcover', '4/4 c', 'F1926', 100),
(195, '260.37', 1, 1502, 'Softcover', '4/4 c', 'F1926', 101),
(196, '282.15', 1, 1502, 'Softcover', '4/4 c', 'F1926', 102),
(197, '296.82', 1, 1502, 'Softcover', '4/4 c', 'F1926', 103),
(198, '319.04', 1, 1502, 'Softcover', '4/4 c', 'F1926', 104),
(199, '329.15', 1, 1502, 'Softcover', '4/4 c', 'F1926', 105),
(200, '340.55', 1, 1502, 'Softcover', '4/4 c', 'F1926', 106),
(201, '355.12', 1, 1502, 'Softcover', '4/4 c', 'F1926', 107),
(202, '369.68', 1, 1502, 'Softcover', '4/4 c', 'F1926', 108),
(203, '384.24', 1, 1502, 'Softcover', '4/4 c', 'F1926', 109),
(204, '403.29', 1, 1502, 'Softcover', '4/4 c', 'F1926', 110),
(205, '424.57', 1, 1502, 'Softcover', '4/4 c', 'F1926', 111),
(206, '439.13', 1, 1502, 'Softcover', '4/4 c', 'F1926', 112),
(207, '453.70', 1, 1502, 'Softcover', '4/4 c', 'F1926', 113),
(208, '473.86', 1, 1502, 'Softcover', '4/4 c', 'F1926', 114),
(209, '483.94', 1, 1502, 'Softcover', '4/4 c', 'F1926', 115),
(210, '502.99', 1, 1502, 'Softcover', '4/4 c', 'F1926', 116),
(211, '513.07', 1, 1502, 'Softcover', '4/4 c', 'F1926', 117),
(212, '0.00', 1, 1502, 'Softcover', '4/4 c', 'F1926', 118),
(213, '0.00', 1, 1502, 'Softcover', '4/4 c', 'F1926', 119);

-- --------------------------------------------------------

--
-- Structure de la table `ausgabe`
--

CREATE TABLE `ausgabe` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `VALUEE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ausgabe`
--

INSERT INTO `ausgabe` (`ID`, `NAME`, `PRICE`, `VALUEE`) VALUES
(7, 'Erstausgabe', NULL, '0.50'),
(8, 'Folgeausgabe', NULL, '0.20');

-- --------------------------------------------------------

--
-- Structure de la table `ausgabepricing`
--

CREATE TABLE `ausgabepricing` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `AUSGABE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `backup`
--

CREATE TABLE `backup` (
  `ID` bigint(20) NOT NULL,
  `DATESYSTEME` date DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `backup`
--

INSERT INTO `backup` (`ID`, `DATESYSTEME`, `NOM`) VALUES
(256, '2017-08-02', '2017-08-02.sql');

-- --------------------------------------------------------

--
-- Structure de la table `baukasten`
--

CREATE TABLE `baukasten` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `baukasten`
--

INSERT INTO `baukasten` (`ID`, `EXPRESSION`) VALUES
(1502, '4/4-fbg.Skala ');

-- --------------------------------------------------------

--
-- Structure de la table `baukastenpricing`
--

CREATE TABLE `baukastenpricing` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `BAUKASTEN_ID` bigint(20) DEFAULT NULL,
  `COVER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `baukastenpricing`
--

INSERT INTO `baukastenpricing` (`ID`, `PRICE`, `BAUKASTEN_ID`, `COVER_ID`) VALUES
(1556, '184.84', 1502, 'Softcover'),
(1557, '352.79', 1502, 'Hardcover');

-- --------------------------------------------------------

--
-- Structure de la table `bindung`
--

CREATE TABLE `bindung` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `bindung`
--

INSERT INTO `bindung` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('Fadenheftung', NULL, NULL),
('PUR-Bindung', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`ID`, `NAME`) VALUES
(1, 'Katalog'),
(2, 'Fleyer'),
(3, 'Prospekt'),
(4, 'BMEcat');

-- --------------------------------------------------------

--
-- Structure de la table `configuration`
--

CREATE TABLE `configuration` (
  `ID` bigint(20) NOT NULL,
  `DATEAPPLICATION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `configuration`
--

INSERT INTO `configuration` (`ID`, `DATEAPPLICATION`) VALUES
(1, '2012-07-03');

-- --------------------------------------------------------

--
-- Structure de la table `configurationitem`
--

CREATE TABLE `configurationitem` (
  `ID` bigint(20) NOT NULL,
  `DEFAULTVALUE` decimal(10,2) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `CONFIGURATION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `configurationitem`
--

INSERT INTO `configurationitem` (`ID`, `DEFAULTVALUE`, `NAME`, `CONFIGURATION_ID`) VALUES
(1, '56.25', 'std_stz', NULL),
(2, '70.00', 'std_stz_dtp', NULL),
(3, '56.25', 'std_stz_pm', NULL),
(4, '162.50', 'std_satz_fotograf', 1),
(5, '75.00', 'std_satz_kind_model', 1),
(6, '112.50', 'std_satz_erwachsene_model', 1);

-- --------------------------------------------------------

--
-- Structure de la table `correctionschluessel`
--

CREATE TABLE `correctionschluessel` (
  `ID` bigint(20) NOT NULL,
  `PERCENT` int(11) DEFAULT NULL,
  `WERT` decimal(10,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `correctionschluessel`
--

INSERT INTO `correctionschluessel` (`ID`, `PERCENT`, `WERT`) VALUES
(1, 0, '1.000'),
(2, 1, '1.000'),
(3, 2, '1.000'),
(4, 3, '1.000'),
(5, 4, '1.000'),
(6, 5, '1.000'),
(7, 6, '1.000'),
(8, 7, '1.000'),
(9, 8, '1.000'),
(10, 9, '1.000'),
(11, 10, '1.000'),
(12, 11, '1.000'),
(13, 12, '1.000'),
(14, 13, '1.000'),
(15, 14, '1.000'),
(17, 15, '1.050'),
(18, 16, '1.025'),
(19, 17, '1.025'),
(20, 18, '1.025'),
(21, 19, '1.025'),
(22, 20, '1.025'),
(23, 21, '1.025'),
(24, 22, '1.025'),
(25, 23, '1.025'),
(26, 24, '1.025'),
(27, 25, '1.025'),
(28, 26, '1.025'),
(29, 27, '1.025'),
(30, 28, '1.025'),
(31, 29, '1.025'),
(32, 30, '1.025'),
(33, 31, '1.050'),
(34, 32, '1.050'),
(35, 33, '1.050'),
(36, 34, '1.050'),
(37, 35, '1.050'),
(38, 36, '1.050'),
(39, 37, '1.050'),
(40, 38, '1.050'),
(41, 39, '1.050'),
(42, 40, '1.050'),
(43, 41, '1.050'),
(44, 42, '1.050'),
(45, 43, '1.050'),
(46, 44, '1.050'),
(47, 45, '1.050'),
(48, 46, '1.050'),
(49, 47, '1.050'),
(50, 48, '1.050'),
(51, 49, '1.050'),
(52, 50, '1.050'),
(53, 51, '1.100'),
(54, 52, '1.100'),
(55, 53, '1.100'),
(56, 54, '1.100'),
(57, 55, '1.100'),
(58, 56, '1.100'),
(59, 57, '1.100'),
(60, 58, '1.100'),
(61, 59, '1.100'),
(62, 60, '1.100'),
(63, 61, '1.100'),
(64, 62, '1.100'),
(65, 63, '1.100'),
(66, 64, '1.100'),
(67, 65, '1.100'),
(68, 66, '1.100'),
(69, 67, '1.100'),
(70, 68, '1.100'),
(71, 69, '1.100'),
(72, 70, '1.100'),
(73, 71, '1.100'),
(74, 72, '1.100'),
(75, 73, '1.100'),
(76, 74, '1.100'),
(77, 75, '1.100'),
(78, 76, '1.150'),
(79, 77, '1.150'),
(80, 78, '1.150'),
(81, 79, '1.150'),
(82, 80, '1.150'),
(83, 81, '1.150'),
(84, 82, '1.150'),
(85, 83, '1.150'),
(86, 84, '1.150'),
(87, 85, '1.150'),
(88, 86, '1.150'),
(89, 87, '1.150'),
(90, 88, '1.150'),
(91, 89, '1.150'),
(92, 90, '1.150'),
(93, 91, '1.150'),
(94, 92, '1.150'),
(95, 93, '1.150'),
(96, 94, '1.150'),
(97, 95, '1.150'),
(98, 96, '1.150'),
(99, 97, '1.150'),
(100, 98, '1.150'),
(101, 99, '1.150'),
(102, 100, '1.150');

-- --------------------------------------------------------

--
-- Structure de la table `cover`
--

CREATE TABLE `cover` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `cover`
--

INSERT INTO `cover` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('Hardcover', 'Hardcover', '1.00'),
('Softcover', 'Softcover', '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `demandcategory`
--

CREATE TABLE `demandcategory` (
  `ID` bigint(20) NOT NULL,
  `ANZAHLBESTANDARTIKEL` int(11) DEFAULT NULL,
  `ANZAHLBESTANDPRODUKT` int(11) DEFAULT NULL,
  `ANZAHLBESTELLNRSEITEN` int(11) DEFAULT NULL,
  `ANZAHLBETEILIGTEN` int(11) DEFAULT NULL,
  `ANZAHLGENERIERUNGUPDATESEITEN` int(11) DEFAULT NULL,
  `ANZAHLGESAMTARTIKEL` int(11) DEFAULT NULL,
  `ANZAHLGESAMTPRODUKT` int(11) DEFAULT NULL,
  `ANZAHLGESAMTSEITEN` int(11) DEFAULT NULL,
  `ANZAHLIHVZSEITEN` int(11) DEFAULT NULL,
  `ANZAHLKAPITETEL` int(11) DEFAULT NULL,
  `ANZAHLLIEFERANTGESAMT` int(11) DEFAULT NULL,
  `ANZAHLLIEFERANTNEU` int(11) DEFAULT NULL,
  `ANZAHLMITGLIEDER` int(11) DEFAULT NULL,
  `ANZAHLNEUEARTIKEL` int(11) DEFAULT NULL,
  `ANZAHLNEUEPRODUKT` int(11) DEFAULT NULL,
  `ANZAHLSONDERSEITEN` int(11) DEFAULT NULL,
  `ANZAHLÜBERNAHMEARTIKEL` int(11) DEFAULT NULL,
  `ARTIKELPERPAGELFAKTOR` decimal(10,2) DEFAULT NULL,
  `AUSGABEPRICING` decimal(10,2) DEFAULT NULL,
  `BAUKASTENPRICING` decimal(10,2) DEFAULT NULL,
  `BEARBEITUNGSZEIT` int(11) DEFAULT NULL,
  `DATEDEMANDCATEGORY` date DEFAULT NULL,
  `DATESYSTEM` date DEFAULT NULL,
  `DRUCK` tinyint(1) DEFAULT '0',
  `LKSCHLUESSELFAKTOR` decimal(10,2) DEFAULT NULL,
  `LIEFERTERMIN` date DEFAULT NULL,
  `MKSCHLUESSELFAKTOR` decimal(10,2) DEFAULT NULL,
  `NACHSATZPRICING` decimal(10,2) DEFAULT NULL,
  `NACHSPANNPRICING` decimal(10,2) DEFAULT NULL,
  `NBRTOTALVALIDATION` int(11) DEFAULT NULL,
  `PERCENTSEITENFAKTOR` int(11) DEFAULT NULL,
  `PRODUCTSCHLUESSELFAKTOR` decimal(10,2) DEFAULT NULL,
  `SEITENANZAHL` int(11) DEFAULT NULL,
  `SUMMDRUCK` decimal(10,2) DEFAULT NULL,
  `SUMMUNITPRICE` decimal(10,2) DEFAULT NULL,
  `SUMMEGLOBAL` decimal(10,2) DEFAULT NULL,
  `TEILNEHMERZAHL` int(11) DEFAULT NULL,
  `TEILNEHMERZAHLPRICING` decimal(10,2) DEFAULT NULL,
  `UMFANG` int(11) DEFAULT NULL,
  `UMSCHLAG` tinyint(1) DEFAULT '0',
  `UMSCHLAGFARBIGKEITELEMENTPRICING` decimal(10,2) DEFAULT NULL,
  `VORSPANNPRICING` decimal(10,2) DEFAULT NULL,
  `SCHLUESSEL_ID` bigint(20) DEFAULT NULL,
  `ARTDERWEITERVERARBEITUNG_ID` bigint(20) DEFAULT NULL,
  `AUFLAGE_ID` int(11) DEFAULT NULL,
  `AUSGABE_ID` bigint(20) DEFAULT NULL,
  `BAUKASTEN_ID` bigint(20) DEFAULT NULL,
  `BINDUNG_ID` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `CORRECTIONSCHLUESSEL_ID` bigint(20) DEFAULT NULL,
  `COVER_ID` varchar(255) DEFAULT NULL,
  `DEPARTMENT_ID` bigint(20) DEFAULT NULL,
  `DRUCKSEITEN_ID` bigint(20) DEFAULT NULL,
  `FARBIGKEIT_ID` varchar(255) DEFAULT NULL,
  `FORMATAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `KATALOGART_ID` bigint(20) DEFAULT NULL,
  `KONZEPTBEARBEITUNGFAKTOR_ID` bigint(20) DEFAULT NULL,
  `LAYOUT_ID` bigint(20) DEFAULT NULL,
  `MITGLIEDERKORREKTURFAKTOR_ID` bigint(20) DEFAULT NULL,
  `NACHSATZ_ID` bigint(20) DEFAULT NULL,
  `NACHSPANN_ID` bigint(20) DEFAULT NULL,
  `PAPIERMATERIALAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `PARTICIPANTFAKTOR_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `PROZESS_ID` bigint(20) DEFAULT NULL,
  `REGISTER_ID` bigint(20) DEFAULT NULL,
  `UMSCHLAGFARBIGKEIT_ID` bigint(20) DEFAULT NULL,
  `UMSCHLAGFARBIGKEITELEMENT_ID` bigint(20) DEFAULT NULL,
  `UMSCHLAGPAPIERAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL,
  `VEREDLUNG_ID` varchar(255) DEFAULT NULL,
  `VORSPANN_ID` bigint(20) DEFAULT NULL,
  `WECHSELFASSUNGVARIANTFAKTOR_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
--

-- Structure de la table `demandcategorycalculation`
CREATE TABLE `demandcategorycalculation` (
  `ID` bigint(20) NOT NULL,
  `SUMME` decimal(10,2) DEFAULT NULL,
  `SUMMEGLOBAL` decimal(10,2) DEFAULT NULL,
  `VALIDE` tinyint(1) DEFAULT '0',
  `DEMANDCATEGORYDEPARTEMENTCALCULATION_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENTCRITERIA_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--

-- --------------------------------------------------------
--

-- Structure de la table `demandcategorycalculationitem`
CREATE TABLE `demandcategorycalculationitem` (
  `ID` bigint(20) NOT NULL,
  `CALCULTAED` tinyint(1) DEFAULT '0',
  `PRICE` decimal(10,2) DEFAULT NULL,
  `PRICEGLOBAL` decimal(10,2) DEFAULT NULL,
  `PRICEGLOBALUPDATE` decimal(10,2) DEFAULT NULL,
  `PRICEUPDATE` decimal(10,2) DEFAULT NULL,
  `DEMANDCATEGORYCALCULATION_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENTCRITERIAITEM_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--

-- --------------------------------------------------------
--

-- Structure de la table `demandcategorydepartementcalculation`
CREATE TABLE `demandcategorydepartementcalculation` (
  `ID` bigint(20) NOT NULL,
  `SUMME` decimal(10,2) DEFAULT NULL,
  `SUMMEGLOBAL` decimal(10,2) DEFAULT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--

-- --------------------------------------------------------
--

-- Structure de la table `demandcategoryvalidation`
CREATE TABLE `demandcategoryvalidation` (
  `ID` int(11) NOT NULL,
  `SYSDATE` time DEFAULT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--

-- --------------------------------------------------------
--

-- Structure de la table `departement`
CREATE TABLE `departement` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`ID`, `NAME`) VALUES
(1, 'contentManagement'),
(2, 'datenManagement'),
(3, 'databasePublishing'),
(4, 'projectManagement'),
(5, 'assetManagement'),
(6, 'mediaIT'),
(8, 'InitialCosts');

-- --------------------------------------------------------

--
-- Structure de la table `departementcriteria`
--

CREATE TABLE `departementcriteria` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `departementcriteria`
--

INSERT INTO `departementcriteria` (`ID`, `NAME`, `DEPARTEMENT_ID`) VALUES
(1, 'Allgemein', 1),
(2, 'Reda', 1),
(3, 'Reda Online', 1),
(4, 'Informatica', 1),
(5, 'LK MG Korrektur', 1),
(6, 'Pruefungen', 1),
(7, 'Sonstiges', 1),
(8, 'Fremdsprachen', 1),
(9, 'Masterlist', 2),
(10, 'Datenbeschaffung', 2),
(11, 'Preisbeschaffung', 2),
(12, 'ASD', 2),
(13, 'Informatica', 2),
(14, 'Sprache', 2),
(15, 'Fixkosten', 3),
(16, '1.Datenimport', 3),
(17, '2. Datenimport', 3),
(18, 'Druckdatenerstellung', 3),
(19, 'Sonstiges', 3),
(20, 'ECC', 3),
(21, 'Produktaufnahme einer Produktgruppe', 5),
(22, 'Fotoshootings', 5),
(23, 'Lizenz', 5),
(24, 'Konzeption', 6),
(25, 'Programmierung', 6),
(27, 'Initial Kosten, diesen fallen unabhängig vom Endprodukt immer an', 8),
(28, 'Projektmanagement Leistungen:', 4),
(29, 'Abbildung', 5),
(31, 'Bildbearbeitung', 5);

-- --------------------------------------------------------

--
-- Structure de la table `departementcriteriaitem`
--

CREATE TABLE `departementcriteriaitem` (
  `ID` bigint(20) NOT NULL,
  `ARITHMITIQUEEXPRESIONFORGLOBALPRICE` varchar(255) DEFAULT NULL,
  `ARITHMITIQUEEXPRESIONFORUNITEPRICE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DESCRIPTIONGLOBAL` varchar(255) DEFAULT NULL,
  `DEPARTEMENTCRITERIA_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `departementcriteriaitem`
--

INSERT INTO `departementcriteriaitem` (`ID`, `ARITHMITIQUEEXPRESIONFORGLOBALPRICE`, `ARITHMITIQUEEXPRESIONFORUNITEPRICE`, `DESCRIPTION`, `DESCRIPTIONGLOBAL`, `DEPARTEMENTCRITERIA_ID`) VALUES
(1, '8*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Erstellung Datenpflegeguide', '8*Std_Satz', 1),
(2, '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Erstellung Redaktionsguide', '6*Std_Satz', 1),
(3, '1*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '1*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Katalog Reda_Vorausgabe kopieren', '1*Std_Satz', 2),
(4, '8*demandCategory.getUmfang()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/100', 'demandCategory.getUmfang()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/100', 'PDF-Generator Reda', '8*AnzahlGesamtSeiten*Std_Satz/100 (100Seiten/Tag)', 2),
(5, '10*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale 8std Prüfung, 2 Std Redaktion Abstimmung', '10*Std_Satz', 9),
(6, '8*demandCategory.getAnzahlNeueArtikel()*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/90', '8*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/90', 'Klassifizierung Neuheiten Information ', '8*Anzahl_Artikel_Neu* LK_Schlüssel*Korrekturschlüssel*Prozessschlüssel*std_satz/90', 13),
(7, '3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Masterlisten Prüfung', '3*Std_Satz', 1),
(8, '8*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Testdaten bereitstellen', '8*Std_Satz', 1),
(11, 'demandCategory.getAnzahlGesamtArtikel()*0.3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/60', '0.3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/60', 'Preis Artikel Reda-Online Pflege', '0.3*AnzahlGesamtArtikel*Std_Satz/60 (0.3Min/Art)', 3),
(12, '16*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Online Pflege(2 Tage)', '16*Std_Satz ', 3),
(13, 'demandCategory.getUmfang()*8*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/70', '8*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/70', 'PDF Generator Informatica ', '8*AnzahlGesamtSeiten*Std_Satz/70 (70 Seiten/Tag)', 4),
(14, '0.5*demandCategory.getAnzahlLieferantNeu()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '0.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Lieferantenkorrektur Versand', '0.5*AnzahlNeueLieferante*Std_Satz', 5),
(15, '0.25*(demandCategory.getAnzahlMitglieder())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue())', '0.25*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Mitgliederkorrektur Versand', '0.25*AnzahlMitglieder*Std_Satz', 5),
(16, '(demandCategory.getAnzahlGesamtProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10)', 'Redaktionelle Text Veredlung der Basis Text für Gesamt Produkte', 'AnzahlGesamtProdukt*KatalogartSchluessel*CorrectionSchluessel*Std_Satz/10', 2),
(17, '(demandCategory.getAnzahlNeueProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/5)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/5)', 'Redaktionelle Textveredlung der Basistext für neue Produkte ', 'AnzahlNeueProdukte*KatalogartSchluessel*CorrectionSchluessel*Std_Satz/10', 2),
(19, '(demandCategory.getAnzahlNeueProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/5)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/5)', 'Redaktionelle Textveredlung der Basistext neue Produkte', 'AnzahlNeueProdukte*KatalogartSchluessel*CorrectionSchluessel*Std_Satz/5', 4),
(20, '(demandCategory.getAnzahlGesamtProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10)', 'Redaktionelle Textveredlung der Basistext Gesamtanzahl Produkte', 'AnzahlGesamtProdukt*KatalogartSchluessel*CorrectionSchluessel*Std_Satz/10', 4),
(21, 'demandCategory.getAnzahlGesamtArtikel()*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10', 'demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10', 'redaktionelle Korrektur inkl. Einarbeitung LK', '(AnzahlGesamtArtikel*LK_Faktor*CorrectionSchluessel)/(10*AnzahlArtikelPerPageFaktor)', 5),
(22, '(demandCategory.getAnzahlGesamtArtikel()*configurationItemFacade.findByName(''std_stz'').getDefaultValue())/30', '(configurationItemFacade.findByName(''std_stz'').getDefaultValue())/30', 'Korrekturlesen mit Kunden', 'AnzahlGesamtArtikel*Std_Satz/AnzahlArtikelPerPageFaktor*30', 5),
(23, '(demandCategory.getAnzahlGesamtArtikel()*demandCategory.getmKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue())/10', '(demandCategory.getmKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue())/10', 'Redaktionelle Korrekturlesen inkl. MK', 'AnzahlGesamtArtikel*MK_Faktor*CorrectionSchluesse*Std_Satzl/(AnzahlArtikelPerPageFaktor*10)', 5),
(24, '(demandCategory.getAnzahlGesamtArtikel()*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue())/15', '(demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue())/15', 'Redaktionelle Korrekturlesen Digiphase', 'AnzahlGesamtArtikel*LK_Faktor*CorrectionSchluesse*Std_Satzl/(AnzahlArtikelPerPageFaktor*15)', 5),
(25, '(demandCategory.getAnzahlGesamtArtikel()*configurationItemFacade.findByName(''std_stz'').getDefaultValue())/30', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()/30', 'Großplott Prüfung', 'AnzahlGesamtArtikel*Std_Satz/(30*ArtikelperPageFaktor)', 6),
(26, 'demandCategory.getAnzahlKapitetel ()*2.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '2.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Preisprüfung aus Satz, KG-Nummer, etc', '2.5*AnzahlKapitel*Std_Satz', 6),
(27, 'demandCategory.getAnzahlGesamtProdukt ()*0.005*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '0.005*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Erstellung IVZ/Synonympflege', '0,005*AnzahlGesamtProdukt*Std_Satz', 7),
(28, '1.5*8*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale ECC Publikationskonfigurator bei LL', '1.5*8*Std_Satz', 7),
(29, '8*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Fotoshootings Teilnahme Redakteur (1 Tag)', '8*Std_Satz', 7),
(30, 'demandCategory.getUmfang()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/19', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()/19', 'Korrektorat (P. Mensch extern)', '(AnzahlGesamtseiten*Std_Satz)/19', 7),
(31, 'demandCategory.getAnzahlKapitetel()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/2.5', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()/2.5', 'Übersetzungsmanagement Marketingdaten', 'AnzahKapitel*STd_Satz/2,5', 8),
(32, '4*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()/2.5', 'Pauschale Übersetzunsmanagement ', '4*Std_Satz', 8),
(33, '0.25*demandCategory.getAnzahlNeueProdukt()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/60', '0.25*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/60', 'Datenbeschaffung pro Produkt Neuheit', '0.25*AnzahlGesamtProdukte*Std_Satz/60', 10),
(34, 'demandCategory.getAnzahlNeueArtikel()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/200', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()/200', 'Datenbeschaffung pro Artikel Neuheit', 'AnzahNeueArtikel*Std_Satz/200', 10),
(35, '0.5*demandCategory.getAnzahlLieferantNeu()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '0.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Datenbeschaffung pro Lieferanten Neuheit ', '0.5*AnzahlNeueLieferanten*Std_Satz', 10),
(36, '4*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Preisbeschaffung (1/2 Tag)', '4*std_Satz', 11),
(37, '0.5*demandCategory.getAnzahlLieferantNeu()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '0.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Preisbechaffung pro Lieferanten Neuheit ', '0.5*AnzahlNeueLieferante*Std_Satz', 11),
(38, 'demandCategory.getAnzahlLieferantGesamt()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/6.25', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()/6.25', 'Preisbeschaffung Lieferanten Gesamt (6,25 lf/std)', 'AnzahlLieferantGesamt*Std_Satz/6.25', 11),
(39, '4*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Preisprüfung (1/2 Tag)', '4*STd_Satz', 11),
(40, 'demandCategory.getAnzahlGesamtArtikel()*demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/200', 'demandCategory.getCorrectionSchluessel().getValue()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/200', 'Stammdatenpflege (ASD, Modul)', 'AnzahlGesamtArtikel*KorrekturSchlüessel*Std_Satz/200', 12),
(41, 'demandCategory.getAnzahlGesamtArtikel()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/1000', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()/1000', 'Übersetzungsmanagement Stammdaten (1000 Art/std)', 'AnzahlGesamtArtikel*std_Satz/1000', 14),
(42, 'demandCategory.getAnzahlBeteiligten()', '4.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Abstimmungsgespräche', '4.5*AnzahlBeteiligten*Std_Satz', 27),
(43, 'demandCategory.getBearbeitungszeit()', 'demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Termin Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (1h)  ', 'Bearbeitungszeit*Anzahl_Beteiligten*Szd_Satz', 27),
(44, 'demandCategory.getAnzahlBeteiligten()*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/4', 'demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/4', 'Budget Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (15min)  ', 'AnzahlBeteiligten*Bearbeitungszeit*Std_Satz/4', 27),
(45, '0.25*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '0.25*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Berichtswesen: Festsatz/Laufzeit in Monaten / Stunde pro Monat (0,25 h)  ', '0.25*Bearbeitungszeit*Std_Satz', 27),
(46, '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Projektplanung = 6 std', '6*Std_Satz', 27),
(47, '1.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Projektvorbereitung = 1,5 std', '1.5*Std_Satz', 27),
(48, '12*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()*demandCategory.getAusgabe().getValuee()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()*demandCategory.getAusgabe().getValuee()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'Pauschale Kalkulation inkl. Prüfschleife und Abstimmung GF', '12*std_Satz*KatalogartFakt*WechselfssungFaktor*AusgabeFaktor', 28),
(49, '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()*demandCategory.getAusgabe().getValuee()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()*demandCategory.getAusgabe().getValuee()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'Nachkalkulation zur Druckvergabe', '6*std_Satz*KatalogartFakt*WechselfssungFaktor*AusgabeFaktor', 28),
(50, '3.6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'Bestellformular inkl. Baukastenanhang erstellen und prüfen', '3,6*Std_Satz*Wechselfassung_Faktor', 28),
(51, '8*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()', 'Planung inkl. Prüfschleifen und Freigaben', ' 8*Std_Satz *KatalogartFaktor', 28),
(52, '3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Händlerabwicklung', ' 3*StdSatz', 28),
(53, '4*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()', 'Präsentationserstellung', '4*Std_Satz*KatalogartFaktor', 28),
(54, '0.55*demandCategory.getTeilnehmerZahl()* demandCategory.getTeilnehmerZahlPricing()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()', '0.55*demandCategory.getTeilnehmerZahlPricing()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getKatalogart().getValuee()', 'Händlerabwicklung', '0.55*TeilnehmerAnzahl * KataloartFaktor* TeilnehmerzahlFaktor * PreisproTeilnehmer (da 0,55std/Teilnehmer)', 28),
(55, '4*0.45*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getBearbeitungszeit()', '0.45*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getBearbeitungszeit()', 'Dokumentation', ' 4* (0,45*Std_Satz * Produktionszeit)', 28),
(58, '0.04*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getUmfang()', '0.04*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Digitales Archiv', '0,04*Std_Satz* Anzahl_Seiten_Gesamt', 28),
(59, '0.008*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getUmfang()', '0.008*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Druckformschreibung', '0,008*Std_Satz*Anzahl_Seiten_Gesamt', 28),
(60, '4.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'Druckabnahme', '4,5*Std_Satz * Wechselfassung_Faktor', 28),
(61, '5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getWechselfassungVariantFaktor().getValue()', 'Verarbeitungsüberwachung', '5*Std_Satz*WechselfassungVarianteaktor', 28),
(62, '0.13*demandCategory.getTeilnehmerZahl()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getTeilnehmerZahlPricing()', '0.13*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getTeilnehmerZahlPricing()', 'Weiterberchnung (Vorbereitung und Durchführung)', 'Anzahl_Teilnehmer * PricePerTeilnehmer(ist 0.13*std_Satz)* Teilnhemerzahl_faktor', 28),
(63, '3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Endabrechnung (Pauschal)', '3*Std_Satz', 28),
(64, '2.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getTeilnehmerZahlPricing()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()*demandCategory.getTeilnehmerZahlPricing()', 'Erstellung und Auswertung von Befragungen (Pauschal)', '2,5* Std_Satz*TeilnehmerFaktor', 28),
(65, '8*demandCategory.getAnzahlNeueArtikel()*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/30', '8*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/30', 'Basisdatenpflege Neuheiten Information', '8*Anzahl_Artikel_Neu* LK_Schlüssel*Korrekturschlüssel*Prozessschlüssel*std_satz/30', 13),
(66, '8*demandCategory.getAnzahlBestandArtikel()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/90', '8*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/90', 'Basis Datenpflege Bestand Artikel', '8*AzahlBestandArtikel*Korrektuschluessek*Prozessschluessel*Std_Satz/90', 13),
(67, '2*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Ermittlung des Seitenumfanges', '2*Std_Stz_dtp', 15),
(68, '24*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Katalog-Check inkl. Expertise ', '24*Std_Stz_dtp', 15),
(69, '8*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Interner Kick-Off', '8*Std_Stz_dtp', 15),
(70, '16*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Statussitzungen', '16*Std_Stz_dtp', 15),
(71, '4*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Bildpflege und Verwaltung Fotolia', '4*Std_Stz_dtp', 15),
(72, '12*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Bildkonzeption und -shootbegleitung', '12*Std_Stz_dtp', 15),
(73, '0.25*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'CD-Verwaltung/Datenrückführung', '0.25*Std_Stz_dtp (15 min)', 15),
(74, '', '', 'Styleguide', '16*Std_Stz_dtp (Erstausgabe) // 8*Std_Stz_dtp (Folgeausgabe)', 15),
(75, '', '', 'Vorstufenbriefing', '8*Std_Stz_dtp (Erstausgabe) // 1.6*Std_Stz_dtp (Folgeausgabe)', 15),
(76, '4*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Vorstufenbetreuung', '4*Std_Stz_dtp', 15),
(77, '4*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Vorspann- und Baukasten', '4*Std_Stz_dtp', 15),
(78, '750', '750', 'Umschlagerstellung (Grundumschlag)', 'Konstante = 750', 15),
(79, '80*configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz_dtp'').getDefaultValue()', 'Programmierung', '80*Std_Stz_dtp', 15),
(80, '', '', 'Konzeptertellung', 'Auf Anfrage', 15),
(81, '1.90*demandCategory.getUmfang()', '1.90', 'Konzeptpauschale', ' Anzahl Gesamt Seiten * PreisPerSeite', 15),
(82, '1500', '1500', 'Übernahme Layoutprogrammierung/Testarbeiten', 'Pauschale 1500.00', 15),
(83, '1600', '1600', 'Layoutfreigabe', 'Pauschale 1600.00', 15),
(84, '', '', 'Seitengenerierung', ' Anzahl_Seiten_Genrierung * PreisPerSeite', 16),
(85, '120*demandCategory.getAnzahlSonderSeiten()', '120', 'Sonderseitenerstellung (manueller Aufbau)', 'AnzahlSonderseiten * PreisPerSeite', 16),
(86, '', '', 'Seitennachbearbeitung', 'Anzahl_Seiten_Genrierung * PricePerSeite', 16),
(87, '1*(demandCategory.getAnzahlSonderSeiten()+demandCategory.getAnzahlGenerierungUpdateSeiten())', '1', 'Screen PDFs 150 dpi (bei Comet 4 automatisiert über Server', '( Anzahl_SeitenGenerierung + Anzahl_Sonderseiten) * PricePerSeite', 16),
(88, '', '', 'Korrekturlauf inkl. Korrektor', '( Anzahl_SeitenGenerierung + Anzahl_Sonderseiten) * PricePerSeite', 16),
(89, '', '', 'Aktualisierung per Datenübernahme (bei Comet 4 über Redaktion) ', 'Anzahl_SeitenGenerierung_Update * PricePerseite', 17),
(90, '', '', 'Seitennachbearbeitung/ Korrekturen ausführen', 'Anzahl_GesamtSeiten * PricePerSeite', 17),
(91, '2.50*demandCategory.getUmfang()', '2.50', 'Erstellen Print PDFs für Digitalandruck (bei Comet 4 automatisiert über Server) ', 'Anzahl_GesamtSeiten * PricePerSeite', 17),
(92, '', '', 'Aktualisierung per Datenübernahme (Teilupdate auf Seitenbasis) (bei Comet 4 über Redaktion) ', '(Anzahl_SeitenGenerierung_Update/2) * PricePerseite', 18),
(93, '', '', 'Seitennachbearbeitung/ Korrekturen ausführen', '(Anzahl_SeitenGenerierung_Update/2) * PricePerseite', 18),
(94, '2.50*demandCategory.getUmfang()', '2.50', 'Datenbereitstellung für CTP (Print-PDF) (bei Comet 4 automatisiert über Server) ', '(Anzahl_SeitenGesamt) * PricePerseite', 18),
(95, '', '', 'Großplott-Korrekturen ', '10%_Anzahl_Gesamtseiten * PricePerSeite', 19),
(96, '3.50*demandCategory.getUmfang()', '3.50', 'Datenbereitstellung nach Projektende ', 'Anzahl_GesamtSeiten * PricePerSeite', 19),
(97, '1.50* demandCategory.getAnzahlGenerierungUpdateSeiten()', '1.50', 'Bereitstellung einer Excel-Liste (ArtikelNr && Seitenzahl)', 'Anzahl_SeitenGenerierung * PricePerSeite', 19),
(98, '25*demandCategory.getAnzahlIHVZSeiten()', '25.00', 'Erstellung/Generierung Inhaltsverzeichnis', 'Anzahl_IhV * PricePerSeite', 19),
(99, '', '25.00', 'Erstellung/Generierung ArtikelNrverzeichnis', 'Anzahl_ArtikelNrVer (10???)* PricePerSeite', 19),
(100, '5.60*demandCategory.getUmfang()', '5.60', 'Seitenrahmenlayout wechseln', 'Anzahl_GesamtSeiten * PricePerSeite', 19),
(101, '6.50*demandCategory.getUmfang()', '6.50', 'Update von Preisen', 'Anzahl_GesamtSeiten * PricePerSeite', 19),
(102, '6.50*demandCategory.getUmfang()', '6.50', 'Update von BestellNr', 'Anzahl_GesamtSeiten * PricePerSeite', 19),
(103, '6.50*demandCategory.getUmfang()', '6.50', 'Update von KG-Nummer ', 'Anzahl_GesamtSeiten * PricePerSeite', 19),
(104, '6.50*demandCategory.getUmfang()', '6.50', 'Update von Lieferkennzeichen', 'Anzahl_GesamtSeiten * PricePerSeite', 19),
(105, '', '', 'Nachbearbeitung nach Fremdsprachenupdate ohne Sortimentsveränderungen ', 'Anzahl_GesamtSeiten * PricePerSeite', 19),
(106, '', '', 'ECC Aufbereitung', '', 20),
(107, '', '', 'ECC Administration', '', 20),
(108, '57*demandCategory.getAnzahlGesamtProdukt()', '57.00', 'Bilder', ' Preis/Bild * Anzahl Bilder(Produkte)', 21),
(109, '57*demandCategory.getAnzahlGesamtProdukt()', '57.00', 'Animation', ' Preis/Animation * Anzahl Bilder(Produkte)', 21),
(110, '8*configurationItemFacade.findByName(''std_satz_fotograf'').getDefaultValue()', 'configurationItemFacade.findByName(''std_satz_fotograf'').getDefaultValue()', 'Fotograf inkl. Assistenz (8Std)', 'Anzah_Std * Std_Satz_Fotograf', 22),
(111, '8*configurationItemFacade.findByName(''std_satz_kind_model'').getDefaultValue()', 'configurationItemFacade.findByName(''std_satz_kind_model'').getDefaultValue()', 'Mit Kind als Model(8Std)', 'Anzah_Std * Std_Satz_Kind_Model', 22),
(112, '8*configurationItemFacade.findByName(''std_satz_erwachsene_model'').getDefaultValue()', 'configurationItemFacade.findByName(''std_satz_erwachsene_model'').getDefaultValue()', 'Mit Erwachsene als Model(8Std)', 'Anzah_Std * Std_Satz_Erwachsene_Model', 22),
(113, '', '', 'Cover', 'Auf Anfrage', 23),
(114, '125*demandCategory.getAnzahlGesamtProdukt()', '125.00', 'Tif, Vollformat, 300 dpi', 'PreisPerBild * Anzahl_Bilder', 29),
(115, '50*demandCategory.getAnzahlGesamtProdukt()', '50.00', 'jpg, lange Seite 10 cm, 300 dpi', 'PreisPerBild * Anzahl_Bilder', 29),
(116, '23*demandCategory.getAnzahlGesamtProdukt()', '23.00', 'Abbildung_jpg, 72 dpi ', 'PreisPerBild * Anzahl_Bilder', 29),
(117, '10*demandCategory.getAnzahlNeueProdukt()', '10.00', 'Freistellung', 'PreisPerBild * Anzahl_Bilder( Anzahl_Neue_Produkte)', 31),
(118, '9*demandCategory.getAnzahlNeueProdukt()', '9.00', 'Leichte Retusche ', 'PreisPerBild * Anzahl_Bilder( Anzahl_Neue_Produkte)', 31),
(119, '9*demandCategory.getAnzahlNeueProdukt()', '9.00', 'Sonstige Bearbeitung ', 'PreisPerBild * Anzahl_Bilder( Anzahl_Neue_Produkte)', 31),
(120, '2*demandCategory.getAnzahlNeueProdukt()', '2.00', 'Eimspielung / Abspeichern nach E/D/E Norm', 'PreisPerBild * Anzahl_Bilder( Anzahl_Neue_Produkte)', 31),
(121, '', '', 'Umfangreiche Retusche', 'Auf Anfrage', 31),
(122, '5000.00', '5000.00', 'Anpassung und Support von bestehende Programmierung', 'Pauschale 10 Arbeitstage', 25);

-- --------------------------------------------------------

--
-- Structure de la table `device`
--

CREATE TABLE `device` (
  `ID` bigint(20) NOT NULL,
  `BROWSER` varchar(255) DEFAULT NULL,
  `DEVICECATEGORIE` varchar(255) DEFAULT NULL,
  `OPERATINGSYSTEM` varchar(255) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL

--
-- Contenu de la table `device`
--

INSERT INTO `device` (`ID`, `BROWSER`, `DEVICECATEGORIE`, `OPERATINGSYSTEM`, `USER_LOGIN`) VALUES
(1, 'CHROME 59.0.3071.114', 'Personal computer', 'Windows', 'walo'),
(51, 'CHROME 59.0.3071.115', 'Personal computer', 'Windows', 'walo'),
(101, 'SAFARI 10.1.1', 'Personal computer', 'OS X', 'admin'),
(153, 'SAFARI 10.1.1', 'Personal computer', 'OS X', 'pm'),
(312, 'SAFARI 10.1.1', 'Personal computer', 'OS X', 'AM'),
(653, 'SAFARI 10.1.1', 'Personal computer', 'OS X', 'mtietgen'),
(857, 'SAFARI 10.1.1', 'Personal computer', 'OS X', 'tenzmann'),
(1103, 'SAFARI 10.1.1', 'Personal computer', 'OS X', 'mediait'),
(2351, 'CHROME 59.0.3071.115', 'Personal computer', 'Windows 7', 'walo');

-- --------------------------------------------------------

--
-- Structure de la table `farbigkeit`
--

CREATE TABLE `farbigkeit` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `farbigkeit`
--

INSERT INTO `farbigkeit` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('1/1 -farbig', NULL, NULL),
('2/2 -farbig', NULL, NULL),
('3/3 -farbig', NULL, NULL),
('4/4 c', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formatauswaehlen`
--

CREATE TABLE `formatauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `formatauswaehlen`
--

INSERT INTO `formatauswaehlen` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('A4', NULL, NULL),
('A5', NULL, NULL),
('A6', NULL, NULL),
('E5PLUS', NULL, NULL),
('F1926', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `historiqueconnexionuser`
--

CREATE TABLE `historiqueconnexionuser` (
  `ID` bigint(20) NOT NULL,
  `CONNEXION` tinyint(1) DEFAULT '0',
  `DATEACTION` datetime DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `historiqueconnexionuser`
--

INSERT INTO `historiqueconnexionuser` (`ID`, `CONNEXION`, `DATEACTION`, `USER_LOGIN`) VALUES
(2, 1, '2017-08-01 00:41:42', 'walo'),
(52, 1, '2017-08-01 00:50:15', 'walo'),
(102, 1, '2017-08-01 13:42:45', 'admin'),
(151, 1, '2017-08-01 13:44:15', 'admin'),
(152, 0, '2017-08-01 13:50:02', 'admin'),
(154, 1, '2017-08-01 13:50:08', 'pm'),
(201, 1, '2017-08-01 17:10:22', 'admin'),
(202, 0, '2017-08-01 17:11:01', 'admin'),
(203, 1, '2017-08-01 17:11:05', 'pm'),
(204, 0, '2017-08-01 17:11:14', 'pm'),
(205, 1, '2017-08-01 17:11:18', 'admin'),
(206, 0, '2017-08-01 17:25:31', 'admin'),
(207, 1, '2017-08-01 17:25:36', 'pm'),
(208, 0, '2017-08-01 17:33:51', 'pm'),
(209, 1, '2017-08-01 17:34:38', 'admin'),
(210, 1, '2017-08-02 09:17:19', 'admin'),
(251, 1, '2017-08-02 10:21:19', 'admin'),
(252, 1, '2017-08-02 10:46:45', 'admin'),
(253, 0, '2017-08-02 11:03:46', 'admin'),
(254, 1, '2017-08-02 11:03:52', 'pm'),
(255, 1, '2017-08-02 12:13:04', 'admin'),
(257, 0, '2017-08-02 12:18:03', 'admin'),
(258, 1, '2017-08-02 12:18:09', 'admin'),
(301, 1, '2017-08-02 12:33:09', 'admin'),
(302, 0, '2017-08-02 12:34:06', 'admin'),
(303, 1, '2017-08-02 12:34:15', 'pm'),
(304, 0, '2017-08-02 12:37:16', 'pm'),
(305, 1, '2017-08-02 12:37:20', 'admin'),
(306, 0, '2017-08-02 12:41:07', 'admin'),
(307, 1, '2017-08-02 12:41:17', 'admin'),
(308, 0, '2017-08-02 12:41:36', 'admin'),
(309, 1, '2017-08-02 12:41:48', 'admin'),
(310, 1, '2017-08-02 13:05:28', 'admin'),
(311, 0, '2017-08-02 13:06:54', 'admin'),
(313, 1, '2017-08-02 13:06:59', 'AM'),
(314, 0, '2017-08-02 13:08:05', 'AM'),
(315, 1, '2017-08-02 13:09:13', 'admin'),
(316, 1, '2017-08-02 13:54:28', 'admin'),
(351, 1, '2017-08-02 20:34:08', 'admin'),
(401, 1, '2017-08-02 20:49:35', 'pm'),
(451, 1, '2017-08-02 21:00:30', 'pm'),
(452, 0, '2017-08-02 21:08:26', 'pm'),
(453, 1, '2017-08-02 21:08:30', 'admin'),
(501, 1, '2017-08-02 21:13:24', 'admin'),
(551, 1, '2017-08-02 21:14:21', 'admin'),
(601, 1, '2017-08-03 09:24:14', 'pm'),
(602, 0, '2017-08-03 09:31:51', 'pm'),
(603, 1, '2017-08-03 09:31:59', 'admin'),
(604, 0, '2017-08-03 09:58:14', 'admin'),
(605, 1, '2017-08-03 09:58:18', 'pm'),
(606, 0, '2017-08-03 09:58:22', 'pm'),
(607, 1, '2017-08-03 09:58:25', 'admin'),
(608, 1, '2017-08-03 10:40:32', 'admin'),
(651, 1, '2017-08-03 11:29:33', 'admin'),
(652, 0, '2017-08-03 11:37:18', 'admin'),
(654, 1, '2017-08-03 11:37:24', 'mtietgen'),
(655, 0, '2017-08-03 11:37:30', 'mtietgen'),
(656, 1, '2017-08-03 11:37:38', 'mtietgen'),
(657, 0, '2017-08-03 11:38:15', 'mtietgen'),
(658, 1, '2017-08-03 11:38:20', 'admin'),
(659, 0, '2017-08-03 11:41:40', 'admin'),
(660, 1, '2017-08-03 11:41:50', 'mtietgen'),
(661, 0, '2017-08-03 11:43:23', 'mtietgen'),
(662, 1, '2017-08-03 11:43:27', 'admin'),
(663, 1, '2017-08-03 12:18:20', 'admin'),
(664, 0, '2017-08-03 12:21:06', 'admin'),
(665, 1, '2017-08-03 12:21:18', 'mtietgen'),
(666, 0, '2017-08-03 12:28:10', 'mtietgen'),
(667, 1, '2017-08-03 12:28:14', 'admin'),
(668, 1, '2017-08-03 12:49:59', 'admin'),
(669, 1, '2017-08-03 13:10:04', 'admin'),
(670, 0, '2017-08-03 13:11:41', 'admin'),
(671, 1, '2017-08-03 13:11:47', 'mtietgen'),
(672, 0, '2017-08-03 13:17:45', 'mtietgen'),
(673, 1, '2017-08-03 13:17:49', 'admin'),
(680, 0, '2017-08-03 13:40:45', 'admin'),
(681, 1, '2017-08-03 13:41:23', 'mtietgen'),
(682, 0, '2017-08-03 13:42:01', 'mtietgen'),
(683, 1, '2017-08-03 13:42:08', 'admin'),
(684, 0, '2017-08-03 13:43:00', 'admin'),
(685, 1, '2017-08-03 13:43:09', 'mtietgen'),
(701, 1, '2017-08-03 13:56:38', 'mtietgen'),
(702, 0, '2017-08-03 14:03:39', 'mtietgen'),
(703, 1, '2017-08-03 14:03:43', 'admin'),
(704, 0, '2017-08-03 14:04:06', 'admin'),
(705, 1, '2017-08-03 14:04:13', 'mtietgen'),
(706, 0, '2017-08-03 14:09:22', 'mtietgen'),
(707, 1, '2017-08-03 14:09:26', 'admin'),
(708, 0, '2017-08-03 14:09:50', 'admin'),
(709, 1, '2017-08-03 14:09:59', 'mtietgen'),
(710, 0, '2017-08-03 14:15:29', 'mtietgen'),
(711, 1, '2017-08-03 14:15:35', 'admin'),
(751, 1, '2017-08-03 14:44:46', 'admin'),
(752, 1, '2017-08-03 15:04:52', 'admin'),
(801, 1, '2017-08-04 08:04:43', 'admin'),
(802, 0, '2017-08-04 08:08:04', 'admin'),
(851, 1, '2017-08-04 08:11:04', 'admin'),
(852, 0, '2017-08-04 08:40:27', 'admin'),
(853, 1, '2017-08-04 08:40:31', 'admin'),
(854, 0, '2017-08-04 08:42:31', 'admin'),
(855, 1, '2017-08-04 08:42:36', 'admin'),
(856, 0, '2017-08-04 08:46:40', 'admin'),
(858, 1, '2017-08-04 08:46:47', 'tenzmann'),
(859, 0, '2017-08-04 08:46:52', 'tenzmann'),
(860, 1, '2017-08-04 08:46:59', 'tenzmann'),
(861, 0, '2017-08-04 08:51:22', 'tenzmann'),
(862, 1, '2017-08-04 08:51:27', 'admin'),
(901, 1, '2017-08-04 09:14:35', 'tenzmann'),
(902, 0, '2017-08-04 09:14:46', 'tenzmann'),
(903, 1, '2017-08-04 09:14:51', 'admin'),
(904, 0, '2017-08-04 09:15:05', 'admin'),
(905, 1, '2017-08-04 09:15:11', 'tenzmann'),
(951, 1, '2017-08-04 09:17:36', 'tenzmann'),
(1001, 1, '2017-08-04 09:18:19', 'tenzmann'),
(1051, 1, '2017-08-04 09:20:02', 'tenzmann'),
(1052, 0, '2017-08-04 09:23:52', 'tenzmann'),
(1053, 1, '2017-08-04 09:23:56', 'admin'),
(1101, 1, '2017-08-04 09:47:40', 'admin'),
(1102, 0, '2017-08-04 09:48:48', 'admin'),
(1104, 1, '2017-08-04 09:48:54', 'mediait'),
(1105, 0, '2017-08-04 09:49:00', 'mediait'),
(1106, 1, '2017-08-04 09:49:07', 'mediait'),
(1151, 1, '2017-08-04 09:56:01', 'admin'),
(1152, 0, '2017-08-04 10:14:27', 'admin'),
(1153, 1, '2017-08-04 10:14:36', 'mediait'),
(1201, 1, '2017-08-04 10:24:22', 'admin'),
(1251, 1, '2017-08-04 10:25:43', 'admin'),
(1264, 0, '2017-08-04 11:21:11', 'admin'),
(1301, 1, '2017-08-04 11:21:35', 'admin'),
(1351, 1, '2017-08-06 18:56:24', 'admin'),
(1401, 1, '2017-08-06 18:58:27', 'admin'),
(1451, 1, '2017-08-06 19:07:54', 'admin'),
(1501, 1, '2017-08-06 19:11:23', 'admin'),
(1503, 0, '2017-08-06 19:13:19', 'admin'),
(1504, 1, '2017-08-06 19:13:23', 'admin'),
(1551, 1, '2017-08-06 19:15:20', 'admin'),
(1552, 0, '2017-08-06 19:17:49', 'admin'),
(1553, 1, '2017-08-06 19:17:53', 'admin'),
(1554, 0, '2017-08-06 19:18:30', 'admin'),
(1555, 1, '2017-08-06 19:18:35', 'admin'),
(1601, 1, '2017-08-06 19:38:39', 'admin'),
(1651, 1, '2017-08-06 19:49:18', 'admin'),
(1701, 1, '2017-08-06 19:53:27', 'admin'),
(1751, 1, '2017-08-06 19:55:48', 'admin'),
(1801, 1, '2017-08-06 20:09:37', 'admin'),
(1851, 1, '2017-08-06 20:15:38', 'admin'),
(1901, 1, '2017-08-06 20:20:05', 'admin'),
(1915, 0, '2017-08-06 20:37:01', 'admin'),
(1916, 1, '2017-08-06 20:37:05', 'admin'),
(1951, 1, '2017-08-06 20:53:46', 'admin'),
(1955, 0, '2017-08-06 21:00:15', 'admin'),
(1956, 1, '2017-08-06 21:01:23', 'admin'),
(2001, 1, '2017-08-06 22:48:22', 'admin'),
(2002, 1, '2017-08-06 22:53:55', 'admin'),
(2051, 1, '2017-08-06 23:04:38', 'admin'),
(2101, 1, '2017-08-06 23:08:58', 'admin'),
(2151, 1, '2017-08-06 23:10:05', 'admin'),
(2201, 1, '2017-08-07 08:09:52', 'admin'),
(2251, 1, '2017-08-07 08:19:57', 'admin'),
(2252, 1, '2017-08-07 08:50:44', 'admin'),
(2301, 1, '2017-08-07 09:57:13', 'admin'),
(2352, 1, '2017-08-07 11:36:25', 'walo'),
(2401, 1, '2017-08-07 11:45:39', 'walo'),
(2451, 1, '2017-08-07 11:54:57', 'walo'),
(2501, 1, '2017-08-07 12:49:44', 'walo'),
(2502, 1, '2017-08-07 12:57:34', 'walo'),
(2551, 1, '2017-08-07 13:04:49', 'walo'),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `katalogart`
--

CREATE TABLE `katalogart` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `katalogart`
--

INSERT INTO `katalogart` (`ID`, `NAME`, `VALUEE`) VALUES
(1, 'Lagerliste', '1.00'),
(2, 'E/D/E Katalog', '1.10'),
(3, 'Individueller Katalog', '1.15'),
(4, 'Fremdsprachen Katalog', '1.00'),
(51, 'Preisliste', '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `konzeptbearbeitungfaktor`
--

CREATE TABLE `konzeptbearbeitungfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `WERT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `konzeptbearbeitungfaktor`
--

INSERT INTO `konzeptbearbeitungfaktor` (`ID`, `EXPRESSION`, `WERT`) VALUES
(1, 'Ja', '1.35'),
(2, 'Nein', '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `layout`
--

CREATE TABLE `layout` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `layout`
--

INSERT INTO `layout` (`ID`, `NAME`, `VALUEE`) VALUES
(1, 'Einfach', '1.00'),
(2, 'Standard', '1.10'),
(3, 'Komplex', '1.15'),
(52, 'individuelles', '1.70');

-- --------------------------------------------------------

--
-- Structure de la table `layoutpricing`
--

CREATE TABLE `layoutpricing` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `DEPARTEMENTCRITERIAITEM_ID` bigint(20) DEFAULT NULL,
  `LAYOUT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `layoutpricing`
--

INSERT INTO `layoutpricing` (`ID`, `PRICE`, `DEPARTEMENTCRITERIAITEM_ID`, `LAYOUT_ID`) VALUES
(674, '10.00', 84, 1),
(675, '12.00', 84, 2),
(676, '14.00', 84, 3),
(677, '20.00', 86, 1),
(678, '25.00', 86, 2),
(679, '35.00', 86, 3),
(1252, '11.50', 88, 1),
(1253, '11.50', 88, 2),
(1254, '14.00', 88, 3),
(1255, '10.00', 89, 1),
(1256, '12.00', 89, 2),
(1257, '14.00', 89, 3),
(1258, '15.00', 90, 1),
(1259, '17.00', 90, 2),
(1260, '25.00', 90, 3),
(1264, '20.00', 86, 1),
(1265, '25.00', 86, 2),
(1266, '35.00', 86, 3),
(1267, '15.00', 95, 1),
(1268, '15.00', 95, 2),
(1269, '16.00', 95, 3),
(1270, '10.00', 105, 1),
(1271, '12.50', 105, 2),
(1272, '12.50', 105, 3);

-- --------------------------------------------------------

--
-- Structure de la table `mitgliederkorrekturfaktor`
--

CREATE TABLE `mitgliederkorrekturfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `WERT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `mitgliederkorrekturfaktor`
--

INSERT INTO `mitgliederkorrekturfaktor` (`ID`, `EXPRESSION`, `WERT`) VALUES
(2, 'Ja', '1.05'),
(3, 'Nein', '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `nachsatz`
--

CREATE TABLE `nachsatz` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `COVER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `nachsatz`
--

INSERT INTO `nachsatz` (`ID`, `EXPRESSION`, `PRICE`, `COVER_ID`) VALUES
(1902, 'Nein', '0.00', 'Softcover'),
(1903, '3 Seiten 1/0-fbg. Skala', '99.70', 'Hardcover'),
(1904, '3 Seiten 1/1-fbg. Skala', '199.40', 'Hardcover'),
(1905, '3 Seiten 4/0-fbg. Skala', '258.53', 'Hardcover'),
(1906, '3 Seiten 4/4-fbg. Skala', '352.79', 'Hardcover');

-- --------------------------------------------------------

--
-- Structure de la table `nachspann`
--

CREATE TABLE `nachspann` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `nachspann`
--

INSERT INTO `nachspann` (`ID`, `EXPRESSION`, `VALUE`) VALUES
(1907, '4 Seiten, 1/1-fbg. Skala', '199.40'),
(1908, '4 Seiten, 1/1-fbg. Sonderfarbe', '199.40'),
(1909, '4 Seiten, 2/2-fbg. Skala', '250.53'),
(1910, '4 Seiten, 2/2-fbg. Skala + 1 Sonderfarbe', '250.53'),
(1911, '4 Seiten, 3/3-fbg. Skala', '301.66'),
(1912, '4 Seiten, 3/3-fbg. Skala + 1 Sonderfarbe', '301.66'),
(1913, '4 Seiten, 3/3-fbg. Skala + 2 Sonderfarben', '301.66'),
(1914, '4 Seiten, 4/4-fbg. Skala', '352.79');

-- --------------------------------------------------------

--
-- Structure de la table `papiermaterialauswaehlen`
--

CREATE TABLE `papiermaterialauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `papiermaterialauswaehlen`
--

INSERT INTO `papiermaterialauswaehlen` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('65 g/qm', NULL, NULL),
('70 g/qm', NULL, NULL),
('80 g/qm', NULL, NULL),
('85 g/qm', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `participantfaktor`
--

CREATE TABLE `participantfaktor` (
  `ID` bigint(20) NOT NULL,
  `PERCENT` int(11) DEFAULT NULL,
  `WERT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `participantfaktor`
--

INSERT INTO `participantfaktor` (`ID`, `PERCENT`, `WERT`) VALUES
(1, 20, '1.00'),
(2, 21, '1.00'),
(3, 36, '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `CATEGORY_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `product`
--

INSERT INTO `product` (`ID`, `DESCRIPTION`, `LABEL`, `CATEGORY_ID`) VALUES
(1, NULL, 'Premium EWZ', 1),
(2, NULL, 'Fortis WZ', 1),
(3, NULL, 'Industrietechnik', 1),
(4, NULL, 'Baugerät', 1),
(5, NULL, 'LL Gartentechnik', 1),
(6, NULL, 'Plus1 Nachdruck', 1),
(7, '', 'Haustechnik 2017', 1);

-- --------------------------------------------------------

--
-- Structure de la table `prozess`
--

CREATE TABLE `prozess` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `prozess`
--

INSERT INTO `prozess` (`ID`, `NAME`, `VALUEE`) VALUES
(5, 'Proz.Neu / Tech.Alt', '1.20'),
(6, 'Prozess.Neu / Tech.Neu', '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `ID` bigint(20) NOT NULL,
  `QUESTION` varchar(255) DEFAULT NULL,
  `REPONSE` varchar(255) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL
(2601, 1, '2017-08-07 13:08:33', 'walo'),
(2651, 1, '2017-08-07 14:15:08', 'walo'),
(2652, 1, '2017-08-07 14:16:43', 'walo');

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`ID`, `QUESTION`, `REPONSE`, `USER_LOGIN`) VALUES
(1, 'your city', 'rabat', 'walo'),
(2, 'your city', 'rabat', 'walo'),
(3, 'your city', 'rabat', 'walo');

-- --------------------------------------------------------

--
-- Structure de la table `register`
--

CREATE TABLE `register` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `register`
--

INSERT INTO `register` (`ID`, `EXPRESSION`, `PRICE`) VALUES
(51, 'Ja', '1.00'),
(2003, 'Nein', '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `schluessel`
--

CREATE TABLE `schluessel` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `WERT` decimal(10,2) DEFAULT NULL,
  `SCHLUESSELTYPE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `schluessel`
--

INSERT INTO `schluessel` (`ID`, `DESCRIPTION`, `LABEL`, `WERT`, `SCHLUESSELTYPE_ID`) VALUES
(1, 'Hier soll BIld oder Beschreibung', 'Einfach', '1.00', 2),
(2, 'Hier soll BIld oder Beschreibung', 'Standard', '1.00', 2),
(3, 'Hier soll BIld oder Beschreibung', 'Komplex', '1.00', 2),
(4, 'Hier soll BIld oder Beschreibung', 'Erstausgabe', '1.00', 1),
(5, 'Hier soll BIld oder Beschreibung', 'Folgeausgabe', '0.00', 1),
(6, 'Hier soll BIld oder Beschreibung', 'Lagerliste', '1.00', 3),
(7, 'Hier soll BIld oder Beschreibung', 'E/D/E Katalog', '1.00', 3),
(8, 'Hier soll BIld oder Beschreibung', 'Individueller Katalog', '1.00', 3),
(9, 'Hier soll BIld oder Beschreibung', 'Fremdsprachen-Katalog', '1.00', 3),
(10, NULL, 'Proz.neu / Tech. Alt', '1.00', 4),
(11, NULL, 'Proz.neu / Tech.Neu', '1.00', 4),
(12, NULL, 'Datenmanagemnt', '56.00', 5),
(13, NULL, 'Contentmanagement', '56.00', 5),
(14, NULL, 'Assetmanagement', '56.00', 5),
(15, NULL, 'Allgemein', '56.00', 5),
(16, 'rettest', '', '1.00', 6);

-- --------------------------------------------------------

--
-- Structure de la table `schluesseltype`
--

CREATE TABLE `schluesseltype` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `schluesseltype`
--

INSERT INTO `schluesseltype` (`ID`, `NAME`) VALUES
(1, 'Ausgabe'),
(2, 'Layout'),
(3, 'Katalogart'),
(4, 'Prozess/Technik'),
(5, 'Kostenschlüssel'),
(6, 'taoufik_key');

-- --------------------------------------------------------

--
-- Structure de la table `seiten`
--

CREATE TABLE `seiten` (
  `ID` bigint(20) NOT NULL,
  `NBREPAGE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `seiten`
--

INSERT INTO `seiten` (`ID`, `NBREPAGE`) VALUES
(78, 1),
(79, 2),
(80, 4),
(81, 8),
(82, 16),
(83, 24),
(84, 32),
(85, 64),
(86, 80),
(87, 100),
(88, 148),
(89, 200),
(90, 244),
(91, 300),
(92, 324),
(93, 400),
(94, 452),
(95, 500),
(96, 548),
(97, 600),
(98, 644),
(99, 700),
(100, 752),
(101, 800),
(102, 852),
(103, 900),
(104, 964),
(105, 1000),
(106, 1056),
(107, 1104),
(108, 1152),
(109, 1200),
(110, 1264),
(111, 1312),
(112, 1360),
(113, 1408),
(114, 1472),
(115, 1504),
(116, 1568),
(117, 1600),
(118, 1680),
(119, 1760);

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `sortiment`
--

CREATE TABLE `sortiment` (
  `ID` bigint(20) NOT NULL,
  `ARTIKELPERPAGE` decimal(10,2) DEFAULT NULL,
  `LKSCHLUESSEL` decimal(10,2) DEFAULT NULL,
  `MKSCHLUESSEL` decimal(10,2) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRODUCTSCHLUESSEL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sortiment`
--

INSERT INTO `sortiment` (`ID`, `ARTIKELPERPAGE`, `LKSCHLUESSEL`, `MKSCHLUESSEL`, `NAME`, `PRODUCTSCHLUESSEL`) VALUES
(1, '15.80', '1.10', '1.05', 'Arbeitsschutz', '4.70'),
(2, '16.10', '1.00', '1.00', 'Baubeschläge', '4.80'),
(3, '8.40', '1.00', '1.00', 'Baugeräte', '2.50'),
(4, '26.90', '1.00', '1.00', 'Befestigungstechnik', '8.00'),
(5, '12.10', '1.10', '1.05', 'Betriebseinrichtungen', '3.60'),
(6, '5.38', '1.15', '1.08', 'Elektrowerkzeuge', '1.60'),
(7, '5.70', '1.00', '1.00', 'Gartentechnik', '2.00'),
(8, '11.10', '1.00', '1.01', 'Handwerkzeuge', '3.30'),
(9, '6.10', '1.00', '1.00', 'Haustechnik/Innendeko/Elektroinstallation', '1.80'),
(10, '17.50', '1.00', '1.00', 'Industrietechnik', '5.20'),
(11, '9.10', '1.00', '1.00', 'Möbelbeschläge', '2.70'),
(12, '10.00', '1.05', '1.03', 'Präzisionswerkzeuge', '7.60'),
(13, '9.10', '1.08', '1.04', 'Schweißtechnik', '2.70'),
(14, '12.40', '1.00', '1.00', 'Verpackungen', '3.70'),
(15, '5.70', '1.05', '1.05', 'Werkstattmaterial', '1.70'),
(16, '11.10', '1.03', '1.01', 'Werkzeuge Holzbearbeitung', '3.30'),
(17, '11.10', '1.03', '1.01', 'Werkzeuge Metallbearbeitung', '3.30');

-- --------------------------------------------------------

--
-- Structure de la table `sotimentitem`
--

CREATE TABLE `sotimentitem` (
  `ID` bigint(20) NOT NULL,
  `WERT` decimal(10,2) DEFAULT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL,
  `SORTIMENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `sotimentitem`
--

INSERT INTO `sotimentitem` (`ID`, `WERT`, `DEMANDCATEGORY_ID`, `SORTIMENT_ID`) VALUES
(57, '100.00', 34, 1),
(58, '100.00', 35, 1),
(62, '100.00', 39, 4),
(64, '100.00', 41, 2),
(65, '100.00', 42, 7),
(66, '100.00', 43, 9),
(67, '100.00', 44, 9),
(68, '100.00', 45, 3),
(71, '100.00', 48, 6),
(72, '100.00', 49, 4),
(73, '100.00', 50, 4),
(74, '100.00', 51, 5),
(75, '10.00', 52, 6),
(76, '90.00', 52, 5),
(77, '100.00', 53, 3),
(81, '100.00', 57, 2),
(82, '100.00', 58, 4),
(83, '100.00', 59, 3),
(93, '100.00', 69, 6),
(95, '100.00', 71, 3),
(96, '100.00', 72, 3),
(97, '100.00', 73, 3),
(100, '100.00', 76, 5),
(105, '100.00', 81, 5),
(117, '90.00', 93, 5),
(118, '10.00', 93, 4),
(119, '100.00', 94, 5),
(121, '100.00', 96, 5),
(122, '40.00', 97, 5),
(123, '60.00', 97, 4),
(124, '100.00', 98, 6),
(125, '100.00', 99, 4),
(129, '100.00', 103, 9),
(132, '100.00', 106, 9),
(133, '100.00', 107, 9),
(157, '100.00', 131, 5),
(165, '100.00', 136, 6),
(167, '100.00', 138, 10),
(174, '100.00', 145, 5),
(179, '100.00', 150, 3),
(182, '100.00', 153, 7),
(184, '100.00', 155, 4),
(186, '100.00', 157, 9),
(189, '100.00', 160, 7),
(190, '100.00', 161, 10),
(191, '100.00', 162, 6),
(192, '100.00', 163, 4),
(193, '100.00', 164, 6),
(194, '100.00', 165, 6),
(195, '100.00', 166, 6),
(196, '100.00', 167, 10),
(198, '100.00', 169, 10),
(199, '100.00', 170, 3),
(200, '100.00', 171, 12);

-- --------------------------------------------------------

--
-- Structure de la table `teilnehmerzahlpricing`
--

CREATE TABLE `teilnehmerzahlpricing` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `TEILNEHMERZAHLMAX` int(11) DEFAULT NULL,
  `TEILNEHMERZAHLMAXOPERATOR` varchar(255) DEFAULT NULL,
  `TEILNEHMERZAHLMIN` int(11) DEFAULT NULL,
  `TEILNEHMERZAHLMINOPERATOR` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `teilnehmerzahlpricing`
--

INSERT INTO `teilnehmerzahlpricing` (`ID`, `PRICE`, `TEILNEHMERZAHLMAX`, `TEILNEHMERZAHLMAXOPERATOR`, `TEILNEHMERZAHLMIN`, `TEILNEHMERZAHLMINOPERATOR`) VALUES
(1, '1.00', 20, '<=', 0, '>='),
(2, '1.20', 35, '<=', 20, '>'),
(3, '1.35', 100000, '<=', 35, '>');

-- --------------------------------------------------------

--
-- Structure de la table `umschlagfarbigkeit`
--

CREATE TABLE `umschlagfarbigkeit` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `umschlagfarbigkeit`
--

INSERT INTO `umschlagfarbigkeit` (`ID`, `DESCRIPTION`, `LABEL`) VALUES
(20, 'Firmeneindruck', 'Firmeneindruck'),
(21, 'Individueller Sonderumschlag', 'Individueller Sonderumschlag');

-- --------------------------------------------------------

--
-- Structure de la table `umschlagfarbigkeitelement`
--

CREATE TABLE `umschlagfarbigkeitelement` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `COVER_ID` varchar(255) DEFAULT NULL,
  `UMSCHLAGFARBIGKEIT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `umschlagfarbigkeitelement`
--

INSERT INTO `umschlagfarbigkeitelement` (`ID`, `EXPRESSION`, `PRICE`, `COVER_ID`, `UMSCHLAGFARBIGKEIT_ID`) VALUES
(1, '1/0-fbg. Skala', '92.03', NULL, 20),
(2, '1/0-Sonderfarbe', '92.03', NULL, 20),
(3, '2/0-fbg. Skala', '168.72', NULL, 20),
(4, '2/0-fbg. Skala+1 Sonderfarbe', '168.72', NULL, 20),
(5, '3/0-fbg. Skala', '245.41', NULL, 20),
(6, '3/0-fbg. Skala+1 Sonderfarbe', '245.41', NULL, 20),
(7, '4/0-fbg. Skala', '322.10', NULL, 20),
(10, '5/0-fbg. Skala+1 Sonderfarbe', '398.79', NULL, 20),
(21, '4/0-fbg. Skala', '322.00', 'Hardcover', 21),
(22, '5/0-fbg. Skala+1 Sonderfarbe', '398.00', 'Hardcover', 21),
(23, '6/0-fbg. Skala+2 Sonderfarbe', '475.00', 'Hardcover', 21),
(24, '7/0-fbg. Skala+3 Sonderfarbe', '552.00', 'Hardcover', 21),
(25, '4/0-fbg. Skala', '322.00', 'Softcover', 21),
(26, '4/1-fbg. Skala', '414.00', 'Softcover', 21),
(27, '4/2-fbg. Skala', '490.00', 'Softcover', 21),
(28, '4/3-fbg. Skala', '567.00', 'Softcover', 21),
(29, '4/4-fbg. Skala', '644.00', 'Softcover', 21),
(30, '5/0-fbg. Skala+1 Sonderfarbe', '398.00', 'Softcover', 21),
(31, '5/2-fbg. Skala+1 Sonderfarbe', '490.00', 'Softcover', 21),
(32, '5/3-fbg. Skala+1 Ssonderfarbe', '567.00', 'Softcover', 21),
(33, '5/4-fbg. Skala+1 Sonderfarbe', '644.00', 'Softcover', 21),
(34, '5/5-fbg. Skala+1 Sonderfarbe', '720.00', 'Softcover', 21),
(35, '6/0-fbg. Skala+2 Sonderfarbe', '797.00', 'Softcover', 21),
(36, '7/0-fbg. Skala+3 Sonderfarbe', '475.00', 'Softcover', 21),
(37, '7/0-fbg. Skala+3 Sonderfarbe', '552.00', 'Softcover', 21);

-- --------------------------------------------------------

--
-- Structure de la table `umschlagpapierauswaehlen`
--

CREATE TABLE `umschlagpapierauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
('SEQ_GEN', '0');
--

-- Structure de la table `user`
CREATE TABLE `user` (
  `LOGIN` varchar(255) NOT NULL,
  `ADMIN` int(11) DEFAULT NULL,
  `BLOCKED` int(11) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `MDPCHANGED` tinyint(1) DEFAULT '0',
  `NBRCNX` int(11) DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `TEL` varchar(255) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`LOGIN`, `ADMIN`, `BLOCKED`, `EMAIL`, `MDPCHANGED`, `NBRCNX`, `NOM`, `PASSWORD`, `PRENOM`, `TEL`, `DEPARTEMENT_ID`) VALUES
('admin', 1, 0, 'admin@ede.de', 1, 0, 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Admin', '012345', NULL),
('ana', 0, 0, 'ana', 1, 0, 'ana', 'b6d4a89ccde3fb8fc69865ac105801287867cf735adf0b8bbca86ee9186f7b64', 'ana', '00000', 1),
('anas', 0, 0, 'user@gmail.com', 1, 0, 'anas', 'c157889e0fd5d7fc0d9a8d951fd64604ebeeb441de6519433dd8f931493dd5da', 'anas', '06', 1),
('dmd', 0, 0, '', 1, 3, 'dm', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', '', 2),
('kiki', 1, 0, 'kiki', 1, 0, 'kiki', '888da5db853449fff82b07cbdbf7c755ece0783aa670bb36cc5c4cc9a68fb864', 'kiki', 'kiki', NULL),
('kkk', 0, 0, 'k', 0, 0, 'kkkk', '503afc4bd66d51aeda05cbcdbf07ad0d560d03fe0819f365629c48299e92b539', 'k', 'k', NULL),
('mbrauer', 0, 0, 'Mandy. Brauer@ede.de', 0, 0, 'Brauer', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Mandy', '+49 202 6096-3079', 2),
('mediait', 0, 0, '', 1, 0, 'mediait', '7b136cfd7e928ddf278620c5c9d3450ef7a713340399440401134c9e36e316c6', '', '', 6),
('mediIT', 0, 0, 'mediIT@ede.de', 1, 0, '', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '', 6),
('mschwandt', 1, 0, 'Michaela. Schwandt@ede.de', 0, 0, 'Schwandt', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Michaela', '+49 202 6096-249', NULL),
('mtietgen', 0, 0, 'michael.tietgen@ede.de', 1, 0, 'Tietgen', '7b136cfd7e928ddf278620c5c9d3450ef7a713340399440401134c9e36e316c6', 'Michael', '', 3),
('pm', 0, 0, 'pm@ede.de', 1, 0, 'pm', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'pm', '123456', 4),
('SScheuerer', 0, 0, 'Stefan. Scheuerer@ede.de', 0, 0, 'Scheuerer ', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Stefan', '+49 202 6090-1218', 1),
('tenzmann', 0, 0, '', 1, 0, 'Enzmann', '7b136cfd7e928ddf278620c5c9d3450ef7a713340399440401134c9e36e316c6', 'Till', '', 5),
('walo', 1, 0, 'walo', 1, 0, 'walo', '41d119f6079d09b46a5c950a03b455c99ec6c9b6f1726401a52c85d0b17d4b54', 'walo', '00000', NULL),
('younes', 1, 0, 'younes@gmail.com', 1, 0, 'zouani', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'younes', '06', 1);

-- --------------------------------------------------------

--
-- Structure de la table `veredlung`
--

CREATE TABLE `veredlung` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `vorspann`
--

CREATE TABLE `vorspann` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `vorspann`
--

INSERT INTO `vorspann` (`ID`, `EXPRESSION`, `VALUE`) VALUES
(1, '4 Seiten, 1/1-fbg. Skala\r4 Seiten, 1/1-fbg. Skala4 Seiten, 1/1-fbg. Skala', '199.40'),
(2, '4 Seiten, 1/1-fbg. Sonderfarbe', '199.40'),
(3, '4 Seiten, 2/2-fbg. Skala\r4 Seiten, 2/2-fbg. Skala\r', '250.53'),
(4, '4 Seiten, 2/2-fbg. Skala + 1 Sonderfarbe', '250.53'),
(5, '4 Seiten, 3/3-fbg. Skala', '301.66'),
(6, '4 Seiten, 3/3-fbg. Skala + 1 Sonderfarbe', '301.66'),
(7, '4 Seiten, 3/3-fbg. Skala + 2 Sonderfarben', '301.66'),
(8, '4 Seiten, 4/4-fbg. Skala', '352.79'),
(9, '4 Seiten, 5/5-fbg. Skala + 1 Sonderfarbe ', '429.48'),
(10, '8 Seiten, 1/1-fbg. Skala', '398.81'),
(11, '8 Seiten, 1/1-fbg. Sonderfarbe', '398.81'),
(12, '8 Seiten, 2/2-fbg. Skala', '501.07'),
(13, '8 Seiten, 2/2-fbg. Skala + 1 Sonderfarbe', '501.07'),
(14, '8 Seiten, 3/3-fbg. Skala', '603.32'),
(15, '8 Seiten, 3/3-fbg. Skala + 1 Sonderfarbe', '603.32'),
(16, '8 Seiten, 3/3-fbg. Skala + 2 Sonderfarben', '603.32'),
(17, '8 Seiten, 4/4-fbg. Skala ', '705.58');

-- --------------------------------------------------------

--
-- Structure de la table `wechselfassungvariantfaktor`
--

CREATE TABLE `wechselfassungvariantfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wechselfassungvariantfaktor`
--

INSERT INTO `wechselfassungvariantfaktor` (`ID`, `EXPRESSION`, `VALUE`) VALUES
(1, 'Ja', '1.20'),
(2, 'Nein', '1.00');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `artderweiterverarbeitung`
--
ALTER TABLE `artderweiterverarbeitung`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `auflage`
--
ALTER TABLE `auflage`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `auflageseitencovermatrix`
--
ALTER TABLE `auflageseitencovermatrix`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_SEITEN_ID` (`SEITEN_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_FORMATAUSWAEHLEN_ID` (`FORMATAUSWAEHLEN_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_COVER_ID` (`COVER_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_AUFLAGE_ID` (`AUFLAGE_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_FARBIGKEIT_ID` (`FARBIGKEIT_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_BAUKASTEN_ID` (`BAUKASTEN_ID`);

--
-- Index pour la table `ausgabe`
--
ALTER TABLE `ausgabe`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `ausgabepricing`
--
ALTER TABLE `ausgabepricing`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_AUSGABEPRICING_AUSGABE_ID` (`AUSGABE_ID`);

--
-- Index pour la table `backup`
--
ALTER TABLE `backup`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `baukasten`
--
ALTER TABLE `baukasten`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `baukastenpricing`
--
ALTER TABLE `baukastenpricing`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_BAUKASTENPRICING_BAUKASTEN_ID` (`BAUKASTEN_ID`),
  ADD KEY `FK_BAUKASTENPRICING_COVER_ID` (`COVER_ID`);

--
-- Index pour la table `bindung`
--
ALTER TABLE `bindung`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `configurationitem`
--
ALTER TABLE `configurationitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_CONFIGURATIONITEM_CONFIGURATION_ID` (`CONFIGURATION_ID`);

--
-- Index pour la table `correctionschluessel`
--
ALTER TABLE `correctionschluessel`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `cover`
--
ALTER TABLE `cover`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `demandcategory`
--
ALTER TABLE `demandcategory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDCATEGORY_PROZESS_ID` (`PROZESS_ID`),
  ADD KEY `FK_DEMANDCATEGORY_REGISTER_ID` (`REGISTER_ID`),
  ADD KEY `FK_DEMANDCATEGORY_CORRECTIONSCHLUESSEL_ID` (`CORRECTIONSCHLUESSEL_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PRODUCT_ID` (`PRODUCT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_CATEGORY_ID` (`CATEGORY_ID`),

--
-- Contraintes pour la table `schluessel`
--
ALTER TABLE `schluessel`
  ADD CONSTRAINT `FK_SCHLUESSEL_SCHLUESSELTYPE_ID` FOREIGN KEY (`SCHLUESSELTYPE_ID`) REFERENCES `schluesseltype` (`ID`);

--
-- Contraintes pour la table `sotimentitem`
--
ALTER TABLE `sotimentitem`
  ADD CONSTRAINT `FK_SOTIMENTITEM_DEMANDCATEGORY_ID` FOREIGN KEY (`DEMANDCATEGORY_ID`) REFERENCES `demandcategory` (`ID`),
  ADD CONSTRAINT `FK_SOTIMENTITEM_SORTIMENT_ID` FOREIGN KEY (`SORTIMENT_ID`) REFERENCES `sortiment` (`ID`);

--
-- Contraintes pour la table `umschlagfarbigkeitelement`
--
ALTER TABLE `umschlagfarbigkeitelement`
  ADD CONSTRAINT `FK_UMSCHLAGFARBIGKEITELEMENT_COVER_ID` FOREIGN KEY (`COVER_ID`) REFERENCES `cover` (`ID`),
  ADD CONSTRAINT `FK_UMSCHLAGFARBIGKEITELEMENT_UMSCHLAGFARBIGKEIT_ID` FOREIGN KEY (`UMSCHLAGFARBIGKEIT_ID`) REFERENCES `umschlagfarbigkeit` (`ID`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_DEPARTEMENT_ID` FOREIGN KEY (`DEPARTEMENT_ID`) REFERENCES `departement` (`ID`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
  ADD KEY `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEITELEMENT_ID` (`UMSCHLAGFARBIGKEITELEMENT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_DEPARTMENT_ID` (`DEPARTMENT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_KONZEPTBEARBEITUNGFAKTOR_ID` (`KONZEPTBEARBEITUNGFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_VEREDLUNG_ID` (`VEREDLUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_COVER_ID` (`COVER_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PARTICIPANTFAKTOR_ID` (`PARTICIPANTFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_LAYOUT_ID` (`LAYOUT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_DRUCKSEITEN_ID` (`DRUCKSEITEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_NACHSPANN_ID` (`NACHSPANN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_MITGLIEDERKORREKTURFAKTOR_ID` (`MITGLIEDERKORREKTURFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_USER_LOGIN` (`USER_LOGIN`),
  ADD KEY `FK_DEMANDCATEGORY_BAUKASTEN_ID` (`BAUKASTEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_KATALOGART_ID` (`KATALOGART_ID`),
  ADD KEY `FK_DEMANDCATEGORY_FORMATAUSWAEHLEN_ID` (`FORMATAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_SCHLUESSEL_ID` (`SCHLUESSEL_ID`),
  ADD KEY `FK_DEMANDCATEGORY_ARTDERWEITERVERARBEITUNG_ID` (`ARTDERWEITERVERARBEITUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_AUFLAGE_ID` (`AUFLAGE_ID`),
  ADD KEY `FK_DEMANDCATEGORY_NACHSATZ_ID` (`NACHSATZ_ID`),
  ADD KEY `FK_DEMANDCATEGORY_UMSCHLAGPAPIERAUSWAEHLEN_ID` (`UMSCHLAGPAPIERAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_BINDUNG_ID` (`BINDUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PAPIERMATERIALAUSWAEHLEN_ID` (`PAPIERMATERIALAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEIT_ID` (`UMSCHLAGFARBIGKEIT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_VORSPANN_ID` (`VORSPANN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_WECHSELFASSUNGVARIANTFAKTOR_ID` (`WECHSELFASSUNGVARIANTFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_AUSGABE_ID` (`AUSGABE_ID`),
  ADD KEY `FK_DEMANDCATEGORY_FARBIGKEIT_ID` (`FARBIGKEIT_ID`);

--
-- Index pour la table `demandcategorycalculation`
--
ALTER TABLE `demandcategorycalculation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DMNDCTGRYCLCULATIONDMNDCTGRYDPRTEMENTCALCULATIONID` (`DEMANDCATEGORYDEPARTEMENTCALCULATION_ID`),
  ADD KEY `DEMANDCATEGORYCALCULATION_DEPARTEMENTCRITERIA_ID` (`DEPARTEMENTCRITERIA_ID`);

--
-- Index pour la table `demandcategorycalculationitem`
--
ALTER TABLE `demandcategorycalculationitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DMNDCATEGORYCALCULATIONITEMDPRTEMENTCRITERIAITEMID` (`DEPARTEMENTCRITERIAITEM_ID`),
  ADD KEY `DMNDCTEGORYCALCULATIONITEMDMNDCTEGORYCALCULATIONID` (`DEMANDCATEGORYCALCULATION_ID`);

--
-- Index pour la table `demandcategorydepartementcalculation`
--
ALTER TABLE `demandcategorydepartementcalculation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DMANDCATEGORYDEPARTEMENTCALCULATIONDMANDCATEGORYID` (`DEMANDCATEGORY_ID`),
  ADD KEY `DEMANDCATEGORYDEPARTEMENTCALCULATIONDEPARTEMENT_ID` (`DEPARTEMENT_ID`);

--
-- Index pour la table `demandcategoryvalidation`
--
ALTER TABLE `demandcategoryvalidation`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEMANDCATEGORYVALIDATION_DEPARTEMENT_ID` (`DEPARTEMENT_ID`),
  ADD KEY `FK_DEMANDCATEGORYVALIDATION_USER_LOGIN` (`USER_LOGIN`),
  ADD KEY `FK_DEMANDCATEGORYVALIDATION_DEMANDCATEGORY_ID` (`DEMANDCATEGORY_ID`);

--
-- Index pour la table `departement`
--
ALTER TABLE `departement`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `departementcriteria`
--
ALTER TABLE `departementcriteria`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEPARTEMENTCRITERIA_DEPARTEMENT_ID` (`DEPARTEMENT_ID`);

--
-- Index pour la table `departementcriteriaitem`
--
ALTER TABLE `departementcriteriaitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEPARTEMENTCRITERIAITEM_DEPARTEMENTCRITERIA_ID` (`DEPARTEMENTCRITERIA_ID`);

--
-- Index pour la table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_DEVICE_USER_LOGIN` (`USER_LOGIN`);

--
-- Index pour la table `farbigkeit`
--
ALTER TABLE `farbigkeit`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `formatauswaehlen`
--
ALTER TABLE `formatauswaehlen`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `historiqueconnexionuser`
--
ALTER TABLE `historiqueconnexionuser`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HISTORIQUECONNEXIONUSER_USER_LOGIN` (`USER_LOGIN`);

--
-- Index pour la table `katalogart`
--
ALTER TABLE `katalogart`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `konzeptbearbeitungfaktor`
--
ALTER TABLE `konzeptbearbeitungfaktor`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `layout`
--
ALTER TABLE `layout`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `layoutpricing`
--
ALTER TABLE `layoutpricing`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_LAYOUTPRICING_DEPARTEMENTCRITERIAITEM_ID` (`DEPARTEMENTCRITERIAITEM_ID`),
  ADD KEY `FK_LAYOUTPRICING_LAYOUT_ID` (`LAYOUT_ID`);

--
-- Index pour la table `mitgliederkorrekturfaktor`
--
ALTER TABLE `mitgliederkorrekturfaktor`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `nachsatz`
--
ALTER TABLE `nachsatz`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_NACHSATZ_COVER_ID` (`COVER_ID`);

--
-- Index pour la table `nachspann`
--
ALTER TABLE `nachspann`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `papiermaterialauswaehlen`
--
ALTER TABLE `papiermaterialauswaehlen`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `participantfaktor`
--
ALTER TABLE `participantfaktor`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PRODUCT_CATEGORY_ID` (`CATEGORY_ID`);

--
-- Index pour la table `prozess`
--
ALTER TABLE `prozess`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_QUESTION_USER_LOGIN` (`USER_LOGIN`);

--
-- Index pour la table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `schluessel`
--
ALTER TABLE `schluessel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SCHLUESSEL_SCHLUESSELTYPE_ID` (`SCHLUESSELTYPE_ID`);

--
-- Index pour la table `schluesseltype`
--
ALTER TABLE `schluesseltype`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `seiten`
--
ALTER TABLE `seiten`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Index pour la table `sortiment`
--
ALTER TABLE `sortiment`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `sotimentitem`
--
ALTER TABLE `sotimentitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SOTIMENTITEM_SORTIMENT_ID` (`SORTIMENT_ID`),
  ADD KEY `FK_SOTIMENTITEM_DEMANDCATEGORY_ID` (`DEMANDCATEGORY_ID`);

--
-- Index pour la table `teilnehmerzahlpricing`
--
ALTER TABLE `teilnehmerzahlpricing`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `umschlagfarbigkeit`
--
ALTER TABLE `umschlagfarbigkeit`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `umschlagfarbigkeitelement`
--
ALTER TABLE `umschlagfarbigkeitelement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_UMSCHLAGFARBIGKEITELEMENT_COVER_ID` (`COVER_ID`),
  ADD KEY `FK_UMSCHLAGFARBIGKEITELEMENT_UMSCHLAGFARBIGKEIT_ID` (`UMSCHLAGFARBIGKEIT_ID`);

--
-- Index pour la table `umschlagpapierauswaehlen`
--
ALTER TABLE `umschlagpapierauswaehlen`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`LOGIN`),
  ADD KEY `FK_USER_DEPARTEMENT_ID` (`DEPARTEMENT_ID`);

--
-- Index pour la table `veredlung`
--
ALTER TABLE `veredlung`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `vorspann`
--
ALTER TABLE `vorspann`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `wechselfassungvariantfaktor`
--
ALTER TABLE `wechselfassungvariantfaktor`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `artderweiterverarbeitung`
--
ALTER TABLE `artderweiterverarbeitung`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auflage`
--
ALTER TABLE `auflage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `auflageseitencovermatrix`
--
ALTER TABLE `auflageseitencovermatrix`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `configurationitem`
--
ALTER TABLE `configurationitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `correctionschluessel`
--
ALTER TABLE `correctionschluessel`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT pour la table `demandcategory`
--
ALTER TABLE `demandcategory`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `demandcategorycalculation`
--
ALTER TABLE `demandcategorycalculation`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `demandcategorycalculationitem`
--
ALTER TABLE `demandcategorycalculationitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `demandcategorydepartementcalculation`
--
ALTER TABLE `demandcategorydepartementcalculation`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `demandcategoryvalidation`
--
ALTER TABLE `demandcategoryvalidation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `departementcriteria`
--
ALTER TABLE `departementcriteria`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT pour la table `departementcriteriaitem`
--
ALTER TABLE `departementcriteriaitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT pour la table `konzeptbearbeitungfaktor`
--
ALTER TABLE `konzeptbearbeitungfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `mitgliederkorrekturfaktor`
--
ALTER TABLE `mitgliederkorrekturfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `participantfaktor`
--
ALTER TABLE `participantfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `schluessel`
--
ALTER TABLE `schluessel`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `schluesseltype`
--
ALTER TABLE `schluesseltype`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `seiten`
--
ALTER TABLE `seiten`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT pour la table `sortiment`
--
ALTER TABLE `sortiment`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `sotimentitem`
--
ALTER TABLE `sotimentitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT pour la table `umschlagfarbigkeit`
--
ALTER TABLE `umschlagfarbigkeit`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `wechselfassungvariantfaktor`
--
ALTER TABLE `wechselfassungvariantfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auflageseitencovermatrix`
--
ALTER TABLE `auflageseitencovermatrix`
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_AUFLAGE_ID` FOREIGN KEY (`AUFLAGE_ID`) REFERENCES `auflage` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_BAUKASTEN_ID` FOREIGN KEY (`BAUKASTEN_ID`) REFERENCES `baukasten` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_COVER_ID` FOREIGN KEY (`COVER_ID`) REFERENCES `cover` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_FARBIGKEIT_ID` FOREIGN KEY (`FARBIGKEIT_ID`) REFERENCES `farbigkeit` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_FORMATAUSWAEHLEN_ID` FOREIGN KEY (`FORMATAUSWAEHLEN_ID`) REFERENCES `formatauswaehlen` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_SEITEN_ID` FOREIGN KEY (`SEITEN_ID`) REFERENCES `seiten` (`ID`);

--
-- Contraintes pour la table `ausgabepricing`
--
ALTER TABLE `ausgabepricing`
  ADD CONSTRAINT `FK_AUSGABEPRICING_AUSGABE_ID` FOREIGN KEY (`AUSGABE_ID`) REFERENCES `ausgabe` (`ID`);

--
-- Contraintes pour la table `baukastenpricing`
--
ALTER TABLE `baukastenpricing`
  ADD CONSTRAINT `FK_BAUKASTENPRICING_BAUKASTEN_ID` FOREIGN KEY (`BAUKASTEN_ID`) REFERENCES `baukasten` (`ID`),
  ADD CONSTRAINT `FK_BAUKASTENPRICING_COVER_ID` FOREIGN KEY (`COVER_ID`) REFERENCES `cover` (`ID`);

--
-- Contraintes pour la table `configurationitem`
--
ALTER TABLE `configurationitem`
  ADD CONSTRAINT `FK_CONFIGURATIONITEM_CONFIGURATION_ID` FOREIGN KEY (`CONFIGURATION_ID`) REFERENCES `configuration` (`ID`);

--
-- Contraintes pour la table `demandcategory`
--
ALTER TABLE `demandcategory`
  ADD CONSTRAINT `FK_DEMANDCATEGORY_ARTDERWEITERVERARBEITUNG_ID` FOREIGN KEY (`ARTDERWEITERVERARBEITUNG_ID`) REFERENCES `artderweiterverarbeitung` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_AUFLAGE_ID` FOREIGN KEY (`AUFLAGE_ID`) REFERENCES `auflage` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_AUSGABE_ID` FOREIGN KEY (`AUSGABE_ID`) REFERENCES `ausgabe` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_BAUKASTEN_ID` FOREIGN KEY (`BAUKASTEN_ID`) REFERENCES `baukasten` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_BINDUNG_ID` FOREIGN KEY (`BINDUNG_ID`) REFERENCES `bindung` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_CORRECTIONSCHLUESSEL_ID` FOREIGN KEY (`CORRECTIONSCHLUESSEL_ID`) REFERENCES `correctionschluessel` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_COVER_ID` FOREIGN KEY (`COVER_ID`) REFERENCES `cover` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_DEPARTMENT_ID` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departement` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_DRUCKSEITEN_ID` FOREIGN KEY (`DRUCKSEITEN_ID`) REFERENCES `seiten` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_FARBIGKEIT_ID` FOREIGN KEY (`FARBIGKEIT_ID`) REFERENCES `farbigkeit` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_FORMATAUSWAEHLEN_ID` FOREIGN KEY (`FORMATAUSWAEHLEN_ID`) REFERENCES `formatauswaehlen` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_KATALOGART_ID` FOREIGN KEY (`KATALOGART_ID`) REFERENCES `katalogart` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_KONZEPTBEARBEITUNGFAKTOR_ID` FOREIGN KEY (`KONZEPTBEARBEITUNGFAKTOR_ID`) REFERENCES `konzeptbearbeitungfaktor` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_LAYOUT_ID` FOREIGN KEY (`LAYOUT_ID`) REFERENCES `layout` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_MITGLIEDERKORREKTURFAKTOR_ID` FOREIGN KEY (`MITGLIEDERKORREKTURFAKTOR_ID`) REFERENCES `mitgliederkorrekturfaktor` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_NACHSATZ_ID` FOREIGN KEY (`NACHSATZ_ID`) REFERENCES `nachsatz` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_NACHSPANN_ID` FOREIGN KEY (`NACHSPANN_ID`) REFERENCES `nachspann` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PAPIERMATERIALAUSWAEHLEN_ID` FOREIGN KEY (`PAPIERMATERIALAUSWAEHLEN_ID`) REFERENCES `papiermaterialauswaehlen` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PARTICIPANTFAKTOR_ID` FOREIGN KEY (`PARTICIPANTFAKTOR_ID`) REFERENCES `participantfaktor` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PRODUCT_ID` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PROZESS_ID` FOREIGN KEY (`PROZESS_ID`) REFERENCES `prozess` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_REGISTER_ID` FOREIGN KEY (`REGISTER_ID`) REFERENCES `register` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_SCHLUESSEL_ID` FOREIGN KEY (`SCHLUESSEL_ID`) REFERENCES `schluessel` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEITELEMENT_ID` FOREIGN KEY (`UMSCHLAGFARBIGKEITELEMENT_ID`) REFERENCES `umschlagfarbigkeitelement` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEIT_ID` FOREIGN KEY (`UMSCHLAGFARBIGKEIT_ID`) REFERENCES `umschlagfarbigkeit` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_UMSCHLAGPAPIERAUSWAEHLEN_ID` FOREIGN KEY (`UMSCHLAGPAPIERAUSWAEHLEN_ID`) REFERENCES `umschlagpapierauswaehlen` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_VEREDLUNG_ID` FOREIGN KEY (`VEREDLUNG_ID`) REFERENCES `veredlung` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_VORSPANN_ID` FOREIGN KEY (`VORSPANN_ID`) REFERENCES `vorspann` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_WECHSELFASSUNGVARIANTFAKTOR_ID` FOREIGN KEY (`WECHSELFASSUNGVARIANTFAKTOR_ID`) REFERENCES `wechselfassungvariantfaktor` (`ID`);

--
-- Contraintes pour la table `demandcategorycalculation`
--
ALTER TABLE `demandcategorycalculation`
  ADD CONSTRAINT `DEMANDCATEGORYCALCULATION_DEPARTEMENTCRITERIA_ID` FOREIGN KEY (`DEPARTEMENTCRITERIA_ID`) REFERENCES `departementcriteria` (`ID`),
  ADD CONSTRAINT `DMNDCTGRYCLCULATIONDMNDCTGRYDPRTEMENTCALCULATIONID` FOREIGN KEY (`DEMANDCATEGORYDEPARTEMENTCALCULATION_ID`) REFERENCES `demandcategorydepartementcalculation` (`ID`);

--
-- Contraintes pour la table `demandcategorycalculationitem`
--
ALTER TABLE `demandcategorycalculationitem`
  ADD CONSTRAINT `DMNDCATEGORYCALCULATIONITEMDPRTEMENTCRITERIAITEMID` FOREIGN KEY (`DEPARTEMENTCRITERIAITEM_ID`) REFERENCES `departementcriteriaitem` (`ID`),
  ADD CONSTRAINT `DMNDCTEGORYCALCULATIONITEMDMNDCTEGORYCALCULATIONID` FOREIGN KEY (`DEMANDCATEGORYCALCULATION_ID`) REFERENCES `demandcategorycalculation` (`ID`);

--
-- Contraintes pour la table `demandcategorydepartementcalculation`
--
ALTER TABLE `demandcategorydepartementcalculation`
  ADD CONSTRAINT `DEMANDCATEGORYDEPARTEMENTCALCULATIONDEPARTEMENT_ID` FOREIGN KEY (`DEPARTEMENT_ID`) REFERENCES `departement` (`ID`),
  ADD CONSTRAINT `DMANDCATEGORYDEPARTEMENTCALCULATIONDMANDCATEGORYID` FOREIGN KEY (`DEMANDCATEGORY_ID`) REFERENCES `demandcategory` (`ID`);

--
-- Contraintes pour la table `demandcategoryvalidation`
--
ALTER TABLE `demandcategoryvalidation`
  ADD CONSTRAINT `FK_DEMANDCATEGORYVALIDATION_DEMANDCATEGORY_ID` FOREIGN KEY (`DEMANDCATEGORY_ID`) REFERENCES `demandcategory` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORYVALIDATION_DEPARTEMENT_ID` FOREIGN KEY (`DEPARTEMENT_ID`) REFERENCES `departement` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORYVALIDATION_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`);

--
-- Contraintes pour la table `departementcriteria`
--
ALTER TABLE `departementcriteria`
  ADD CONSTRAINT `FK_DEPARTEMENTCRITERIA_DEPARTEMENT_ID` FOREIGN KEY (`DEPARTEMENT_ID`) REFERENCES `departement` (`ID`);

--
-- Contraintes pour la table `departementcriteriaitem`
--
ALTER TABLE `departementcriteriaitem`
  ADD CONSTRAINT `FK_DEPARTEMENTCRITERIAITEM_DEPARTEMENTCRITERIA_ID` FOREIGN KEY (`DEPARTEMENTCRITERIA_ID`) REFERENCES `departementcriteria` (`ID`);

--
-- Contraintes pour la table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `FK_DEVICE_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`);

--
-- Contraintes pour la table `historiqueconnexionuser`
--
ALTER TABLE `historiqueconnexionuser`
  ADD CONSTRAINT `FK_HISTORIQUECONNEXIONUSER_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`);

--
-- Contraintes pour la table `layoutpricing`
--
ALTER TABLE `layoutpricing`
  ADD CONSTRAINT `FK_LAYOUTPRICING_DEPARTEMENTCRITERIAITEM_ID` FOREIGN KEY (`DEPARTEMENTCRITERIAITEM_ID`) REFERENCES `departementcriteriaitem` (`ID`),
  ADD CONSTRAINT `FK_LAYOUTPRICING_LAYOUT_ID` FOREIGN KEY (`LAYOUT_ID`) REFERENCES `layout` (`ID`);

--
-- Contraintes pour la table `nachsatz`
--
ALTER TABLE `nachsatz`
  ADD CONSTRAINT `FK_NACHSATZ_COVER_ID` FOREIGN KEY (`COVER_ID`) REFERENCES `cover` (`ID`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_PRODUCT_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_QUESTION_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`);
