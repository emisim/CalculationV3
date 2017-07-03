/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;

/**
 *
 * @author lcharaf
 */
public class CalculeHelper {
    public static void calculateAnzahlBestandArtikel(DemandCategory selected){
    selected.setAnzahlBestandArtikel(selected.getAnzahlGesamtArtikel() - selected.getAnzahlNeueArtikel());
    }
}
