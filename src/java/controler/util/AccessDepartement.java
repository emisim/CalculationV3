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
 * @author Ashen One
 */
public class AccessDepartement {
    
    private static Map<String, Boolean> contentManagementMap = new HashMap<>();
    private static Map<String, Boolean> datenManagementMap = new HashMap<>();
    private static Map<String, Boolean> databasePublishingMap = new HashMap<>();
    private static Map<String, Boolean> projectManagementMap = new HashMap<>();

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
    
    public static void populateMaps(){
        populateContentManagementMap();
        populateDatenManagementMap();
        populateDatabasePublishingMap();
        populateProjectManagementMap();
    }

    private static void populateContentManagementMap() {
    
        contentManagementMap.put("category", true);
        contentManagementMap.put("product", true);
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
        databasePublishingMap.put("sortiment", true);
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
        
    
    }
    
}
