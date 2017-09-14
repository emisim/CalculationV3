/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler.util;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author
 */
public class AccessDepartement {

    private static Map<String, Boolean> contentManagementMap = new HashMap<>();
    private static Map<String, Boolean> datenManagementMap = new HashMap<>();
    private static Map<String, Boolean> databasePublishingMap = new HashMap<>();
    private static Map<String, Boolean> projectManagementMap = new HashMap<>();
    private static Map<String, Boolean> mediaITMap = new HashMap<>();
    private static Map<String, Boolean> assetManagementMap = new HashMap<>();
    private static Map<String, Boolean> adminMap = new HashMap<>();

    public static Map<String, Boolean> getContentManagementMap() {

        return contentManagementMap;
    }

    public static void setContentManagementMap(Map<String, Boolean> contentManagementMap) {
        AccessDepartement.contentManagementMap = contentManagementMap;
    }

    public static Map<String, Boolean> getDatenManagementMap() {

        return datenManagementMap;
    }

    public static void setDatenManagementMap(Map<String, Boolean> datenManagementMap) {
        AccessDepartement.datenManagementMap = datenManagementMap;
    }

    public static Map<String, Boolean> getDatabasePublishingMap() {

        return databasePublishingMap;
    }

    public static void setDatabasePublishingMap(Map<String, Boolean> databasePublishingMap) {
        AccessDepartement.databasePublishingMap = databasePublishingMap;
    }

    public static Map<String, Boolean> getProjectManagementMap() {

        return projectManagementMap;
    }

    public static void setProjectManagementMap(Map<String, Boolean> ProjectManagementMap) {
        AccessDepartement.projectManagementMap = ProjectManagementMap;
    }

    public static Map<String, Boolean> getAssetManagementMap() {
        return assetManagementMap;
    }

    public static void setAssetManagementMap(Map<String, Boolean> assetManagementMap) {
        AccessDepartement.assetManagementMap = assetManagementMap;
    }

    public static Map<String, Boolean> getMediaITMap() {
        return mediaITMap;
    }

    public static void setMediaITMap(Map<String, Boolean> mediaITMap) {
        AccessDepartement.mediaITMap = mediaITMap;
    }

    public static Map<String, Boolean> getAdminMap() {
        if (adminMap == null) {
            adminMap = new HashMap<>();
        }
        return adminMap;
    }

    public static void setAdminMap(Map<String, Boolean> adminMap) {
        AccessDepartement.adminMap = adminMap;
    }

    public static void populateMaps() {
        populateContentManagementMap();
        populateDatenManagementMap();
        populateDatabasePublishingMap();
        populateProjectManagementMap();
        populateAssetManagementMap();
        populatemediaITMap();
        populateAdminMap();
    }

    private static void populateContentManagementMap() {

        contentManagementMap.put("category", true);
        contentManagementMap.put("product", true);
        contentManagementMap.put("layout", true);
        contentManagementMap.put("katalogart", true);
        contentManagementMap.put("ausgabe", true);
        contentManagementMap.put("umfang", true);
        contentManagementMap.put("sortiment", true);
        contentManagementMap.put("anzahlGesamtArtikel", true);
        contentManagementMap.put("anzahlNeueArtikel", true);
        contentManagementMap.put("anzahlGesamtProdukt", true);
        contentManagementMap.put("anzahlNeueProdukt", true);
        contentManagementMap.put("anzahlLieferantGesamt", true);
        contentManagementMap.put("anzahlLieferantNeu", true);
        contentManagementMap.put("anzahlKapitetel", true);
        //Anzahlmitglieder ist für den Mitgliederkorrekturversand wichtig  = AnzahlMitglieder*.....
        contentManagementMap.put("anzahlMitglieder", true);
        contentManagementMap.put("mitgliederkorrekturFaktor", true);
//
//        contentManagementMap.put("farbigkeit", true);
//        contentManagementMap.put("umschlagFarbigkeitElement", true);
//        contentManagementMap.put("umschlagFarbigkeit", true);
//        contentManagementMap.put("nachspann", true);
//        contentManagementMap.put("vorspann", true);
//        contentManagementMap.put("nachsatz", true);

    }

