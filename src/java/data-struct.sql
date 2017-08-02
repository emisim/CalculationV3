-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 01 Août 2017 à 15:38
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

-- --------------------------------------------------------

--
-- Structure de la table `auflageseitencovermatrix`
--

CREATE TABLE `auflageseitencovermatrix` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `AUFLAGE_ID` int(11) DEFAULT NULL,
  `COVER_ID` int(11) DEFAULT NULL,
  `BAUKASTEN_ID` bigint(20) DEFAULT NULL,
  `FARBIGKEIT_ID` varchar(255) DEFAULT NULL,
  `FORMATAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `SEITEN_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Structure de la table `backup`
--

CREATE TABLE `backup` (
  `ID` bigint(20) NOT NULL,
  `DATESYSTEME` date DEFAULT NULL,
  `NOM` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `baukasten`
--

CREATE TABLE `baukasten` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` varchar(255) DEFAULT NULL,
  `VALUE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, '56.25', 'std_stz_pm', NULL);

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
('Hardcover', NULL, NULL),
('Softcover', NULL, NULL);

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
  `BEARBEITUNGSZEIT` int(11) DEFAULT NULL,
  `DATEDEMANDCATEGORY` date DEFAULT NULL,
  `DATESYSTEM` date DEFAULT NULL,
  `DRUCK` tinyint(1) DEFAULT '0',
  `LKSCHLUESSELFAKTOR` decimal(10,2) DEFAULT NULL,
  `LIEFERTERMIN` date DEFAULT NULL,
  `MKSCHLUESSELFAKTOR` decimal(10,2) DEFAULT NULL,
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
  `PAPIERMATERIALAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `PARTICIPANTFAKTOR_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `PROZESS_ID` bigint(20) DEFAULT NULL,
  `REGISTER_ID` bigint(20) DEFAULT NULL,
  `UMSCHLAGFARBIGKEIT_ID` bigint(20) DEFAULT NULL,
  `UMSCHLAGPAPIERAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL,
  `VEREDLUNG_ID` varchar(255) DEFAULT NULL,
  `WECHSELFASSUNGVARIANTFAKTOR_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `demandcategory`
--

