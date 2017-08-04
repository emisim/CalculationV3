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
        contentManagementMap.put("anzahlMitglieder", true);
        contentManagementMap.put("mitgliederkorrekturFaktor", true);
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
        datenManagementMap.put("anzahlNeueProdukt", true);
        datenManagementMap.put("anzahlLieferantGesamt", true);
        datenManagementMap.put("anzahlLieferantNeu", true);
        datenManagementMap.put("anzahlKapitetel", true);
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

    }

    private static void populateProjectManagementMap() {

        projectManagementMap.put("category", true);
        projectManagementMap.put("product", true);
        projectManagementMap.put("sortiment", true);
        projectManagementMap.put("layout", true);
        projectManagementMap.put("katalogart", true);
        projectManagementMap.put("ausgabe", true);
        projectManagementMap.put("umfang", true);
        projectManagementMap.put("teilnehmerZahl", true);
        projectManagementMap.put("konzeptbearbeitungFaktor", true);
        projectManagementMap.put("wechselfassungVariantFaktor",true);
        projectManagementMap.put("bearbeitungszeit", true);
        
        

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
    }
    private static void populatemediaITMap() {

        mediaITMap.put("category", true);
        mediaITMap.put("product", true);
        mediaITMap.put("katalogart", true);
        mediaITMap.put("layout", true);
        mediaITMap.put("ausgabe", true);
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

    }

}
