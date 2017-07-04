-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 04 Juillet 2017 à 20:07
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
(1, '257', 'std_stz', 1);

--
-- Contenu de la table `departement`
--

INSERT INTO `departement` (`ID`, `NAME`) VALUES
(1, 'contentManagement'),
(2, 'datenManagement'),
(3, 'databasePublishing'),
(4, 'projectManagement');

--
-- Contenu de la table `departementcriteria`
--

INSERT INTO `departementcriteria` (`ID`, `NAME`, `DEPARTEMENT_ID`) VALUES
(1, 'Allgemein', 1),
(2, 'Reda', 1);

--
-- Contenu de la table `farbigkeit`
--

INSERT INTO `farbigkeit` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('1/1 -farbig', NULL, NULL),
('2/2 -farbig', NULL, NULL),
('3/3 -farbig', NULL, NULL);

--
-- Contenu de la table `papiermaterialauswaehlen`
--

INSERT INTO `papiermaterialauswaehlen` (`ID`, `DESCRIPTION`, `PRICE`) VALUES
('65 g/qm', NULL, NULL),
('70 g/qm', NULL, NULL),
('80 g/qm', NULL, NULL),
('85 g/qm', NULL, NULL);

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

--
-- Contenu de la table `schluesseltype`
--

INSERT INTO `schluesseltype` (`ID`, `NAME`) VALUES
(1, 'Ausgabe'),
(2, 'Layout'),
(3, 'Katalogart'),
(4, 'Prozess/Technik'),
(5, 'Kostenschlüssel');

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

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`LOGIN`, `ADMIN`, `BLOCKED`, `EMAIL`, `MDPCHANGED`, `NBRCNX`, `NOM`, `PASSWORD`, `PRENOM`, `TEL`, `DEPARTEMENT_ID`) VALUES
('ana', 0, 0, 'ana', 1, 0, 'ana', 'b6d4a89ccde3fb8fc69865ac105801287867cf735adf0b8bbca86ee9186f7b64', 'ana', '00000', 1),
('anas', 0, 1, 'anas@gmail.com', 1, 3, 'anas', '9d171d82134b0ec576fe121cf857321819cf3a59bc0138af35862c2caa617d57', 'anas', '06', 1),
('kiki', 1, 0, 'kiki', 1, 0, 'kiki', '888da5db853449fff82b07cbdbf7c755ece0783aa670bb36cc5c4cc9a68fb864', 'kiki', 'kiki', NULL),
('walo', 1, 0, 'walo', 1, 0, 'walo', '41d119f6079d09b46a5c950a03b455c99ec6c9b6f1726401a52c85d0b17d4b54', 'walo', '00000', NULL),
('younes', 1, 0, 'younes@gmail.com', 1, 0, 'zouani', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'younes', '06', 1);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