INSERT INTO `demandcategory` (`ID`, `ANZAHLBESTANDARTIKEL`, `ANZAHLBESTANDPRODUKT`, `ANZAHLBESTELLNRSEITEN`, `ANZAHLBETEILIGTEN`, `ANZAHLGENERIERUNGUPDATESEITEN`, `ANZAHLGESAMTARTIKEL`, `ANZAHLGESAMTPRODUKT`, `ANZAHLGESAMTSEITEN`, `ANZAHLIHVZSEITEN`, `ANZAHLKAPITETEL`, `ANZAHLLIEFERANTGESAMT`, `ANZAHLLIEFERANTNEU`, `ANZAHLMITGLIEDER`, `ANZAHLNEUEARTIKEL`, `ANZAHLNEUEPRODUKT`, `ANZAHLSONDERSEITEN`, `ANZAHLÜBERNAHMEARTIKEL`, `ARTIKELPERPAGELFAKTOR`, `BEARBEITUNGSZEIT`, `DATEDEMANDCATEGORY`, `DATESYSTEM`, `DRUCK`, `LKSCHLUESSELFAKTOR`, `LIEFERTERMIN`, `MKSCHLUESSELFAKTOR`, `NBRTOTALVALIDATION`, `PERCENTSEITENFAKTOR`, `PRODUCTSCHLUESSELFAKTOR`, `SEITENANZAHL`, `SUMMDRUCK`, `SUMMUNITPRICE`, `SUMMEGLOBAL`, `TEILNEHMERZAHL`, `TEILNEHMERZAHLPRICING`, `UMFANG`, `UMSCHLAG`, `SCHLUESSEL_ID`, `ARTDERWEITERVERARBEITUNG_ID`, `AUFLAGE_ID`, `AUSGABE_ID`, `BAUKASTEN_ID`, `BINDUNG_ID`, `CATEGORY_ID`, `CORRECTIONSCHLUESSEL_ID`, `COVER_ID`, `DEPARTMENT_ID`, `DRUCKSEITEN_ID`, `FARBIGKEIT_ID`, `FORMATAUSWAEHLEN_ID`, `KATALOGART_ID`, `KONZEPTBEARBEITUNGFAKTOR_ID`, `LAYOUT_ID`, `MITGLIEDERKORREKTURFAKTOR_ID`, `PAPIERMATERIALAUSWAEHLEN_ID`, `PARTICIPANTFAKTOR_ID`, `PRODUCT_ID`, `PROZESS_ID`, `REGISTER_ID`, `UMSCHLAGFARBIGKEIT_ID`, `UMSCHLAGPAPIERAUSWAEHLEN_ID`, `USER_LOGIN`, `VEREDLUNG_ID`, `WECHSELFASSUNGVARIANTFAKTOR_ID`) VALUES
(24, -1, 0, 5, 2, 0, 6, 2, 0, 4, 15, 13, 14, 20, 7, 2, 0, 9, '9.14', 3, '2017-07-23', '2017-07-23', 1, '1.01', '2017-07-23', '1.01', 0, 10, '2.72', 17, '0.00', '2338.19', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 7, NULL, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 1, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1),
(25, -1, -1, 5, 0, 0, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 0, 9, '0.00', 0, '2017-07-23', '2017-07-23', 0, '0.00', '2017-07-23', '0.00', 0, 10, '0.00', 17, '0.00', '2128.19', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 102, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1),
(26, 8, -1, 5, 0, 4, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 3, 9, '0.00', 0, '2017-07-23', '2017-07-23', 0, '0.00', '2017-07-23', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 7, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'kiki', NULL, 1),
(27, 8, -1, 5, 0, 4, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 3, 9, '0.00', 0, '2017-07-24', '2017-07-24', 0, '0.00', '2017-07-24', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 8, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, 1, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'ana', NULL, NULL),
(29, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, '15.80', 3, '2017-07-24', '2017-07-24', 1, '1.10', '2017-07-24', '1.05', 0, 10, '4.70', 17, '0.00', '2338.19', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 7, NULL, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 2, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1),
(30, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, '15.80', 3, '2017-07-24', '2017-07-24', 1, '1.10', '2017-07-24', '1.05', 0, 10, '4.70', 17, '0.00', '2338.19', '0.00', 16, NULL, 0, 0, NULL, NULL, NULL, 7, NULL, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 2, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1),
(32, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, '15.80', 3, '2017-07-24', '2017-07-24', 1, '1.10', '2017-07-24', '1.05', 1, 10, '4.70', 17, '0.00', '2338.19', '0.00', 16, '1.00', 0, 0, NULL, NULL, NULL, 7, NULL, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 1, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1),
(33, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, '15.80', 3, '2017-07-24', '2017-07-24', 1, '1.10', '2017-07-24', '1.05', 1, 10, '4.70', 17, '0.00', '2338.19', '0.00', 21, '1.20', 0, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 2, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1),
(34, -1, 0, 5, 2, 0, 6, 1, 0, 4, 15, 13, 14, 20, 7, 1, 0, 9, '15.80', 3, '2017-07-24', '2017-07-24', 1, '1.10', '2017-07-24', '1.05', 1, 10, '4.70', 17, '0.00', '2338.19', '10026.74', 16, '1.00', 0, 0, NULL, NULL, NULL, 7, NULL, 'Fadenheftung', 2, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 3, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1),
(35, 50, 11, 5, 0, 990, 100, 21, 0, 4, 9, 13, 14, 0, 50, 10, 110, 9, '15.80', 0, '2017-07-26', '2017-07-26', 0, '1.10', '2017-07-26', '1.05', 1, 10, '4.70', 17, '0.00', '2744.19', '23802.70', 35, '1.20', 1100, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(36, 50, 20, 5, 0, 1710, 100, 40, 0, 4, 15, 13, 14, 0, 50, 20, 190, 9, '0.00', 0, '2017-07-26', '2017-07-26', 0, '0.00', '2017-07-26', '0.00', 0, 10, '2.50', 17, '0.00', '0.00', NULL, 40, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(37, 50, 20, 5, 0, 1710, 100, 40, 0, 4, 15, 13, 14, 0, 50, 20, 190, 9, '0.00', 0, '2017-07-26', '2017-07-26', 0, '0.00', '2017-07-26', '0.00', 0, 10, '2.50', 17, '0.00', '0.00', NULL, 40, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(38, 50, 20, 5, 0, 1710, 100, 40, 0, 4, 15, 13, 14, 0, 50, 20, 190, 9, '0.00', 0, '2017-07-26', '2017-07-26', 0, '0.00', '2017-07-26', '0.00', 0, 10, '2.50', 17, '0.00', '0.00', NULL, 40, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(39, 3900, 488, 5, 0, 1710, 4000, 500, 0, 4, 15, 13, 14, 0, 100, 12, 190, 9, '26.90', 0, '2017-07-26', '2017-07-26', 0, '1.00', '2017-07-26', '1.00', 1, 10, '8.00', 17, '0.00', '3192.19', '43803.08', 16, '1.00', 1900, 0, NULL, NULL, NULL, 8, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 3, 1, 2, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1),
(41, 910, 190, 5, 0, 900, 1000, 208, 0, 4, 15, 13, 14, 0, 90, 18, 100, 9, '16.10', 0, '2017-07-26', '2017-07-26', 0, '1.00', '2017-07-26', '1.00', 1, 10, '4.80', 17, '0.00', '2688.19', '26290.59', 37, '1.35', 1000, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(42, 1100, 550, 5, 0, 926, 1900, 950, 0, 4, 9, 16, 14, 0, 800, 400, 102, 9, '5.70', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '2.00', 17, '0.00', '2733.41', '45859.84', 16, '1.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 5, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(43, 910, 505, 5, 0, 900, 1000, 555, 0, 4, 15, 13, 14, 0, 90, 50, 100, 9, '6.10', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '1.80', 17, '0.00', '2717.66', '31873.54', 16, '1.00', 1000, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 7, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(44, 400, 222, 5, 0, 926, 1200, 666, 0, 4, 9, 13, 14, 0, 800, 444, 102, 9, '6.10', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '1.80', 17, '0.00', '2733.41', '42904.63', 16, '1.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 7, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(45, 100, 40, 5, 0, 9000, 1000, 400, 0, 4, 15, 13, 14, 0, 900, 360, 1000, 9, '8.40', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '2.50', 17, '0.00', '7780.16', '162942.36', 16, '1.00', 10000, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 6, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(46, 720, 450, 5, 0, 1710, 800, 500, 0, 4, 15, 13, 14, 0, 80, 50, 190, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 1, 10, '1.60', 17, '0.00', '0.00', NULL, 16, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(47, 1810, 1131, 5, 0, 1710, 1900, 1187, 0, 4, 15, 13, 14, 0, 90, 56, 190, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 0, 10, '1.60', 17, '0.00', '0.00', NULL, 16, '0.00', 1900, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1),
(48, 1090, 681, 5, 0, 1710, 1980, 1237, 0, 4, 15, 30, 20, 0, 890, 556, 190, 9, '5.38', 0, '2017-07-27', '2017-07-27', 0, '1.15', '2017-07-27', '1.08', 1, 10, '1.60', 17, '0.00', '3223.91', '67193.04', 38, '1.35', 1900, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(49, 1800, 225, 8, 0, 1800, 1890, 236, 0, 9, 4, 33, 23, 0, 90, 11, 200, 9, '26.90', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '8.00', 17, '0.00', '3276.78', '40156.35', 23, '1.20', 2000, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(50, 2181, 272, 5, 0, 1800, 2990, 373, 0, 4, 9, 20, 12, 0, 809, 101, 200, 9, '26.90', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '8.00', 17, '0.00', '3276.78', '44485.01', 45, '1.35', 2000, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 3, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(51, 729, 202, 5, 0, 1800, 809, 224, 0, 4, 9, 20, 2, 0, 80, 22, 200, 9, '12.10', 0, '2017-07-27', '2017-07-27', 0, '1.10', '2017-07-27', '1.05', 1, 10, '3.60', 17, '0.00', '3276.78', '38522.43', 46, '1.35', 2000, 0, NULL, NULL, NULL, 7, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(52, 7309, 2149, 5, 0, 1800, 8098, 2381, 0, 4, 15, 13, 14, 0, 789, 232, 200, 9, '11.43', 0, '2017-07-27', '2017-07-27', 0, '1.11', '2017-07-27', '1.05', 1, 10, '3.40', 17, '0.00', '3276.78', '74856.03', 80, '1.35', 2000, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(53, 7300, 2920, 5, 2, 1800, 8000, 3200, 0, 4, 15, 13, 14, 20, 700, 280, 200, 9, '8.40', 3, '2017-07-27', '2017-07-27', 1, '1.00', '2017-07-27', '1.00', 1, 10, '2.50', 17, '0.00', '3487.72', '86551.15', 16, '1.00', 2000, 0, NULL, NULL, 3, 8, NULL, 'Fadenheftung', 1, 1, 'Hardcover', NULL, NULL, '2/2 -farbig', 'A5', 1, 1, 2, 2, '65 g/qm', NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(57, 23217, 4837, 5, 0, 4212, 23451, 4885, 0, 4, 15, 13, 14, 0, 234, 48, 467, 9, '16.10', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '4.80', 17, '0.00', '4783.72', '146061.47', 16, '1.00', 4679, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 4, 1, 3, 2, NULL, NULL, 2, 6, NULL, NULL, NULL, 'admin', NULL, 1),
(58, 7000, 875, 5, 0, 8100, 7890, 986, 0, 4, 34, 78, 21, 0, 890, 111, 900, 9, '26.90', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '8.00', 17, '0.00', '7217.66', '158783.43', 34, '1.20', 9000, 0, NULL, NULL, NULL, 7, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1),
(59, 801, 321, 5, 0, 1701, 890, 356, 0, 4, 9, 30, 27, 0, 89, 35, 189, 9, '8.40', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '2.50', 17, '0.00', '1788.04', '37812.60', 16, '1.00', 1890, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, 2, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ana', NULL, NULL),
(60, 6700, 837, 5, 0, 3783, 6789, 848, 0, 4, 15, 13, 14, 0, 89, 11, 6, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 0, 10, '8.00', 17, '0.00', '0.00', NULL, 33, '0.00', 3789, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(61, 822, 158, 5, 0, 1800, 900, 173, 0, 4, 15, 13, 14, 0, 78, 15, 200, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 0, 10, '5.20', 17, '0.00', '0.00', NULL, 16, '0.00', 2000, 0, NULL, NULL, NULL, 7, NULL, NULL, 2, 1, NULL, 1, NULL, NULL, NULL, 1, NULL, 2, 2, NULL, NULL, 3, NULL, NULL, NULL, NULL, 'ana', NULL, NULL),
(62, 622, 78, 5, 0, 2700, 700, 87, 0, 4, 15, 13, 14, 0, 78, 9, 300, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 0, 10, '8.00', 17, '0.00', '0.00', NULL, 16, '0.00', 3000, 0, NULL, NULL, NULL, 8, NULL, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, 2, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'ana', NULL, NULL),
(63, 8901, 5563, 5, 0, 2700, 8990, 5618, 0, 4, 9, 13, 4, 0, 89, 55, 299, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 0, 10, '1.60', 17, '0.00', '0.00', NULL, 78, '0.00', 2999, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(65, 8901, 5563, 5, 0, 2700, 8990, 5618, 0, 4, 9, 13, 4, 0, 89, 55, 299, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 0, 10, '1.60', 17, '0.00', '0.00', NULL, 78, '0.00', 2999, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(66, 8901, 5563, 5, 0, 2700, 8990, 5618, 0, 4, 9, 13, 4, 0, 89, 55, 299, 9, '0.00', 0, '2017-07-27', '2017-07-27', 0, '0.00', '2017-07-27', '0.00', 0, 10, '1.60', 17, '0.00', '0.00', NULL, 78, '0.00', 2999, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(69, 74889, 46805, 5, 0, 17018, 75678, 47298, 0, 4, 9, 20, 2, 0, 789, 493, 1890, 9, '5.38', 0, '2017-07-27', '2017-07-27', 0, '1.15', '2017-07-27', '1.08', 1, 10, '1.60', 17, '0.00', '12790.91', '927782.12', 44, '1.35', 18908, 0, NULL, NULL, NULL, 7, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(71, 820, 12, 5, 0, 1710, 900, 360, 0, 4, 9, 18, 7, 0, 80, 32, 190, 9, '8.40', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '2.50', 17, '0.00', '572.43', '1907.52', 16, '1.00', 1900, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, 6, NULL, NULL, NULL, 'dmd', NULL, NULL),
(72, 1622, 649, 5, 0, 1710, 1700, 680, 0, 4, 9, 9, 7, 0, 78, 31, 190, 9, '8.40', 0, '2017-07-27', '2017-07-27', 0, '1.00', '2017-07-27', '1.00', 1, 10, '2.50', 17, '0.00', '1793.66', '41618.44', 16, '1.00', 1900, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, 2, NULL, 3, 2, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'ana', NULL, NULL),
(73, 1100, 440, 5, 0, 926, 1900, 760, 0, 4, 9, 16, 14, 0, 800, 320, 102, 9, '8.40', 0, '2017-07-28', '2017-07-28', 0, '1.00', '2017-07-28', '1.00', 1, 10, '2.50', 17, '0.00', '2733.41', '41456.39', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 4, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(76, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '12.10', 0, '2017-07-28', '2017-07-28', 0, '1.10', '2017-07-28', '1.05', 1, 10, '3.60', 17, '0.00', '2733.41', '36059.01', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 3, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(77, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '3.60', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(78, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '3.60', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(79, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '3.60', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(80, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '3.60', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(81, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '12.10', 0, '2017-07-28', '2017-07-28', 0, '1.10', '2017-07-28', '1.05', 1, 10, '3.60', 17, '0.00', '2733.41', '36059.01', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(91, 1100, 440, 5, 0, 926, 1900, 760, 0, 4, 9, 16, 14, 0, 800, 320, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '2.50', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(92, 1100, 137, 5, 0, 926, 1900, 237, 0, 4, 9, 16, 14, 0, 800, 100, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '8.00', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(93, 1100, 272, 5, 0, 926, 1900, 470, 0, 4, 9, 16, 14, 0, 800, 198, 102, 9, '13.58', 0, '2017-07-28', '2017-07-28', 0, '1.09', '2017-07-28', '1.05', 1, 10, '4.04', 17, '0.00', '2730.03', '33763.74', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(94, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '12.10', 0, '2017-07-28', '2017-07-28', 0, '1.10', '2017-07-28', '1.05', 1, 10, '3.60', 17, '0.00', '2730.03', '34966.65', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(96, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '12.10', 0, '2017-07-28', '2017-07-28', 0, '1.10', '2017-07-28', '1.05', 1, 10, '3.60', 17, '0.00', '2730.03', '34966.65', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(97, 1100, 176, 5, 0, 926, 1900, 304, 0, 4, 9, 16, 14, 0, 800, 128, 102, 9, '20.98', 0, '2017-07-28', '2017-07-28', 0, '1.04', '2017-07-28', '1.02', 1, 10, '6.24', 17, '0.00', '2731.91', '33820.64', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(98, 1100, 687, 5, 0, 926, 1900, 1187, 0, 4, 9, 16, 14, 0, 800, 500, 102, 9, '5.38', 0, '2017-07-28', '2017-07-28', 0, '1.15', '2017-07-28', '1.08', 1, 10, '1.60', 17, '0.00', '2737.17', '58482.79', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 6, NULL, NULL, NULL, 'admin', NULL, 1),
(99, 1100, 137, 5, 0, 926, 1900, 237, 0, 4, 9, 16, 14, 0, 800, 100, 102, 9, '26.90', 0, '2017-07-28', '2017-07-28', 0, '1.00', '2017-07-28', '1.00', 1, 10, '8.00', 17, '0.00', '2733.79', '35974.00', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(100, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '3.60', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(101, 1100, 305, 5, 0, 926, 1900, 527, 0, 4, 9, 16, 14, 0, 800, 222, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '3.60', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(102, 10, 0, 5, 0, 926, 1900, 0, 0, 4, 9, 16, 14, 0, 800, 0, 102, 9, '12.10', 0, '2017-07-28', '2017-07-28', 0, '1.10', '2017-07-28', '1.05', 1, 10, '3.60', 17, '0.00', '2086.84', '30912.64', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 1, 1, 3, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(103, 1100, 611, 5, 0, 180, 1900, 1055, 0, 4, 9, 16, 14, 0, 800, 444, 20, 9, '6.10', 0, '2017-07-28', '2017-07-28', 0, '1.00', '2017-07-28', '1.00', 1, 10, '1.80', 17, '0.00', '1630.47', '50457.87', 20, '1.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 4, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(104, 1100, 611, 5, 0, 926, 1900, 1055, 0, 4, 9, 16, 14, 0, 800, 444, 102, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '1.80', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(106, 1100, 611, 5, 0, 926, 1900, 1055, 0, 4, 9, 16, 14, 0, 800, 444, 102, 9, '6.10', 0, '2017-07-28', '2017-07-28', 0, '1.00', '2017-07-28', '1.00', 1, 10, '1.80', 17, '0.00', '2096.22', '61958.04', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(107, 1100, 611, 10, 0, 160, 1900, 1055, 0, 10, 9, 16, 14, 0, 800, 444, 20, 9, '6.10', 0, '2017-07-28', '2017-07-28', 0, '1.00', '2017-07-28', '1.00', 1, 10, '1.80', 17, '0.00', '1630.47', '50457.87', 20, '1.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(112, 1100, 611, 10, 0, 160, 1900, 1055, 0, 10, 9, 16, 14, 0, 800, 444, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '1.80', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(113, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(114, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(115, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(116, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(117, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(118, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(119, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(120, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(121, 1100, 440, 10, 0, 160, 1900, 760, 0, 10, 9, 16, 14, 0, 800, 320, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '2.50', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(123, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(124, 10, 1, 10, 0, 160, 1900, 1, 0, 10, 9, 16, 14, 0, 800, 1, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, NULL, NULL, 4, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'pm', NULL, NULL),
(129, 1100, 611, 10, 0, 160, 1900, 1055, 0, 10, 9, 16, 14, 0, 800, 444, 20, 9, '0.00', 0, '2017-07-28', '2017-07-28', 0, '0.00', '2017-07-28', '0.00', 0, 10, '1.80', 17, '0.00', '0.00', NULL, 35, '0.00', 200, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(130, 1100, 229, 10, 0, 906, 1900, 395, 0, 10, 9, 16, 14, 0, 800, 166, 102, 9, '0.00', 0, '2017-07-30', '2017-07-30', 0, '0.00', '2017-07-30', '0.00', 0, 10, '4.80', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(131, 1100, 305, 10, 0, 906, 1900, 527, 0, 10, 9, 16, 14, 0, 800, 222, 102, 9, '12.10', 0, '2017-07-30', '2017-07-30', 0, '1.10', '2017-07-30', '1.05', 1, 10, '3.60', 17, '0.00', '2134.02', '49729.01', 35, '1.20', 1028, 0, NULL, NULL, NULL, 7, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'admin', NULL, 1),
(132, 10, 0, 10, 2, 4, 1900, 1, 0, 10, 9, 16, 14, 20, 800, 1, 3, 9, '0.00', 3, '2017-07-31', '2017-07-31', 1, '0.00', '2017-07-31', '0.00', 0, 10, '0.00', 17, '0.00', '0.00', NULL, 35, '0.00', 1028, 0, NULL, NULL, 3, 7, NULL, 'PUR-Bindung', 2, NULL, 'Hardcover', NULL, NULL, '3/3 -farbig', 'A5', 3, 2, 2, 3, '70 g/qm', NULL, 3, 6, NULL, NULL, NULL, 'walo', NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `demandcategorycalculation`
--

CREATE TABLE `demandcategorycalculation` (
  `ID` bigint(20) NOT NULL,
  `SUMME` decimal(10,2) DEFAULT NULL,
  `SUMMEGLOBAL` decimal(10,2) DEFAULT NULL,
  `VALIDE` tinyint(1) DEFAULT '0',
  `DEMANDCATEGORYDEPARTEMENTCALCULATION_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENTCRITERIA_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandcategorycalculationitem`
--

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

-- --------------------------------------------------------

--
-- Structure de la table `demandcategorydepartementcalculation`
--

CREATE TABLE `demandcategorydepartementcalculation` (
  `ID` bigint(20) NOT NULL,
  `SUMME` decimal(10,2) DEFAULT NULL,
  `SUMMEGLOBAL` decimal(10,2) DEFAULT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `demandcategoryvalidation`
--

CREATE TABLE `demandcategoryvalidation` (
  `ID` int(11) NOT NULL,
  `SYSDATE` time DEFAULT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

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
(5, 'Assetmanagement'),
(6, 'Media IT'),
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
(28, 'Projektmanagement Leistungen:', 4);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `device`
--

INSERT INTO `device` (`ID`, `BROWSER`, `DEVICECATEGORIE`, `OPERATINGSYSTEM`, `USER_LOGIN`) VALUES
(1, 'CHROME 59.0.3071.115', 'Personal computer', 'Windows 7', 'walo');

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
(2, 1, '2017-08-01 13:01:45', 'walo'),
(51, 1, '2017-08-01 14:31:29', 'walo'),
(52, 0, '2017-08-01 14:31:43', 'walo'),
(53, 1, '2017-08-01 14:31:48', 'walo'),
(101, 1, '2017-08-01 14:34:50', 'walo'),
(151, 1, '2017-08-01 14:37:27', 'walo');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(51, 'Falls Register ausgewählt= 1 Euro*Auflage', '1.00');

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
('SEQ_GEN', '200');

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
  `LABEL` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Structure de la table `user`
--

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
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_AUFLAGE_ID` (`AUFLAGE_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_FARBIGKEIT_ID` (`FARBIGKEIT_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_COVER_ID` (`COVER_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_BAUKASTEN_ID` (`BAUKASTEN_ID`);

--
-- Index pour la table `ausgabe`
--
ALTER TABLE `ausgabe`
  ADD PRIMARY KEY (`ID`);

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
  ADD KEY `FK_DEMANDCATEGORY_DEPARTMENT_ID` (`DEPARTMENT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_KONZEPTBEARBEITUNGFAKTOR_ID` (`KONZEPTBEARBEITUNGFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_VEREDLUNG_ID` (`VEREDLUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_COVER_ID` (`COVER_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PARTICIPANTFAKTOR_ID` (`PARTICIPANTFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_LAYOUT_ID` (`LAYOUT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_DRUCKSEITEN_ID` (`DRUCKSEITEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_MITGLIEDERKORREKTURFAKTOR_ID` (`MITGLIEDERKORREKTURFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_USER_LOGIN` (`USER_LOGIN`),
  ADD KEY `FK_DEMANDCATEGORY_BAUKASTEN_ID` (`BAUKASTEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_KATALOGART_ID` (`KATALOGART_ID`),
  ADD KEY `FK_DEMANDCATEGORY_FORMATAUSWAEHLEN_ID` (`FORMATAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_SCHLUESSEL_ID` (`SCHLUESSEL_ID`),
  ADD KEY `FK_DEMANDCATEGORY_ARTDERWEITERVERARBEITUNG_ID` (`ARTDERWEITERVERARBEITUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_AUFLAGE_ID` (`AUFLAGE_ID`),
  ADD KEY `FK_DEMANDCATEGORY_UMSCHLAGPAPIERAUSWAEHLEN_ID` (`UMSCHLAGPAPIERAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_BINDUNG_ID` (`BINDUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PAPIERMATERIALAUSWAEHLEN_ID` (`PAPIERMATERIALAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEIT_ID` (`UMSCHLAGFARBIGKEIT_ID`),
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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `correctionschluessel`
--
ALTER TABLE `correctionschluessel`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT pour la table `demandcategory`
--
ALTER TABLE `demandcategory`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;
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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `departementcriteriaitem`
--
ALTER TABLE `departementcriteriaitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT pour la table `umschlagfarbigkeit`
--
ALTER TABLE `umschlagfarbigkeit`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
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
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_FARBIGKEIT_ID` FOREIGN KEY (`FARBIGKEIT_ID`) REFERENCES `farbigkeit` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_FORMATAUSWAEHLEN_ID` FOREIGN KEY (`FORMATAUSWAEHLEN_ID`) REFERENCES `formatauswaehlen` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_SEITEN_ID` FOREIGN KEY (`SEITEN_ID`) REFERENCES `seiten` (`ID`);

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
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PAPIERMATERIALAUSWAEHLEN_ID` FOREIGN KEY (`PAPIERMATERIALAUSWAEHLEN_ID`) REFERENCES `papiermaterialauswaehlen` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PARTICIPANTFAKTOR_ID` FOREIGN KEY (`PARTICIPANTFAKTOR_ID`) REFERENCES `participantfaktor` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PRODUCT_ID` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_PROZESS_ID` FOREIGN KEY (`PROZESS_ID`) REFERENCES `prozess` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_REGISTER_ID` FOREIGN KEY (`REGISTER_ID`) REFERENCES `register` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_SCHLUESSEL_ID` FOREIGN KEY (`SCHLUESSEL_ID`) REFERENCES `schluessel` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEIT_ID` FOREIGN KEY (`UMSCHLAGFARBIGKEIT_ID`) REFERENCES `umschlagfarbigkeit` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_UMSCHLAGPAPIERAUSWAEHLEN_ID` FOREIGN KEY (`UMSCHLAGPAPIERAUSWAEHLEN_ID`) REFERENCES `umschlagpapierauswaehlen` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_VEREDLUNG_ID` FOREIGN KEY (`VEREDLUNG_ID`) REFERENCES `veredlung` (`ID`),
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
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_PRODUCT_CATEGORY_ID` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`ID`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_QUESTION_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`);

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
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_DEPARTEMENT_ID` FOREIGN KEY (`DEPARTEMENT_ID`) REFERENCES `departement` (`ID`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
