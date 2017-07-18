/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import bean.DemandCategoryCalculationItem;
import bean.DemandCategoryDepartementCalculation;
import bean.Departement;
import bean.DepartementCriteria;
import bean.SotimentItem;
import controler.util.SearchUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;

/**
 *
 * @author
 */
@Stateless
public class DemandCategoryCalculationFacade extends AbstractFacade<DemandCategoryCalculation> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB
    DemandCategoryCalculationItemFacade demandCategoryCalculationItemFacade;
    private @EJB
    DepartementCriteriaFacade departementCriteriaFacade;
    
    private @EJB
    SotimentItemFacade sortimentItemFacade;

    public static void calculateAnzahlBestandArtikel(DemandCategory selected) {
        selected.setAnzahlBestandArtikel(selected.getAnzahlGesamtArtikel() - selected.getAnzahlNeueArtikel());
    }
    
    //Calculate CorrectionschluesselAufwand Allgemeine Änderung
    
    
    // Hier soll noch AnzahlGesamtProdukt berechnet werden abhängig von SOrtimentfaktor soll noch defineirt werden
    
    public static void calculateAnzahlGesamtProdukt(DemandCategory selected) {
        
        selected.setAnzahlGesamtProdukt(selected.getAnzahlGesamtArtikel() );       
    }


    public static void calculateAnzahlBestandProdukt(DemandCategory selected) {
        selected.setAnzahlBestandProdukt(selected.getAnzahlGesamtProdukt() - selected.getAnzahlNeueProdukt());
    }

    public static void calculateAnzahlSonderSeiten(DemandCategory selected) {
        selected.setAnzahlSonderSeiten((int) (0.1 * selected.getUmfang()));
    }
    
    
    public static void calculAnzahlBestandArtikelAndAnzahlGesamtProdukt(DemandCategory selected) {        
        calculateAnzahlBestandArtikel(selected);
        
        
        BigDecimal summ = summSortiment(selected);
        
        System.out.println("daba andi f summ f gesamtprodukt : " + summ);
        if (summ.compareTo(new BigDecimal(0)) != 0 ){
            //Hier werde es durch SUmme von Prozentwert zu devidieren nicht durch Produktschluessel
            int sortimentFaktor = (int) (new Double(selected.getAnzahlGesamtArtikel()) / summ.doubleValue());
        
            selected.setAnzahlGesamtProdukt(sortimentFaktor);
            System.out.println(" hha l faktor dyalna " + sortimentFaktor);
            System.out.println("ha selected.setAnzahlGesamtProdukt " + selected.getAnzahlGesamtProdukt());
        }
        
    }

    public static void calculAnzahlBestandArtikelAndAnzahlNeueProdukt(DemandCategory selected) {        
        calculateAnzahlBestandArtikel(selected);
        
        BigDecimal summ = summSortiment(selected);
        System.out.println("daba andi f summ f neu Produkt: " + summ);
        if (summ.compareTo(new BigDecimal(0)) != 0 ){
            int sortimentFaktor = (int) (new Double(selected.getAnzahlNeueArtikel()) / summ.doubleValue());
        
            selected.setAnzahlNeueProdukt(sortimentFaktor);
            System.out.println(" hha l faktor dyalna " + sortimentFaktor);
            System.out.println("ha selected.setAnzahlNeueProdukt " + selected.getAnzahlGesamtProdukt());
        }
        
    }
    
    
    
    
