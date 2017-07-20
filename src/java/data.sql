-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 20 Juillet 2017 à 19:51
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
(1, '257.00', 'std_stz', 1);

--
-- Contenu de la table `demandcategory`
--

INSERT INTO `demandcategory` (`ID`, `ANZAHLBESTANDARTIKEL`, `ANZAHLBESTANDPRODUKT`, `ANZAHLBESTELLNRSEITEN`, `ANZAHLBETEILIGTEN`, `ANZAHLGENERIERUNGUPDATESEITEN`, `ANZAHLGESAMTARTIKEL`, `ANZAHLGESAMTPRODUKT`, `ANZAHLGESAMTSEITEN`, `ANZAHLIHVZSEITEN`, `ANZAHLKAPITETEL`, `ANZAHLLIEFERANTGESAMT`, `ANZAHLLIEFERANTNEU`, `ANZAHLMITGLIEDER`, `ANZAHLNEUEARTIKEL`, `ANZAHLNEUEPRODUKT`, `ANZAHLSONDERSEITEN`, `ANZAHLÜBERNAHMEARTIKEL`, `BEARBEITUNGSZEIT`, `DATEDEMANDCATEGORY`, `DATESYSTEM`, `DRUCK`, `LIEFERTERMIN`, `NBRTOTALVALIDATION`, `PERCENTSEITENFAKTOR`, `SEITENANZAHL`, `SUMMDRUCK`, `SUMMTOTAL`, `TEILNEHMERZAHL`, `UMFANG`, `UMSCHLAG`, `SCHLUESSEL_ID`, `ARTDERWEITERVERARBEITUNG_ID`, `AUFLAGE_ID`, `AUSGABE_ID`, `BINDUNG_ID`, `CATEGORY_ID`, `CORRECTIONSCHLUESSEL_ID`, `COVER_ID`, `DEPARTMENT_ID`, `FARBIGKEIT_ID`, `FORMATAUSWAEHLEN_ID`, `KATALOGART_ID`, `KONZEPTBEARBEITUNGFAKTOR_ID`, `LAYOUT_ID`, `MITGLIEDERKORREKTURFAKTOR_ID`, `PAPIERMATERIALAUSWAEHLEN_ID`, `PARTICIPANTFAKTOR_ID`, `PRODUCT_ID`, `PROZESS_ID`, `UMSCHLAGFARBIGKEIT_ID`, `UMSCHLAGPAPIERAUSWAEHLEN_ID`, `USER_LOGIN`, `VEREDLUNG_ID`, `WECHSELFASSUNGVARIANTFAKTOR_ID`) VALUES
(9, 8, 12, 5, 2, 4, 6, 10, 2, 4, 15, 13, 14, 20, 7, 11, 3, 9, 3, '2017-07-20', '2017-07-20', 1, '2017-07-20', 1, 10, 17, '0.00', '0.00', 16, 0, 0, NULL, NULL, NULL, NULL, 'PUR-Bindung', 4, NULL, NULL, NULL, '2/2 -farbig', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 'walo', NULL, NULL),
(10, 8, 12, 5, 2, 4, 6, 10, 2, 4, 15, 13, 14, 20, 7, 11, 3, 9, 3, '2017-07-20', '2017-07-20', 1, '2017-07-20', 2, 10, 17, '0.00', '0.00', 16, 0, 0, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, 'ana', NULL, NULL);

--
-- Contenu de la table `demandcategorycalculation`
--

INSERT INTO `demandcategorycalculation` (`ID`, `SUMME`, `VALIDE`, `DEMANDCATEGORYDEPARTEMENTCALCULATION_ID`, `DEPARTEMENTCRITERIA_ID`) VALUES
(17, '2827.00', 0, 27, 1),
(18, '1028.00', 0, 27, 2),
(19, '0.00', 0, 31, 1),
(20, '257.00', 0, 31, 2);

--
-- Contenu de la table `demandcategorycalculationitem`
--

INSERT INTO `demandcategorycalculationitem` (`ID`, `CALCULTAED`, `PRICE`, `PRICEGLOBAL`, `DEMANDCATEGORYCALCULATION_ID`, `DEPARTEMENTCRITERIAITEM_ID`) VALUES
(33, 1, '1285.00', '2570.00', 17, 1),
(34, 1, '1542.00', '3084.00', 17, 2),
(35, 1, '771.00', '1542.00', 18, 3),
(36, 1, '257.00', '514.00', 18, 4),
(37, 0, '0.00', '0.00', 19, 1),
(38, 1, '0.00', '0.00', 19, 2),
(39, 1, '0.00', '0.00', 20, 3),
(40, 1, '257.00', '514.00', 20, 4);

