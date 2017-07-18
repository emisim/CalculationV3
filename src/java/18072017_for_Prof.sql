-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: kt_FST_2
-- ------------------------------------------------------
-- Server version	5.7.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `artderweiterverarbeitung`
--

LOCK TABLES `artderweiterverarbeitung` WRITE;
/*!40000 ALTER TABLE `artderweiterverarbeitung` DISABLE KEYS */;
/*!40000 ALTER TABLE `artderweiterverarbeitung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auflage`
--

LOCK TABLES `auflage` WRITE;
/*!40000 ALTER TABLE `auflage` DISABLE KEYS */;
INSERT INTO `auflage` VALUES (50,NULL),(100,''),(150,''),(200,''),(500,''),(750,''),(1000,''),(1250,''),(1500,''),(1750,''),(2000,''),(2500,''),(3000,''),(3500,''),(4000,''),(4500,''),(5000,''),(5500,''),(6000,''),(6500,''),(7000,''),(7500,''),(8000,''),(8500,''),(9000,''),(9500,''),(10000,'');
/*!40000 ALTER TABLE `auflage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auflageseitencovermatrix`
--

LOCK TABLES `auflageseitencovermatrix` WRITE;
/*!40000 ALTER TABLE `auflageseitencovermatrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `auflageseitencovermatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ausgabe`
--

LOCK TABLES `ausgabe` WRITE;
/*!40000 ALTER TABLE `ausgabe` DISABLE KEYS */;
INSERT INTO `ausgabe` VALUES (7,'Erstausgabe',1.00),(8,'Folgeausgabe',1.00);
/*!40000 ALTER TABLE `ausgabe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bindung`
--

LOCK TABLES `bindung` WRITE;
/*!40000 ALTER TABLE `bindung` DISABLE KEYS */;
INSERT INTO `bindung` VALUES ('Fadenheftung',NULL,NULL),('PUR-Bindung',NULL,NULL);
/*!40000 ALTER TABLE `bindung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Katalog'),(2,'Fleyer'),(3,'Prospekt'),(4,'BMEcat');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `configuration`
--

LOCK TABLES `configuration` WRITE;
/*!40000 ALTER TABLE `configuration` DISABLE KEYS */;
INSERT INTO `configuration` VALUES (1,'2012-07-03');
/*!40000 ALTER TABLE `configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `configurationitem`
--

LOCK TABLES `configurationitem` WRITE;
/*!40000 ALTER TABLE `configurationitem` DISABLE KEYS */;
INSERT INTO `configurationitem` VALUES (1,56.00,'std_stz',1),(2,70.00,'std_stz_dtp',NULL);
/*!40000 ALTER TABLE `configurationitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `correctionschluessel`
--

LOCK TABLES `correctionschluessel` WRITE;
/*!40000 ALTER TABLE `correctionschluessel` DISABLE KEYS */;
INSERT INTO `correctionschluessel` VALUES (1,0,1.00),(2,1,1.00),(3,2,1.00),(4,3,1.00),(5,4,1.00),(6,5,1.00),(7,6,1.00),(8,7,1.00),(9,8,1.00),(10,9,1.00),(11,10,1.00),(12,11,1.00),(13,12,1.00),(14,13,1.00),(15,14,1.00),(17,15,1.00),(18,16,1.00),(19,17,1.00),(20,18,1.00),(21,19,1.00),(22,20,1.00),(23,21,1.00),(24,22,1.00),(25,23,1.00),(26,24,1.00),(27,25,1.00),(28,26,1.00),(29,27,1.00),(30,28,1.00),(31,29,1.00),(32,30,1.00),(33,31,1.00),(34,32,1.00),(35,33,1.00),(36,34,1.00),(37,35,1.00),(38,36,1.00),(39,37,1.00),(40,38,1.00),(41,39,1.00),(42,40,1.00),(43,41,1.00),(44,42,1.00),(45,43,1.00),(46,44,1.00),(47,45,1.00),(48,46,1.00),(49,47,1.00),(50,48,1.00),(51,49,1.00),(52,50,1.00),(53,51,1.00),(54,52,1.00),(55,53,1.00),(56,54,1.00),(57,55,1.00),(58,56,1.00),(59,57,1.00),(60,58,1.00),(61,59,1.00),(62,60,1.00),(63,61,1.00),(64,62,1.00),(65,63,1.00),(66,64,1.00),(67,65,1.00),(68,66,1.00),(69,67,1.00),(70,68,1.00),(71,69,1.00),(72,70,1.00),(73,71,1.00),(74,72,1.00),(75,73,1.00),(76,74,1.00),(77,75,1.00),(78,76,1.00),(79,77,1.00),(80,78,1.00),(81,79,1.00),(82,80,1.00),(83,81,1.00),(84,82,1.00),(85,83,1.00),(86,84,1.00),(87,85,1.00),(88,86,1.00),(89,87,1.00),(90,88,1.00),(91,89,1.00),(92,90,1.00),(93,91,1.00),(94,92,1.00),(95,93,1.00),(96,94,1.00),(97,95,1.00),(98,96,1.00),(99,97,1.00),(100,98,1.00),(101,99,1.00),(102,100,1.00);
/*!40000 ALTER TABLE `correctionschluessel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cover`
--

LOCK TABLES `cover` WRITE;
/*!40000 ALTER TABLE `cover` DISABLE KEYS */;
/*!40000 ALTER TABLE `cover` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `demandcategory`
--

LOCK TABLES `demandcategory` WRITE;
/*!40000 ALTER TABLE `demandcategory` DISABLE KEYS */;
INSERT INTO `demandcategory` VALUES (3,5,-7,5,0,180,10,4,2,4,15,13,14,0,5,11,20,9,0,'2017-07-07',0,'2017-07-07',1,10,0,0.00,0.00,16,200,0,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(7,150,-1,5,0,405,200,10,2,4,15,13,14,0,50,11,45,9,0,'2017-07-09',0,'2017-07-09',0,10,0,0.00,0.00,16,450,0,NULL,NULL,NULL,7,NULL,1,2,NULL,NULL,NULL,1,NULL,1,2,NULL,NULL,1,5,NULL,NULL,NULL,NULL),(8,150,-1,5,0,405,200,10,2,4,15,13,14,0,50,11,45,9,0,'2017-07-09',0,'2017-07-09',0,10,0,0.00,0.00,16,450,0,NULL,NULL,NULL,7,NULL,1,2,NULL,NULL,NULL,1,NULL,1,2,NULL,NULL,1,5,NULL,NULL,NULL,NULL),(12,150,2,5,0,4,200,2,2,4,15,13,14,0,50,0,3,9,0,'2017-07-18',0,'2017-07-18',0,10,0,0.00,0.00,16,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `demandcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `demandcategorycalculation`
--

LOCK TABLES `demandcategorycalculation` WRITE;
/*!40000 ALTER TABLE `demandcategorycalculation` DISABLE KEYS */;
INSERT INTO `demandcategorycalculation` VALUES (7,224.00,0,4,1),(8,NULL,0,4,2);
/*!40000 ALTER TABLE `demandcategorycalculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `demandcategorycalculationitem`
--

LOCK TABLES `demandcategorycalculationitem` WRITE;
/*!40000 ALTER TABLE `demandcategorycalculationitem` DISABLE KEYS */;
INSERT INTO `demandcategorycalculationitem` VALUES (19,0,56.00,448.00,7,1),(20,0,56.00,336.00,7,2),(21,0,56.00,168.00,7,7),(22,0,56.00,448.00,7,8),(23,0,56.00,56.00,8,3),(24,0,0.00,0.00,8,4);
/*!40000 ALTER TABLE `demandcategorycalculationitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `demandcategorydepartementcalculation`
--

LOCK TABLES `demandcategorydepartementcalculation` WRITE;
/*!40000 ALTER TABLE `demandcategorydepartementcalculation` DISABLE KEYS */;
INSERT INTO `demandcategorydepartementcalculation` VALUES (4,NULL,12,1);
/*!40000 ALTER TABLE `demandcategorydepartementcalculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `demandcategoryvalidation`
--

LOCK TABLES `demandcategoryvalidation` WRITE;
/*!40000 ALTER TABLE `demandcategoryvalidation` DISABLE KEYS */;
INSERT INTO `demandcategoryvalidation` VALUES (1,NULL),(2,3);
/*!40000 ALTER TABLE `demandcategoryvalidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `demandcategoryvalidationitem`
--

LOCK TABLES `demandcategoryvalidationitem` WRITE;
/*!40000 ALTER TABLE `demandcategoryvalidationitem` DISABLE KEYS */;
INSERT INTO `demandcategoryvalidationitem` VALUES (1,'','2017-07-07',2,'kiki');
/*!40000 ALTER TABLE `demandcategoryvalidationitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departement`
--

LOCK TABLES `departement` WRITE;
/*!40000 ALTER TABLE `departement` DISABLE KEYS */;
INSERT INTO `departement` VALUES (1,'contentManagement'),(2,'datenManagement'),(3,'databasePublishing'),(4,'projectManagement'),(5,'Assetmanagement'),(6,'Media IT'),(8,'InitialCosts');
/*!40000 ALTER TABLE `departement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departementcriteria`
--

LOCK TABLES `departementcriteria` WRITE;
/*!40000 ALTER TABLE `departementcriteria` DISABLE KEYS */;
INSERT INTO `departementcriteria` VALUES (1,'Allgemein',1),(2,'Reda',1),(3,'Reda Online',1),(4,'Informatica',1),(5,'LK MG Korrektur',1),(6,'Pruefungen',1),(7,'Sonstiges',1),(8,'Fremdsprachen',1),(9,'Masterlist',2),(10,'Datenbeschaffung',2),(11,'Preisbeschaffung',2),(12,'ASD',2),(13,'Informatica',2),(14,'Sprache',2),(15,'Fixkosten',3),(16,'1.Datenimport',3),(17,'2. Datenimport',3),(18,'Druckdatenerstellung',3),(19,'Sonstiges',3),(20,'ECC',3),(21,'Produktaufnahme einer Produktgruppe',5),(22,'Fotoshootings',5),(23,'Lizenz',5),(24,'Konzeption',6),(25,'Programmierung',6),(27,'Initial Kosten, diesen fallen unabhängig vom Endprodukt immer an',8),(28,'Projektmanagement Leistungen:',4);
/*!40000 ALTER TABLE `departementcriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departementcriteriaitem`
--

LOCK TABLES `departementcriteriaitem` WRITE;
/*!40000 ALTER TABLE `departementcriteriaitem` DISABLE KEYS */;
INSERT INTO `departementcriteriaitem` VALUES (1,'(8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','(configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Erstellung Datenpflegeguide',1),(2,'6*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Erstellung Redaktionsguide',1),(3,'1*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','1*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Katalog Reda_Vorausgabe kopieren',2),(4,'8*demandCategory.getUmfang()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/100','demandCategory.getUmfang()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/100','PDF-Generator Reda',2),(5,'10*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Pauschale 8std Prüfung, 2 Std Redaktion Abstimmung',9),(6,'','','Klassifizierung Neuheiten Information = LK_Schlüssel*Korrektirschlüssel*Prpzessschlüssel*Anzahl_Artikel_Neu*(8*std_satz/90)',13),(7,'3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Masterlisten Prüfung',1),(8,'8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Testdaten bereitstellen',1),(11,'demandCategory.getAnzahlGesamtArtikel()*0.3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60','0.3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60','Preis Artikel Reda-Online Pflege',3),(12,'16*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Pauschale Online Pflege(2 Tage)',3),(13,'demandCategory.getUmfang()*8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/70','8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/70','PDF Generator Informatica ',4),(14,'demandCategory.getAnzahlLieferantNeu()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()*0.5','0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Lieferantenkorrektur Versand',5),(15,'','','Mitgliederkorrektur Versand',5),(16,'(demandCategory.getAnzahlGesamtProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)','(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)','Redaktionelle Text Veredlung der Basis Text für Gesamt Produkte',2),(17,'(demandCategory.getAnzahlNeueProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)','(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)','Redaktionelle Textveredlung der Basistext für neue Produkte ',2),(18,'(demandCategory.getAnzahlNeueProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/250)','(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/250)','Aufbau redaktioneller Struktur',2),(19,'(demandCategory.getAnzahlNeueProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)','(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/5)','Redaktionelle Textveredlung der Basistext neue Produkte',4),(20,'(demandCategory.getAnzahlGesamtProdukt())*(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)','(demandCategory.getKatalogart().getValuee())*(demandCategory.getCorrectionSchluessel().getValue())*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/10)','Redaktionelle Textveredlung der Basistext Gesamtanzahl Produkte',4),(21,'','','redaktionelle Korrektur inkl. Einarbeitung LK',5),(22,'','','Korrekturlesen mit Kunden',5),(23,'','','Redaktionelle Korrekturlesen inkl. MK',5),(24,'','','Redaktionelle Korrekturlesen Digiphase',5),(25,'','','Großplott Prüfung',6),(26,'demandCategory.getAnzahlKapitetel ()*2.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','2.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Preisprüfung aus Satz, KG-Nummer, etc',6),(27,'demandCategory.getAnzahlGesamtProdukt ()*0.005*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','0.005*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Erstellung IVZ/Synonympflege',7),(28,'1.5*8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Pauschale ECC Publikationskonfigurator bei LL',7),(29,'8*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','Pauschale Fotoshootings Teilnahme Redakteur (1 Tag)',7),(30,'demandCategory.getUmfang()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/19','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/19','Korrektorat (P. Mensch extern)',7),(31,'demandCategory.getAnzahlKapitetel()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/2.5','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/2.5','Übersetzungsmanagement Marketingdaten',8),(32,'4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()','configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/2.5','Pauschale Übersetzunsmanagement ',8),(33,'(demandCategory.getAnzahlNeueProdukt()*(0.25*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60))','(0.25*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/60)','Datenbeschaffung pro Produkt Neuheit',10),(34,'(demandCategory.getAnzahlNeueArtikel()*(configurationItemFacade.findByName(\'std_stz_dtp‘).getDefaultValue()/200))','(configurationItemFacade.findByName(\'std_stz_dtp‘).getDefaultValue()/200)','Datenbeschaffung pro Artikel Neuheit',10),(35,'(demandCategory.getAnzahlLieferantNeu()*(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))','(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Datenbeschaffung pro Lieferanten Neuheit ',10),(36,'(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Pauschale Preisbeschaffung (1/2 Tag)',11),(37,'(demandCategory.getAnzahlLieferantNeu()*(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))','(0.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Preisbechaffung pro Lieferanten Neuheit ',11),(38,'(demandCategory.getAnzahlLieferantGesamt()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/6.25))','(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/6.25)','Preisbeschaffung Lieferanten Gesamt (6,25 lf/std)',11),(39,'(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','(4*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Pauschale Preisprüfung (1/2 Tag)',11),(40,'(demandCategory.getAnzahlGesamtArtikel()*(demandCategory.getCorrectionSchluessel()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/200)))','(demandCategory.getCorrectionSchluessel()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/200))','Stammdatenpflege (ASD, Modul)',12),(41,'(demandCategory.getAnzahlGesamtArtikel()*(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/1000))','(configurationItemFacade.findByName(\'std_stz\').getDefaultValue()/1000)','Übersetzungsmanagement Stammdaten (1000 Art/std)',14),(42,'(demandCategory.getAnzahlBeteiligten()*(4.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))','(4.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Abstimmungsgespräche (Festsatz/Laufzeit in Monaten nach Personen (1xTPV + 1x0,5 Grl) ca 0,25h)',27),(43,'(demandCategory.getAnzahlBeteiligten()*(demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))','(demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Termin Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (1h)  ',27),(44,'(demandCategory.getAnzahlBeteiligten()((demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())/4))','((demandCategory.getBearbeitungszeit()*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())/4)','Budget Überwachung: Festsatz/Laufzeit in Monaten / Stunde pro Monat (15min)  ',27),(45,'((demandCategory.getBearbeitungszeit()*(0.25*configurationItemFacade.findByName(\'std_stz\').getDefaultValue()))','(0.25*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Berichtswesen: Festsatz/Laufzeit in Monaten / Stunde pro Monat (0,25 h)  ',27),(46,'(6*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','(6*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Pauschale Projektplanung = 6 std',27),(47,'(1.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','(1.5*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Pauschale Projektvorbereitung = 1,5 std',27),(48,'','','Pauschale Kalkulation inkl. Prüfschleife und Abstimmung GF',28),(49,'','','Nachkalkulation zur Druckvergabe',28),(50,'','','Bestellformular inkl. Baukastenanhang erstellen und prüfen',28),(51,'','','Planung inkl. Prüfschleifen und Freigaben',28),(52,'','','Projektvorbereitung (Statuslisten, Ordner, Checklisten...)',28),(53,'','','Präsentationserstellung',28),(54,'','','Händlerabwicklung',28),(55,'','','Dokumentation',28),(58,'','','Digitales Archiv',28),(59,'','','Druckformschreibung',28),(60,'','','Druckabnahme',28),(61,'','','Verarbeitungsüberwachung',28),(62,'','','Weiterberchnung (Vorbereitung und Durchführung)',28),(63,'(3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','(3*configurationItemFacade.findByName(\'std_stz\').getDefaultValue())','Endabrechnung (Pauschal)',28),(64,'','','Erstellung und Auswertung von Befragungen (Pauschal)',28);
/*!40000 ALTER TABLE `departementcriteriaitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `farbigkeit`
--

LOCK TABLES `farbigkeit` WRITE;
/*!40000 ALTER TABLE `farbigkeit` DISABLE KEYS */;
INSERT INTO `farbigkeit` VALUES ('1/1 -farbig',NULL,NULL),('2/2 -farbig',NULL,NULL),('3/3 -farbig',NULL,NULL),('4/4 c',NULL,NULL);
/*!40000 ALTER TABLE `farbigkeit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `formatauswaehlen`
--

LOCK TABLES `formatauswaehlen` WRITE;
/*!40000 ALTER TABLE `formatauswaehlen` DISABLE KEYS */;
/*!40000 ALTER TABLE `formatauswaehlen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `katalogart`
--

LOCK TABLES `katalogart` WRITE;
/*!40000 ALTER TABLE `katalogart` DISABLE KEYS */;
INSERT INTO `katalogart` VALUES (1,'Lagerliste',1.00),(2,'E/D/E Katalog',1.00),(3,'Individueller Katalog',1.00),(4,'Fremdsprachen Katalog',1.00),(51,'Preisliste',1.00);
/*!40000 ALTER TABLE `katalogart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `konzeptbearbeitungfaktor`
--

LOCK TABLES `konzeptbearbeitungfaktor` WRITE;
/*!40000 ALTER TABLE `konzeptbearbeitungfaktor` DISABLE KEYS */;
INSERT INTO `konzeptbearbeitungfaktor` VALUES (1,0,1.00),(2,0,1.00);
/*!40000 ALTER TABLE `konzeptbearbeitungfaktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
INSERT INTO `layout` VALUES (1,'Einfach',1.00),(2,'Standard',1.00),(3,'Komplex',1.00),(52,'individuelles',2.30);
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mitgliederkorrekturfaktor`
--

LOCK TABLES `mitgliederkorrekturfaktor` WRITE;
/*!40000 ALTER TABLE `mitgliederkorrekturfaktor` DISABLE KEYS */;
INSERT INTO `mitgliederkorrekturfaktor` VALUES (2,0,1.00),(3,0,1.00);
/*!40000 ALTER TABLE `mitgliederkorrekturfaktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `papiermaterialauswaehlen`
--

LOCK TABLES `papiermaterialauswaehlen` WRITE;
/*!40000 ALTER TABLE `papiermaterialauswaehlen` DISABLE KEYS */;
INSERT INTO `papiermaterialauswaehlen` VALUES ('65 g/qm',NULL,NULL),('70 g/qm',NULL,NULL),('80 g/qm',NULL,NULL),('85 g/qm',NULL,NULL);
/*!40000 ALTER TABLE `papiermaterialauswaehlen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `participantfaktor`
--

LOCK TABLES `participantfaktor` WRITE;
/*!40000 ALTER TABLE `participantfaktor` DISABLE KEYS */;
INSERT INTO `participantfaktor` VALUES (1,20,1.00),(2,21,1.00),(3,36,1.00);
/*!40000 ALTER TABLE `participantfaktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,NULL,'Premium EWZ',1),(2,NULL,'Fortis WZ',1),(3,NULL,'Industrietechnik',1),(4,NULL,'Baugerät',1),(5,NULL,'LL Gartentechnik',1),(6,NULL,'Plus1 Nachdruck',1),(7,'','Haustechnik 2017',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `prozess`
--

LOCK TABLES `prozess` WRITE;
/*!40000 ALTER TABLE `prozess` DISABLE KEYS */;
INSERT INTO `prozess` VALUES (5,'Proz.Neu / Tech.Alt',1.00),(6,'Prozess.Neu / Tech.Neu',1.00);
/*!40000 ALTER TABLE `prozess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `schluessel`
--

LOCK TABLES `schluessel` WRITE;
/*!40000 ALTER TABLE `schluessel` DISABLE KEYS */;
INSERT INTO `schluessel` VALUES (1,'Hier soll BIld oder Beschreibung','Einfach',1,2),(2,'Hier soll BIld oder Beschreibung','Standard',1,2),(3,'Hier soll BIld oder Beschreibung','Komplex',1,2),(4,'Hier soll BIld oder Beschreibung','Erstausgabe',1,1),(5,'Hier soll BIld oder Beschreibung','Folgeausgabe',0,1),(6,'Hier soll BIld oder Beschreibung','Lagerliste',1,3),(7,'Hier soll BIld oder Beschreibung','E/D/E Katalog',1,3),(8,'Hier soll BIld oder Beschreibung','Individueller Katalog',1,3),(9,'Hier soll BIld oder Beschreibung','Fremdsprachen-Katalog',1,3),(10,NULL,'Proz.neu / Tech. Alt',1,4),(11,NULL,'Proz.neu / Tech.Neu',1,4),(12,NULL,'Datenmanagemnt',56,5),(13,NULL,'Contentmanagement',56,5),(14,NULL,'Assetmanagement',56,5),(15,NULL,'Allgemein',56,5),(16,'rettest','',1,6);
/*!40000 ALTER TABLE `schluessel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `schluesseltype`
--

LOCK TABLES `schluesseltype` WRITE;
/*!40000 ALTER TABLE `schluesseltype` DISABLE KEYS */;
INSERT INTO `schluesseltype` VALUES (1,'Ausgabe'),(2,'Layout'),(3,'Katalogart'),(4,'Prozess/Technik'),(5,'Kostenschlüssel'),(6,'taoufik_key');
/*!40000 ALTER TABLE `schluesseltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `seiten`
--

LOCK TABLES `seiten` WRITE;
/*!40000 ALTER TABLE `seiten` DISABLE KEYS */;
INSERT INTO `seiten` VALUES (78,1),(79,2),(80,4),(81,8),(82,16),(83,24),(84,32),(85,64),(86,80),(87,100),(88,148),(89,200),(90,244),(91,300),(92,324),(93,400),(94,452),(95,500),(96,548),(97,600),(98,644),(99,700),(100,752),(101,800),(102,852),(103,900),(104,964),(105,1000),(106,1056),(107,1104),(108,1152),(109,1200),(110,1264),(111,1312),(112,1360),(113,1408),(114,1472),(115,1504),(116,1568),(117,1600),(118,1680),(119,1760);
/*!40000 ALTER TABLE `seiten` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('SEQ_GEN',100);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sortiment`
--

LOCK TABLES `sortiment` WRITE;
/*!40000 ALTER TABLE `sortiment` DISABLE KEYS */;
INSERT INTO `sortiment` VALUES (1,15.80,1.10,1.05,'Arbeitsschutz',4.70),(2,16.10,1.00,1.00,'Baubeschläge',4.80),(3,8.40,1.00,1.00,'Baugeräte',2.50),(4,26.90,1.00,1.00,'Befestigungstechnik',8.00),(5,12.10,1.10,1.05,'Betriebseinrichtungen',3.60),(6,5.38,1.15,1.08,'Elektrowerkzeuge',1.60),(7,5.70,1.00,1.00,'Gartentechnik',2.00),(8,11.10,1.00,1.01,'Handwerkzeuge',3.30),(9,6.10,1.00,1.00,'Haustechnik/Innendeko/Elektroinstallation',1.80),(10,17.50,1.00,1.00,'Industrietechnik',5.20),(11,9.10,1.00,1.00,'Möbelbeschläge',2.70),(12,10.00,1.05,1.03,'Präzisionswerkzeuge',7.60),(13,9.10,1.08,1.04,'Schweißtechnik',2.70),(14,12.40,1.00,1.00,'Verpackungen',3.70),(15,5.70,1.05,1.05,'Werkstattmaterial',1.70),(16,11.10,1.03,1.01,'Werkzeuge Holzbearbeitung',3.30),(17,11.10,1.03,1.01,'Werkzeuge Metallbearbeitung',3.30);
/*!40000 ALTER TABLE `sortiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sotimentitem`
--

LOCK TABLES `sotimentitem` WRITE;
/*!40000 ALTER TABLE `sotimentitem` DISABLE KEYS */;
INSERT INTO `sotimentitem` VALUES (6,100.00,12,1);
/*!40000 ALTER TABLE `sotimentitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `umschlagfarbigkeit`
--

LOCK TABLES `umschlagfarbigkeit` WRITE;
/*!40000 ALTER TABLE `umschlagfarbigkeit` DISABLE KEYS */;
/*!40000 ALTER TABLE `umschlagfarbigkeit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `umschlagpapierauswaehlen`
--

LOCK TABLES `umschlagpapierauswaehlen` WRITE;
/*!40000 ALTER TABLE `umschlagpapierauswaehlen` DISABLE KEYS */;
/*!40000 ALTER TABLE `umschlagpapierauswaehlen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('',0,0,'',0,0,'','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','','',3),('admin',1,0,'admin@ede.de',1,0,'Admin','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','Admin','012345',NULL),('ana',0,0,'ana',1,0,'ana','b6d4a89ccde3fb8fc69865ac105801287867cf735adf0b8bbca86ee9186f7b64','ana','00000',1),('anas',0,1,'user@gmail.com',1,3,'anas','cae764289950ffa9c8d2ed55185988f59d3869c136ac13bfc662adaed9f9450c','anas','06',1),('assetmanagement',0,0,'',1,0,'assetmanagement','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','','',5),('CM_user',0,0,'CM_user@ede.de',1,0,'CM_user','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','CM_user','01234567',1),('contentmanagement_user',0,0,'xy@ede.de',1,0,'x','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','y','012356',1),('datamanagement',0,0,'',1,0,'user','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','','',2),('dmd',0,0,'',1,0,'dm','03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4','','',2),('DTP_user',0,0,'DTP_user@ede.de',1,0,'DTP_user','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','','01234567',3),('kiki',1,0,'kiki',1,2,'kiki','888da5db853449fff82b07cbdbf7c755ece0783aa670bb36cc5c4cc9a68fb864','kiki','kiki',NULL),('mediIT',0,0,'mediIT@ede.de',1,0,'','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','','',6),('walo',1,0,'walo',1,0,'walo','41d119f6079d09b46a5c950a03b455c99ec6c9b6f1726401a52c85d0b17d4b54','walo','00000',NULL),('younes',1,0,'younes@gmail.com',1,0,'zouani','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','younes','06',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `veredlung`
--

LOCK TABLES `veredlung` WRITE;
/*!40000 ALTER TABLE `veredlung` DISABLE KEYS */;
/*!40000 ALTER TABLE `veredlung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `wechselfassungvariantfaktor`
--

LOCK TABLES `wechselfassungvariantfaktor` WRITE;
/*!40000 ALTER TABLE `wechselfassungvariantfaktor` DISABLE KEYS */;
INSERT INTO `wechselfassungvariantfaktor` VALUES (1,0,1),(2,0,1);
/*!40000 ALTER TABLE `wechselfassungvariantfaktor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-18 19:30:11