//    
//    public static void calculAnzahlNeuProdukt(DemandCategory selected) {     
//        
//        
//        BigDecimal summ = summSortiment(selected);
//        if (summ.compareTo(new BigDecimal(0)) != 0 ){
//             BigDecimal sortimentFaktor = new BigDecimal(selected.getAnzahlNeueArtikel()).divide(summ);
//            selected.setAnzahlNeueProdukt(sortimentFaktor.intValue());
//            
//             System.out.println("haa le resultat dyl produkt gesamt " + sortimentFaktor);
//        }
//    }
  
  
    
    //Summe der Faktor der Sortimente nicht von den SortimentFaktor
    public static BigDecimal summSortiment(DemandCategory selected) {
        List<SotimentItem> sotimentItems = selected.getSotimentItems();
       BigDecimal summe =new BigDecimal("0");
       if(sotimentItems == null  || sotimentItems.isEmpty()){
           return summe;
    }
        for (SotimentItem sotimentItem : sotimentItems) {
            //summe =summe.add(percentValueProductSchluessel(sotimentItem));
            summe =summe.add((sotimentItem.getWert()));
        }
        System.out.println("haa somme dyal faktor dyalna multipliés par leur sortiment " + summe);
        return summe;
    }

    public static BigDecimal percentValueProductSchluessel(SotimentItem sotimentItem) {
        //BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal sotimentItem.getWert() " + sotimentItem.getWert());
        System.out.println("la valeur dyal produktschluessel dyalna sotimentItem.getSortiment().getProductSchluessel() " + sotimentItem.getSortiment().getProductSchluessel());
        BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal percentwert.multiply(sotimentItem.getSortiment().getProductSchluessel()) " + percentwert.multiply(sotimentItem.getSortiment().getProductSchluessel()));
        
        BigDecimal multiplyValueProduktKey = percentwert.multiply(sotimentItem.getSortiment().getProductSchluessel());
        return multiplyValueProduktKey;
    }
    
    
    public static BigDecimal percentValueLKSchluessel(SotimentItem sotimentItem) {
        //BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal sotimentItem.getWert() " + sotimentItem.getWert());
        System.out.println("la valeur dyal LK dyalna sotimentItem.getSortiment().getlKSchluessel() " + sotimentItem.getSortiment().getlKSchluessel());
        BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal percentwert.multiply(sotimentItem.getSortiment().getlKSchluessel()) " + percentwert.multiply(sotimentItem.getSortiment().getlKSchluessel()));
        
        return (percentwert.multiply(sotimentItem.getSortiment().getlKSchluessel()));
    }
    
    public static BigDecimal percentValueMKSchluessel(SotimentItem sotimentItem) {
        //BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal sotimentItem.getWert() " + sotimentItem.getWert());
        System.out.println("la valeur dyal MK dyalna sotimentItem.getSortiment().getMKSchluessel() " + sotimentItem.getSortiment().getmKSchluessel());
        BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal percentwert.multiply(sotimentItem.getSortiment().getmKSchluessel()) " + percentwert.multiply(sotimentItem.getSortiment().getmKSchluessel()));
        
        return (percentwert.multiply(sotimentItem.getSortiment().getmKSchluessel()));
    }
    
    public static BigDecimal percentValueArtikelPerPage(SotimentItem sotimentItem) {
        //BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal sotimentItem.getWert() " + sotimentItem.getWert());
        System.out.println("la valeur dyal MK dyalna sotimentItem.getSortiment().getArtikelPerPage() " + sotimentItem.getSortiment().getArtikelPerPage());
        BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
        System.out.println("la valeur dyal percentwert.multiply(sotimentItem.getSortiment().getArtikelPerPage()) " + percentwert.multiply(sotimentItem.getSortiment().getArtikelPerPage()));
        
        return (percentwert.multiply(sotimentItem.getSortiment().getArtikelPerPage()));
    }
    
    
    
    

    public static void calculateAnzahlGenerierungUpdateSeitenn(DemandCategory selected) {
        selected.setAnzahlGenerierungUpdateSeiten(selected.getUmfang() - selected.getAnzahlSonderSeiten());
    }

    public List<DemandCategoryCalculation> findWithItemsByDemandCategoryDepartementCalculation(DemandCategoryDepartementCalculation demandCategoryDepartementCalculation) {
        List<DemandCategoryCalculation> demandCategoryCalculations = findByDemandCategoryDepartementCalculation(demandCategoryDepartementCalculation);
        for (DemandCategoryCalculation demandCategoryCalculation : demandCategoryCalculations) {
            demandCategoryCalculation.setDemandCategoryCalculationItems(demandCategoryCalculationItemFacade.findByDemandCategoryCalculation(demandCategoryCalculation));
        }
        return demandCategoryCalculations;
    }

    public List<DemandCategoryCalculation> findByDemandCategoryDepartementCalculation(DemandCategoryDepartementCalculation demandCategoryDepartementCalculation) {
        String query = "SELECT item FROM DemandCategoryCalculation item WHERE 1=1";
        if (demandCategoryDepartementCalculation != null && demandCategoryDepartementCalculation.getId() != null) {
            query += SearchUtil.addConstraint("item", "demandCategoryDepartementCalculation.id", "=", demandCategoryDepartementCalculation.getId());
        }
        System.out.println("Auery  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM "+query);
        return em.createQuery(query).getResultList();
    }

    //Hier werden alle Calculation gesucht oder gespeichert
    public List<DemandCategoryCalculation> save(DemandCategory demandCategory, DemandCategoryDepartementCalculation demandCategoryDepartementCalculation, boolean similuer, boolean isSave) throws ScriptException {
        List<DemandCategoryCalculation> res = new ArrayList();
        List<DepartementCriteria> departementCriterias = departementCriteriaFacade.findDepartementCriteriaWithItemsByDepartement(demandCategoryDepartementCalculation.getDepartement());
        for (DepartementCriteria departementCriteria : departementCriterias) {
            DemandCategoryCalculation demandCategoryCalculation = createOrFind(departementCriteria, demandCategoryDepartementCalculation);
            if (!similuer) {
                if (isSave) {
                    create(demandCategoryCalculation);
                } else {
                    edit(demandCategoryCalculation);
                }
                System.out.println("hana savite demandCategoryCalculation ==> " + demandCategoryCalculation);
            }
            demandCategoryCalculation.setDemandCategoryCalculationItems(demandCategoryCalculationItemFacade.save(demandCategoryCalculation, demandCategory, similuer,isSave));
            demandCategoryCalculation.setSumme(calculerSum(demandCategoryCalculation.getDemandCategoryCalculationItems()));
            if (!similuer) {
                edit(demandCategoryCalculation);
                System.out.println("hana edite demandCategoryCalculation ==> " + demandCategoryCalculation);
            }
            res.add(demandCategoryCalculation);
        }
        return res;
    }
    
    public List<DemandCategoryCalculation> detail(DemandCategory demandCategory, DemandCategoryDepartementCalculation demandCategoryDepartementCalculation) throws ScriptException {
        List<DemandCategoryCalculation> res = new ArrayList();
        List<DepartementCriteria> departementCriterias = departementCriteriaFacade.findDepartementCriteriaWithItemsByDepartement(demandCategoryDepartementCalculation.getDepartement());
        for (DepartementCriteria departementCriteria : departementCriterias) {
            DemandCategoryCalculation demandCategoryCalculation = find(departementCriteria, demandCategoryDepartementCalculation);
            demandCategoryCalculation.setDemandCategoryCalculationItems(demandCategoryCalculationItemFacade.detail(demandCategoryCalculation, demandCategory));
            demandCategoryCalculation.setSumme(calculerSum(demandCategoryCalculation.getDemandCategoryCalculationItems()));
            demandCategoryCalculation.setDepartementCriteria(departementCriteria);
            res.add(demandCategoryCalculation);
        }
        return res;
    }

    private DemandCategoryCalculation createOrFind(DepartementCriteria departementCriteria, DemandCategoryDepartementCalculation demandCategoryDepartementCalculation) {

        String query = "SELECT item FROM DemandCategoryCalculation item WHERE "
                + "item.demandCategoryDepartementCalculation.id=" + demandCategoryDepartementCalculation.getId()
                + " AND item.departementCriteria.id=" + departementCriteria.getId();
        System.out.println("haa query ==> " + query);
        List<DemandCategoryCalculation> res = em.createQuery(query).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
            System.out.println("rah l9ite DemandCategoryCalculation f bd ha son id " + res.get(0).getId());
            return res.get(0);
        }
        System.out.println("rah maaa l9itechhh DemandCategoryCalculation f bd ");
        DemandCategoryCalculation demandCategoryCalculation = new DemandCategoryCalculation();
        demandCategoryCalculation.setId(generate("DemandCategoryCalculation", "id"));
        demandCategoryCalculation.setDepartementCriteria(departementCriteria);
        demandCategoryCalculation.setDemandCategoryDepartementCalculation(demandCategoryDepartementCalculation);
        return demandCategoryCalculation;
    }
    
     private DemandCategoryCalculation find(DepartementCriteria departementCriteria, DemandCategoryDepartementCalculation demandCategoryDepartementCalculation) {

        String query = "SELECT item FROM DemandCategoryCalculation item WHERE "
                + "item.demandCategoryDepartementCalculation.id=" + demandCategoryDepartementCalculation.getId()
                + " AND item.departementCriteria.id=" + departementCriteria.getId();
        System.out.println("haa query ==> " + query);
        List<DemandCategoryCalculation> res = em.createQuery(query).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
            System.out.println("rah l9ite DemandCategoryCalculation f bd ha son id " + res.get(0).getId());
            return res.get(0);
        }
       
        return new DemandCategoryCalculation();
    }

     
     
     public  int addSortimentItem(DemandCategory selected, List<SotimentItem> sotimentItems, SotimentItem sotimentItem){
         selected.setSotimentItems(sotimentItems);
         BigDecimal resSumm = summSortiment(selected).add(sotimentItem.getWert());
         if(resSumm.compareTo(new BigDecimal(100)) <= 0){
             
             System.out.println("aatini daba ach wake3 f summ dyal percent wert summSortiment(selected).add(sotimentItem.getWert())" + summSortiment(selected).add(sotimentItem.getWert()));
         //if(summSortiment(selected).add(percentValueProductSchluessel(sotimentItem)).compareTo(new BigDecimal(100)) <= 0){  
         
             //summSortiment(selected).add(percentValueProductSchluessel(sotimentItem));
             
             sotimentItems.add(sortimentItemFacade.clone(sotimentItem, sotimentItems));
             System.out.println("werrini la valeur dyal percentValueProductSchluessel" + percentValueProductSchluessel(sotimentItem));
             System.out.println("werrini la valeur dyal percentValueLKSchluessel" + percentValueLKSchluessel(sotimentItem));
             System.out.println("werrini la valeur dyal percentValueMKSchluessel" + percentValueMKSchluessel(sotimentItem));
             System.out.println("werrini la valeur dyal percentValueArtikelPerPage" + percentValueArtikelPerPage(sotimentItem));
            
             
             System.out.println("werrini la valeur dyal summe Sortiment resSumm" + resSumm);
             return 1;
        }
        return -1;
     }

    private BigDecimal calculerSum(List<DemandCategoryCalculationItem> demandCategoryCalculationItems) {
        BigDecimal sum = new BigDecimal(0);
        for (DemandCategoryCalculationItem demandCategoryCalculationItem : demandCategoryCalculationItems) {
            sum = sum.add(demandCategoryCalculationItem.getPrice());
        }
        return sum;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DemandCategoryCalculationFacade() {
        super(DemandCategoryCalculation.class);
    }

    public int checkItem(List<SotimentItem> sotimentItems, SotimentItem sortimentItem) {
    
        for (SotimentItem sotimentItemm : sotimentItems) {
            if(sotimentItemm.getSortiment().getId() == sortimentItem.getSortiment().getId()){
                return -1;
            }
            
        }
        return 1;
    }

}