--
-- Contenu de la table `demandcategorydepartementcalculation`
--

INSERT INTO `demandcategorydepartementcalculation` (`ID`, `SUMME`, `DEMANDCATEGORY_ID`, `DEPARTEMENT_ID`) VALUES
(27, '3855.00', 9, 1),
(28, '0.00', 9, 2),
(29, '0.00', 9, 3),
(30, '0.00', 9, 4),
(31, '3598.00', 10, 1);

--
-- Contenu de la table `demandcategoryvalidation`
--

INSERT INTO `demandcategoryvalidation` (`ID`, `SYSDATE`, `DEMANDCATEGORY_ID`, `DEPARTEMENT_ID`, `USER_LOGIN`) VALUES
(11, '18:46:17', 9, NULL, 'walo'),
(12, '18:47:47', 10, 1, 'ana'),
(13, '18:48:08', 10, NULL, 'walo');

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
-- Contenu de la table `departementcriteriaitem`
--

INSERT INTO `departementcriteriaitem` (`ID`, `ARITHMITIQUEEXPRESIONFORGLOBALPRICE`, `ARITHMITIQUEEXPRESIONFORUNITEPRICE`, `DESCRIPTION`, `DEPARTEMENTCRITERIA_ID`) VALUES
(1, '10*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '5*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '5*std_stz', 1),
(2, '12*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '6*std_stz', 1),
(3, '6*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '3*configurationItemFacade.findByName(''std_stz'').getDefaultValue()', '1*std_stz', 2),
(4, 'demandCategory.getAnzahlGesamtProdukt()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/5', 'demandCategory.getAnzahlGesamtProdukt()*configurationItemFacade.findByName(''std_stz'').getDefaultValue()/10', 'anzahlGesamtProdukt*std_stz/10', 2);

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
(15, NULL, 'Allgemein', '56.00', 5);

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
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '0');

--
-- Contenu de la table `sortiment`
--

INSERT INTO `sortiment` (`ID`, `ARTIKELPERPAGE`, `LKSCHLUESSEL`, `MKSCHLUESSEL`, `NAME`, `PRODUCTSCHLUESSEL`) VALUES
(1, '16.00', '1.00', '1.00', 'Arbeitsschutz', '5.00'),
(2, '16.00', '1.00', '1.00', 'Baubeschläge', '5.00'),
(3, '8.00', '1.00', '1.00', 'Baugeräte', '3.00'),
(4, '27.00', '1.00', '1.00', 'Befestigungstechnik', '8.00'),
(5, '12.00', '1.00', '1.00', 'Betriebseinrichtungen', '4.00'),
(6, '5.00', '1.00', '1.00', 'Elektrowerkzeuge', '2.00'),
(7, '6.00', '1.00', '1.00', 'Gartentechnik', '2.00'),
(8, '11.00', '1.00', '1.00', 'Handwerkzeuge', '3.00'),
(9, '6.00', '1.00', '1.00', 'Haustechnik/Innendeko/Elektroinstallation', '2.00'),
(10, '18.00', '1.00', '1.00', 'Industrietechnik', '5.00'),
(11, '9.00', '1.00', '1.00', 'Möbelbeschläge', '3.00'),
(12, '10.00', '1.00', '1.00', 'Präzisionswerkzeuge', '8.00'),
(13, '9.00', '1.00', '1.00', 'Schweißtechnik', '3.00'),
(14, '12.00', '1.00', '1.00', 'Verpackungen', '4.00'),
(15, '6.00', '1.00', '1.00', 'Werkstattmaterial', '2.00'),
(16, '11.00', '1.00', '1.00', '\nWerkzeuge Holzbearbeitung', '3.00'),
(17, '11.00', '1.00', '1.00', 'Werkzeuge Metallbearbeitung', '3.00');

--
-- Contenu de la table `sotimentitem`
--

INSERT INTO `sotimentitem` (`ID`, `WERT`, `DEMANDCATEGORY_ID`, `SORTIMENT_ID`) VALUES
(22, '30.00', 9, 6),
(23, '20.00', 9, 2),
(24, '50.00', 9, 4),
(25, '10.00', 10, 3),
(26, '40.00', 10, 7),
(27, '50.00', 10, 5);

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
