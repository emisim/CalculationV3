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
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
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

    private @EJB
    CorrectionSchluesselFacade correctionSchluesselFacade;

    public static BigDecimal findSortimentmKSchluessel(DemandCategory selected, List<SotimentItem> sotimentItems,boolean mitgliederkorrekturFaktor) {
        if (mitgliederkorrekturFaktor == true) {
            return summSortimentmKSchluessel(selected,sotimentItems, mitgliederkorrekturFaktor,true);
        }
        return new BigDecimal(1);
    }

    public static void calculateAnzahlBestandArtikel(DemandCategory selected) {
        selected.setAnzahlBestandArtikel(selected.getAnzahlGesamtArtikel() - selected.getAnzahlNeueArtikel());
    }

    //Calculate CorrectionschluesselAufwand Allgemeine Änderung
    // Hier soll noch AnzahlGesamtProdukt berechnet werden abhängig von SOrtimentfaktor soll noch defineirt werden
    public static void calculateAnzahlGesamtProdukt(DemandCategory selected) {
        selected.setAnzahlGesamtProdukt(selected.getAnzahlGesamtArtikel());
    }

    public static void calculateAnzahlBestandProdukt(DemandCategory selected) {
        selected.setAnzahlBestandProdukt(selected.getAnzahlGesamtProdukt() - selected.getAnzahlNeueProdukt());
    }

    public static void calculateAnzahlSonderSeiten(DemandCategory selected) {
        selected.setAnzahlSonderSeiten((int) (0.1 * selected.getUmfang()));
    }

    private void calculateCorrectionSchluessel(DemandCategory selected) {
        if (selected.getAnzahlGesamtArtikel() != 0) {
            selected.setCorrectionSchluessel(correctionSchluesselFacade.findByPercent((int) ((selected.getAnzahlNeueArtikel() / selected.getAnzahlGesamtArtikel()) * 100)));
        }
    }

    public void calculAnzahlBestandArtikelAndAnzahlGesamtProdukt(DemandCategory selected,List<SotimentItem> sotimentItems) {
        calculateAnzahlBestandArtikel(selected);
        calculateCorrectionSchluessel(selected);
        BigDecimal sortimentFaktor = summSortimentProductSchluessel(selected,sotimentItems, true,true);
        if (sortimentFaktor.compareTo(new BigDecimal(0)) != 0) {

            selected.setAnzahlGesamtProdukt((int) (new Double(selected.getAnzahlGesamtArtikel()) / sortimentFaktor.doubleValue()));
            System.out.println(" hha l faktor dyalna " + sortimentFaktor);
            System.out.println("ha selected.setAnzahlGesamtProdukt " + selected.getAnzahlGesamtProdukt());
        }

    }

    public void calculAnzahlBestandArtikelAndAnzahlNeueProdukt(DemandCategory selected,List<SotimentItem> sotimentItems) {
        calculateAnzahlBestandArtikel(selected);
        calculateCorrectionSchluessel(selected);
        BigDecimal sortimentFaktor = summSortimentProductSchluessel(selected,sotimentItems, true,true);
        if (sortimentFaktor.compareTo(new BigDecimal(0)) != 0) {
            selected.setAnzahlNeueProdukt((int) (new Double(selected.getAnzahlNeueArtikel()) / sortimentFaktor.doubleValue()));
            System.out.println(" hha l faktor dyalna " + sortimentFaktor);
            System.out.println("ha selected.setAnzahlNeueProdukt " + selected.getAnzahlGesamtProdukt());
        }

    }

    public static void calculAnzahlNeuProdukt(DemandCategory selected,List<SotimentItem> sotimentItems) {

        BigDecimal summ = summSortimentProductSchluessel(selected, sotimentItems,true,true);
        if (summ.compareTo(new BigDecimal(0)) != 0) {
            BigDecimal sortimentFaktor = new BigDecimal(selected.getAnzahlNeueArtikel()).divide(summ);
            selected.setAnzahlNeueProdukt(sortimentFaktor.intValue());

            System.out.println("haa le resultat dyl produkt gesamt " + sortimentFaktor);
        }
    }
    public static void summSortimentFactor(DemandCategory selected,List<SotimentItem> sotimentItems){
        summSortimentArtikelPerPagel(selected, sotimentItems,true, true);
        summSortimentlKSchluessel(selected, sotimentItems,true, true);
        summSortimentmKSchluessel(selected, sotimentItems,true, true);
        summSortimentProductSchluessel(selected, sotimentItems,true, true);
        
    }

    public static BigDecimal summSortimentArtikelPerPagel(DemandCategory selected, List<SotimentItem> sotimentItems,boolean percent, boolean injectInDemandCategory) {
        BigDecimal summ = summSortiment(selected,sotimentItems, percent, 1);
        if (injectInDemandCategory) {
            selected.setArtikelPerPagelFaktor(summ);
        }
        return summ;
    }

    public static BigDecimal summSortimentlKSchluessel(DemandCategory selected, List<SotimentItem> sotimentItems,boolean percent, boolean injectInDemandCategory) {
        BigDecimal summ = summSortiment(selected, sotimentItems,percent, 2);
        if (injectInDemandCategory) {
            selected.setlKSchluesselFaktor(summ);
        }
        return summ;
    }

    public static BigDecimal summSortimentmKSchluessel(DemandCategory selected, List<SotimentItem> sotimentItems,boolean percent, boolean injectInDemandCategory) {
        BigDecimal summ = summSortiment(selected, sotimentItems,percent, 3);
        if (injectInDemandCategory) {
            selected.setmKSchluesselFaktor(summ);
        }
        return summ;
    }

    public static BigDecimal summSortimentProductSchluessel(DemandCategory selected, List<SotimentItem> sotimentItems,boolean percent, boolean injectInDemandCategory) {
        BigDecimal summ = summSortiment(selected, sotimentItems,percent, 4);
        if (injectInDemandCategory) {
            selected.setProductSchluesselFaktor(summ);
        }
        return summ;
    }

    public static BigDecimal summSortiment(DemandCategory selected, List<SotimentItem> sotimentItems,boolean percent, int ordreSortiement) {
        BigDecimal summe = new BigDecimal("0");
        if (sotimentItems == null || sotimentItems.isEmpty()) {
            return summe;
        }
        for (SotimentItem sotimentItem : sotimentItems) {
            summe = summe.add(percentValueSortiment(sotimentItem, percent, ordreSortiement));
        }
        System.out.println("haa somme dyal faktor dyalna multipliés par leur sortiment " + summe);
        return summe;
    }

    public static BigDecimal percentValueSortiment(SotimentItem sotimentItem, boolean percent, int ordreSortiement) {
        if (sotimentItem.getWert() == null) {
            sotimentItem.setWert(new BigDecimal(0));
        }
        if (percent == true) {
            BigDecimal percentwert = sotimentItem.getWert().divide(new BigDecimal(100));
            if (ordreSortiement == 1) {
                return (percentwert.multiply(sotimentItem.getSortiment().getArtikelPerPage()));
            } else if (ordreSortiement == 2) {
                return (percentwert.multiply(sotimentItem.getSortiment().getlKSchluessel()));
            } else if (ordreSortiement == 3) {
                return (percentwert.multiply(sotimentItem.getSortiment().getmKSchluessel()));
            } else {
                return (percentwert.multiply(sotimentItem.getSortiment().getProductSchluessel()));
            }
        } else {
            return sotimentItem.getWert();
        }
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
        System.out.println("Auery  MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM " + query);
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
            demandCategoryCalculation.setDemandCategoryCalculationItems(demandCategoryCalculationItemFacade.save(demandCategoryCalculation, demandCategory, similuer, isSave));
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

    public int addSortimentItem(DemandCategory selected, List<SotimentItem> sotimentItems, SotimentItem sotimentItem) {
        selected.setSotimentItems(sotimentItems);
        if (checkItem(sotimentItems, sotimentItem) < 0) {
            return -1;
        } else if (summSortimentProductSchluessel(selected, sotimentItems,false,false).add(sotimentItem.getWert()).compareTo(new BigDecimal(100)) > 0) {
            return -2;
        } else {
            sotimentItems.add(sortimentItemFacade.clone(sotimentItem, sotimentItems));
            return 1;
        }
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

    private int checkItem(List<SotimentItem> sotimentItems, SotimentItem sortimentItem) {

        for (SotimentItem sotimentItemm : sotimentItems) {
            if (Objects.equals(sotimentItemm.getSortiment().getId(), sortimentItem.getSortiment().getId())) {
                return -1;
            }

        }
        return 1;
    }

}
