
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
import bean.Nachsatz;
import bean.Sortiment;
import bean.SotimentItem;
import bean.User;
import controler.util.JsfUtil;
import controler.util.SearchUtil;
import controler.util.SessionUtil;
import java.math.BigDecimal;
import java.math.RoundingMode;
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
    private BaukastenPricingFacade baukastenPricingFacade;

        @EJB
    private AusgabePricingFacade ausgabePricingFacade;
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public boolean sortimentCondition(DemandCategory demandCategory, List<SotimentItem> sotimentItems) {
        return demandCategory != null && sotimentItems != null && !sotimentItems.isEmpty() && DemandCategoryCalculationFacade.summSortiment(demandCategory, sotimentItems, false, 0).compareTo(new BigDecimal(100)) == 0;
    }

    public BigDecimal calcSumPerAuflagRequieredSum(DemandCategory demandCategory) {
        if (demandCategory.getAuflage() != null && demandCategory.getAuflage().getPrice() != null && demandCategory.getAuflage().getPrice().compareTo(new BigDecimal(0)) != 0) {
            return demandCategory.getSummeGlobal().add(demandCategory.getSummDruck()).divide(demandCategory.getAuflage().getPrice(), 2, RoundingMode.HALF_UP);
        }
        return new BigDecimal(0);
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
        System.out.println("demandCategory.getKatalogart().getValuee() ==> " + demandCategory.getKatalogart().getValuee());
        System.out.println("demandCategory.getAusgabe().getValuee() ==> " + demandCategory.getAusgabe().getValuee());
        System.out.println("demandCategory.getWechselfassungVariantFaktor().getValue() ==> " + demandCategory.getWechselfassungVariantFaktor().getValue());

        performPreCalculationDemandCategory(demandCategory, sotimentItems);
        saveOrUpdate(simulation, isSave, demandCategory);
        sotimentItemFacade.save(sotimentItems, demandCategory, simulation, isSave);
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.save(demandCategory, departement, simulation, isSave);
        performPostCalculationDemandCategory(demandCategory, demandCategoryDepartementCalculations, sotimentItems);
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

        edit(demandCategory);
        demandCategoryValidationFacade.checkExistanceOrCreate(demandCategory);

    }

    public void performPostCalculationDemandCategory(DemandCategory demandCategory, List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations, List<SotimentItem> sotimentItems) {
        calcSumTotal(demandCategory, demandCategoryDepartementCalculations);
        calcSumDruck(demandCategory);
        DemandCategoryCalculationFacade.summSortimentFactor(demandCategory, sotimentItems);
        calcSumPerAuflagRequieredSum(demandCategory);
    }

    public void performPreCalculationDemandCategory(DemandCategory demandCategory, List<SotimentItem> sotimentItems) {

        DemandCategoryCalculationFacade.calculateAnzahlSonderSeiten(demandCategory);
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(demandCategory);
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(demandCategory);
        demandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlGesamtProdukt(demandCategory, sotimentItems);
        demandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlNeueProdukt(demandCategory, sotimentItems);
        DemandCategoryCalculationFacade.calculateAnzahlBestandProdukt(demandCategory);
        DemandCategoryCalculationFacade.summSortimentFactor(demandCategory, sotimentItems);
        teilnehmerZahlPricingFacade.calcPriceByTeilnehmerZahlValue(demandCategory);
        
        ausgabePricingFacade.findByAusgabe(demandCategory);
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

    //Druck Kalkulation
//    private int calcSumDruck(DemandCategory demandCategory) {
//        demandCategory.setSummDruck(new BigDecimal(0));
//        AuflageSeitenCoverMatrix auflageSeitenCoverMatrix = auflageSeitenCoverMatrixFacade.findByCriteria(demandCategory.getAuflage(), demandCategory.getDruckSeiten(), demandCategory.getFormatAuswaehlen(), demandCategory.getFarbigkeit(), demandCategory.getBaukasten());
//        BigDecimal nachsatzPricing = new BigDecimal(0);
//        BigDecimal nachspannPricing = new BigDecimal(0);
//        BigDecimal vorspannPricing = new BigDecimal(0);
//        BigDecimal umschlagFarbigkeitElementPricing = new BigDecimal(0);
//        BigDecimal baukastenPricing = new BigDecimal(0);
//        if (demandCategory == null || demandCategory.getCover() == null || SearchUtil.isStringNullOrVide(demandCategory.getCover().getDescription())) {
//            return -1;
//        }
//
//        boolean hardCover = demandCategory.getCover().getDescription().toLowerCase().contains("hard");
//        
//        if (!hardCover && (auflageSeitenCoverMatrix == null || auflageSeitenCoverMatrix.getPrice() == null)) {
//            return -2;
//        } else {
//            baukastenPricing = baukastenPricingFacade.findByCoverAndBaukasten(demandCategory.getCover(), demandCategory.getBaukasten());
//            if (demandCategory.getNachspann() != null) {
//                nachspannPricing = demandCategory.getNachspann().getValue();
//            }
//            if (demandCategory.getNachsatz() != null) {
//                nachsatzPricing = demandCategory.getNachsatz().getPrice();
//            }
//            if (demandCategory.getVorspann() != null) {
//                vorspannPricing = demandCategory.getVorspann().getValue();
//            }
//            if (demandCategory.getUmschlagFarbigkeitElement() != null) {
//                umschlagFarbigkeitElementPricing = demandCategory.getUmschlagFarbigkeitElement().getPrice();
//            }
//            demandCategory.setNachsatzPricing(nachsatzPricing);
//            demandCategory.setNachspannPricing(nachspannPricing);
//            demandCategory.setVorspannPricing(vorspannPricing);
//            demandCategory.setBaukastenPricing(baukastenPricing);
//
//            demandCategory.setUmschlagFarbigkeitElementPricing(umschlagFarbigkeitElementPricing);
//            BigDecimal summDruck = demandCategory.getCover().getPrice().add(nachsatzPricing).add(nachspannPricing).add(vorspannPricing).add(umschlagFarbigkeitElementPricing).add(baukastenPricing);
//            System.out.println("summDruck before hard test ==> " + summDruck);
//            if (hardCover) {
//                System.out.println("hahna daba f hardcover derniere!!!!!!!!!!");
//                System.out.println("demandCategory.getRegister().getPrice()" + demandCategory.getRegister().getPrice());
//                System.out.println("auflageSeitenCoverMatrix.getPrice()" + auflageSeitenCoverMatrix.getPrice());
//                System.out.println("demandCategory.getAuflage().getPrice()" + demandCategory.getAuflage().getPrice());
//                
//                summDruck = (summDruck.add(auflageSeitenCoverMatrix.getPrice()).add(demandCategory.getRegister().getPrice())).multiply(demandCategory.getAuflage().getPrice());
//            } else {
//                summDruck = summDruck.multiply(demandCategory.getAuflage().getPrice());
//            }
//            System.out.println("summDruck after hard test ==> " + summDruck);
//            summDruck = summDruck.setScale(2, RoundingMode.HALF_UP);
//            demandCategory.setSummDruck(summDruck);
//            return 1;
//        }
//
//    }
    private int calcSumDruck(DemandCategory demandCategory) {
        demandCategory.setSummDruck(new BigDecimal(0));
        AuflageSeitenCoverMatrix auflageSeitenCoverMatrix = auflageSeitenCoverMatrixFacade.findByCriteria(demandCategory.getAuflage(), demandCategory.getDruckSeiten(), demandCategory.getFormatAuswaehlen(), demandCategory.getFarbigkeit(), demandCategory.getBaukasten());
        System.out.println("AuflageSeitenCoverMatrix Cover:" + auflageSeitenCoverMatrix.getCover());
        System.out.println("AuflageSeitenCoverMatrix Auflage:" + auflageSeitenCoverMatrix.getAuflage());
        System.out.println("AuflageSeitenCoverMatrix Druckseiten:" + auflageSeitenCoverMatrix.getSeiten());
        System.out.println("AuflageSeitenCoverMatrix Price:" + auflageSeitenCoverMatrix.getPrice());
        BigDecimal nachsatzPricing = new BigDecimal(0);
        BigDecimal nachspannPricing = new BigDecimal(0);
        BigDecimal vorspannPricing = new BigDecimal(0);
        BigDecimal umschlagFarbigkeitElementPricing = new BigDecimal(0);
        BigDecimal baukastenPricing = new BigDecimal(0);
        if (demandCategory == null || demandCategory.getCover() == null || SearchUtil.isStringNullOrVide(demandCategory.getCover().getDescription())) {
            return -1;
        }
        boolean hardCover = demandCategory.getCover().getDescription().toLowerCase().contains("hard");
        if (!hardCover && (auflageSeitenCoverMatrix == null || auflageSeitenCoverMatrix.getPrice() == null)) {
            return -2;
        } else {
            baukastenPricing = baukastenPricingFacade.findByCoverAndBaukasten(demandCategory.getCover(), demandCategory.getBaukasten());
            if (demandCategory.getNachspann() != null) {
                nachspannPricing = demandCategory.getNachspann().getValue();
            }
            if (demandCategory.getNachsatz() != null) {
                nachsatzPricing = demandCategory.getNachsatz().getPrice();
            }
            if (demandCategory.getVorspann() != null) {
                vorspannPricing = demandCategory.getVorspann().getValue();
            }
            if (demandCategory.getUmschlagFarbigkeitElement() != null) {
                umschlagFarbigkeitElementPricing = demandCategory.getUmschlagFarbigkeitElement().getPrice();
            }
            demandCategory.setNachsatzPricing(nachsatzPricing);
            demandCategory.setNachspannPricing(nachspannPricing);
            demandCategory.setVorspannPricing(vorspannPricing);
            demandCategory.setBaukastenPricing(baukastenPricing);

            demandCategory.setUmschlagFarbigkeitElementPricing(umschlagFarbigkeitElementPricing);
            BigDecimal summDruck = demandCategory.getCover().getPrice().add(nachsatzPricing).add(nachspannPricing).add(vorspannPricing).add(umschlagFarbigkeitElementPricing).add(baukastenPricing);
            System.out.println("summDruck before hard test ==> " + summDruck);
            if (hardCover) {
                summDruck = (summDruck.add(auflageSeitenCoverMatrix.getPrice()).add(demandCategory.getRegister().getPrice())).multiply(demandCategory.getAuflage().getPrice());
            } else {
                summDruck = summDruck.multiply(demandCategory.getAuflage().getPrice());
            }
            System.out.println("summDruck after hard test ==> " + summDruck);
            summDruck = summDruck.setScale(2, RoundingMode.HALF_UP);
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
            demandCategory.setCover(null);
            demandCategory.setBindung(null);
            demandCategory.setAuflage(null);
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
            JsfUtil.addErrorMessage("Sorry, No Items found!");
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
        } else {

            System.out.println("SessionUtil.getConnectedUser().getDepartement()" + SessionUtil.getConnectedUser().getDepartement());
            System.out.println("SessionUtil.getConnectedUser().getDepartement().getId()" + SessionUtil.getConnectedUser().getDepartement().getId());

            DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = demandCategoryDepartementCalculationFacade.getUniqueResult("SELECT item FROM DemandCategoryDepartementCalculation item WHERE  item.demandCategory.id="
                    + demandCategory.getId() + " AND item.departement.id=" + SessionUtil.getConnectedUser().getDepartement().getId());
            if (demandCategoryDepartementCalculation == null) {
                System.out.println(" hna return NULL");
                return new BigDecimal(0);
            } else {
                return demandCategoryDepartementCalculation.getSummeGlobal();
            }
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
                    //   System.out.println("save save");
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
//            if (demandCategory.getDepartment() != null) {
//                query += SearchUtil.addConstraint(beanAbreviation, "department.id", "=", demandCategory.getDepartment().getId());
//            }
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
