-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 19 Juillet 2017 à 02:59
-- Version du serveur :  10.1.19-MariaDB
-- Version de PHP :  5.5.38

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
  `PRICE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auflage`
--

CREATE TABLE `auflage` (
  `ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auflageseitencovermatrix`
--

CREATE TABLE `auflageseitencovermatrix` (
  `ID` bigint(20) NOT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL,
  `AUFLAGE_ID` int(11) DEFAULT NULL,
  `COVER_ID` varchar(255) DEFAULT NULL,
  `SEITEN_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ausgabe`
--

CREATE TABLE `ausgabe` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `bindung`
--

CREATE TABLE `bindung` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
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
  `DEFAULTVALUE` decimal(38,0) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `CONFIGURATION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `configurationitem`
--

INSERT INTO `configurationitem` (`ID`, `DEFAULTVALUE`, `NAME`, `CONFIGURATION_ID`) VALUES
(1, '257', 'std_stz', 1);

-- --------------------------------------------------------

--
-- Structure de la table `correctionschluessel`
--

CREATE TABLE `correctionschluessel` (
  `ID` bigint(20) NOT NULL,
  `PERCENT` int(11) DEFAULT NULL,
  `WERT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cover`
--

CREATE TABLE `cover` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
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
  `DRUCK` tinyint(1) DEFAULT '0',
  `LIEFERTERMIN` date DEFAULT NULL,
  `NBRTOTALVALIDATION` int(11) DEFAULT NULL,
  `PERCENTSEITENFAKTOR` int(11) DEFAULT NULL,
  `SEITENANZAHL` int(11) DEFAULT NULL,
  `SUMMDRUCK` decimal(38,0) DEFAULT NULL,
  `SUMMTOTAL` decimal(38,0) DEFAULT NULL,
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
  `UMSCHLAGFARBIGKEIT_ID` bigint(20) DEFAULT NULL,
  `UMSCHLAGPAPIERAUSWAEHLEN_ID` varchar(255) DEFAULT NULL,
  `VEREDLUNG_ID` varchar(255) DEFAULT NULL,
  `WECHSELFASSUNGVARIANTFAKTOR_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategory`
--

INSERT INTO `demandcategory` (`ID`, `ANZAHLBESTANDARTIKEL`, `ANZAHLBESTANDPRODUKT`, `ANZAHLBESTELLNRSEITEN`, `ANZAHLBETEILIGTEN`, `ANZAHLGENERIERUNGUPDATESEITEN`, `ANZAHLGESAMTARTIKEL`, `ANZAHLGESAMTPRODUKT`, `ANZAHLGESAMTSEITEN`, `ANZAHLIHVZSEITEN`, `ANZAHLKAPITETEL`, `ANZAHLLIEFERANTGESAMT`, `ANZAHLLIEFERANTNEU`, `ANZAHLMITGLIEDER`, `ANZAHLNEUEARTIKEL`, `ANZAHLNEUEPRODUKT`, `ANZAHLSONDERSEITEN`, `ANZAHLÜBERNAHMEARTIKEL`, `BEARBEITUNGSZEIT`, `DATEDEMANDCATEGORY`, `DRUCK`, `LIEFERTERMIN`, `NBRTOTALVALIDATION`, `PERCENTSEITENFAKTOR`, `SEITENANZAHL`, `SUMMDRUCK`, `SUMMTOTAL`, `TEILNEHMERZAHL`, `UMFANG`, `UMSCHLAG`, `SCHLUESSEL_ID`, `ARTDERWEITERVERARBEITUNG_ID`, `AUFLAGE_ID`, `AUSGABE_ID`, `BINDUNG_ID`, `CATEGORY_ID`, `CORRECTIONSCHLUESSEL_ID`, `COVER_ID`, `FARBIGKEIT_ID`, `FORMATAUSWAEHLEN_ID`, `KATALOGART_ID`, `KONZEPTBEARBEITUNGFAKTOR_ID`, `LAYOUT_ID`, `MITGLIEDERKORREKTURFAKTOR_ID`, `PAPIERMATERIALAUSWAEHLEN_ID`, `PARTICIPANTFAKTOR_ID`, `PRODUCT_ID`, `PROZESS_ID`, `UMSCHLAGFARBIGKEIT_ID`, `UMSCHLAGPAPIERAUSWAEHLEN_ID`, `VEREDLUNG_ID`, `WECHSELFASSUNGVARIANTFAKTOR_ID`) VALUES
(35, 8, 12, 5, 0, 4, 6, 10, 2, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-05', 0, '2017-07-05', 0, 10, 0, '0', '0', 16, 0, 0, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(36, 8, 12, 5, 0, 4, 6, 10, 2, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-18', 0, '2017-07-18', 0, 10, 0, '0', '0', 16, 0, 0, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL),
(37, 8, 12, 5, 0, 4, 6, 10, 2, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-18', 0, '2017-07-18', 0, 10, 0, '0', '0', 16, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL),
(38, 8, 12, 5, 0, 4, 6, 10, 2, 4, 15, 13, 14, 0, 7, 11, 3, 9, 0, '2017-07-18', 0, '2017-07-18', 0, 10, 0, '0', '0', 16, 0, 0, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `demandcategorycalculation`
--

CREATE TABLE `demandcategorycalculation` (
  `ID` bigint(20) NOT NULL,
  `SUMME` decimal(38,0) DEFAULT NULL,
  `VALIDE` tinyint(1) DEFAULT '0',
  `DEMANDCATEGORYDEPARTEMENTCALCULATION_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENTCRITERIA_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategorycalculation`
--

INSERT INTO `demandcategorycalculation` (`ID`, `SUMME`, `VALIDE`, `DEMANDCATEGORYDEPARTEMENTCALCULATION_ID`, `DEPARTEMENTCRITERIA_ID`) VALUES
(23, '2827', 0, 12, 1),
(24, '1028', 0, 12, 2),
(25, '2827', 0, 13, 1),
(26, '1028', 0, 13, 2),
(27, '0', 0, 17, 1),
(28, '0', 0, 17, 2),
(29, '2827', 0, 21, 1),
(30, '1028', 0, 21, 2);

-- --------------------------------------------------------

--
-- Structure de la table `demandcategorycalculationitem`
--

CREATE TABLE `demandcategorycalculationitem` (
  `ID` bigint(20) NOT NULL,
  `CALCULTAED` tinyint(1) DEFAULT '0',
  `PRICE` decimal(38,0) DEFAULT NULL,
  `PRICEGLOBAL` decimal(38,0) DEFAULT NULL,
  `DEMANDCATEGORYCALCULATION_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENTCRITERIAITEM_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategorycalculationitem`
--

INSERT INTO `demandcategorycalculationitem` (`ID`, `CALCULTAED`, `PRICE`, `PRICEGLOBAL`, `DEMANDCATEGORYCALCULATION_ID`, `DEPARTEMENTCRITERIAITEM_ID`) VALUES
(41, 0, '1285', '2570', 23, 1),
(42, 0, '1542', '3084', 23, 2),
(43, 0, '771', '1542', 24, 3),
(44, 0, '257', '514', 24, 4),
(45, 0, '1285', '2570', 25, 1),
(46, 0, '1542', '3084', 25, 2),
(47, 0, '771', '1542', 26, 3),
(48, 0, '257', '514', 26, 4),
(49, 0, '0', '0', 27, 1),
(50, 0, '0', '0', 27, 2),
(51, 0, '0', '0', 28, 3),
(52, 0, '0', '0', 28, 4),
(53, 1, '1285', '2570', 29, 1),
(54, 1, '1542', '3084', 29, 2),
(55, 1, '771', '1542', 30, 3),
(56, 1, '257', '514', 30, 4);

-- --------------------------------------------------------

--
-- Structure de la table `demandcategorydepartementcalculation`
--

CREATE TABLE `demandcategorydepartementcalculation` (
  `ID` bigint(20) NOT NULL,
  `SUMME` decimal(38,0) DEFAULT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL,
  `DEPARTEMENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategorydepartementcalculation`
--

INSERT INTO `demandcategorydepartementcalculation` (`ID`, `SUMME`, `DEMANDCATEGORY_ID`, `DEPARTEMENT_ID`) VALUES
(12, '3855', 35, 1),
(13, '3855', 36, 1),
(14, '0', 36, 2),
(15, '0', 36, 3),
(16, '0', 36, 4),
(17, '0', 37, 1),
(18, '0', 37, 2),
(19, '0', 37, 3),
(20, '0', 37, 4),
(21, '3855', 38, 1),
(22, '0', 38, 2),
(23, '0', 38, 3),
(24, '0', 38, 4);

-- --------------------------------------------------------

--
-- Structure de la table `demandcategoryvalidation`
--

CREATE TABLE `demandcategoryvalidation` (
  `ID` int(11) NOT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategoryvalidation`
--

INSERT INTO `demandcategoryvalidation` (`ID`, `DEMANDCATEGORY_ID`) VALUES
(2, NULL),
(4, NULL),
(1, 32),
(3, 33);

-- --------------------------------------------------------

--
-- Structure de la table `demandcategoryvalidationitem`
--

CREATE TABLE `demandcategoryvalidationitem` (
  `ID` int(11) NOT NULL,
  `DEPARTEMENT` varchar(255) DEFAULT NULL,
  `SYSDATE` date DEFAULT NULL,
  `DEMANDCATEGORYVALIDATION_ID` int(11) DEFAULT NULL,
  `USER_LOGIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `demandcategoryvalidationitem`
--

INSERT INTO `demandcategoryvalidationitem` (`ID`, `DEPARTEMENT`, `SYSDATE`, `DEMANDCATEGORYVALIDATION_ID`, `USER_LOGIN`) VALUES
(1, 'contentManagement', '2017-07-05', 1, 'younes'),
(2, 'contentManagement', '2017-07-05', 3, 'younes');

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
(4, 'projectManagement');

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
(2, 'Reda', 1);

-- --------------------------------------------------------

--
-- Structure de la table `departementcriteriaitem`
--

CREATE TABLE `departementcriteriaitem` (
  `ID` bigint(20) NOT NULL,
  `ARITHMITIQUEEXPRESIONFORGLOBALPRICE` varchar(255) DEFAULT NULL,
  `ARITHMITIQUEEXPRESIONFORUNITEPRICE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `DEPARTEMENTCRITERIA_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `departementcriteriaitem`
--

INSERT INTO `departementcriteriaitem` (`ID`, `ARITHMITIQUEEXPRESIONFORGLOBALPRICE`, `ARITHMITIQUEEXPRESIONFORUNITEPRICE`, `DESCRIPTION`, `DEPARTEMENTCRITERIA_ID`) VALUES
(1, '10*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '5*std_stz', 1),
(2, '12*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '6*std_stz', 1),
(3, '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '1*std_stz', 2),
(4, 'demandCategory.getAnzahlGesamtProdukt()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/5', 'demandCategory.getAnzahlGesamtProdukt()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10', 'anzahlGesamtProdukt*std_stz/10', 2);

-- --------------------------------------------------------

--
-- Structure de la table `farbigkeit`
--

CREATE TABLE `farbigkeit` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `farbigkeit`
--

INSERT INTO `farbigkeit` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('1/1 -farbig', NULL, NULL),
('2/2 -farbig', NULL, NULL),
('3/3 -farbig', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formatauswaehlen`
--

CREATE TABLE `formatauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `katalogart`
--

CREATE TABLE `katalogart` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `konzeptbearbeitungfaktor`
--

CREATE TABLE `konzeptbearbeitungfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` tinyint(1) DEFAULT '0',
  `WERT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `layout`
--

CREATE TABLE `layout` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mitgliederkorrekturfaktor`
--

CREATE TABLE `mitgliederkorrekturfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` tinyint(1) DEFAULT '0',
  `WERT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `papiermaterialauswaehlen`
--

CREATE TABLE `papiermaterialauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
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
  `WERT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(6, NULL, 'Plus1 Nachdruck', 1);

-- --------------------------------------------------------

--
-- Structure de la table `prozess`
--

CREATE TABLE `prozess` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUEE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `schluessel`
--

CREATE TABLE `schluessel` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `WERT` decimal(38,0) DEFAULT NULL,
  `SCHLUESSELTYPE_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `schluessel`
--

INSERT INTO `schluessel` (`ID`, `DESCRIPTION`, `LABEL`, `WERT`, `SCHLUESSELTYPE_ID`) VALUES
(1, 'Hier soll BIld oder Beschreibung', 'Einfach', '1', 2),
(2, 'Hier soll BIld oder Beschreibung', 'Standard', '1', 2),
(3, 'Hier soll BIld oder Beschreibung', 'Komplex', '1', 2),
(4, 'Hier soll BIld oder Beschreibung', 'Erstausgabe', '1', 1),
(5, 'Hier soll BIld oder Beschreibung', 'Folgeausgabe', '0', 1),
(6, 'Hier soll BIld oder Beschreibung', 'Lagerliste', '1', 3),
(7, 'Hier soll BIld oder Beschreibung', 'E/D/E Katalog', '1', 3),
(8, 'Hier soll BIld oder Beschreibung', 'Individueller Katalog', '1', 3),
(9, 'Hier soll BIld oder Beschreibung', 'Fremdsprachen-Katalog', '1', 3),
(10, NULL, 'Proz.neu / Tech. Alt', '1', 4),
(11, NULL, 'Proz.neu / Tech.Neu', '1', 4),
(12, NULL, 'Datenmanagemnt', '56', 5),
(13, NULL, 'Contentmanagement', '56', 5),
(14, NULL, 'Assetmanagement', '56', 5),
(15, NULL, 'Allgemein', '56', 5);

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
(5, 'Kostenschlüssel');

-- --------------------------------------------------------

--
-- Structure de la table `seiten`
--

CREATE TABLE `seiten` (
  `ID` bigint(20) NOT NULL,
  `NBREPAGE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `ARTIKELPERPAGE` decimal(38,0) DEFAULT NULL,
  `LKSCHLUESSEL` decimal(38,0) DEFAULT NULL,
  `MKSCHLUESSEL` decimal(38,0) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRODUCTSCHLUESSEL` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sortiment`
--

INSERT INTO `sortiment` (`ID`, `ARTIKELPERPAGE`, `LKSCHLUESSEL`, `MKSCHLUESSEL`, `NAME`, `PRODUCTSCHLUESSEL`) VALUES
(1, '16', '1', '1', 'Arbeitsschutz', '5'),
(2, '16', '1', '1', 'Baubeschläge', '5'),
(3, '8', '1', '1', 'Baugeräte', '3'),
(4, '27', '1', '1', 'Befestigungstechnik', '8'),
(5, '12', '1', '1', 'Betriebseinrichtungen', '4'),
(6, '5', '1', '1', 'Elektrowerkzeuge', '2'),
(7, '6', '1', '1', 'Gartentechnik', '2'),
(8, '11', '1', '1', 'Handwerkzeuge', '3'),
(9, '6', '1', '1', 'Haustechnik/Innendeko/Elektroinstallation', '2'),
(10, '18', '1', '1', 'Industrietechnik', '5'),
(11, '9', '1', '1', 'Möbelbeschläge', '3'),
(12, '10', '1', '1', 'Präzisionswerkzeuge', '8'),
(13, '9', '1', '1', 'Schweißtechnik', '3'),
(14, '12', '1', '1', 'Verpackungen', '4'),
(15, '6', '1', '1', 'Werkstattmaterial', '2'),
(16, '11', '1', '1', '\nWerkzeuge Holzbearbeitung', '3'),
(17, '11', '1', '1', 'Werkzeuge Metallbearbeitung', '3');

-- --------------------------------------------------------

--
-- Structure de la table `sotimentitem`
--

CREATE TABLE `sotimentitem` (
  `ID` bigint(20) NOT NULL,
  `WERT` decimal(38,0) DEFAULT NULL,
  `DEMANDCATEGORY_ID` bigint(20) DEFAULT NULL,
  `SORTIMENT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sotimentitem`
--

INSERT INTO `sotimentitem` (`ID`, `WERT`, `DEMANDCATEGORY_ID`, `SORTIMENT_ID`) VALUES
(1, '20', 36, 2),
(2, '10', 36, 8),
(3, '10', 36, 5),
(4, '60', 36, 6),
(5, '20', 37, 2),
(6, '60', 37, 6),
(7, '10', 37, 5),
(8, '10', 37, 8),
(9, '60', 38, 6),
(10, '10', 38, 8),
(11, '20', 38, 2),
(12, '10', 38, 5);

-- --------------------------------------------------------

--
-- Structure de la table `umschlagfarbigkeit`
--

CREATE TABLE `umschlagfarbigkeit` (
  `ID` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `LABEL` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `umschlagpapierauswaehlen`
--

CREATE TABLE `umschlagpapierauswaehlen` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
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
('ana', 0, 0, 'ana', 1, 0, 'ana', 'b6d4a89ccde3fb8fc69865ac105801287867cf735adf0b8bbca86ee9186f7b64', 'ana', '00000', 1),
('anas', 0, 1, 'anas@gmail.com', 1, 3, 'anas', '9d171d82134b0ec576fe121cf857321819cf3a59bc0138af35862c2caa617d57', 'anas', '06', 1),
('kiki', 1, 0, 'kiki', 1, 0, 'kiki', '888da5db853449fff82b07cbdbf7c755ece0783aa670bb36cc5c4cc9a68fb864', 'kiki', 'kiki', NULL),
('walo', 1, 0, 'walo', 1, 0, 'walo', '41d119f6079d09b46a5c950a03b455c99ec6c9b6f1726401a52c85d0b17d4b54', 'walo', '00000', NULL),
('younes', 1, 0, 'younes@gmail.com', 1, 0, 'zouani', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'younes', '06', 1);

-- --------------------------------------------------------

--
-- Structure de la table `veredlung`
--

CREATE TABLE `veredlung` (
  `ID` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `PRICE` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `wechselfassungvariantfaktor`
--

CREATE TABLE `wechselfassungvariantfaktor` (
  `ID` bigint(20) NOT NULL,
  `EXPRESSION` tinyint(1) DEFAULT '0',
  `WERT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_COVER_ID` (`COVER_ID`),
  ADD KEY `FK_AUFLAGESEITENCOVERMATRIX_AUFLAGE_ID` (`AUFLAGE_ID`);

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
  ADD KEY `FK_DEMANDCATEGORY_FORMATAUSWAEHLEN_ID` (`FORMATAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PROZESS_ID` (`PROZESS_ID`),
  ADD KEY `FK_DEMANDCATEGORY_SCHLUESSEL_ID` (`SCHLUESSEL_ID`),
  ADD KEY `FK_DEMANDCATEGORY_CORRECTIONSCHLUESSEL_ID` (`CORRECTIONSCHLUESSEL_ID`),
  ADD KEY `FK_DEMANDCATEGORY_ARTDERWEITERVERARBEITUNG_ID` (`ARTDERWEITERVERARBEITUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_AUFLAGE_ID` (`AUFLAGE_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PRODUCT_ID` (`PRODUCT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_CATEGORY_ID` (`CATEGORY_ID`),
  ADD KEY `FK_DEMANDCATEGORY_UMSCHLAGPAPIERAUSWAEHLEN_ID` (`UMSCHLAGPAPIERAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_BINDUNG_ID` (`BINDUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_KONZEPTBEARBEITUNGFAKTOR_ID` (`KONZEPTBEARBEITUNGFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PAPIERMATERIALAUSWAEHLEN_ID` (`PAPIERMATERIALAUSWAEHLEN_ID`),
  ADD KEY `FK_DEMANDCATEGORY_VEREDLUNG_ID` (`VEREDLUNG_ID`),
  ADD KEY `FK_DEMANDCATEGORY_COVER_ID` (`COVER_ID`),
  ADD KEY `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEIT_ID` (`UMSCHLAGFARBIGKEIT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_PARTICIPANTFAKTOR_ID` (`PARTICIPANTFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_LAYOUT_ID` (`LAYOUT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_WECHSELFASSUNGVARIANTFAKTOR_ID` (`WECHSELFASSUNGVARIANTFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_AUSGABE_ID` (`AUSGABE_ID`),
  ADD KEY `FK_DEMANDCATEGORY_FARBIGKEIT_ID` (`FARBIGKEIT_ID`),
  ADD KEY `FK_DEMANDCATEGORY_MITGLIEDERKORREKTURFAKTOR_ID` (`MITGLIEDERKORREKTURFAKTOR_ID`),
  ADD KEY `FK_DEMANDCATEGORY_KATALOGART_ID` (`KATALOGART_ID`);

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
  ADD KEY `FK_DEMANDCATEGORYVALIDATION_DEMANDCATEGORY_ID` (`DEMANDCATEGORY_ID`);

--
-- Index pour la table `demandcategoryvalidationitem`
--
ALTER TABLE `demandcategoryvalidationitem`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `DMNDCATEGORYVALIDATIONITEMDMNDCATEGORYVALIDATIONID` (`DEMANDCATEGORYVALIDATION_ID`),
  ADD KEY `FK_DEMANDCATEGORYVALIDATIONITEM_USER_LOGIN` (`USER_LOGIN`);

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
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `correctionschluessel`
--
ALTER TABLE `correctionschluessel`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `demandcategory`
--
ALTER TABLE `demandcategory`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `demandcategorycalculation`
--
ALTER TABLE `demandcategorycalculation`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT pour la table `demandcategorycalculationitem`
--
ALTER TABLE `demandcategorycalculationitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT pour la table `demandcategorydepartementcalculation`
--
ALTER TABLE `demandcategorydepartementcalculation`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `demandcategoryvalidation`
--
ALTER TABLE `demandcategoryvalidation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `demandcategoryvalidationitem`
--
ALTER TABLE `demandcategoryvalidationitem`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `departement`
--
ALTER TABLE `departement`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `departementcriteria`
--
ALTER TABLE `departementcriteria`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `departementcriteriaitem`
--
ALTER TABLE `departementcriteriaitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `konzeptbearbeitungfaktor`
--
ALTER TABLE `konzeptbearbeitungfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `mitgliederkorrekturfaktor`
--
ALTER TABLE `mitgliederkorrekturfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `participantfaktor`
--
ALTER TABLE `participantfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `schluessel`
--
ALTER TABLE `schluessel`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `schluesseltype`
--
ALTER TABLE `schluesseltype`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `seiten`
--
ALTER TABLE `seiten`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `sortiment`
--
ALTER TABLE `sortiment`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `sotimentitem`
--
ALTER TABLE `sotimentitem`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `umschlagfarbigkeit`
--
ALTER TABLE `umschlagfarbigkeit`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `wechselfassungvariantfaktor`
--
ALTER TABLE `wechselfassungvariantfaktor`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auflageseitencovermatrix`
--
ALTER TABLE `auflageseitencovermatrix`
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_AUFLAGE_ID` FOREIGN KEY (`AUFLAGE_ID`) REFERENCES `auflage` (`ID`),
  ADD CONSTRAINT `FK_AUFLAGESEITENCOVERMATRIX_COVER_ID` FOREIGN KEY (`COVER_ID`) REFERENCES `cover` (`ID`),
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
  ADD CONSTRAINT `FK_DEMANDCATEGORY_SCHLUESSEL_ID` FOREIGN KEY (`SCHLUESSEL_ID`) REFERENCES `schluessel` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_UMSCHLAGFARBIGKEIT_ID` FOREIGN KEY (`UMSCHLAGFARBIGKEIT_ID`) REFERENCES `umschlagfarbigkeit` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORY_UMSCHLAGPAPIERAUSWAEHLEN_ID` FOREIGN KEY (`UMSCHLAGPAPIERAUSWAEHLEN_ID`) REFERENCES `umschlagpapierauswaehlen` (`ID`),
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
  ADD CONSTRAINT `FK_DEMANDCATEGORYVALIDATION_DEMANDCATEGORY_ID` FOREIGN KEY (`DEMANDCATEGORY_ID`) REFERENCES `demandcategory` (`ID`);

--
-- Contraintes pour la table `demandcategoryvalidationitem`
--
ALTER TABLE `demandcategoryvalidationitem`
  ADD CONSTRAINT `DMNDCATEGORYVALIDATIONITEMDMNDCATEGORYVALIDATIONID` FOREIGN KEY (`DEMANDCATEGORYVALIDATION_ID`) REFERENCES `demandcategoryvalidation` (`ID`),
  ADD CONSTRAINT `FK_DEMANDCATEGORYVALIDATIONITEM_USER_LOGIN` FOREIGN KEY (`USER_LOGIN`) REFERENCES `user` (`LOGIN`);

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
