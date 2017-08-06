-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 06 Août 2017 à 20:25
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

--
-- Contenu de la table `ausgabe`
--

INSERT INTO `ausgabe` (`ID`, `NAME`, `PRICE`, `VALUEE`) VALUES
(7, 'Erstausgabe', NULL, '0.50'),
(8, 'Folgeausgabe', NULL, '0.20');

--
-- Contenu de la table `backup`
--

INSERT INTO `backup` (`ID`, `DATESYSTEME`, `NOM`) VALUES
(256, '2017-08-02', '2017-08-02.sql');

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
(3, '56.25', 'std_stz_pm', NULL),
(4, '162.50', 'std_satz_fotograf', 1),
(5, '75.00', 'std_satz_kind_model', 1),
(6, '112.50', 'std_satz_erwachsene_model', 1);

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
-- Contenu de la table `demandcategorydepartementcalculation`
--

INSERT INTO `demandcategorydepartementcalculation` (`ID`, `SUMME`, `SUMMEGLOBAL`, `DEMANDCATEGORY_ID`, `DEPARTEMENT_ID`) VALUES
(165, '1319.77', '58642.67', 179, 1),
(166, '267.26', '30530.49', 179, 2),
(167, '4764.50', '72680.50', 179, 3),
(168, '687.05', '7358.85', 179, 4),
(169, '692.00', '3142.00', 179, 5),
(170, '5000.00', '5000.00', 179, 6),
(171, '590.63', '553.45', 179, 8),
(200, '611.11', '7055.10', 185, 4),
(201, '267.26', '30530.49', 185, 2),
(202, '692.00', '3142.00', 185, 5),
(203, '4764.50', '72680.50', 185, 3),
(204, '590.63', '553.45', 185, 8),
(205, '1319.77', '58642.67', 185, 1),
(206, '5000.00', '5000.00', 185, 6),
(207, '611.11', '7055.10', 186, 4),
(208, '267.26', '30530.49', 186, 2),
(209, '692.00', '3142.00', 186, 5),
(210, '4764.50', '72680.50', 186, 3),
(211, '590.63', '553.45', 186, 8),
(212, '1319.77', '58642.67', 186, 1),
(213, '5000.00', '5000.00', 186, 6);

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
(1351, 'CHROME 59.0.3071.115', 'Personal computer', 'Windows 7', 'walo'),
(1852, 'CHROME 59.0.3071.115', 'Personal computer', 'Windows 7', 'ana');

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
(1352, 1, '2017-08-04 20:09:23', 'walo'),
(1401, 1, '2017-08-05 09:37:39', 'walo'),
(1451, 1, '2017-08-05 19:05:20', 'walo'),
(1501, 1, '2017-08-05 19:29:16', 'walo'),
(1502, 1, '2017-08-05 19:32:49', 'walo'),
(1551, 1, '2017-08-05 19:50:18', 'walo'),
(1601, 1, '2017-08-05 19:56:01', 'walo'),
(1651, 1, '2017-08-06 09:53:41', 'walo'),
(1701, 1, '2017-08-06 10:00:31', 'walo'),
(1702, 0, '2017-08-06 10:19:11', 'walo'),
(1703, 1, '2017-08-06 10:19:17', 'walo'),
(1751, 1, '2017-08-06 10:31:14', 'walo'),
(1752, 1, '2017-08-06 10:58:04', 'walo'),
(1801, 1, '2017-08-06 11:03:43', 'walo'),
(1851, 1, '2017-08-06 11:40:12', 'walo'),
(1853, 1, '2017-08-06 12:12:36', 'ana'),
(1901, 1, '2017-08-06 12:24:43', 'ana'),
(1951, 1, '2017-08-06 12:39:08', 'ana'),
(1952, 0, '2017-08-06 12:41:03', 'ana'),
(1953, 1, '2017-08-06 12:41:11', 'walo'),
(2001, 1, '2017-08-06 12:43:31', 'ana'),
(2051, 1, '2017-08-06 12:50:59', 'ana'),
(2052, 0, '2017-08-06 12:51:36', 'ana'),
(2053, 1, '2017-08-06 12:51:41', 'ana'),
(2101, 1, '2017-08-06 13:21:34', 'walo'),
(2151, 1, '2017-08-06 14:48:06', 'walo'),
(2201, 1, '2017-08-06 14:53:58', 'walo');

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
-- Contenu de la table `question`
--

INSERT INTO `question` (`ID`, `QUESTION`, `REPONSE`, `USER_LOGIN`) VALUES
(1, 'your city', 'rabat', 'walo'),
(2, 'your city', 'rabat', 'walo'),
(3, 'your city', 'rabat', 'walo');

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
('SEQ_GEN', '2250');

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
(206, '100.00', NULL, 1),
(209, '100.00', 179, 1),
(215, '100.00', 185, 1),
(216, '100.00', 186, 1);

--
-- Contenu de la table `teilnehmerzahlpricing`
--

INSERT INTO `teilnehmerzahlpricing` (`ID`, `PRICE`, `TEILNEHMERZAHLMAX`, `TEILNEHMERZAHLMAXOPERATOR`, `TEILNEHMERZAHLMIN`, `TEILNEHMERZAHLMINOPERATOR`) VALUES
(1, '1.00', 20, '<=', 0, '>='),
(2, '1.20', 35, '<=', 20, '>'),
(3, '1.35', 100000, '<=', 35, '>');

--
-- Contenu de la table `umschlagfarbigkeit`
--

INSERT INTO `umschlagfarbigkeit` (`ID`, `DESCRIPTION`, `LABEL`) VALUES
(1, NULL, '1/0-fbg. Skala'),
(2, NULL, '1/0-Sonderfarbe'),
(3, NULL, '2/0-fbg. Skala'),
(4, NULL, '2/0-fbg. Skala+1 Sonderfarbe'),
(5, NULL, '3/0-fbg. Skala'),
(6, NULL, '3/0-fbg. Skala+1 Sonderfarbe'),
(7, NULL, '4/0-fbg. Skala'),
(8, NULL, '4/1-fbg. Skala'),
(9, NULL, '4/2-fbg. Skala'),
(10, NULL, '5/0-fbg. Skala+1 Sonderfarbe'),
(11, NULL, '6/0-fbg. Skala+2 Sonderfarbe');

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
