-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 24 Juillet 2017 à 17:24
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auflage`
--

CREATE TABLE `auflage` (
  `ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auflageseitencovermatrix`
--

CREATE TABLE `auflageseitencovermatrix` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `AUFLAGE_ID` int(11) DEFAULT NULL,
  `FARBIGKEIT_ID` varchar(255) DEFAULT NULL,
  `FORMATAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `SEITEN_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ausgabe`
--

CREATE TABLE `ausgabe` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `VALUEE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ausgabe`
--

INSERT INTO `ausgabe` (`ID`, `NAME`, `PRICE`, `VALUEE`) VALUES
(7, 'Erstausgabe', NULL, '1.00'),
(8, 'Folgeausgabe', NULL, '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `bindung`
--

CREATE TABLE `bindung` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `configurationitem`
--

INSERT INTO `configurationitem` (`ID`, `DEFAULTVALUE`, `NAME`, `CONFIGURATION_ID`) VALUES
(1, '56.00', 'std_stz', 1),
(2, '70.00', 'std_stz_dtp', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `correctionschluessel`
--

CREATE TABLE `correctionschluessel` (
  `ID` bigint(20) NOT NULL,
  `PERCENT` int(11) DEFAULT NULL,
  `WERT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `correctionschluessel`
--

INSERT INTO `correctionschluessel` (`ID`, `PERCENT`, `WERT`) VALUES
(1, 0, '1.00'),
(2, 1, '1.00'),
(3, 2, '1.00'),
(4, 3, '1.00'),
(5, 4, '1.00'),
(6, 5, '1.00'),
(7, 6, '1.00'),
(8, 7, '1.00'),
(9, 8, '1.00'),
(10, 9, '1.00'),
(11, 10, '1.00'),
(12, 11, '1.00'),
(13, 12, '1.00'),
(14, 13, '1.00'),
(15, 14, '1.00'),
(17, 15, '1.00'),
(18, 16, '1.00'),
(19, 17, '1.00'),
(20, 18, '1.00'),
(21, 19, '1.00'),
(22, 20, '1.00'),
(23, 21, '1.00'),
(24, 22, '1.00'),
(25, 23, '1.00'),
(26, 24, '1.00'),
(27, 25, '1.00'),
(28, 26, '1.00'),
(29, 27, '1.00'),
(30, 28, '1.00'),
(31, 29, '1.00'),
(32, 30, '1.00'),
(33, 31, '1.00'),
(34, 32, '1.00'),
(35, 33, '1.00'),
(36, 34, '1.00'),
(37, 35, '1.00'),
(38, 36, '1.00'),
(39, 37, '1.00'),
(40, 38, '1.00'),
(41, 39, '1.00'),
(42, 40, '1.00'),
(43, 41, '1.00'),
(44, 42, '1.00'),
(45, 43, '1.00'),
(46, 44, '1.00'),
(47, 45, '1.00'),
(48, 46, '1.00'),
(49, 47, '1.00'),
(50, 48, '1.00'),
(51, 49, '1.00'),
(52, 50, '1.00'),
(53, 51, '1.00'),
(54, 52, '1.00'),
(55, 53, '1.00'),
(56, 54, '1.00'),
(57, 55, '1.00'),
(58, 56, '1.00'),
(59, 57, '1.00'),
(60, 58, '1.00'),
(61, 59, '1.00'),
(62, 60, '1.00'),
(63, 61, '1.00'),
(64, 62, '1.00'),
(65, 63, '1.00'),
(66, 64, '1.00'),
(67, 65, '1.00'),
(68, 66, '1.00'),
(69, 67, '1.00'),
(70, 68, '1.00'),
(71, 69, '1.00'),
(72, 70, '1.00'),
(73, 71, '1.00'),
(74, 72, '1.00'),
(75, 73, '1.00'),
(76, 74, '1.00'),
(77, 75, '1.00'),
(78, 76, '1.00'),
(79, 77, '1.00'),
(80, 78, '1.00'),
(81, 79, '1.00'),
(82, 80, '1.00'),
(83, 81, '1.00'),
(84, 82, '1.00'),
(85, 83, '1.00'),
(86, 84, '1.00'),
(87, 85, '1.00'),
(88, 86, '1.00'),
(89, 87, '1.00'),
(90, 88, '1.00'),
(91, 89, '1.00'),
(92, 90, '1.00'),
(93, 91, '1.00'),
(94, 92, '1.00'),
(95, 93, '1.00'),
(96, 94, '1.00'),
(97, 95, '1.00'),
(98, 96, '1.00'),
(99, 97, '1.00'),
(100, 98, '1.00'),
(101, 99, '1.00'),
(102, 100, '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `cover`
--

CREATE TABLE `cover` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `BEARBEITUNGSZEIT` int(11) DEFAULT NULL,
  `DATEDEMANDCATEGORY` date DEFAULT NULL,
  `DATESYSTEM` date DEFAULT NULL,
  `DRUCK` tinyint(1) DEFAULT '0',
  `LIEFERTERMIN` date DEFAULT NULL,
  `NBRTOTALVALIDATION` int(11) DEFAULT NULL,
  `PERCENTSEITENFAKTOR` int(11) DEFAULT NULL,
  `SEITENANZAHL` int(11) DEFAULT NULL,
  `SUMMDRUCK` decimal(10,2) DEFAULT NULL,
  `SUMMTOTAL` decimal(10,2) DEFAULT NULL,
  `TEILNEHMERZAHL` int(11) DEFAULT NULL,
  `UMFANG` int(11) DEFAULT NULL,
  `UMSCHLAG` tinyint(1) DEFAULT '0',
  `SCHLUESSEL_ID` bigint(20) DEFAULT NULL,
  `ARTDERWEITERVERARBEITUNG_ID` bigint(20) DEFAULT NULL,
  `AUFLAGE_ID` int(11) DEFAULT NULL,
  `AUSGABE_ID` bigint(20) DEFAULT NULL,
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
  `WECHSELFASSUNGVARIANTFAKTOR_ID` bigint(20) DEFAULT NULL,
  `PRODUCTSCHLUESSELFAKTOR` decimal(10,2) NOT NULL,
  `ARTIKELPERPAGELFAKTOR` decimal(10,2) NOT NULL,
  `LKSCHLUESSELFAKTOR` decimal(10,2) NOT NULL,
  `MKSCHLUESSELFAKTOR` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategory`
--

INSERT INTO `demandcategory` (`ID`, `ANZAHLBESTANDARTIKEL`, `ANZAHLBESTANDPRODUKT`, `ANZAHLBESTELLNRSEITEN`, `ANZAHLBETEILIGTEN`, `ANZAHLGENERIERUNGUPDATESEITEN`, `ANZAHLGESAMTARTIKEL`, `ANZAHLGESAMTPRODUKT`, `ANZAHLGESAMTSEITEN`, `ANZAHLIHVZSEITEN`, `ANZAHLKAPITETEL`, `ANZAHLLIEFERANTGESAMT`, `ANZAHLLIEFERANTNEU`, `ANZAHLMITGLIEDER`, `ANZAHLNEUEARTIKEL`, `ANZAHLNEUEPRODUKT`, `ANZAHLSONDERSEITEN`, `ANZAHLÜBERNAHMEARTIKEL`, `BEARBEITUNGSZEIT`, `DATEDEMANDCATEGORY`, `DATESYSTEM`, `DRUCK`, `LIEFERTERMIN`, `NBRTOTALVALIDATION`, `PERCENTSEITENFAKTOR`, `SEITENANZAHL`, `SUMMDRUCK`, `SUMMTOTAL`, `TEILNEHMERZAHL`, `UMFANG`, `UMSCHLAG`, `SCHLUESSEL_ID`, `ARTDERWEITERVERARBEITUNG_ID`, `AUFLAGE_ID`, `AUSGABE_ID`, `BINDUNG_ID`, `CATEGORY_ID`, `CORRECTIONSCHLUESSEL_ID`, `COVER_ID`, `DEPARTMENT_ID`, `DRUCKSEITEN_ID`, `FARBIGKEIT_ID`, `FORMATAUSWAEHLEN_ID`, `KATALOGART_ID`, `KONZEPTBEARBEITUNGFAKTOR_ID`, `LAYOUT_ID`, `MITGLIEDERKORREKTURFAKTOR_ID`, `PAPIERMATERIALAUSWAEHLEN_ID`, `PARTICIPANTFAKTOR_ID`, `PRODUCT_ID`, `PROZESS_ID`, `REGISTER_ID`, `UMSCHLAGFARBIGKEIT_ID`, `UMSCHLAGPAPIERAUSWAEHLEN_ID`, `USER_LOGIN`, `VEREDLUNG_ID`, `WECHSELFASSUNGVARIANTFAKTOR_ID`, `PRODUCTSCHLUESSELFAKTOR`, `ARTIKELPERPAGELFAKTOR`, `LKSCHLUESSELFAKTOR`, `MKSCHLUESSELFAKTOR`) VALUES
(24, -1, 0, 5, 2, 0, 6, 2, 0, 4, 15, 13, 14, 20, 7, 2, 0, 9, 3, '2017-07-23', '2017-07-23', 1, '2017-07-23', 0, 10, 17, '0.00', '2338.19', 16, 0, 0, NULL, NULL, NULL, 7, 'Fadenheftung', 1, 102, NULL, NULL, NULL, '1/1 -farbig', NULL, 1, 1, 1, 2, '65 g/qm', NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '2.72', '9.14', '1.01', '1.01'),
(25, -1, -1, 5, 0, 0, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 0, 9, 0, '2017-07-23', '2017-07-23', 0, '2017-07-23', 0, 10, 17, '0.00', '2128.19', 16, 0, 0, NULL, NULL, NULL, 7, NULL, 1, 102, NULL, NULL, NULL, NULL, NULL, 2, 1, 3, 2, NULL, NULL, 1, 5, NULL, NULL, NULL, 'walo', NULL, 1, '0.00', '0.00', '0.00', '0.00'),
(26, 8, -1, 5, 0, 4, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-23', '2017-07-23', 0, '2017-07-23', 0, 10, 17, '0.00', '0.00', 16, 0, 0, NULL, NULL, NULL, 7, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, NULL, 2, 5, NULL, NULL, NULL, 'kiki', NULL, 1, '0.00', '0.00', '0.00', '0.00'),
(27, 8, -1, 5, 0, 4, 6, 10, 0, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-24', '2017-07-24', 0, '2017-07-24', 0, 10, 17, '0.00', '0.00', 16, 0, 0, NULL, NULL, NULL, 8, NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, 1, 2, NULL, NULL, 2, NULL, NULL, NULL, NULL, 'ana', NULL, NULL, '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Structure de la table `demandcategorycalculation`
--

CREATE TABLE `demandcategorycalculation` (
  `ID` bigint(20) NOT NULL,
  `SUMME` decimal(10,2) DEFAULT NULL,
  `SUMMEGLOBAL` decimal(10,0) DEFAULT NULL,
  `VALIDE` tinyint(1) DEFAULT '0',
  `DEMANDCATEGORYDEPARTEMENTCALCULATION_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENTCRITERIA_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategorycalculation`
--

INSERT INTO `demandcategorycalculation` (`ID`, `SUMME`, `SUMMEGLOBAL`, `VALIDE`, `DEMANDCATEGORYDEPARTEMENTCALCULATION_ID`, `DEPARTEMENTCRITERIA_ID`) VALUES
(371, '224.00', NULL, 0, 98, 1),
(372, '72.80', NULL, 0, 98, 2),
(373, '56.28', NULL, 0, 98, 3),
(374, '23.20', NULL, 0, 98, 4),
(375, '28.00', NULL, 0, 98, 5),
(376, '140.00', NULL, 0, 98, 6),
(377, '115.23', NULL, 0, 98, 7),
(378, '44.80', NULL, 0, 98, 8),
(379, '56.00', NULL, 0, 99, 9),
(380, '28.58', NULL, 0, 99, 10),
(381, '484.96', NULL, 0, 99, 11),
(382, '0.28', NULL, 0, 99, 12),
(383, '0.00', NULL, 0, 99, 13),
(384, '0.06', NULL, 0, 99, 14),
(385, '0.00', NULL, 0, 100, 15),
(386, '0.00', NULL, 0, 100, 16),
(387, '0.00', NULL, 0, 100, 17),
(388, '0.00', NULL, 0, 100, 18),
(389, '0.00', NULL, 0, 100, 19),
(390, '0.00', NULL, 0, 100, 20),
(391, '168.00', NULL, 0, 101, 28),
(392, '0.00', NULL, 0, 102, 21),
(393, '0.00', NULL, 0, 102, 22),
(394, '0.00', NULL, 0, 102, 23),
(395, '0.00', NULL, 0, 103, 24),
(396, '0.00', NULL, 0, 103, 25),
(397, '896.00', NULL, 0, 104, 27),
(398, '224.00', NULL, 0, 105, 1),
(399, '72.80', NULL, 0, 105, 2),
(400, '56.28', NULL, 0, 105, 3),
(401, '23.20', NULL, 0, 105, 4),
(402, '28.00', NULL, 0, 105, 5),
(403, '140.00', NULL, 0, 105, 6),
(404, '115.23', NULL, 0, 105, 7),
(405, '44.80', NULL, 0, 105, 8),
(406, '56.00', NULL, 0, 106, 9),
(407, '28.58', NULL, 0, 106, 10),
(408, '484.96', NULL, 0, 106, 11),
(409, '0.28', NULL, 0, 106, 12),
(410, '0.00', NULL, 0, 106, 13),
(411, '0.06', NULL, 0, 106, 14),
(412, '0.00', NULL, 0, 107, 15),
(413, '0.00', NULL, 0, 107, 16),
(414, '0.00', NULL, 0, 107, 17),
(415, '0.00', NULL, 0, 107, 18),
(416, '0.00', NULL, 0, 107, 19),
(417, '0.00', NULL, 0, 107, 20),
(418, '168.00', NULL, 0, 108, 28),
(419, '0.00', NULL, 0, 109, 21),
(420, '0.00', NULL, 0, 109, 22),
(421, '0.00', NULL, 0, 109, 23),
(422, '0.00', NULL, 0, 110, 24),
(423, '0.00', NULL, 0, 110, 25),
(424, '686.00', NULL, 0, 111, 27),
(425, '224.00', NULL, 0, 112, 1),
(426, NULL, NULL, 0, 112, 2),
(427, '224.00', NULL, 0, 113, 1),
(428, NULL, NULL, 0, 113, 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategorycalculationitem`
--

INSERT INTO `demandcategorycalculationitem` (`ID`, `CALCULTAED`, `PRICE`, `PRICEGLOBAL`, `PRICEGLOBALUPDATE`, `PRICEUPDATE`, `DEMANDCATEGORYCALCULATION_ID`, `DEPARTEMENTCRITERIAITEM_ID`) VALUES
(813, 1, '56.00', '448.00', '448.00', '56.00', 371, 1),
(814, 1, '56.00', '336.00', '336.00', '56.00', 371, 2),
(815, 1, '56.00', '168.00', '168.00', '56.00', 371, 7),
(816, 1, '56.00', '448.00', '448.00', '56.00', 371, 8),
(817, 1, '56.00', '56.00', '56.00', '56.00', 372, 3),
(818, 1, '0.00', '0.00', '0.00', '0.00', 372, 4),
(819, 1, '5.60', '11.20', '11.20', '5.60', 372, 16),
(820, 1, '11.20', '22.40', '22.40', '11.20', 372, 17),
(821, 1, '0.28', '1.68', '1.68', '0.28', 373, 11),
(822, 1, '56.00', '896.00', '896.00', '56.00', 373, 12),
(823, 1, '6.40', '0.00', '0.00', '6.40', 374, 13),
(824, 1, '11.20', '22.40', '22.40', '11.20', 374, 19),
(825, 1, '5.60', '11.20', '11.20', '5.60', 374, 20),
(826, 1, '28.00', '392.00', '392.00', '28.00', 375, 14),
(827, 1, '0.00', '0.00', '0.00', '0.00', 375, 15),
(828, 1, '0.00', '0.00', '0.00', '0.00', 375, 21),
(829, 1, '0.00', '0.00', '0.00', '0.00', 375, 22),
(830, 1, '0.00', '0.00', '0.00', '0.00', 375, 23),
(831, 1, '0.00', '0.00', '0.00', '0.00', 375, 24),
(832, 1, '0.00', '0.00', '0.00', '0.00', 376, 25),
(833, 1, '140.00', '2100.00', '2100.00', '140.00', 376, 26),
(834, 1, '0.28', '0.56', '0.56', '0.28', 377, 27),
(835, 1, '56.00', '672.00', '672.00', '56.00', 377, 28),
(836, 1, '56.00', '448.00', '448.00', '56.00', 377, 29),
(837, 1, '2.95', '0.00', '0.00', '2.95', 377, 30),
(838, 1, '22.40', '336.00', '336.00', '22.40', 378, 31),
(839, 1, '22.40', '224.00', '224.00', '22.40', 378, 32),
(840, 1, '56.00', '560.00', '560.00', '56.00', 379, 5),
(841, 1, '0.23', '0.47', '0.47', '0.23', 380, 33),
(842, 1, '0.35', '2.45', '2.45', '0.35', 380, 34),
(843, 1, '28.00', '392.00', '392.00', '28.00', 380, 35),
(844, 1, '224.00', '224.00', '224.00', '224.00', 381, 36),
(845, 1, '28.00', '392.00', '392.00', '28.00', 381, 37),
(846, 1, '8.96', '116.48', '116.48', '8.96', 381, 38),
(847, 1, '224.00', '224.00', '224.00', '224.00', 381, 39),
(848, 1, '0.28', '1.68', '1.68', '0.28', 382, 40),
(849, 1, '0.00', '0.00', '0.00', '0.00', 383, 6),
(850, 1, '0.06', '0.34', '0.34', '0.06', 384, 41),
(851, 1, '0.00', '0.00', '0.00', '0.00', 391, 48),
(852, 1, '0.00', '0.00', '0.00', '0.00', 391, 49),
(853, 1, '0.00', '0.00', '0.00', '0.00', 391, 50),
(854, 1, '0.00', '0.00', '0.00', '0.00', 391, 51),
(855, 1, '0.00', '0.00', '0.00', '0.00', 391, 52),
(856, 1, '0.00', '0.00', '0.00', '0.00', 391, 53),
(857, 1, '0.00', '0.00', '0.00', '0.00', 391, 54),
(858, 1, '0.00', '0.00', '0.00', '0.00', 391, 55),
(859, 1, '0.00', '0.00', '0.00', '0.00', 391, 58),
(860, 1, '0.00', '0.00', '0.00', '0.00', 391, 59),
(861, 1, '0.00', '0.00', '0.00', '0.00', 391, 60),
(862, 1, '0.00', '0.00', '0.00', '0.00', 391, 61),
(863, 1, '0.00', '0.00', '0.00', '0.00', 391, 62),
(864, 1, '168.00', '168.00', '168.00', '168.00', 391, 63),
(865, 1, '0.00', '0.00', '0.00', '0.00', 391, 64),
(866, 1, '252.00', '504.00', '504.00', '252.00', 397, 42),
(867, 1, '168.00', '336.00', '336.00', '168.00', 397, 43),
(868, 1, '42.00', '84.00', '84.00', '42.00', 397, 44),
(869, 1, '14.00', '42.00', '42.00', '14.00', 397, 45),
(870, 1, '336.00', '336.00', '336.00', '336.00', 397, 46),
(871, 1, '84.00', '84.00', '84.00', '84.00', 397, 47),
(872, 1, '56.00', '448.00', '448.00', '56.00', 398, 1),
(873, 1, '56.00', '336.00', '336.00', '56.00', 398, 2),
(874, 1, '56.00', '168.00', '168.00', '56.00', 398, 7),
(875, 1, '56.00', '448.00', '448.00', '56.00', 398, 8),
(876, 1, '56.00', '56.00', '56.00', '56.00', 399, 3),
(877, 1, '0.00', '0.00', '0.00', '0.00', 399, 4),
(878, 1, '5.60', '56.00', '56.00', '5.60', 399, 16),
(879, 1, '11.20', '123.20', '123.20', '11.20', 399, 17),
(880, 1, '0.28', '1.68', '1.68', '0.28', 400, 11),
(881, 1, '56.00', '896.00', '896.00', '56.00', 400, 12),
(882, 1, '6.40', '0.00', '0.00', '6.40', 401, 13),
(883, 1, '11.20', '123.20', '123.20', '11.20', 401, 19),
(884, 1, '5.60', '56.00', '56.00', '5.60', 401, 20),
(885, 1, '28.00', '392.00', '392.00', '28.00', 402, 14),
(886, 1, '0.00', '0.00', '0.00', '0.00', 402, 15),
(887, 1, '0.00', '0.00', '0.00', '0.00', 402, 21),
(888, 1, '0.00', '0.00', '0.00', '0.00', 402, 22),
(889, 1, '0.00', '0.00', '0.00', '0.00', 402, 23),
(890, 1, '0.00', '0.00', '0.00', '0.00', 402, 24),
(891, 1, '0.00', '0.00', '0.00', '0.00', 403, 25),
(892, 1, '140.00', '2100.00', '2100.00', '140.00', 403, 26),
(893, 1, '0.28', '2.80', '2.80', '0.28', 404, 27),
(894, 1, '56.00', '672.00', '672.00', '56.00', 404, 28),
(895, 1, '56.00', '448.00', '448.00', '56.00', 404, 29),
(896, 1, '2.95', '0.00', '0.00', '2.95', 404, 30),
(897, 1, '22.40', '336.00', '336.00', '22.40', 405, 31),
(898, 1, '22.40', '224.00', '224.00', '22.40', 405, 32),
(899, 1, '56.00', '560.00', '560.00', '56.00', 406, 5),
(900, 1, '0.23', '2.57', '2.57', '0.23', 407, 33),
(901, 1, '0.35', '2.45', '2.45', '0.35', 407, 34),
(902, 1, '28.00', '392.00', '392.00', '28.00', 407, 35),
(903, 1, '224.00', '224.00', '224.00', '224.00', 408, 36),
(904, 1, '28.00', '392.00', '392.00', '28.00', 408, 37),
(905, 1, '8.96', '116.48', '116.48', '8.96', 408, 38),
(906, 1, '224.00', '224.00', '224.00', '224.00', 408, 39),
(907, 1, '0.28', '1.68', '1.68', '0.28', 409, 40),
(908, 1, '0.00', '0.00', '0.00', '0.00', 410, 6),
(909, 1, '0.06', '0.34', '0.34', '0.06', 411, 41),
(910, 1, '0.00', '0.00', '0.00', '0.00', 418, 48),
(911, 1, '0.00', '0.00', '0.00', '0.00', 418, 49),
(912, 1, '0.00', '0.00', '0.00', '0.00', 418, 50),
(913, 1, '0.00', '0.00', '0.00', '0.00', 418, 51),
(914, 1, '0.00', '0.00', '0.00', '0.00', 418, 52),
(915, 1, '0.00', '0.00', '0.00', '0.00', 418, 53),
(916, 1, '0.00', '0.00', '0.00', '0.00', 418, 54),
(917, 1, '0.00', '0.00', '0.00', '0.00', 418, 55),
(918, 1, '0.00', '0.00', '0.00', '0.00', 418, 58),
(919, 1, '0.00', '0.00', '0.00', '0.00', 418, 59),
(920, 1, '0.00', '0.00', '0.00', '0.00', 418, 60),
(921, 1, '0.00', '0.00', '0.00', '0.00', 418, 61),
(922, 1, '0.00', '0.00', '0.00', '0.00', 418, 62),
(923, 1, '168.00', '168.00', '168.00', '168.00', 418, 63),
(924, 1, '0.00', '0.00', '0.00', '0.00', 418, 64),
(925, 1, '252.00', '0.00', '0.00', '252.00', 424, 42),
(926, 1, '0.00', '0.00', '0.00', '0.00', 424, 43),
(927, 1, '0.00', '0.00', '0.00', '0.00', 424, 44),
(928, 1, '14.00', '0.00', '0.00', '14.00', 424, 45),
(929, 1, '336.00', '336.00', '336.00', '336.00', 424, 46),
(930, 1, '84.00', '84.00', '84.00', '84.00', 424, 47),
(931, 1, '56.00', '448.00', '448.00', '56.00', 425, 1),
(932, 1, '56.00', '336.00', '336.00', '56.00', 425, 2),
(933, 1, '56.00', '168.00', '168.00', '56.00', 425, 7),
(934, 1, '56.00', '448.00', '448.00', '56.00', 425, 8),
(935, 1, '56.00', '56.00', '56.00', '56.00', 426, 3),
(936, 1, '0.00', '0.00', '0.00', '0.00', 426, 4),
(937, 1, '56.00', '448.00', '448.00', '56.00', 427, 1),
(938, 1, '56.00', '336.00', '336.00', '56.00', 427, 2),
(939, 1, '56.00', '168.00', '168.00', '56.00', 427, 7),
(940, 1, '56.00', '448.00', '448.00', '56.00', 427, 8),
(941, 1, '56.00', '56.00', '56.00', '56.00', 428, 3),
(942, 1, '0.00', '0.00', '0.00', '0.00', 428, 4);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategorydepartementcalculation`
--

INSERT INTO `demandcategorydepartementcalculation` (`ID`, `SUMME`, `SUMMEGLOBAL`, `DEMANDCATEGORY_ID`, `DEPARTEMENT_ID`) VALUES
(98, '704.31', NULL, 24, 1),
(99, '569.88', NULL, 24, 2),
(100, '0.00', NULL, 24, 3),
(101, '168.00', NULL, 24, 4),
(102, '0.00', NULL, 24, 5),
(103, '0.00', NULL, 24, 6),
(104, '896.00', NULL, 24, 8),
(105, '704.31', NULL, 25, 1),
(106, '569.88', NULL, 25, 2),
(107, '0.00', NULL, 25, 3),
(108, '168.00', NULL, 25, 4),
(109, '0.00', NULL, 25, 5),
(110, '0.00', NULL, 25, 6),
(111, '686.00', NULL, 25, 8),
(112, NULL, NULL, 26, 1),
(113, NULL, NULL, 27, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

CREATE TABLE `departement` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departementcriteriaitem`
--

INSERT INTO `departementcriteriaitem` (`ID`, `ARITHMITIQUEEXPRESIONFORGLOBALPRICE`, `ARITHMITIQUEEXPRESIONFORUNITEPRICE`, `DESCRIPTION`, `DESCRIPTIONGLOBAL`, `DEPARTEMENTCRITERIA_ID`) VALUES
(1, '(8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', '(configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Erstellung Datenpflegeguide', NULL, 1),
(2, '6*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Erstellung Redaktionsguide', NULL, 1),
(3, '1*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', '1*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Katalog Reda_Vorausgabe kopieren', NULL, 2),
(4, '8*demandCategory.getUmfang()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/100', 'demandCategory.getUmfang()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/100', 'PDF-Generator Reda', NULL, 2),
(5, '10*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Pauschale 8std Prüfung, 2 Std Redaktion Abstimmung', NULL, 9),
(6, '', '', 'Klassifizierung Neuheiten Information = LK_Schlüssel*Korrektirschlüssel*Prpzessschlüssel*Anzahl_Artikel_Neu*(8*std_satz/90)', NULL, 13),
(7, '3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Masterlisten Prüfung', NULL, 1),
(8, '8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Testdaten bereitstellen', NULL, 1),
(11, 'demandCategory.getAnzahlGesamtArtikel()*0.3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60', '0.3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60', 'Preis Artikel Reda-Online Pflege', NULL, 3),
(12, '16*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Pauschale Online Pflege(2 Tage)', NULL, 3),
(13, 'demandCategory.getUmfang()*8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/70', '8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/70', 'PDF Generator Informatica ', NULL, 4),
(14, 'demandCategory.getAnzahlLieferantNeu()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()*0.5', '0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Lieferantenkorrektur Versand', NULL, 5),
(15, '', '', 'Mitgliederkorrektur Versand', NULL, 5),
(16, '(demandCategory.getAnzahlGesamtProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)', 'Redaktionelle Text Veredlung der Basis Text für Gesamt Produkte', NULL, 2),
(17, '(demandCategory.getAnzahlNeueProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)', 'Redaktionelle Textveredlung der Basistext für neue Produkte ', NULL, 2),
(19, '(demandCategory.getAnzahlNeueProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)', 'Redaktionelle Textveredlung der Basistext neue Produkte', NULL, 4),
(20, '(demandCategory.getAnzahlGesamtProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)', '(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)', 'Redaktionelle Textveredlung der Basistext Gesamtanzahl Produkte', NULL, 4),
(21, '', '', 'redaktionelle Korrektur inkl. Einarbeitung LK', NULL, 5),
(22, '', '', 'Korrekturlesen mit Kunden', NULL, 5),
(23, '', '', 'Redaktionelle Korrekturlesen inkl. MK', NULL, 5),
(24, '', '', 'Redaktionelle Korrekturlesen Digiphase', NULL, 5),
(25, '', '', 'Großplott Prüfung', NULL, 6),
(26, 'demandCategory.getAnzahlKapitetel ()*2.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', '2.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Preisprüfung aus Satz, KG-Nummer, etc', NULL, 6),
(27, 'demandCategory.getAnzahlGesamtProdukt ()*0.005*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', '0.005*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Erstellung IVZ/Synonympflege', NULL, 7),
(28, '1.5*8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Pauschale ECC Publikationskonfigurator bei LL', NULL, 7),
(29, '8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Pauschale Fotoshootings Teilnahme Redakteur (1 Tag)', NULL, 7),
(30, 'demandCategory.getUmfang()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/19', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/19', 'Korrektorat (P. Mensch extern)', NULL, 7),
(31, 'demandCategory.getAnzahlKapitetel()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/2.5', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/2.5', 'Übersetzungsmanagement Marketingdaten', NULL, 8),
(32, '4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/2.5', 'Pauschale Übersetzunsmanagement ', NULL, 8),
(33, '0.25*demandCategory.getAnzahlNeueProdukt()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60', '0.25*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60', 'Datenbeschaffung pro Produkt Neuheit', NULL, 10),
(34, '(demandCategory.getAnzahlNeueArtikel()*(configurationItemFacade.findByName(\'std_stz_dtp\').getDefaultValue()/200))', '(configurationItemFacade.findByName(\'std_stz_dtp\').getDefaultValue()/200)', 'Datenbeschaffung pro Artikel Neuheit', NULL, 10),
(35, '(demandCategory.getAnzahlLieferantNeu()*(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))', '(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Datenbeschaffung pro Lieferanten Neuheit ', NULL, 10),
(36, '(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', '(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Pauschale Preisbeschaffung (1/2 Tag)', NULL, 11),
(37, '(demandCategory.getAnzahlLieferantNeu()*(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))', '(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Preisbechaffung pro Lieferanten Neuheit ', NULL, 11),
(38, '(demandCategory.getAnzahlLieferantGesamt()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/6.25))', '(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/6.25)', 'Preisbeschaffung Lieferanten Gesamt (6,25 lf/std)', NULL, 11),
(39, '(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', '(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Pauschale Preisprüfung (1/2 Tag)', NULL, 11),
(40, '(demandCategory.getAnzahlGesamtArtikel()*(demandCategory.getCorrectionSchluessel().getValue()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/200)))', '(demandCategory.getCorrectionSchluessel().getValue()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/200))', 'Stammdatenpflege (ASD, Modul)', NULL, 12),
(41, '(demandCategory.getAnzahlGesamtArtikel()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/1000))', '(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/1000)', 'Übersetzungsmanagement Stammdaten (1000 Art/std)', NULL, 14),
(42, '(demandCategory.getAnzahlBeteiligten()*(4.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))', '(4.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Abstimmungsgespräche (Festsatz/Laufzeit in Monaten nach Personen (1xTPV + 1x0,5 Grl) ca 0,25h)', NULL, 27),
(43, 'demandCategory.getAnzahlBeteiligten()*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Termin Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (1h)  ', NULL, 27),
(44, 'demandCategory.getAnzahlBeteiligten()*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/4', 'demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/4', 'Budget Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (15min)  ', NULL, 27),
(45, '0.25*demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', '0.25*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()', 'Berichtswesen: Festsatz/Laufzeit in Monaten / Stunde pro Monat (0,25 h)  ', NULL, 27),
(46, '(6*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', '(6*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Pauschale Projektplanung = 6 std', NULL, 27),
(47, '(1.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', '(1.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Pauschale Projektvorbereitung = 1,5 std', NULL, 27),
(48, '', '', 'Pauschale Kalkulation inkl. Prüfschleife und Abstimmung GF', NULL, 28),
(49, '', '', 'Nachkalkulation zur Druckvergabe', NULL, 28),
(50, '', '', 'Bestellformular inkl. Baukastenanhang erstellen und prüfen', NULL, 28),
(51, '', '', 'Planung inkl. Prüfschleifen und Freigaben', NULL, 28),
(52, '', '', 'Projektvorbereitung (Statuslisten, Ordner, Checklisten...)', NULL, 28),
(53, '', '', 'Präsentationserstellung', NULL, 28),
(54, '', '', 'Händlerabwicklung', NULL, 28),
(55, '', '', 'Dokumentation', NULL, 28),
(58, '', '', 'Digitales Archiv', NULL, 28),
(59, '', '', 'Druckformschreibung', NULL, 28),
(60, '', '', 'Druckabnahme', NULL, 28),
(61, '', '', 'Verarbeitungsüberwachung', NULL, 28),
(62, '', '', 'Weiterberchnung (Vorbereitung und Durchführung)', NULL, 28),
(63, '(3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', '(3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())', 'Endabrechnung (Pauschal)', NULL, 28),
(64, '', '', 'Erstellung und Auswertung von Befragungen (Pauschal)', NULL, 28);

-- --------------------------------------------------------

--
-- Structure de la table `farbigkeit`
--

CREATE TABLE `farbigkeit` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `katalogart`
--

CREATE TABLE `katalogart` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `katalogart`
--

INSERT INTO `katalogart` (`ID`, `NAME`, `VALUEE`) VALUES
(1, 'Lagerliste', '1.00'),
(2, 'E/D/E Katalog', '1.00'),
(3, 'Individueller Katalog', '1.00'),
(4, 'Fremdsprachen Katalog', '1.00'),
(51, 'Preisliste', '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `konzeptbearbeitungfaktor`
--

CREATE TABLE `konzeptbearbeitungfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` tinyint(1) DEFAULT '0',
  `WERT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `konzeptbearbeitungfaktor`
--

INSERT INTO `konzeptbearbeitungfaktor` (`ID`, `EXPRESSION`, `WERT`) VALUES
(1, 1, '1.35'),
(2, 0, '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `layout`
--

CREATE TABLE `layout` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `layout`
--

INSERT INTO `layout` (`ID`, `NAME`, `VALUEE`) VALUES
(1, 'Einfach', '1.00'),
(2, 'Standard', '1.00'),
(3, 'Komplex', '1.00'),
(52, 'individuelles', '2.30');

-- --------------------------------------------------------

--
-- Structure de la table `layoutpricing`
--

CREATE TABLE `layoutpricing` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `DEPARTEMENTCRITERIAITEM_ID` bigint(20) DEFAULT NULL,
  `LAYOUT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mitgliederkorrekturfaktor`
--

CREATE TABLE `mitgliederkorrekturfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` tinyint(1) DEFAULT '0',
  `WERT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `mitgliederkorrekturfaktor`
--

INSERT INTO `mitgliederkorrekturfaktor` (`ID`, `EXPRESSION`, `WERT`) VALUES
(2, 0, '1.00'),
(3, 0, '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `papiermaterialauswaehlen`
--

CREATE TABLE `papiermaterialauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `prozess`
--

INSERT INTO `prozess` (`ID`, `NAME`, `VALUEE`) VALUES
(5, 'Proz.Neu / Tech.Alt', '1.00'),
(6, 'Prozess.Neu / Tech.Neu', '1.00');

-- --------------------------------------------------------

--
-- Structure de la table `register`
--

CREATE TABLE `register` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` tinyint(1) DEFAULT '0',
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sotimentitem`
--

INSERT INTO `sotimentitem` (`ID`, `WERT`, `DEMANDCATEGORY_ID`, `SORTIMENT_ID`) VALUES
(47, '10.00', 24, 1),
(48, '90.00', 24, 3),
(49, '100.00', 26, 3),
(50, '100.00', 27, 2);

-- --------------------------------------------------------

--
-- Structure de la table `teilnehmerzahlpricing`
--

CREATE TABLE `teilnehmerzahlpricing` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(10,2) NOT NULL,
  `TEILNEHMERZAHLMIN` varchar(255) NOT NULL,
  `TEILNEHMERZAHLMINOPERATOR` varchar(255) NOT NULL,
  `TEILNEHMERZAHLMAX` varchar(255) NOT NULL,
  `TEILNEHMERZAHLMAXOPERATOR` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `umschlagfarbigkeit`
--

CREATE TABLE `umschlagfarbigkeit` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `umschlagpapierauswaehlen`
--

CREATE TABLE `umschlagpapierauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`LOGIN`, `ADMIN`, `BLOCKED`, `EMAIL`, `MDPCHANGED`, `NBRCNX`, `NOM`, `PASSWORD`, `PRENOM`, `TEL`, `DEPARTEMENT_ID`) VALUES
('', 0, 0, '', 0, 0, '', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '', '', 3),
('admin', 1, 0, 'admin@ede.de', 1, 0, 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Admin', '012345', NULL),
('ana', 0, 0, 'ana', 1, 0, 'ana', 'b6d4a89ccde3fb8fc69865ac105801287867cf735adf0b8bbca86ee9186f7b64', 'ana', '00000', 1),
('anas', 0, 0, 'user@gmail.com', 1, 0, 'anas', 'c157889e0fd5d7fc0d9a8d951fd64604ebeeb441de6519433dd8f931493dd5da', 'anas', '06', 1),
('assetmanagement', 0, 0, '', 1, 0, 'assetmanagement', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '', 5),
('CM_user', 0, 0, 'CM_user@ede.de', 1, 0, 'CM_user', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'CM_user', '01234567', 1),
('contentmanagement_user', 0, 0, 'xy@ede.de', 1, 0, 'x', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'y', '012356', 1),
('datamanagement', 0, 0, '', 1, 0, 'user', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', '', 2),
('dmd', 0, 0, '', 1, 0, 'dm', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '', '', 2),
('DTP_user', 0, 0, 'DTP_user@ede.de', 1, 0, 'DTP_user', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '01234567', 3),
('kiki', 1, 0, 'kiki', 1, 0, 'kiki', '888da5db853449fff82b07cbdbf7c755ece0783aa670bb36cc5c4cc9a68fb864', 'kiki', 'kiki', NULL),
('mediIT', 0, 0, 'mediIT@ede.de', 1, 0, '', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', '', '', 6),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `wechselfassungvariantfaktor`
--

CREATE TABLE `wechselfassungvariantfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` tinyint(1) DEFAULT '0',
  `WERT` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `wechselfassungvariantfaktor`
--

INSERT INTO `wechselfassungvariantfaktor` (`ID`, `EXPRESSION`, `WERT`) VALUES
(1, 1, '1.20'),
(2, 0, '1.00');

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
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_FARBIGKEIT_ID` (`FARBIGKEIT_ID`);

--
-- Index pour la table `ausgabe`
--
ALTER TABLE `ausgabe`
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `correctionschluessel`
--
ALTER TABLE `correctionschluessel`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT pour la table `demandcategory`
--
ALTER TABLE `demandcategory`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `demandcategorycalculation`
--
ALTER TABLE `demandcategorycalculation`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;
--
-- AUTO_INCREMENT pour la table `demandcategorycalculationitem`
--
ALTER TABLE `demandcategorycalculationitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=943;
--
-- AUTO_INCREMENT pour la table `demandcategorydepartementcalculation`
--
ALTER TABLE `demandcategorydepartementcalculation`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT pour la table `teilnehmerzahlpricing`
--
ALTER TABLE `teilnehmerzahlpricing`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `umschlagfarbigkeit`
--
ALTER TABLE `umschlagfarbigkeit`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
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
