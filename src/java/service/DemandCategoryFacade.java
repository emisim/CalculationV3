
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryDepartementCalculation;
import bean.Departement;
import bean.Sortiment;
import bean.SotimentItem;
import bean.User;
import controler.util.AccessDepartement;
import controler.util.JsfUtil;
import controler.util.SearchUtil;
import controler.util.SessionUtil;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.PieChartModel;

/**
 *
 * @author
 */
@Stateless
public class DemandCategoryFacade extends AbstractFacade<DemandCategory> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB
    SotimentItemFacade sotimentItemFacade;
    private @EJB
    DemandCategoryDepartementCalculationFacade demandCategoryDepartementCalculationFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    @Override
    public void remove(DemandCategory demandCategory) {
        em.createQuery("DELETE FROM SotimentItem item WHERE item.demandCategory.id=" + demandCategory.getId()).executeUpdate();
        em.createQuery("DELETE FROM DemandCategoryCalculationItem item WHERE item.demandCategoryCalculation.demandCategoryDepartementCalculation.demandCategory.id=" + demandCategory.getId()).executeUpdate();
        em.createQuery("DELETE FROM DemandCategoryCalculation item WHERE item.demandCategoryDepartementCalculation.demandCategory.id=" + demandCategory.getId()).executeUpdate();
        em.createQuery("DELETE FROM DemandCategoryDepartementCalculation item WHERE item.demandCategory.id=" + demandCategory.getId()).executeUpdate();
        super.remove(demandCategory);
    }

    public void save(List<SotimentItem> sotimentItems, DemandCategory demandCategory, Departement departement, boolean simulation, boolean isSave) throws ScriptException {
        prepareSave(demandCategory, isSave);
        if (!simulation) {
            if (isSave) {
                create(demandCategory);
            } else {
                edit(demandCategory);
            }
            System.out.println("hana savite demandCategory ==> " + demandCategory);
        }
        sotimentItemFacade.save(sotimentItems, demandCategory, simulation, isSave);
        demandCategoryDepartementCalculationFacade.save(demandCategory, departement, simulation, isSave);
        calcSumTotal(demandCategory);
        if (simulation == false && isSave == false) {
            edit(demandCategory);
        }

    }

    private void calcSumTotal(DemandCategory demandCategory) {
        demandCategory.setSummTotal(new BigDecimal(0));
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategory.getDemandCategoryDepartementCalculations();
        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            demandCategory.setSummTotal(demandCategory.getSummTotal().add(demandCategoryDepartementCalculation.getSumme()));
        }
    }

    private void prepareSave(DemandCategory demandCategory, boolean isSave) {
        demandCategory.setUser(SessionUtil.getConnectedUser());
        demandCategory.setDepartment(SessionUtil.getConnectedUser().getDepartement());
        if (!demandCategory.isDruck()) {
            demandCategory.setFormatAuswaehlen(null);
            demandCategory.setPapierMaterialAuswaehlen(null);
            demandCategory.setSeitenanzahl(0);
            demandCategory.setFarbigkeit(null);
            demandCategory.setArtDerWeiterverarbeitung(null);
            demandCategory.setVeredlung(null);
            demandCategory.setVeredlung(null);
            demandCategory.setUmschlag(false);
            demandCategory.setCover(null);
            demandCategory.setBindung(null);
            demandCategory.setAuflage(null);
            demandCategory.setBearbeitungszeit(0);
            demandCategory.setAnzahlBeteiligten(0);
            demandCategory.setAnzahlMitglieder(0);
            demandCategory.setSummDruck(new BigDecimal(0));
        }
        if (!demandCategory.isUmschlag()) {
            demandCategory.setUmschlagPapierAuswaehlen(null);
            demandCategory.setUmschlagFarbigkeit(null);
        }
        if (isSave) {
            demandCategory.setId(generate("DemandCategory", "id"));
        }

    }

    public List<DemandCategory> search(DemandCategory demandCategory, List<String> sotimentItems, List<Sortiment> selectedSortiemnts) {
        List<DemandCategory> demandCategorys = new ArrayList<>();
        List<SotimentItem> myItems = new ArrayList<>();
        String query = "SELECT distinct(d) from DemandCategory d, SotimentItem s WHERE s.demandCategory.id = d.id";
        if (demandCategory != null) {
            if (demandCategory.getProduct() != null) {
                query += SearchUtil.addConstraint("d", "product.id", "=", demandCategory.getProduct().getId());
            }
            if (demandCategory.getCategory() != null) {
                query += SearchUtil.addConstraint("d", "category.id", "=", demandCategory.getCategory().getId());
            }
            if (demandCategory.getCorrectionSchluessel() != null) {
                query += SearchUtil.addConstraint("d", "correctionSchluessel.id", "=", demandCategory.getCorrectionSchluessel().getId());
            }
            if (demandCategory.getMitgliederkorrekturFaktor() != null) {
                query += SearchUtil.addConstraint("d", "mitgliederkorrekturFaktor.id", "=", demandCategory.getMitgliederkorrekturFaktor().getId());
            }
            if (demandCategory.getWechselfassungVariantFaktor() != null) {
                query += SearchUtil.addConstraint("d", "wechselfassungVariantFaktor.id", "=", demandCategory.getWechselfassungVariantFaktor().getId());
            }
            if (demandCategory.getParticipantFaktor() != null) {
                query += SearchUtil.addConstraint("d", "participantFaktor.id", "=", demandCategory.getParticipantFaktor().getId());
            }
            if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
                query += SearchUtil.addConstraint("d", "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
            }
            if (!selectedSortiemnts.isEmpty()) {
                for (Sortiment selectedSortiemnt : selectedSortiemnts) {
                    query += SearchUtil.addConstraint("s", "sortiment.id", "=", selectedSortiemnt.getId());
                }
            }
            demandCategorys = em.createQuery(query).getResultList();
            List<DemandCategory> demandCategorysWithSortiements = new ArrayList<>();
            if (demandCategorys != null && !demandCategorys.isEmpty() && sotimentItems != null && !sotimentItems.isEmpty()) {
                System.out.println("items avant :::: " + sotimentItems);
                myItems = convertToLong(sotimentItems);
                System.out.println("items aprés :::: " + myItems);
                for (DemandCategory loadedDemandCategory : demandCategorys) {
                    List<SotimentItem> items = sotimentItemFacade.findByDemandeCategory(loadedDemandCategory);
                    if (myItems.containsAll(items)) {
                        System.out.println("it conatains :::: true");
                        demandCategorysWithSortiements.add(loadedDemandCategory);
                    }
                }
            }
            if (!demandCategorysWithSortiements.isEmpty()) {
                demandCategorys = demandCategorysWithSortiements;
            }
        }
        System.out.println("query ::::::: " + query);
        if (demandCategorys != null && demandCategorys.isEmpty()) {
            JsfUtil.addErrorMessage("Kein Ergebnis gefunden!");
        }

        return demandCategorys;
    }

    private List<SotimentItem> convertToLong(List<String> sotiementItems) {
        List<SotimentItem> sotimentItemss = new ArrayList<>();
        for (String sotiementItem : sotiementItems) {
            sotimentItemss.add(new SotimentItem(Long.valueOf(sotiementItem), new Sortiment(), new DemandCategory()));
        }
        return sotimentItemss;
    }

    public DemandCategoryFacade() {
        super(DemandCategory.class);
    }

    public boolean renderAttribute(String attribute) {
        User user = SessionUtil.getConnectedUser();
        Departement dep = user.getDepartement();

        if (user.getAdmin() == 1) {
            return true;
        } else {
            if (dep.getName().equals("contentManagement")) {
                if (AccessDepartement.getContentManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("datenManagement")) {
                if (AccessDepartement.getDatenManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("databasePublishing")) {
                if (AccessDepartement.getDatabasePublishingMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("projectManagement")) {
                if (AccessDepartement.getProjectManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            return false;

        }
    }

    public boolean renderAttributeForList(String attribute) {
        User user = SessionUtil.getConnectedUser();
        Departement dep = user.getDepartement();

        if (user.getAdmin() == 1) {

            if (AccessDepartement.getAdminMap().containsKey(attribute)) {
                return true;
            }

        } else {
            if (dep.getName().equals("contentManagement")) {
                if (AccessDepartement.getContentManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("datenManagement")) {
                if (AccessDepartement.getDatenManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("databasePublishing")) {
                if (AccessDepartement.getDatabasePublishingMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("projectManagement")) {
                if (AccessDepartement.getProjectManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

        }
        return false;
    }

    public List<DemandCategory> findByDepartement() {
        User connectedUser = SessionUtil.getConnectedUser();
        if (connectedUser.getAdmin() == 0) {
            String requette = "select dem from DemandCategory dem where dem.department.id = '" + connectedUser.getDepartement().getId() + "'";
            return em.createQuery(requette).getResultList();
        } else {
            return findAll();
        }

    }

    public BigDecimal findSummByDepartement(DemandCategory demandCategory) {
        if (SessionUtil.getConnectedUser().getAdmin() == 1) {
            return demandCategory.getSummTotal();
        } else if (SessionUtil.getConnectedUser().getDepartement() != null && !Objects.equals(SessionUtil.getConnectedUser().getDepartement().getId(), demandCategory.getDepartment().getId())) {
            return (BigDecimal) em.createQuery("SELECT item.summe FROM DemandCategoryDepartementCalculation item WHERE  item.demandCategory.id"
                    + demandCategory.getId() + " AND item.departement.id=" + SessionUtil.getConnectedUser().getDepartement().getId()).getSingleResult();
        } else {
            return demandCategory.getSummTotal();
        }
    }

    public ChartSeries createDemandeCategoryStat(int year, int typeSum, int typeAxe, DemandCategory demandCategory) {

        ChartSeries chartSeries = new ChartSeries();

        if (typeAxe == 1) {
            String requet = "select dc from DemandCategory dc where 1=1";
            requet += " AND dc.dateDemandCategory LIKE '" + year + "-%-%'";

            List<DemandCategory> demandCategorys = em.createQuery(requet).getResultList();
            System.out.println("methode createDemandeCategoryStat -> demandCategorys :" + demandCategorys);
            chartSeries = charSerieParAnne(year, typeSum, demandCategorys);
        } else if (typeAxe == 2) {
            chartSeries.set("summTotal", calculerSum(demandCategory));
            chartSeries.set("summDruck", demandCategory.getSummDruck());

        }

        chartSeries.setLabel("" + year);

        return chartSeries;

    }

    public ChartSeries charSerieParAnne(int year, int typeSum, List<DemandCategory> demandCategorys) {
        ChartSeries series = new ChartSeries();
        for (int i = 1; i <= 12; i++) {
            BigDecimal a = new BigDecimal(BigInteger.ZERO);
            for (DemandCategory demandCategory : demandCategorys) {
                if (demandCategory.getDateDemandCategory().getMonth() + 1 == i && demandCategory.getDateDemandCategory().getYear() + 1900 == year) {
                    if (typeSum == 1) {
                        a = a.add(calculerSum(demandCategory));
                    } else {
                        a = a.add(demandCategory.getSummDruck());
                    }

                }
            }
            System.out.println("summ value (a)" + a);
            series.set("mois " + i, a);
        }
        return series;
    }

    private BigDecimal calculerSum(DemandCategory demandCategory) {

        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = findByDemandeCategory(demandCategory);
        System.out.println("demandCategorys-->" + demandCategoryDepartementCalculations.size());
        BigDecimal sum = new BigDecimal(0);

        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            if (demandCategoryDepartementCalculation.getSumme() != null) {
                sum = sum.add(demandCategoryDepartementCalculation.getSumme());
            }
        }
        System.out.println("sum ---> " + sum);
        return sum;
    }

    public PieChartModel createDemandeCategoryPieModel(DemandCategory demandCategory) {
        PieChartModel pieModel = new PieChartModel();

        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = findByDemandeCategory(demandCategory);

        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            pieModel.set("dc.Departement Calculation" + demandCategoryDepartementCalculation.getId(), demandCategoryDepartementCalculation.getSumme());
        }

        pieModel.setTitle("detail summTotal for demand Category(dc)");
        pieModel.setLegendPosition("w");
        pieModel.setShowDataLabels(true);
        pieModel.setDiameter(360);

        return pieModel;
    }

    public List<DemandCategoryDepartementCalculation> findByDemandeCategory(DemandCategory demandCategory) {

        return em.createQuery("SELECT dc FROM DemandCategoryDepartementCalculation dc WHERE dc.demandCategory.id=" + demandCategory.getId()).getResultList();

    }
}
