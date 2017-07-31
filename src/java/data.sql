-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 31 Juillet 2017 à 22:48
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

--
-- Contenu de la table `auflage`
--

INSERT INTO `auflage` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
(1, '50', '0.00'),
(2, '100', '0.00'),
(3, '150', '0.00'),
(4, '200', '0.00'),
(5, '500', '0.00'),
(6, '750', '0.00'),
(7, '1000', '0.00'),
(8, '1250', '0.00'),
(9, '1500', '0.00'),
(10, '1750', '0.00'),
(11, '2000', '0.00'),
(12, '2500', '0.00'),
(13, '3000', '0.00'),
(14, '3500', '0.00'),
(15, '4000', '0.00'),
(16, '4500', '0.00'),
(17, '5000', '0.00'),
(18, '5500', '0.00'),
(19, '6000', '0.00'),
(20, '6500', '0.00'),
(21, '7000', '0.00'),
(22, '7500', '0.00'),
(23, '8000', '0.00'),
(24, '8500', '0.00'),
(25, '9000', '0.00'),
(26, '9500', '0.00'),
(27, '10000', '0.00');

--
-- Contenu de la table `ausgabe`
--

INSERT INTO `ausgabe` (`ID`, `NAME`, `PRICE`, `VALUEE`) VALUES
(7, 'Erstausgabe', NULL, '0.50'),
(8, 'Folgeausgabe', NULL, '0.20');

--
-- Contenu de la table `bindung`
--

INSERT INTO `bindung` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('Fadenheftung', NULL, NULL),
('PUR-Bindung', NULL, NULL);

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`ID`, `NAME`) VALUES
(1, 'Katalog'),
(2, 'Fleyer'),
(3, 'Prospekt'),
(4, 'BMEcat');

--
-- Contenu de la table `configuration`
--

INSERT INTO `configuration` (`ID`, `DATEAPPLICATION`) VALUES
(1, '2012-07-03');

--
-- Contenu de la table `configurationitem`
--

INSERT INTO `configurationitem` (`ID`, `DEFAULTVALUE`, `NAME`, `CONFIGURATION_ID`) VALUES
(1, '56.25', 'std_stz', NULL),
(2, '70.00', 'std_stz_dtp', NULL),
(3, '56.25', 'std_stz_pm', NULL);

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

--
-- Contenu de la table `cover`
--

INSERT INTO `cover` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('Hardcover', NULL, NULL),
('Softcover', NULL, NULL);

--
-- Contenu de la table `demandcategory`
--