    private static void populateDatenManagementMap() {

        datenManagementMap.put("category", true);
        datenManagementMap.put("product", true);
        datenManagementMap.put("layout", true);
        datenManagementMap.put("umfang", true);
        datenManagementMap.put("prozess", true);
        datenManagementMap.put("sortiment", true);
        datenManagementMap.put("anzahlGesamtArtikel", true);
        datenManagementMap.put("anzahlNeueArtikel", true);
        datenManagementMap.put("anzahlBestandArtikel", true);
        datenManagementMap.put("anzahlGesamtProdukt", true);
        datenManagementMap.put("anzahlNeueProdukt", true);
        datenManagementMap.put("anzahlLieferantGesamt", true);
        datenManagementMap.put("anzahlLieferantNeu", true);
        datenManagementMap.put("anzahlKapitetel", true);

        datenManagementMap.put("farbigkeit", true);
        datenManagementMap.put("umschlagFarbigkeitElement", true);
        datenManagementMap.put("umschlagFarbigkeit", true);
        datenManagementMap.put("nachspann", true);
        datenManagementMap.put("vorspann", true);
        datenManagementMap.put("nachsatz", true);
    }

    private static void populateDatabasePublishingMap() {
        databasePublishingMap.put("category", true);
        databasePublishingMap.put("product", true);
        databasePublishingMap.put("layout", true);
        databasePublishingMap.put("prozess", true);
        databasePublishingMap.put("katalogart", true);
        databasePublishingMap.put("ausgabe", true);
        databasePublishingMap.put("sortiment", true);
        databasePublishingMap.put("umfang", true);
        databasePublishingMap.put("anzahlSonderSeiten", true);
        databasePublishingMap.put("anzahlGenerierungUpdateSeiten", true);
        databasePublishingMap.put("anzahlIHVZSeiten", true);
        databasePublishingMap.put("anzahlBestellNrSeiten", true);
        databasePublishingMap.put("bearbeitungszeit", true);

//        databasePublishingMap.put("farbigkeit", true);
//        databasePublishingMap.put("umschlagFarbigkeitElement", true);
//        databasePublishingMap.put("umschlagFarbigkeit", true);
//        databasePublishingMap.put("nachspann", true);
//        databasePublishingMap.put("vorspann", true);
//        databasePublishingMap.put("nachsatz", true);

    }

