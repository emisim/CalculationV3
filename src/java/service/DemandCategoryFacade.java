
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
import bean.DepartementDetail;
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
import java.util.Date;
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
    @EJB
    private DemandCategoryCalculationFacade demandCategoryCalculationFacade;
    @EJB
    private DemandCategoryCalculationItemFacade demandCategoryCalculationItemFacade;
    @EJB
    private DemandCategoryValidationFacade demandCategoryValidationFacade;
    @EJB
    private DepartementFacade departementFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    private String findByValidation(Integer validationLevel, String beanAbrveation) {
        int topLevel = departementFacade.findAll().size();
        String query = "";
        if (validationLevel != null) {
            if (validationLevel == 0) {
                query += SearchUtil.addConstraint(beanAbrveation, "nbrTotalValidation", "=", "0");
            } else if (validationLevel == 1) {
                query += SearchUtil.addConstraintMinMaxStrict(beanAbrveation, "nbrTotalValidation", "0", topLevel);
            } else if (validationLevel == 2) {
                query += SearchUtil.addConstraint(beanAbrveation, "nbrTotalValidation", "=", topLevel);
            }
        }
        return query;
    }

    @Override
    public void remove(DemandCategory demandCategory) {
        em.createQuery("DELETE FROM SotimentItem item WHERE item.demandCategory.id=" + demandCategory.getId()).executeUpdate();
        em.createQuery("DELETE FROM DemandCategoryValidation item WHERE item.demandCategory.id=" + demandCategory.getId()).executeUpdate();
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
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.save(demandCategory, departement, simulation, isSave);
        calcSumTotal(demandCategory, demandCategoryDepartementCalculations);
        if (simulation == false && isSave == false) {
            edit(demandCategory);
            demandCategoryValidationFacade.checkExistanceOrCreate(demandCategory);
        }

    }

    private void calcSumTotal(DemandCategory demandCategory, List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations) {
        demandCategory.setSummTotal(new BigDecimal(0));
        if (demandCategoryDepartementCalculations == null || demandCategoryDepartementCalculations.isEmpty()) {
            return;
        }
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

    public List<DemandCategory> search(DemandCategory demandCategory, List<String> sotimentItems, List<Sortiment> selectedSortiemnts, Integer validationLevel,Date sysDateMin,Date sysDateMax) {
        List<DemandCategory> demandCategorys = new ArrayList<>();
        List<SotimentItem> myItems = new ArrayList<>();
        String query = "SELECT distinct(d) from DemandCategory d, SotimentItem s WHERE s.demandCategory.id = d.id";
        if (demandCategory != null) {
            query = getQuery(demandCategory, query, "d");

            if (!selectedSortiemnts.isEmpty()) {
                query += SearchUtil.addConstraintOr("s", "sortiment.id", "=", selectedSortiemnts);
            }
            
            query += SearchUtil.addConstraintMinMaxDate("d", "dateSystem", sysDateMin, sysDateMax);
           
            System.out.println("ha query ==> " + query);
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

    public void updateDepItems(List<DepartementDetail> departementDetails) {
        if (departementDetails != null && !departementDetails.isEmpty()) {
            for (DepartementDetail departementCriteria : departementDetails) {
                DemandCategoryCalculation demandCategoryCalculation = demandCategoryCalculationFacade.find(departementCriteria.getDemandCategoryCalcuationId());
                demandCategoryCalculation.setSumme(new BigDecimal(departementCriteria.getSummCriteria()));
                demandCategoryCalculationFacade.edit(demandCategoryCalculation);
                DemandCategoryCalculationItem demandCategoryCalculationItem = demandCategoryCalculationItemFacade.find(departementCriteria.getDemandCategoryCalculationItemId());
                demandCategoryCalculationItem.setPriceUpdate(new BigDecimal(departementCriteria.getPriceUpdate()));
                demandCategoryCalculationItem.setPriceGlobalUpdate(new BigDecimal(departementCriteria.getPriceGlobalUpdate()));
                demandCategoryCalculationItem.setCalcultaed(departementCriteria.isChecked());
                demandCategoryCalculationItemFacade.edit(demandCategoryCalculationItem);
                DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = demandCategoryDepartementCalculationFacade.find(departementCriteria.getDemandCategoryDepartementCalculationId());
                demandCategoryDepartementCalculation.setSumme(new BigDecimal(departementCriteria.getSummDepartement()));
                demandCategoryDepartementCalculationFacade.edit(demandCategoryDepartementCalculation);
            }
            JsfUtil.addSuccessMessage("Details updated");
        }
    }

    public ChartSeries createDemandeCategoryStat(int year, int typeSum, int typeAxe, DemandCategory demandCategory, List<String> departements, DemandCategory selectedForSearch) {
        ChartSeries chartSeries = new ChartSeries();

        if (typeAxe == 2) {
            chartSeries.set("summTotal", calculerSum(demandCategory));
            chartSeries.set("summDruck", demandCategory.getSummDruck());
            return chartSeries;
        } else {

            String query = "SELECT dc FROM DemandCategory dc WHERE 1=1 ";
            if (selectedForSearch != null) {
                query = getQuery(selectedForSearch, query, "dc");
            }

            if (typeAxe == 0 && !departements.isEmpty()) {

                query += " AND (";
                for (String departement : departements) {
                    query += (departements.size() != 2 && departements.indexOf(departement) == (departements.size() - 1) || departements.indexOf(departement) == 0) ? " " : " OR ";
                    query += "dc.department.name='" + departement + "'";
                }
                query += " )";

            }
            query += " AND dc.dateDemandCategory LIKE '" + year + "-%-%'";
            System.out.println("reauet--| " + query);
            List<DemandCategory> demandCategorys = em.createQuery(query).getResultList();
            System.out.println("methode createDemandeCategoryStat -> demandCategorys :" + demandCategorys);
            chartSeries = charSerieParAnne(year, typeSum, demandCategorys);

            chartSeries.setLabel("" + year);

            return chartSeries;
        }

    }

    public ChartSeries charSerieParAnne(int year, int typeSum, List<DemandCategory> demandCategorys) {
        ChartSeries series = new ChartSeries();
        for (int i = 1; i <= 12; i++) {
            BigDecimal summ = new BigDecimal(BigInteger.ZERO);
            for (DemandCategory demandCategory : demandCategorys) {
                if (demandCategory.getDateDemandCategory() != null && demandCategory.getDateDemandCategory().getMonth() + 1 == i && demandCategory.getDateDemandCategory().getYear() + 1900 == year) {
                    if (typeSum == 1) {
                        summ = summ.add(calculerSum(demandCategory));
                    } else {
                        summ = summ.add(demandCategory.getSummDruck());
                    }
                }
            }
            System.out.println("summ value (a)" + summ);
            series.set("mois " + i, summ);
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

    private BigDecimal calculerSumDruck(DemandCategory demandCategory) {

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
            pieModel.set("dc.Departement Calculation( " + demandCategoryDepartementCalculation + " )", demandCategoryDepartementCalculation.getSumme());
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

    public String getQuery(DemandCategory demandCategory, String query, String varSql) {

        if (demandCategory.getProduct() != null) {
            query += SearchUtil.addConstraint(varSql, "product.id", "=", demandCategory.getProduct().getId());
        }
        if (demandCategory.getCategory() != null) {
            query += SearchUtil.addConstraint(varSql, "category.id", "=", demandCategory.getCategory().getId());
        }
        if (demandCategory.getCorrectionSchluessel() != null) {
            query += SearchUtil.addConstraint(varSql, "correctionSchluessel.id", "=", demandCategory.getCorrectionSchluessel().getId());
        }
        if (demandCategory.getMitgliederkorrekturFaktor() != null) {
            query += SearchUtil.addConstraint(varSql, "mitgliederkorrekturFaktor.id", "=", demandCategory.getMitgliederkorrekturFaktor().getId());
        }
        if (demandCategory.getWechselfassungVariantFaktor() != null) {
            query += SearchUtil.addConstraint(varSql, "wechselfassungVariantFaktor.id", "=", demandCategory.getWechselfassungVariantFaktor().getId());
        }
        if (demandCategory.getParticipantFaktor() != null) {
            query += SearchUtil.addConstraint(varSql, "participantFaktor.id", "=", demandCategory.getParticipantFaktor().getId());
        }
        if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
            query += SearchUtil.addConstraint(varSql, "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
        }
        if (demandCategory.getUser() != null) {
            query += SearchUtil.addConstraint(varSql, "user.login", "=", demandCategory.getUser().getLogin());
        }
        if (demandCategory.getDepartment() != null) {
            query += SearchUtil.addConstraint(varSql, "department.id", "=", demandCategory.getDepartment().getId());
        }

        if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
            query += SearchUtil.addConstraint(varSql, "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
        }
        return query;
    }
}