INSERT INTO `demandcategory` (`ID`, `ANZAHLBESTANDARTIKEL`, `ANZAHLBESTANDPRODUKT`, `ANZAHLBESTELLNRSEITEN`, `ANZAHLBETEILIGTEN`, `ANZAHLGENERIERUNGUPDATESEITEN`, `ANZAHLGESAMTARTIKEL`, `ANZAHLGESAMTPRODUKT`, `ANZAHLGESAMTSEITEN`, `ANZAHLIHVZSEITEN`, `ANZAHLKAPITETEL`, `ANZAHLLIEFERANTGESAMT`, `ANZAHLLIEFERANTNEU`, `ANZAHLMITGLIEDER`, `ANZAHLNEUEARTIKEL`, `ANZAHLNEUEPRODUKT`, `ANZAHLSONDERSEITEN`, `ANZAHLÜBERNAHMEARTIKEL`, `BEARBEITUNGSZEIT`, `DATEDEMANDCATEGORY`, `DATESYSTEM`, `DRUCK`, `LIEFERTERMIN`, `NBRTOTALVALIDATION`, `PERCENTSEITENFAKTOR`, `SEITENANZAHL`, `SUMMDRUCK`, `SUMMUNITPRICE`, `TEILNEHMERZAHL`, `TEILNEHMERZAHLPRICING`, `UMFANG`, `UMSCHLAG`, `SCHLUESSEL_ID`, `ARTDERWEITERVERARBEITUNG_ID`, `AUFLAGE_ID`, `AUSGABE_ID`, `BINDUNG_ID`, `CATEGORY_ID`, `CORRECTIONSCHLUESSEL_ID`, `COVER_ID`, `DEPARTMENT_ID`, `DRUCKSEITEN_ID`, `FARBIGKEIT_ID`, `FORMATAUSWAEHLEN_ID`, `KATALOGART_ID`, `KONZEPTBEARBEITUNGFAKTOR_ID`, `LAYOUT_ID`, `MITGLIEDERKORREKTURFAKTOR_ID`, `PAPIERMATERIALAUSWAEHLEN_ID`, `PARTICIPANTFAKTOR_ID`, `PRODUCT_ID`, `PROZESS_ID`, `REGISTER_ID`, `UMSCHLAGFARBIGKEIT_ID`, `UMSCHLAGPAPIERAUSWAEHLEN_ID`, `USER_LOGIN`, `VEREDLUNG_ID`, `WECHSELFASSUNGVARIANTFAKTOR_ID`, `PRODUCTSCHLUESSELFAKTOR`, `ARTIKELPERPAGELFAKTOR`, `LKSCHLUESSELFAKTOR`, `MKSCHLUESSELFAKTOR`, `SUMMEGLOBAL`) VALUES
(24, -1, 0, 5, 2, 0, 6, 2, 0, 4, 15, 13, 14, 20, 7, 2, 0, 9, 3, '2017-07-23', '2017-07-23', 1, '2017-07-23', 0, 10, 17, '0.00', '2338.19', 16, NULL, 0, 0, NULL, NULL, NULL, 7, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 1, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '2.72', '9.14', '1.01', '1.01', '0.00'),
(25, -1, -1, 5, 0, 0, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 0, 9, 0, '2017-07-23', '2017-07-23', 0, '2017-07-23', 0, 10, 17, '0.00', '2128.19', 16, NULL, 0, 0, NULL, NULL, NULL, 7, NULL, 1, 102, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '0.00', '0.00', '0.00', '0.00', '0.00'),
(26, 8, -1, 5, 0, 4, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-23', '2017-07-23', 0, '2017-07-23', 0, 10, 17, '0.00', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 7, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'kiki', NULL, 1, '0.00', '0.00', '0.00', '0.00', '0.00'),
(27, 8, -1, 5, 0, 4, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-24', '2017-07-24', 0, '2017-07-24', 0, 10, 17, '0.00', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 8, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, 1, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'ana', NULL, NULL, '0.00', '0.00', '0.00', '0.00', '0.00'),
(29, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, 3, '2017-07-24', '2017-07-24', 1, '2017-07-24', 0, 10, 17, '0.00', '2338.19', 16, NULL, 0, 0, NULL, NULL, NULL, 7, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 2, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '4.70', '15.80', '1.10', '1.05', '0.00'),
(30, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, 3, '2017-07-24', '2017-07-24', 1, '2017-07-24', 0, 10, 17, '0.00', '2338.19', 16, NULL, 0, 0, NULL, NULL, NULL, 7, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 2, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '4.70', '15.80', '1.10', '1.05', '0.00'),
(32, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, 3, '2017-07-24', '2017-07-24', 1, '2017-07-24', 1, 10, 17, '0.00', '2338.19', 16, '1.00', 0, 0, NULL, NULL, NULL, 7, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 1, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '4.70', '15.80', '1.10', '1.05', '0.00'),
(33, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, 3, '2017-07-24', '2017-07-24', 1, '2017-07-24', 1, 10, 17, '0.00', '2338.19', 21, '1.20', 0, 0, NULL, NULL, NULL, 7, NULL, 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 2, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '4.70', '15.80', '1.10', '1.05', '0.00'),
(34, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, 3, '2017-07-24', '2017-07-24', 1, '2017-07-24', 1, 10, 17, '0.00', '2338.19', 16, '1.00', 0, 0, NULL, NULL, NULL, 7, 'Fadenheftung', 2, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 3, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '4.70', '15.80', '1.10', '1.05', '10026.74'),
(35, 50, 11, 5, 0, 990, 100, 21, 0, 4, 9, 13, 14, 0, 50, 10, 110, 9, 0, '2017-07-26', '2017-07-26', 0, '2017-07-26', 1, 10, 17, '0.00', '2744.19', 35, '1.20', 1100, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '4.70', '15.80', '1.10', '1.05', '23802.70'),
(36, 50, 20, 5, 0, 1710, 100, 40, 0, 4, 15, 13, 14, 0, 50, 20, 190, 9, 0, '2017-07-26', '2017-07-26', 0, '2017-07-26', 0, 10, 17, '0.00', '0.00', 40, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '0.00', '0.00', '0.00', NULL),
(37, 50, 20, 5, 0, 1710, 100, 40, 0, 4, 15, 13, 14, 0, 50, 20, 190, 9, 0, '2017-07-26', '2017-07-26', 0, '2017-07-26', 0, 10, 17, '0.00', '0.00', 40, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '0.00', '0.00', '0.00', NULL),
(38, 50, 20, 5, 0, 1710, 100, 40, 0, 4, 15, 13, 14, 0, 50, 20, 190, 9, 0, '2017-07-26', '2017-07-26', 0, '2017-07-26', 0, 10, 17, '0.00', '0.00', 40, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '0.00', '0.00', '0.00', NULL),
(39, 3900, 488, 5, 0, 1710, 4000, 500, 0, 4, 15, 13, 14, 0, 100, 12, 190, 9, 0, '2017-07-26', '2017-07-26', 0, '2017-07-26', 1, 10, 17, '0.00', '3192.19', 16, '1.00', 1900, 0, NULL, NULL, NULL, 8, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 3, 1, 2, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1, '8.00', '26.90', '1.00', '1.00', '43803.08'),
(41, 910, 190, 5, 0, 900, 1000, 208, 0, 4, 15, 13, 14, 0, 90, 18, 100, 9, 0, '2017-07-26', '2017-07-26', 0, '2017-07-26', 1, 10, 17, '0.00', '2688.19', 37, '1.35', 1000, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '4.80', '16.10', '1.00', '1.00', '26290.59'),
(42, 1100, 550, 5, 0, 926, 1900, 950, 0, 4, 9, 16, 14, 0, 800, 400, 102, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '2733.41', 16, '1.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 5, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.00', '5.70', '1.00', '1.00', '45859.84'),
(43, 910, 505, 5, 0, 900, 1000, 555, 0, 4, 15, 13, 14, 0, 90, 50, 100, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '2717.66', 16, '1.00', 1000, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 7, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '6.10', '1.00', '1.00', '31873.54'),
(44, 400, 222, 5, 0, 926, 1200, 666, 0, 4, 9, 13, 14, 0, 800, 444, 102, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '2733.41', 16, '1.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 7, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '6.10', '1.00', '1.00', '42904.63'),
(45, 100, 40, 5, 0, 9000, 1000, 400, 0, 4, 15, 13, 14, 0, 900, 360, 1000, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '7780.16', 16, '1.00', 10000, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 6, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '8.40', '1.00', '1.00', '162942.36'),
(46, 720, 450, 5, 0, 1710, 800, 500, 0, 4, 15, 13, 14, 0, 80, 50, 190, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '0.00', 16, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '0.00', '0.00', '0.00', NULL),
(47, 1810, 1131, 5, 0, 1710, 1900, 1187, 0, 4, 15, 13, 14, 0, 90, 56, 190, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 0, 10, 17, '0.00', '0.00', 16, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '0.00', '0.00', '0.00', NULL),
(48, 1090, 681, 5, 0, 1710, 1980, 1237, 0, 4, 15, 30, 20, 0, 890, 556, 190, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '3223.91', 38, '1.35', 1900, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '5.38', '1.15', '1.08', '67193.04'),
(49, 1800, 225, 8, 0, 1800, 1890, 236, 0, 9, 4, 33, 23, 0, 90, 11, 200, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '3276.78', 23, '1.20', 2000, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '8.00', '26.90', '1.00', '1.00', '40156.35'),
(50, 2181, 272, 5, 0, 1800, 2990, 373, 0, 4, 9, 20, 12, 0, 809, 101, 200, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '3276.78', 45, '1.35', 2000, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 3, 5, NULL, NULL, NULL, 'admin', NULL, 1, '8.00', '26.90', '1.00', '1.00', '44485.01'),
(51, 729, 202, 5, 0, 1800, 809, 224, 0, 4, 9, 20, 2, 0, 80, 22, 200, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '3276.78', 46, '1.35', 2000, 0, NULL, NULL, NULL, 7, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '12.10', '1.10', '1.05', '38522.43'),
(52, 7309, 2149, 5, 0, 1800, 8098, 2381, 0, 4, 15, 13, 14, 0, 789, 232, 200, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '3276.78', 80, '1.35', 2000, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.40', '11.43', '1.11', '1.05', '74856.03'),
(53, 7300, 2920, 5, 2, 1800, 8000, 3200, 0, 4, 15, 13, 14, 20, 700, 280, 200, 9, 3, '2017-07-27', '2017-07-27', 1, '2017-07-27', 1, 10, 17, '0.00', '3487.72', 16, '1.00', 2000, 0, NULL, NULL, 3, 8, 'Fadenheftung', 1, 1, 'Hardcover', NULL, NULL, '2/2 -farbig', 'A5', 1, 1, 2, 2, '65 g/qm', NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '8.40', '1.00', '1.00', '86551.15'),
(57, 23217, 4837, 5, 0, 4212, 23451, 4885, 0, 4, 15, 13, 14, 0, 234, 48, 467, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '4783.72', 16, '1.00', 4679, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 4, 1, 3, 2, NULL, NULL, 2, 6, NULL, NULL, NULL, 'admin', NULL, 1, '4.80', '16.10', '1.00', '1.00', '146061.47'),
(58, 7000, 875, 5, 0, 8100, 7890, 986, 0, 4, 34, 78, 21, 0, 890, 111, 900, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '7217.66', 34, '1.20', 9000, 0, NULL, NULL, NULL, 7, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1, '8.00', '26.90', '1.00', '1.00', '158783.43'),
(59, 801, 321, 5, 0, 1701, 890, 356, 0, 4, 9, 30, 27, 0, 89, 35, 189, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '1788.04', 16, '1.00', 1890, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, 2, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ana', NULL, NULL, '2.50', '8.40', '1.00', '1.00', '37812.60'),
(60, 6700, 837, 5, 0, 3783, 6789, 848, 0, 4, 15, 13, 14, 0, 89, 11, 6, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 0, 10, 17, '0.00', '0.00', 33, '0.00', 3789, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '8.00', '0.00', '0.00', '0.00', NULL),
(61, 822, 158, 5, 0, 1800, 900, 173, 0, 4, 15, 13, 14, 0, 78, 15, 200, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 0, 10, 17, '0.00', '0.00', 16, '0.00', 2000, 0, NULL, NULL, NULL, 7, NULL, 2, 1, NULL, 1, NULL, NULL, NULL, 1, NULL, 2, 2, NULL, NULL, 3, NULL, NULL, NULL, NULL, 'ana', NULL, NULL, '5.20', '0.00', '0.00', '0.00', NULL),
(62, 622, 78, 5, 0, 2700, 700, 87, 0, 4, 15, 13, 14, 0, 78, 9, 300, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 0, 10, 17, '0.00', '0.00', 16, '0.00', 3000, 0, NULL, NULL, NULL, 8, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, 2, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'ana', NULL, NULL, '8.00', '0.00', '0.00', '0.00', NULL),
(63, 8901, 5563, 5, 0, 2700, 8990, 5618, 0, 4, 9, 13, 4, 0, 89, 55, 299, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 0, 10, 17, '0.00', '0.00', 78, '0.00', 2999, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '0.00', '0.00', '0.00', NULL),
(65, 8901, 5563, 5, 0, 2700, 8990, 5618, 0, 4, 9, 13, 4, 0, 89, 55, 299, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 0, 10, 17, '0.00', '0.00', 78, '0.00', 2999, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '0.00', '0.00', '0.00', NULL),
(66, 8901, 5563, 5, 0, 2700, 8990, 5618, 0, 4, 9, 13, 4, 0, 89, 55, 299, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 0, 10, 17, '0.00', '0.00', 78, '0.00', 2999, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '0.00', '0.00', '0.00', NULL),
(69, 74889, 46805, 5, 0, 17018, 75678, 47298, 0, 4, 9, 20, 2, 0, 789, 493, 1890, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '12790.91', 44, '1.35', 18908, 0, NULL, NULL, NULL, 7, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '5.38', '1.15', '1.08', '927782.12'),
(71, 820, 12, 5, 0, 1710, 900, 360, 0, 4, 9, 18, 7, 0, 80, 32, 190, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '572.43', 16, '1.00', 1900, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, 6, NULL, NULL, NULL, 'dmd', NULL, NULL, '2.50', '8.40', '1.00', '1.00', '1907.52'),
(72, 1622, 649, 5, 0, 1710, 1700, 680, 0, 4, 9, 9, 7, 0, 78, 31, 190, 9, 0, '2017-07-27', '2017-07-27', 0, '2017-07-27', 1, 10, 17, '0.00', '1793.66', 16, '1.00', 1900, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, 3, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ana', NULL, NULL, '2.50', '8.40', '1.00', '1.00', '41618.44'),
(73, 1100, 440, 5, 0, 926, 1900, 760, 0, 4, 9, 16, 14, 0, 800, 320, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2733.41', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 4, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '8.40', '1.00', '1.00', '41456.39'),
(76, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2733.41', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 3, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '12.10', '1.10', '1.05', '36059.01'),
(77, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '0.00', '0.00', '0.00', NULL),
(78, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '0.00', '0.00', '0.00', NULL),
(79, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '0.00', '0.00', '0.00', NULL),
(80, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '0.00', '0.00', '0.00', NULL),
(81, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2733.41', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '12.10', '1.10', '1.05', '36059.01'),
(91, 1100, 440, 5, 0, 926, 1900, 760, 0, 4, 9, 16, 14, 0, 800, 320, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '0.00', '0.00', '0.00', NULL),
(92, 1100, 137, 5, 0, 926, 1900, 237, 0, 4, 9, 16, 14, 0, 800, 100, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '8.00', '0.00', '0.00', '0.00', NULL),
(93, 1100, 272, 5, 0, 926, 1900, 470, 0, 4, 9, 16, 14, 0, 800, 198, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2730.03', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '4.04', '13.58', '1.09', '1.05', '33763.74'),
(94, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2730.03', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '12.10', '1.10', '1.05', '34966.65'),
(96, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2730.03', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '12.10', '1.10', '1.05', '34966.65'),
(97, 1100, 176, 5, 0, 926, 1900, 304, 0, 4, 9, 16, 14, 0, 800, 128, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2731.91', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '6.24', '20.98', '1.04', '1.02', '33820.64'),
(98, 1100, 687, 5, 0, 926, 1900, 1187, 0, 4, 9, 16, 14, 0, 800, 500, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2737.17', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1, '1.60', '5.38', '1.15', '1.08', '58482.79'),
(99, 1100, 137, 5, 0, 926, 1900, 237, 0, 4, 9, 16, 14, 0, 800, 100, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2733.79', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '8.00', '26.90', '1.00', '1.00', '35974.00'),
(100, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '0.00', '0.00', '0.00', NULL),
(101, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '0.00', '0.00', '0.00', NULL),
(102, 10, 0, 5, 0, 926, 1900, 0, 0, 4, 9, 16, 14, 0, 800, 0, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2086.84', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '12.10', '1.10', '1.05', '30912.64'),
(103, 1100, 611, 5, 0, 180, 1900, 1055, 0, 4, 9, 16, 14, 0, 800, 444, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '1630.47', 20, '1.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 4, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '6.10', '1.00', '1.00', '50457.87'),
(104, 1100, 611, 5, 0, 926, 1900, 1055, 0, 4, 9, 16, 14, 0, 800, 444, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '0.00', '0.00', '0.00', NULL),
(106, 1100, 611, 5, 0, 926, 1900, 1055, 0, 4, 9, 16, 14, 0, 800, 444, 102, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '2096.22', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '6.10', '1.00', '1.00', '61958.04'),
(107, 1100, 611, 10, 0, 160, 1900, 1055, 0, 10, 9, 16, 14, 0, 800, 444, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 1, 10, 17, '0.00', '1630.47', 20, '1.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '6.10', '1.00', '1.00', '50457.87'),
(112, 1100, 611, 10, 0, 160, 1900, 1055, 0, 10, 9, 16, 14, 0, 800, 444, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '0.00', '0.00', '0.00', NULL),
(113, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(114, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(115, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(116, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(117, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(118, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(119, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(120, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(121, 1100, 440, 10, 0, 160, 1900, 760, 0, 10, 9, 16, 14, 0, 800, 320, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '2.50', '0.00', '0.00', '0.00', NULL),
(123, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(124, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'pm', NULL, NULL, '0.00', '0.00', '0.00', '0.00', NULL),
(129, 1100, 611, 10, 0, 160, 1900, 1055, 0, 10, 9, 16, 14, 0, 800, 444, 20, 9, 0, '2017-07-28', '2017-07-28', 0, '2017-07-28', 0, 10, 17, '0.00', '0.00', 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '1.80', '0.00', '0.00', '0.00', NULL),
(130, 1100, 229, 10, 0, 906, 1900, 395, 0, 10, 9, 16, 14, 0, 800, 166, 102, 9, 0, '2017-07-30', '2017-07-30', 0, '2017-07-30', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '4.80', '0.00', '0.00', '0.00', NULL),
(131, 1100, 305, 10, 0, 906, 1900, 527, 0, 10, 9, 16, 14, 0, 800, 222, 102, 9, 0, '2017-07-30', '2017-07-30', 0, '2017-07-30', 1, 10, 17, '0.00', '2134.02', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1, '3.60', '12.10', '1.10', '1.05', '49729.01'),
(132, 10, 0, 10, 2, 4, 1900, 1, 0, 10, 9, 16, 14, 20, 800, 1, 3, 9, 3, '2017-07-31', '2017-07-31', 1, '2017-07-31', 0, 10, 17, '0.00', '0.00', 35, '0.00', 1028, 0, NULL, NULL, 3, 7, 'PUR-Bindung', 2, NULL, 'Hardcover', NULL, NULL, '3/3 -farbig', 'A5', 3, 2, 2, 3, '70 g/qm', NULL, 3, 6, NULL, NULL, NULL, 'walo', NULL, 2, '0.00', '0.00', '0.00', '0.00', NULL);

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`ID`, `NAME`) VALUES
(1, 'contentManagement'),
(2, 'datenManagement'),
(3, 'databasePublishing'),
(4, 'projectManagement'),
(5, 'Assetmanagement'),
(6, 'Media IT'),
(8, 'InitialCosts');

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
(28, 'Projektmanagement Leistungen:', 4);

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
(7, '3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Masterlisten Prüfung', 'hhh', 1),
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
(42, '4.5*demandCategory.getAnzahlBeteiligten()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '4.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Abstimmungsgespräche', '4.5*AnzahlBeteiligten*Std_Satz', 27),
(43, 'demandCategory.getAnzahlBeteiligten()*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Termin Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (1h)  ', 'Bearbeitungszeit*Anzahl_Beteiligten*Szd_Satz', 27),
(44, 'demandCategory.getAnzahlBeteiligten()*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/4', 'demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/4', 'Budget Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (15min)  ', 'AnzahlBeteiligten*Bearbeitungszeit*Std_Satz/4', 27),
(45, '0.25*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '0.25*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Berichtswesen: Festsatz/Laufzeit in Monaten / Stunde pro Monat (0,25 h)  ', '0.25*Bearbeitungszeit*Std_Satz', 27),
(46, '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Projektplanung = 6 std', '6*Std_Satz', 27),
(47, '1.5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'configurationItemFacade.findByName(''std_stz'').getDefaultValue()', 'Pauschale Projektvorbereitung = 1,5 std', '1.5*Std_Satz', 27),
(48, '', 'demandCategory.getKatalogart().getValuee()', 'Pauschale Kalkulation inkl. Prüfschleife und Abstimmung GF', '12*std_Satz*KatalogartFakt*WechselfssungFaktor*AusgabeFaktor', 28),
(49, '', 'demandCategory.getAusgabe().getValuee()', 'Nachkalkulation zur Druckvergabe', '', 28),
(50, '', 'demandCategory.getWechselfassungVariantFaktor().getValue()', 'Bestellformular inkl. Baukastenanhang erstellen und prüfen', '', 28),
(51, '', '', 'Planung inkl. Prüfschleifen und Freigaben', '', 28),
(52, '', '', 'Händlerabwicklung', '', 28),
(53, '', 'demandCategory.getTeilnehmerZahl()', 'Präsentationserstellung', '', 28),
(54, '', 'demandCategory.getTeilnehmerZahlPricing().getPrice()', 'Händlerabwicklung', '', 28),
(55, '', '', 'Dokumentation', NULL, 28),
(58, '', '', 'Digitales Archiv', NULL, 28),
(59, '', '', 'Druckformschreibung', NULL, 28),
(60, '', '', 'Druckabnahme', NULL, 28),
(61, '', '', 'Verarbeitungsüberwachung', NULL, 28),
(62, '', '', 'Weiterberchnung (Vorbereitung und Durchführung)', NULL, 28),
(63, '(3*configurationItemFacade.findByName(''std_stz'').getDefaultValue())', '(3*configurationItemFacade.findByName(''std_stz'').getDefaultValue())', 'Endabrechnung (Pauschal)', NULL, 28),
(64, '', '', 'Erstellung und Auswertung von Befragungen (Pauschal)', NULL, 28),
(65, '8*demandCategory.getAnzahlNeueArtikel()*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/30', '8*demandCategory.getlKSchluesselFaktor()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/30', 'Basisdatenpflege Neuheiten Information', '8*Anzahl_Artikel_Neu* LK_Schlüssel*Korrekturschlüssel*Prozessschlüssel*std_satz/30', 13),
(66, '8*demandCategory.getAnzahlBestandArtikel()*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/90', '8*demandCategory.getCorrectionSchluessel().getValue()*demandCategory.getProzess().getValuee()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/90', 'Basis Datenpflege Bestand Artikel', '8*AzahlBestandArtikel*Korrektuschluessek*Prozessschluessel*Std_Satz/90', 13);

--
-- Contenu de la table `farbigkeit`
--

INSERT INTO `farbigkeit` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('1/1 -farbig', NULL, NULL),
('2/2 -farbig', NULL, NULL),
('3/3 -farbig', NULL, NULL),
('4/4 c', NULL, NULL);

--
-- Contenu de la table `formatauswaehlen`
--

INSERT INTO `formatauswaehlen` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('A4', NULL, NULL),
('A5', NULL, NULL),
('A6', NULL, NULL),
('E5PLUS', NULL, NULL),
('F1926', NULL, NULL);

--
-- Contenu de la table `katalogart`
--

INSERT INTO `katalogart` (`ID`, `NAME`, `VALUEE`) VALUES
(1, 'Lagerliste', '1.00'),
(2, 'E/D/E Katalog', '1.10'),
(3, 'Individueller Katalog', '1.15'),
(4, 'Fremdsprachen Katalog', '1.00'),
(51, 'Preisliste', '1.00');

--
-- Contenu de la table `konzeptbearbeitungfaktor`
--

INSERT INTO `konzeptbearbeitungfaktor` (`ID`, `EXPRESSION`, `WERT`) VALUES
(1, 'Ja', '1.35'),
(2, 'Nein', '1.00');

--
-- Contenu de la table `layout`
--

INSERT INTO `layout` (`ID`, `NAME`, `VALUEE`) VALUES
(1, 'Einfach', '1.00'),
(2, 'Standard', '1.10'),
(3, 'Komplex', '1.15'),
(52, 'individuelles', '1.70');

--
-- Contenu de la table `mitgliederkorrekturfaktor`
--

INSERT INTO `mitgliederkorrekturfaktor` (`ID`, `EXPRESSION`, `WERT`) VALUES
(2, 'Ja', '1.05'),
(3, 'Nein', '1.00');

--
-- Contenu de la table `papiermaterialauswaehlen`
--

INSERT INTO `papiermaterialauswaehlen` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('65 g/qm', NULL, NULL),
('70 g/qm', NULL, NULL),
('80 g/qm', NULL, NULL),
('85 g/qm', NULL, NULL);

--
-- Contenu de la table `participantfaktor`
--

INSERT INTO `participantfaktor` (`ID`, `PERCENT`, `WERT`) VALUES
(1, 20, '1.00'),
(2, 21, '1.00'),
(3, 36, '1.00');

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

--
-- Contenu de la table `prozess`
--

INSERT INTO `prozess` (`ID`, `NAME`, `VALUEE`) VALUES
(5, 'Proz.Neu / Tech.Alt', '1.20'),
(6, 'Prozess.Neu / Tech.Neu', '1.00');

--
-- Contenu de la table `register`
--

INSERT INTO `register` (`ID`, `EXPRESSION`, `PRICE`) VALUES
(51, 'Falls Register ausgewählt= 1 Euro*Auflage', '1.00');

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

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '100');

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

--
-- Contenu de la table `sotimentitem`
--

INSERT INTO `sotimentitem` (`ID`, `WERT`, `DEMANDCATEGORY_ID`, `SORTIMENT_ID`) VALUES
(47, '10.00', 24, 1),
(48, '90.00', 24, 3),
(49, '100.00', 26, 3),
(50, '100.00', 27, 2),
(52, '100.00', 29, 1),
(53, '100.00', 30, 1),
(55, '100.00', 32, 1),
(56, '100.00', 33, 1),
(57, '100.00', 34, 1),
(58, '100.00', 35, 1),
(59, '100.00', 36, 3),
(60, '100.00', 37, 3),
(61, '100.00', 38, 3),
(62, '100.00', 39, 4),
(64, '100.00', 41, 2),
(65, '100.00', 42, 7),
(66, '100.00', 43, 9),
(67, '100.00', 44, 9),
(68, '100.00', 45, 3),
(69, '100.00', 46, 6),
(70, '100.00', 47, 6),
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
(84, '100.00', 60, 4),
(85, '100.00', 61, 10),
(86, '100.00', 62, 4),
(87, '100.00', 63, 6),
(89, '100.00', 65, 6),
(90, '100.00', 66, 6),
(93, '100.00', 69, 6),
(95, '100.00', 71, 3),
(96, '100.00', 72, 3),
(97, '100.00', 73, 3),
(100, '100.00', 76, 5),
(101, '100.00', 77, 5),
(102, '100.00', 78, 5),
(103, '100.00', 79, 5),
(104, '100.00', 80, 5),
(105, '100.00', 81, 5),
(115, '100.00', 91, 3),
(116, '100.00', 92, 4),
(117, '90.00', 93, 5),
(118, '10.00', 93, 4),
(119, '100.00', 94, 5),
(121, '100.00', 96, 5),
(122, '40.00', 97, 5),
(123, '60.00', 97, 4),
(124, '100.00', 98, 6),
(125, '100.00', 99, 4),
(126, '100.00', 100, 5),
(127, '100.00', 101, 5),
(128, '100.00', 102, 5),
(129, '100.00', 103, 9),
(130, '100.00', 104, 9),
(132, '100.00', 106, 9),
(133, '100.00', 107, 9),
(138, '100.00', 112, 9),
(139, '100.00', 113, 1),
(140, '100.00', 114, 1),
(141, '100.00', 115, 2),
(142, '100.00', 116, 4),
(143, '100.00', 117, 4),
(144, '100.00', 118, 4),
(145, '100.00', 119, 4),
(146, '100.00', 120, 4),
(147, '100.00', 121, 3),
(149, '100.00', 123, 5),
(150, '100.00', 124, 5),
(155, '100.00', 129, 9),
(156, '100.00', 130, 2),
(157, '100.00', 131, 5),
(158, '50.00', 132, 8),
(159, '50.00', 132, 6);

--
-- Contenu de la table `teilnehmerzahlpricing`
--

INSERT INTO `teilnehmerzahlpricing` (`ID`, `PRICE`, `TEILNEHMERZAHLMIN`, `TEILNEHMERZAHLMINOPERATOR`, `TEILNEHMERZAHLMAX`, `TEILNEHMERZAHLMAXOPERATOR`) VALUES
(1, '1.00', '0', '>=', '20', '<='),
(2, '1.20', '20', '>', '35', '<='),
(3, '1.35', '35', '>', '100000', '<=');

--
-- Contenu de la table `umschlagfarbigkeit`
--

INSERT INTO `umschlagfarbigkeit` (`ID`, `DESCRIPTION`, `LABEL`, `PRICE`) VALUES
(1, NULL, '1/0-fbg. Skala', '92.03'),
(2, NULL, '1/0-Sonderfarbe', '92.03'),
(3, NULL, '2/0-fbg. Skala', '168.72'),
(4, NULL, '2/0-fbg. Skala+1 Sonderfarbe', '168.72'),
(5, NULL, '3/0-fbg. Skala', '245.41'),
(6, NULL, '3/0-fbg. Skala+1 Sonderfarbe', '245.41'),
(7, NULL, '4/0-fbg. Skala', '322.10'),
(8, NULL, '4/1-fbg. Skala', '414.13'),
(9, NULL, '4/2-fbg. Skala', '490.82'),
(10, NULL, '5/0-fbg. Skala+1 Sonderfarbe', '398.79'),
(11, NULL, '6/0-fbg. Skala+2 Sonderfarbe', '475.48');

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`LOGIN`, `ADMIN`, `BLOCKED`, `EMAIL`, `MDPCHANGED`, `NBRCNX`, `NOM`, `PASSWORD`, `PRENOM`, `TEL`, `DEPARTEMENT_ID`) VALUES
('admin', 1, 0, 'admin@ede.de', 1, 0, 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Admin', '012345', NULL),
('ana', 0, 0, 'ana', 1, 0, 'ana', 'b6d4a89ccde3fb8fc69865ac105801287867cf735adf0b8bbca86ee9186f7b64', 'ana', '00000', 1),
('anas', 0, 0, 'user@gmail.com', 1, 0, 'anas', 'c157889e0fd5d7fc0d9a8d951fd64604ebeeb441de6519433dd8f931493dd5da', 'anas', '06', 1),
('assetmanagement', 0, 0, '', 1, 0, 'assetmanagement', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '', 5),
('CM_user', 0, 0, 'CM_user@ede.de', 1, 0, 'CM_user', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'CM_user', '01234567', 1),
('contentmanagement_user', 0, 0, 'xy@ede.de', 1, 0, 'x', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'y', '012356', 1),
('datamanagement', 0, 0, '', 1, 0, 'user', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', '', 2),
('dmd', 0, 0, '', 1, 2, 'dm', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', '', 2),
('DTP_user', 0, 0, 'DTP_user@ede.de', 1, 0, 'DTP_user', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '01234567', 3),
('kiki', 1, 0, 'kiki', 1, 0, 'kiki', '888da5db853449fff82b07cbdbf7c755ece0783aa670bb36cc5c4cc9a68fb864', 'kiki', 'kiki', NULL),
('kkk', 0, 0, 'k', 0, 0, 'kkkk', '503afc4bd66d51aeda05cbcdbf07ad0d560d03fe0819f365629c48299e92b539', 'k', 'k', NULL),
('mediIT', 0, 0, 'mediIT@ede.de', 1, 0, '', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '', 6),
('pm', 0, 0, 'pm@ede.de', 1, 0, 'pm', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'pm', '123456', 4),
('walo', 1, 0, 'walo', 1, 0, 'walo', '41d119f6079d09b46a5c950a03b455c99ec6c9b6f1726401a52c85d0b17d4b54', 'walo', '00000', NULL),
('younes', 1, 0, 'younes@gmail.com', 1, 0, 'zouani', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'younes', '06', 1);

--
-- Contenu de la table `wechselfassungvariantfaktor`
--

INSERT INTO `wechselfassungvariantfaktor` (`ID`, `EXPRESSION`, `VALUE`) VALUES
(1, 'Ja', '1.20'),
(2, 'Nein', '1.00');
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
