
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.AuflageSeitenCoverMatrix;
import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import bean.DemandCategoryCalculationItem;
import bean.DemandCategoryDepartementCalculation;
import bean.Departement;
import bean.DepartementDetail;
import bean.Sortiment;
import bean.SotimentItem;
import bean.User;
import controler.util.JsfUtil;
import controler.util.SearchUtil;
import controler.util.SessionUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;

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
    TeilnehmerZahlPricingFacade teilnehmerZahlPricingFacade;
    private @EJB
    AuflageSeitenCoverMatrixFacade auflageSeitenCoverMatrixFacade;
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
    @EJB
    private DemandCategoryFacade demandCategoryFacade;

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
        prepare(demandCategory, isSave);
        saveOrUpdate(simulation, isSave, demandCategory);
        sotimentItemFacade.save(sotimentItems, demandCategory, simulation, isSave);
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.save(demandCategory, departement, simulation, isSave);
        calcSumTotal(demandCategory, demandCategoryDepartementCalculations);
        calcSumDruck(demandCategory);
        DemandCategoryCalculationFacade.summSortimentFactor(demandCategory, sotimentItems);
        teilnehmerZahlPricingFacade.calcPriceByTeilnehmerZahlValue(demandCategory);
        if (simulation == false) {
            edit(demandCategory);
            if (isSave) {
                demandCategoryValidationFacade.checkExistanceOrCreate(demandCategory);
            }
        }
        saveOrUpdate(simulation, isSave, demandCategory);

    }

    public void saveForSimulation(List<SotimentItem> sotimentItems, DemandCategory demandCategory, boolean simulation, boolean isSave) throws ScriptException {
        prepare(demandCategory, isSave);
        saveOrUpdate(simulation, isSave, demandCategory);
        sotimentItemFacade.save(sotimentItems, demandCategory, simulation, isSave);
        calcSumDruck(demandCategory);
        DemandCategoryCalculationFacade.summSortimentFactor(demandCategory, sotimentItems);
        teilnehmerZahlPricingFacade.calcPriceByTeilnehmerZahlValue(demandCategory);
        edit(demandCategory);
        demandCategoryValidationFacade.checkExistanceOrCreate(demandCategory);

    }

    private void saveOrUpdate(boolean simulation, boolean isSave, DemandCategory demandCategory) {
        if (!simulation) {
            if (isSave) {
                create(demandCategory);
            } else {
                edit(demandCategory);
            }
        }
    }

    private void calcSumTotal(DemandCategory demandCategory, List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations) {
        demandCategory.setSummUnitPrice(new BigDecimal(0));
        demandCategory.setSummeGlobal(new BigDecimal(0));
        if (demandCategoryDepartementCalculations == null || demandCategoryDepartementCalculations.isEmpty()) {
            return;
        }
        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            demandCategory.setSummUnitPrice(demandCategory.getSummUnitPrice().add(demandCategoryDepartementCalculation.getSumme()));
            demandCategory.setSummeGlobal(demandCategory.getSummeGlobal().add(demandCategoryDepartementCalculation.getSummeGlobal()));
        }
    }

    private int calcSumDruck(DemandCategory demandCategory) {
        demandCategory.setSummDruck(new BigDecimal(0));
        AuflageSeitenCoverMatrix auflageSeitenCoverMatrix = auflageSeitenCoverMatrixFacade.findByCriteria(demandCategory.getAuflage(), demandCategory.getDruckSeiten(), demandCategory.getFormatAuswaehlen(), demandCategory.getFarbigkeit(), demandCategory.getBaukasten());
        if (demandCategory == null || demandCategory.getCover() == null || SearchUtil.isStringNullOrVide(demandCategory.getCover().getDescription())) {
            return -1;
        }
        boolean hardCover = demandCategory.getCover().getDescription().toLowerCase().contains("hard");
        if (hardCover && (auflageSeitenCoverMatrix == null || auflageSeitenCoverMatrix.getPrice() == null)) {
            return -2;
        } else {
            BigDecimal summDruck = new BigDecimal(0);
            if (hardCover) {
                summDruck = (demandCategory.getCover().getPrice().add(auflageSeitenCoverMatrix.getPrice()).add(demandCategory.getRegister().getPrice())).multiply(demandCategory.getAuflage().getPrice());
            } else {
                summDruck = auflageSeitenCoverMatrix.getPrice().multiply(demandCategory.getAuflage().getPrice());
            }
            demandCategory.setSummDruck(summDruck);
            return 1;
        }

    }

    private void prepare(DemandCategory demandCategory, boolean isSave) {
        demandCategory.setUser(SessionUtil.getConnectedUser());
        demandCategory.setDepartment(SessionUtil.getConnectedUser().getDepartement());
        if (!demandCategory.isDruck()) {
            demandCategory.setFormatAuswaehlen(null);
            demandCategory.setPapierMaterialAuswaehlen(null);
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
        }
        if (!demandCategory.isUmschlag()) {
            demandCategory.setUmschlagPapierAuswaehlen(null);
            demandCategory.setUmschlagFarbigkeit(null);
        }
        if (isSave) {
            demandCategory.setId(generate("DemandCategory", "id"));
        }

    }

    public List<DemandCategory> search(DemandCategory demandCategory, List<String> departements, List<String> sotimentItems, List<String> sortiemnts, Integer validationLevel, Date dateSysMin, Date dateSysMax) {
        List<DemandCategory> demandCategorys = new ArrayList<>();
        String[] queryHelper = constructQueryHelper(sortiemnts);

        String query = "SELECT " + queryHelper[0] + " FROM " + queryHelper[1] + " WHERE " + queryHelper[2];
        query += constructSearchQuery(demandCategory, validationLevel, "dc");
        query += SearchUtil.addConstraintMinMaxDate("dc", "dateSystem", dateSysMin, dateSysMax);
        query += SearchUtil.addConstraintOr("so", "sortiment.name", "=", sortiemnts);
        query += SearchUtil.addConstraintOr("dc", "department.name", "=", departements);

        System.out.println("ha departements ==> " + departements);
        System.out.println("ha query ==> " + query);
        demandCategorys = em.createQuery(query).getResultList();

        if (demandCategorys != null && demandCategorys.isEmpty()) {
            JsfUtil.addErrorMessage("Kein Ergebnis gefunden!");
        }

        return demandCategorys;
    }

    private String[] constructQueryHelper(List<String> sortiemnts) {

        String beanAbreviation = "distinct(dc)";
        String fromQuery = "DemandCategory dc";
        String wherequery = "1=1";

        if (sortiemnts != null && !sortiemnts.isEmpty()) {
            fromQuery += " , SotimentItem so";
            wherequery = " so.demandCategory.id = dc.id";
        }

        return new String[]{beanAbreviation, fromQuery, wherequery};

    }

    private List<SotimentItem> convertToLong(List<String> sotiementItems) {
        List<SotimentItem> sotimentItemss = new ArrayList<>();
        for (String sotiementItem : sotiementItems) {
            sotimentItemss.add(new SotimentItem(Long.valueOf(sotiementItem), new Sortiment(), new DemandCategory()));
        }
        return sotimentItemss;
    }

    public DemandCategoryFacade() {
        super(DemandCategory.class
        );
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
            return demandCategory.getSummeGlobal();
        } else if (SessionUtil.getConnectedUser().getDepartement() != null && !Objects.equals(SessionUtil.getConnectedUser().getDepartement().getId(), demandCategory.getDepartment().getId())) {
            return (BigDecimal) em.createQuery("SELECT item.summeGlobal FROM DemandCategoryDepartementCalculation item WHERE  item.demandCategory.id="
                    + demandCategory.getId() + " AND item.departement.id=" + SessionUtil.getConnectedUser().getDepartement().getId()).getSingleResult();
        } else {
            return demandCategory.getSummeGlobal();
        }
    }

    public void updateDepItems(List<DepartementDetail> departementDetails, List<SotimentItem> sotimentItems, String flag) {
        if (departementDetails != null && !departementDetails.isEmpty()) {
            for (DepartementDetail departementCriteria : departementDetails) {
                if (flag.equals("edit")) {
                    DemandCategoryCalculation demandCategoryCalculation = demandCategoryCalculationFacade.find(departementCriteria.getDemandCategoryCalcuation().getId());
                    demandCategoryCalculation.setSumme(new BigDecimal(departementCriteria.getSummCriteria()));
                    demandCategoryCalculation.setSummeGlobal(new BigDecimal(departementCriteria.getSummCriteriaGlobal()));
                    demandCategoryCalculationFacade.edit(demandCategoryCalculation);
                    DemandCategoryCalculationItem demandCategoryCalculationItem = demandCategoryCalculationItemFacade.find(departementCriteria.getDemandCategoryCalculationItem().getId());
                    demandCategoryCalculationItem.setPriceUpdate(new BigDecimal(departementCriteria.getPriceUpdate()));
                    demandCategoryCalculationItem.setPriceGlobalUpdate(new BigDecimal(departementCriteria.getPriceGlobalUpdate()));
                    demandCategoryCalculationItem.setCalcultaed(departementCriteria.isChecked());
                    demandCategoryCalculationItemFacade.edit(demandCategoryCalculationItem);
                    DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = demandCategoryDepartementCalculationFacade.find(departementCriteria.getDemandCategoryDepartementCalculation().getId());
                    demandCategoryDepartementCalculation.setSumme(new BigDecimal(departementCriteria.getSummDepartement()));
                    demandCategoryDepartementCalculation.setSummeGlobal(new BigDecimal(departementCriteria.getSummDepartementGlobal()));
                    demandCategoryDepartementCalculationFacade.edit(demandCategoryDepartementCalculation);
                }
                if (flag.equals("save")) {
                    System.out.println("save save");
                    DemandCategoryCalculation demandCategoryCalculation = departementCriteria.getDemandCategoryCalcuation();
                    demandCategoryCalculation.setSumme(new BigDecimal(departementCriteria.getSummCriteria()));
                    demandCategoryCalculation.setSummeGlobal(new BigDecimal(departementCriteria.getSummCriteriaGlobal()));
                    demandCategoryCalculationFacade.create(demandCategoryCalculation);
                    DemandCategoryCalculationItem demandCategoryCalculationItem = departementCriteria.getDemandCategoryCalculationItem();
                    demandCategoryCalculationItem.setPriceUpdate(new BigDecimal(departementCriteria.getPriceUpdate()));
                    demandCategoryCalculationItem.setPriceGlobalUpdate(new BigDecimal(departementCriteria.getPriceGlobalUpdate()));
                    demandCategoryCalculationItem.setCalcultaed(departementCriteria.isChecked());
                    demandCategoryCalculationItemFacade.create(demandCategoryCalculationItem);
                    DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = departementCriteria.getDemandCategoryDepartementCalculation();
                    demandCategoryDepartementCalculation.setSumme(new BigDecimal(departementCriteria.getSummDepartement()));
                    demandCategoryDepartementCalculation.setSummeGlobal(new BigDecimal(departementCriteria.getSummDepartementGlobal()));
                    demandCategoryDepartementCalculationFacade.create(demandCategoryDepartementCalculation);
                }

            }

        }
    }

    public String constructSearchQuery(DemandCategory demandCategory, Integer validationLevel, String beanAbreviation) {
        String query = "";
        if (demandCategory != null) {
            if (demandCategory.getProduct() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "product.id", "=", demandCategory.getProduct().getId());
            }
            if (demandCategory.getCategory() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "category.id", "=", demandCategory.getCategory().getId());
            }
            if (demandCategory.getCorrectionSchluessel() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "correctionSchluessel.id", "=", demandCategory.getCorrectionSchluessel().getId());
            }
            if (demandCategory.getMitgliederkorrekturFaktor() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "mitgliederkorrekturFaktor.id", "=", demandCategory.getMitgliederkorrekturFaktor().getId());
            }
            if (demandCategory.getWechselfassungVariantFaktor() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "wechselfassungVariantFaktor.id", "=", demandCategory.getWechselfassungVariantFaktor().getId());
            }
            if (demandCategory.getParticipantFaktor() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "participantFaktor.id", "=", demandCategory.getParticipantFaktor().getId());
            }
            if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
            }
            if (demandCategory.getUser() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "user.login", "=", demandCategory.getUser().getLogin());
            }
            if (demandCategory.getDepartment() != null) {
                query += SearchUtil.addConstraint(beanAbreviation, "department.id", "=", demandCategory.getDepartment().getId());
            }
//            if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
//            }

//            if (demandCategory.getCorrectionSchluessel() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "correctionSchluessel.id", "=", demandCategory.getCorrectionSchluessel().getId());
//            }
//            if (demandCategory.getMitgliederkorrekturFaktor() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "mitgliederkorrekturFaktor.id", "=", demandCategory.getMitgliederkorrekturFaktor().getId());
//            }
//            if (demandCategory.getWechselfassungVariantFaktor() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "wechselfassungVariantFaktor.id", "=", demandCategory.getWechselfassungVariantFaktor().getId());
//            }
//            if (demandCategory.getParticipantFaktor() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "participantFaktor.id", "=", demandCategory.getParticipantFaktor().getId());
//            }
//            if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
//            }
//            if (demandCategory.getUser() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "user.login", "=", demandCategory.getUser().getLogin());
//            }
//            if (demandCategory.getDepartment() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "department.id", "=", demandCategory.getDepartment().getId());
//            }
//            if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
//            }
        }
        query += findByValidation(validationLevel, beanAbreviation);
        return query;
    }

}