    private static void populateProjectManagementMap() {

        //PM doit avoir la mm interface que Admin
        
        projectManagementMap.put("category", true);
        projectManagementMap.put("product", true);
        projectManagementMap.put("sortiment", true);
        projectManagementMap.put("layout", true);
        projectManagementMap.put("katalogart", true);
        projectManagementMap.put("prozess", true);
        projectManagementMap.put("ausgabe", true);
        
        projectManagementMap.put("umfang", true);
        projectManagementMap.put("anzahlSonderSeiten", true);
        projectManagementMap.put("anzahlGenerierungUpdateSeiten", true);
        projectManagementMap.put("anzahlIHVZSeiten", true);
        projectManagementMap.put("anzahlBestellNrSeiten", true);
        
        projectManagementMap.put("anzahlGesamtArtikel", true);
        projectManagementMap.put("anzahlNeueArtikel", true);
        projectManagementMap.put("anzahlBestandArtikel", true);
        projectManagementMap.put("anzahlGesamtProdukt", true);
        projectManagementMap.put("anzahlNeueProdukt", true);
        projectManagementMap.put("anzahlBestandProdukt", true);
        projectManagementMap.put("anzahlLieferantGesamt", true);
        projectManagementMap.put("anzahlLieferantNeu", true);
        projectManagementMap.put("anzahlKapitetel", true);
        
        projectManagementMap.put("anzahlMitglieder", true);
        projectManagementMap.put("mitgliederkorrekturFaktor", true);
        
        projectManagementMap.put("anzahlBeteiligten", true);
        
        projectManagementMap.put("teilnehmerZahl", true);
        projectManagementMap.put("konzeptbearbeitungFaktor", true);
        projectManagementMap.put("wechselfassungVariantFaktor", true);
        projectManagementMap.put("bearbeitungszeit", true);

        //DRUCK
        projectManagementMap.put("formatAuswaehlen", true);
        projectManagementMap.put("druckSeiten", true);
        projectManagementMap.put("papierMaterialAuswaehlen", true);
        projectManagementMap.put("cover", true);
        projectManagementMap.put("farbigkeit", true);        
        projectManagementMap.put("vorspann", true);        
        projectManagementMap.put("nachspann", true);
        projectManagementMap.put("nachsatz", true);        
        projectManagementMap.put("baukasten", true);        
        projectManagementMap.put("umschlagFarbigkeit", true);
        projectManagementMap.put("umschlagFarbigkeitElement", true);
        projectManagementMap.put("bindung", true);        
        projectManagementMap.put("register", true);        
        projectManagementMap.put("auflage", true);        
        projectManagementMap.put("liefertermin", true);        
                
        //ALS PM NUR DIESE FELDER
//        projectManagementMap.put("category", true);
//        projectManagementMap.put("product", true);
//        projectManagementMap.put("sortiment", true);
//        projectManagementMap.put("layout", true);
//        projectManagementMap.put("katalogart", true);
//        projectManagementMap.put("ausgabe", true);
//        projectManagementMap.put("umfang", true);
//        projectManagementMap.put("teilnehmerZahl", true);
//        projectManagementMap.put("konzeptbearbeitungFaktor", true);
//        projectManagementMap.put("wechselfassungVariantFaktor", true);
//        projectManagementMap.put("bearbeitungszeit", true);

//        projectManagementMap.put("farbigkeit", true);
//        projectManagementMap.put("umschlagFarbigkeitElement", true);
//        projectManagementMap.put("umschlagFarbigkeit", true);
//        projectManagementMap.put("nachspann", true);
//        projectManagementMap.put("vorspann", true);
//        projectManagementMap.put("nachsatz", true);

    }

    private static void populateAssetManagementMap() {

        assetManagementMap.put("category", true);
        assetManagementMap.put("product", true);
        assetManagementMap.put("sortiment", true);
        assetManagementMap.put("katalogart", true);
        assetManagementMap.put("anzahlGesamtArtikel", true);
        assetManagementMap.put("anzahlNeueArtikel", true);
        assetManagementMap.put("anzahlGesamtProdukt", true);
        assetManagementMap.put("anzahlNeueProdukt", true);

//        assetManagementMap.put("farbigkeit", true);
//        assetManagementMap.put("umschlagFarbigkeitElement", true);
//        assetManagementMap.put("umschlagFarbigkeit", true);
//        assetManagementMap.put("nachspann", true);
//        assetManagementMap.put("vorspann", true);
//        assetManagementMap.put("nachsatz", true);

    }

    private static void populatemediaITMap() {

        mediaITMap.put("category", true);
        mediaITMap.put("product", true);
        mediaITMap.put("katalogart", true);
        mediaITMap.put("sortiment", true);
        mediaITMap.put("layout", true);
        mediaITMap.put("ausgabe", true);

//        mediaITMap.put("farbigkeit", true);
//        mediaITMap.put("umschlagFarbigkeitElement", true);
//        mediaITMap.put("umschlagFarbigkeit", true);
//        mediaITMap.put("nachspann", true);
//        mediaITMap.put("vorspann", true);
//        mediaITMap.put("nachsatz", true);
    }

    private static void populateAdminMap() {

        adminMap.put("category", true);
        adminMap.put("product", true);
        adminMap.put("anzahlGesamtArtikel", true);
        adminMap.put("anzahlKapitetel", true);
        adminMap.put("anzahlGesamtProdukt", true);
        adminMap.put("layout", true);
        adminMap.put("katalogart", true);
        adminMap.put("umfang", true);

        adminMap.put("farbigkeit", true);
        adminMap.put("umschlagFarbigkeitElement", true);
        adminMap.put("umschlagFarbigkeit", true);
        adminMap.put("nachspann", true);
        adminMap.put("vorspann", true);
        adminMap.put("nachsatz", true);

    }

}
