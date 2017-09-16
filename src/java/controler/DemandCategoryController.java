package controler;

import bean.DemandCategory;
import bean.DemandCategoryDepartementCalculation;
import bean.DemandCategoryValidation;
import bean.Departement;
import bean.DepartementDetail;
import bean.Nachsatz;
import bean.Sortiment;
import bean.SotimentItem;
import bean.UmschlagFarbigkeitElement;
import bean.User;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import controler.util.SessionUtil;
import service.DemandCategoryFacade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.inject.Named;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import javax.faces.view.ViewScoped;
import service.DemandCategoryCalculationFacade;
import javax.script.ScriptException;
import org.primefaces.context.RequestContext;
import service.AccessFacade;
import service.DemandCategoryDepartementCalculationFacade;
import service.NachsatzFacade;
import service.UmschlagFarbigkeitElementFacade;

@Named("demandCategoryController")
@ViewScoped
public class DemandCategoryController implements Serializable {

    @EJB
    private service.DemandCategoryFacade ejbFacade;
    @EJB
    private service.DepartementCriteriaFacade departementCriteriaFacade;
    @EJB
    private service.DemandCategoryValidationFacade demandCategoryValidationFacade;
    @EJB
    private service.SortimentFacade sortimentFacade;
    @EJB
    private service.SotimentItemFacade sortimentItemFacade;
    @EJB
    private service.DepartementFacade departementFacade;
    @EJB
    private DemandCategoryDepartementCalculationFacade demandCategoryDepartementCalculationFacade;
    @EJB
    private DemandCategoryCalculationFacade demandCategoryCalculationFacade;
    @EJB
    private NachsatzFacade nachsatzFacade;
    @EJB
    private AccessFacade accessFacade;
    @EJB
    private DemandCategoryFacade demandCategoryFacade;
    @EJB
    private UmschlagFarbigkeitElementFacade umschlagFarbigkeitElementFacade;

    private List<DemandCategory> items = null;
    private DemandCategory selected;
    private DemandCategory selectedForSearch;
    private Sortiment sortiment;
    private SotimentItem sortimentItem;
    private List<SotimentItem> sotimentItems;
    private List<String> selectedSortiemnts;
    private List<Sortiment> sortiments;
    private List<SotimentItem> detailSotimentItems;
    private List<SotimentItem> sotimentItemsMixEdit;
    private List<SotimentItem> sotimentItemsForSearch;
    private List<String> sotimentItemsForCheckBox;
    private List<DemandCategoryValidation> demandCategoryValidations;
    private int index;
    private int cmp = 0;
    private List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations;
    private List<DepartementDetail> departementCriterias;
    private Map<String, List<DepartementDetail>> params;
    private List<DepartementDetail> contentManagement;
    private List<DepartementDetail> datenManagement;
    private List<DepartementDetail> databasePublisihing;
    private List<DepartementDetail> projectManagement;
    private List<DepartementDetail> assetManagement;
    private List<DepartementDetail> mediaIT;
    private BigDecimal totalSummDepartement;
    private Integer validationSearch;
    private String save;
    private Date dateSysMin;
    private Date dateSysMax;
    private List<String> departements = new ArrayList();
    private List<UmschlagFarbigkeitElement> umschlagFarbigkeitElements = new ArrayList();
    private List<Nachsatz> nachsatzs = new ArrayList();

    public void findByUmschlagFarbigkeitAndCover() {
        umschlagFarbigkeitElements = umschlagFarbigkeitElementFacade.findByUmschlagFarbigkeitAndCover(getSelected().getUmschlagFarbigkeit(), getSelected().getCover());
    }

    public void findByCover() {
        nachsatzs = nachsatzFacade.findByCover(getSelected().getCover());
    }

    public BigDecimal calcSumPerAuflag(DemandCategory demandCategory) {
        return ejbFacade.calcSumPerAuflagRequieredSum(demandCategory);
    }

    @PostConstruct
    public void prepareSearchForm() {
        User connectedUser = SessionUtil.getConnectedUser();
        if (connectedUser.getAdmin() == 0) {
            getSelectedForSearch().setDepartment(connectedUser.getDepartement());
            getSelectedForSearch().setUser(connectedUser);

        }
    }

    public void initAction() {
        selected.setSotimentItems(null);
        selected = null;
        sotimentItems = null;
    }

    public boolean adminOrInTheSameDepartement(String departementName) {
        boolean res= !accessFacade.isAdminOrInTheSameDepartement(SessionUtil.getConnectedUser(), departementName);
        System.out.println("haa res ==> "+res);
        return res;
    }

    public boolean adminAccess() {
        return SessionUtil.getConnectedUser().getAdmin() == 1;
    }

    public DemandCategoryController() {
    }

    public BigDecimal findSummByDepartement(DemandCategory demandCategory) {
        return ejbFacade.findSummByDepartement(demandCategory);
    }

    public void simuler() throws ScriptException {
        save = "simuler";
        List<DepartementDetail> myDepartementCriterias = new ArrayList<>();
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculationsAll = new ArrayList();

        if (ejbFacade.sortimentCondition(selected, selected.getSotimentItems())) {
            ejbFacade.performPreCalculationDemandCategory(selected, sotimentItems);
            List<Departement> departements = departementFacade.findAll();
            if (departements != null && !departements.isEmpty()) {
                for (Departement departement1 : departements) {
                    demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.save(selected, departement1, true, false);
                    demandCategoryDepartementCalculationsAll.addAll(demandCategoryDepartementCalculations);
                    myDepartementCriterias = departementCriteriaFacade.detailDepartement(demandCategoryDepartementCalculations);
                    params.put(departement1.getName(), myDepartementCriterias);
                }
            }
            ejbFacade.performPostCalculationDemandCategory(selected, demandCategoryDepartementCalculationsAll, sotimentItems);

            System.out.println("Departements details :::: " + params);
            RequestContext context = RequestContext.getCurrentInstance();
            context.execute("PF('DemandCategoryDetailDialog').show();");
        } else {
            JsfUtil.addWrningMessage("Assortment items required");
        }
    }

    public void findSortimentItem() {
        detailSotimentItems = sortimentItemFacade.findByDemandeCategory(selected);
        sotimentItemsMixEdit = sortimentItemFacade.findByDemandeCategory(selected);
    }

    public boolean checkUser() {
        if (SessionUtil.getConnectedUser().getAdmin() == 1) {
            return true;
        } else {
            return false;
        }
    }

    public void removeSortimentItem(SotimentItem sItem) {
        System.out.println("hahowa element a supprimer : " + sItem.getWert());
        index = sItem.getId().intValue();
        sotimentItems.remove(sItem);
    }

    public int checkSelection() {
        if (selected == null) {
            JsfUtil.addWrningMessage("Please, select a Calculation!");
            return 0;
        }
        return 1;
    }

    public void prepareValidate(DemandCategory demandCategory) {
        demandCategoryValidations = demandCategoryValidationFacade.findByDemandCategory(demandCategory);
    }

    public void prepareSortimentItems(DemandCategory demandCategory) {
        detailSotimentItems = sortimentItemFacade.findByDemandeCategory(demandCategory);
    }

    public void calculAnzahlBestandArtikel() {
        DemandCategoryCalculationFacade.calculateAnzahlBestandArtikel(selected);
    }

//1
    public void calculAnzahlSonderSteinAndAnzahlGenerierungUpdateSeitenn() {
        DemandCategoryCalculationFacade.calculateAnzahlSonderSeiten(selected);
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(selected);

    }
//2

    public void calculAnzahlGenerierungUpdateSeitenn() {
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(selected);
    }

//3
    public void calculAnzahlBestandArtikelAndAnzahlGesamtProdukt() {
        demandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlGesamtProdukt(selected, sotimentItems);

    }
//4

    public void calculAnzahlBestandArtikelAndAnzahlNeueProdukt() {
        demandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlNeueProdukt(selected, sotimentItems);

    }
//5

    public void calculAnzahlBestandProdukt() {
        DemandCategoryCalculationFacade.calculateAnzahlBestandProdukt(selected);
    }

    public boolean renderAttribute(String attribute) {
        boolean isSet = accessFacade.renderAttribute(attribute);
        return isSet;
    }

    public boolean renderAttributeForList(String attribute) {
        boolean isSet = accessFacade.renderAttributeForList(attribute);
        return isSet;
    }

    public void findSortiementItemsBySortiement() {
        System.out.println("selected sortiement ::::: " + sortiment);
        sotimentItemsForSearch = sortimentItemFacade.findBySortiement(sortiment);
        System.out.println("list " + sotimentItemsForSearch);
    }

    public List<Sortiment> findAllSortiment() {
        return sortimentFacade.findAll();
    }

    public void checkDruck() {
        System.out.println("hahowa druck : " + selected.isDruck());
    }

    public void addSortimentItem() {

        int res = demandCategoryCalculationFacade.addSortimentItem(selected, sotimentItems, sortimentItem);
        if (res == -1) {
            JsfUtil.addErrorMessage("This assortment already exist!");
        } else if (res == -2) {
            JsfUtil.addErrorMessage("Sum of assortment musst be 100%!");
        } else {
            System.out.println("item hinzugefügt mit dem Wert = " + sortimentItem.getWert());
        }
    }

    public List<Nachsatz> getNachsatzs() {
        return nachsatzs;
    }

    public void setNachsatzs(List<Nachsatz> nachsatzs) {
        this.nachsatzs = nachsatzs;
    }

    public List<UmschlagFarbigkeitElement> getUmschlagFarbigkeitElements() {
        return umschlagFarbigkeitElements;
    }

    public void setUmschlagFarbigkeitElements(List<UmschlagFarbigkeitElement> umschlagFarbigkeitElement) {
        this.umschlagFarbigkeitElements = umschlagFarbigkeitElement;
    }

    public DemandCategory getSelectedForSearch() {
        if (selectedForSearch == null) {
            selectedForSearch = new DemandCategory();
        }
        return selectedForSearch;
    }

    public void setSelectedForSearch(DemandCategory selectedForSearch) {
        this.selectedForSearch = selectedForSearch;
    }

    public DemandCategory getSelected() {
        if (selected == null) {
            selected = new DemandCategory();
        }
        return selected;
    }

    public void setSelected(DemandCategory selected) {
        this.selected = selected;
    }

    public List<String> getDepartements() {
        System.out.println("departements ---> " + departements);
        if (departements == null) {
            departements = new ArrayList<>();
        }
        return departements;
    }

    public void setDepartements(List<String> departements) {
        this.departements = departements;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private DemandCategoryFacade getFacade() {
        return ejbFacade;
    }

    public DemandCategory prepareCreate() {
        selected = new DemandCategory();
        initializeEmbeddableKey();
        return selected;
    }

    public void search() {
        items = ejbFacade.search(selectedForSearch, departements, sotimentItemsForCheckBox, selectedSortiemnts, validationSearch, dateSysMin, dateSysMax);
    }

    public int checkDemandValidation(DemandCategory demandCategory) {
        return demandCategoryValidationFacade.findByConnectedUserAndDemandCategory(demandCategory) == null ? 0 : 1;
    }

    public void validate(DemandCategory demandCategory) {
        System.out.println("validate methode in controller");
        demandCategoryValidationFacade.checkExistanceOrCreate(demandCategory);
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("DemandCategoryCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("DemandCategoryUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("DemandCategoryDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<DemandCategory> getItems() {
        if (items == null) {
            items = getFacade().findByDepartement();
        }
        return items;
    }

    public void departementeDetails(DemandCategory demandCategory) throws ScriptException {
        save = "details";
        selected = demandCategory;
        prepareValidate(demandCategory);
        prepareSortimentItems(demandCategory);
        List<DepartementDetail> myDepartementCriterias = new ArrayList<>();
        User user = SessionUtil.getConnectedUser();
        Departement departement = SessionUtil.getConnectedUser().getDepartement();
//        if (departement != null && departement.getId() != null && user.getAdmin() == 0) {
//            demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findWithItemsByDemandCategory(demandCategory, departement);
//            departementCriterias = departementCriteriaFacade.detailDepartement(demandCategoryDepartementCalculations);
//        }
//        if (departement == null && user.getAdmin() == 1) {
        List<Departement> departements = departementFacade.findAll();
        if (departements != null && !departements.isEmpty()) {
            for (Departement departement1 : departements) {
                demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findWithItemsByDemandCategory(demandCategory, departement1);
                myDepartementCriterias = departementCriteriaFacade.detailDepartement(demandCategoryDepartementCalculations);
                params.put(departement1.getName(), myDepartementCriterias);
            }
        }

        // }
        System.out.println("params ::::: " + params);
    }

    public void updateDepItems(String flag) {
        try {
            if (flag.equals("save")) {
                demandCategoryFacade.saveForSimulation(sotimentItems, selected, false, true);
            }
            for (Map.Entry<String, List<DepartementDetail>> entry : params.entrySet()) {
                List<DepartementDetail> value = entry.getValue();
                ejbFacade.updateDepItems(value, sotimentItems, flag);
            }
            System.out.println("ha sum de selected " + selected.getSummeGlobal());
            ejbFacade.edit(selected);
            JsfUtil.addSuccessMessage("Details updated");
        } catch (Exception e) {
            JsfUtil.addErrorMessage("something went wrong!");
        }

    }

    public void updateDetailDepCritarias(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, departementCriterias);
    }

    public Integer getValidationSearch() {
        return validationSearch;
    }

    public void setValidationSearch(Integer validationSearch) {
        this.validationSearch = validationSearch;
    }

    public void updateDetails(DepartementDetail loadedDepartementDetail, List<DepartementDetail> departementDetails) {
        if (departementDetails != null && !departementDetails.isEmpty() && loadedDepartementDetail != null) {

            if (loadedDepartementDetail.isChecked() == false) {
                System.out.println("false");
                BigDecimal price = new BigDecimal(loadedDepartementDetail.getPriceUpdate());
                BigDecimal priceGlobal = new BigDecimal(loadedDepartementDetail.getPriceGlobalUpdate());
                BigDecimal subTotal = new BigDecimal(loadedDepartementDetail.getSummCriteria()).subtract(new BigDecimal(loadedDepartementDetail.getPriceUpdate()));
                BigDecimal subTotalGlobal = new BigDecimal(loadedDepartementDetail.getSummCriteriaGlobal()).subtract(new BigDecimal(loadedDepartementDetail.getPriceGlobalUpdate()));
                System.out.println("Subtotal :::::: " + subTotal);
                BigDecimal total = new BigDecimal(loadedDepartementDetail.getSummDepartement()).subtract(price);
                BigDecimal totalGlobal = new BigDecimal(loadedDepartementDetail.getSummDepartementGlobal()).subtract(priceGlobal);
                selected.setSummUnitPrice(selected.getSummUnitPrice().subtract(new BigDecimal(loadedDepartementDetail.getPriceUpdate())));
                selected.setSummeGlobal(selected.getSummeGlobal().subtract(new BigDecimal(loadedDepartementDetail.getPriceGlobalUpdate())));
                loadedDepartementDetail.setSummCriteria(subTotal + "");
                loadedDepartementDetail.setSummDepartement(total + "");
                loadedDepartementDetail.setSummCriteriaGlobal(subTotalGlobal + "");
                loadedDepartementDetail.setSummDepartementGlobal(totalGlobal + "");
                loadedDepartementDetail.setPriceUpdate("0.00");
                loadedDepartementDetail.setPriceGlobalUpdate("0.00");
                departementDetails.set(departementDetails.indexOf(loadedDepartementDetail), loadedDepartementDetail);
            }

            if (loadedDepartementDetail.isChecked() == true) {
                System.out.println("True");
                System.out.println("Totaaal ::::: " + loadedDepartementDetail.getSummDepartement());
                BigDecimal price = new BigDecimal(loadedDepartementDetail.getPrice());
                BigDecimal priceGlobal = new BigDecimal(loadedDepartementDetail.getPriceGlobal());
                BigDecimal subTotal = new BigDecimal(loadedDepartementDetail.getSummCriteria()).add(price);
                BigDecimal subTotalGlobal = new BigDecimal(loadedDepartementDetail.getSummCriteriaGlobal()).add(priceGlobal);
                BigDecimal total = new BigDecimal(loadedDepartementDetail.getSummDepartement()).add(price);
                BigDecimal totalGlobal = new BigDecimal(loadedDepartementDetail.getSummDepartementGlobal()).add(priceGlobal);
                selected.setSummUnitPrice(selected.getSummUnitPrice().subtract(new BigDecimal(loadedDepartementDetail.getPriceUpdate())));
                selected.setSummeGlobal(selected.getSummeGlobal().subtract(new BigDecimal(loadedDepartementDetail.getPriceGlobalUpdate())));
                loadedDepartementDetail.setSummCriteria(subTotal + "");
                loadedDepartementDetail.setSummDepartement(total + "");
                loadedDepartementDetail.setSummCriteriaGlobal(subTotalGlobal + "");
                loadedDepartementDetail.setSummDepartementGlobal(totalGlobal + "");
                loadedDepartementDetail.setPriceUpdate(price + "");
                loadedDepartementDetail.setPriceGlobalUpdate(priceGlobal + "");
                departementDetails.set(departementDetails.indexOf(loadedDepartementDetail), loadedDepartementDetail);
            }
            for (DepartementDetail departementDetail2 : departementDetails) {
                if (loadedDepartementDetail.getNomDepCritera().equals(departementDetail2.getNomDepCritera())) {
                    System.out.println("vrai");
                    departementDetail2.setSummCriteria(loadedDepartementDetail.getSummCriteria());
                    departementDetail2.setSummCriteriaGlobal(loadedDepartementDetail.getSummCriteriaGlobal());
                }
                departementDetail2.setSummDepartement(loadedDepartementDetail.getSummDepartement());
                departementDetail2.setSummDepartementGlobal(loadedDepartementDetail.getSummDepartementGlobal());
            }
        }
    }

    public List allDepartements() {
        return departementCriteriaFacade.allDetailDepartements();
    }

    public void verifySortiement() {
        if (!ejbFacade.sortimentCondition(selected, sotimentItems)) {
            JsfUtil.addWrningMessage("Assortment value should be 100%!");
        }
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction == PersistAction.CREATE) {
                    if (ejbFacade.sortimentCondition(selected, getSotimentItems())) {
                        getFacade().save(getSotimentItems(), getSelected(), SessionUtil.getConnectedUser().getDepartement(), false, true);
                        JsfUtil.addSuccessMessage(successMessage + " and is saved automatically from " + SessionUtil.getConnectedUser().getLogin());
                    } else {
                        JsfUtil.addWrningMessage("Assortment value should be 100%!");
                    }
                } else if (persistAction == PersistAction.UPDATE) {
                    sortimentItemFacade.delete(detailSotimentItems);
                    if (getSotimentItems() != null && !getSotimentItems().isEmpty() && DemandCategoryCalculationFacade.summSortiment(selected, sotimentItems, false, 0).compareTo(new BigDecimal(100)) == 0) {
                        getFacade().save(getSotimentItems(), getSelected(), SessionUtil.getConnectedUser().getDepartement(), false, false);
                        JsfUtil.addSuccessMessage(successMessage);
                    } else {
                        JsfUtil.addWrningMessage("Assortment value should be 100%!");
                    }
                } else {
                    getFacade().remove(selected);
                    JsfUtil.addSuccessMessage(successMessage);
                }

            } catch (EJBException ex) {
                String msg = "";
                Throwable cause = ex.getCause();
                if (cause != null) {
                    msg = cause.getLocalizedMessage();
                }
                if (msg.length() > 0) {
                    JsfUtil.addErrorMessage(msg);
                } else {
                    JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
                }
            } catch (Exception ex) {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
                JsfUtil.addErrorMessage(ex, ResourceBundle.getBundle("/Bundle").getString("PersistenceErrorOccured"));
            }
        }
    }

    public DemandCategory getDemandCategory(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<DemandCategory> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<DemandCategory> getItemsAvailableSelectOne() {
        return getFacade().findAll();

    }

    @FacesConverter(forClass = DemandCategory.class)
    public static class DemandCategoryControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            DemandCategoryController controller = (DemandCategoryController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "demandCategoryController");
            return controller.getDemandCategory(getKey(value));
        }

        java.lang.Long getKey(String value) {
            java.lang.Long key;
            key = Long.valueOf(value);
            return key;
        }

        String getStringKey(java.lang.Long value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof DemandCategory) {
                DemandCategory o = (DemandCategory) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), DemandCategory.class.getName()});
                return null;
            }
        }

    }

    public Sortiment getSortiment() {
        return sortiment;
    }

    public void setSortiment(Sortiment sortiment) {
        this.sortiment = sortiment;
    }

    public List<SotimentItem> getSotimentItems() {
        if (sotimentItems == null) {
            sotimentItems = new ArrayList<>();
        }
        return sotimentItems;
    }

    public void setSotimentItems(List<SotimentItem> sotimentItems) {
        this.sotimentItems = sotimentItems;
    }

    public SotimentItem getSortimentItem() {
        if (sortimentItem == null) {
            sortimentItem = new SotimentItem();
        }
        return sortimentItem;
    }

    public void setSortimentItem(SotimentItem sortimentItem) {
        this.sortimentItem = sortimentItem;
    }

    public List<DemandCategoryValidation> getDemandCategoryValidationItems() {
        if (demandCategoryValidations == null) {
            demandCategoryValidations = new ArrayList<>();
        }
        return demandCategoryValidations;
    }

    public void setDemandCategoryValidationItems(List<DemandCategoryValidation> demandCategoryValidations) {
        this.demandCategoryValidations = demandCategoryValidations;
    }

    public List<SotimentItem> getDetailSotimentItems() {
        if (detailSotimentItems == null) {
            detailSotimentItems = new ArrayList<>();
        }
        return detailSotimentItems;
    }

    public void setDetailSotimentItems(List<SotimentItem> detailSotimentItems) {
        this.detailSotimentItems = detailSotimentItems;
    }

    public List<SotimentItem> getSotimentItemsForSearch() {
        return sotimentItemsForSearch;
    }

    public void setSotimentItemsForSearch(List<SotimentItem> sotimentItemsForSearch) {
        this.sotimentItemsForSearch = sotimentItemsForSearch;
    }

    public List<String> getSotimentItemsForCheckBox() {
        return sotimentItemsForCheckBox;
    }

    public void setSotimentItemsForCheckBox(List<String> sotimentItemsForCheckBox) {
        this.sotimentItemsForCheckBox = sotimentItemsForCheckBox;
    }

    public List<DepartementDetail> getContentManagement() throws ScriptException {
        if (params == null) {
            params = new HashMap<>();
        }
        return contentManagement;
    }

    public void setContentManagement(List<DepartementDetail> contentManagement) {
        this.contentManagement = contentManagement;
    }

    public Map<String, List<DepartementDetail>> getParams() {
        if (params == null) {
            params = new HashMap<>();
        }
        return params;
    }

    public void setParams(Map<String, List<DepartementDetail>> params) {

        this.params = params;
    }

    public List<DepartementDetail> getDatenManagement() {
        return datenManagement;
    }

    public void setDatenManagement(List<DepartementDetail> datenManagement) {
        this.datenManagement = datenManagement;
    }

    public List<DepartementDetail> getDatabasePublisihing() {
        return databasePublisihing;
    }

    public void setDatabasePublisihing(List<DepartementDetail> databasePublisihing) {
        this.databasePublisihing = databasePublisihing;
    }

    public List<DepartementDetail> getProjectManagement() {
        return projectManagement;
    }

    public void setProjectManagement(List<DepartementDetail> projectManagement) {
        this.projectManagement = projectManagement;
    }

    public List<DepartementDetail> getAssetManagement() {
        return assetManagement;
    }

    public void setAssetManagement(List<DepartementDetail> assetManagement) {
        this.assetManagement = assetManagement;
    }

    public List<DepartementDetail> getMediaIT() {
        return mediaIT;
    }

    public void setMediaIT(List<DepartementDetail> mediaIT) {
        this.mediaIT = mediaIT;
    }

    public List<DepartementDetail> getDepartementCriterias() {
        return departementCriterias;
    }

    public void setDepartementCriterias(List<DepartementDetail> departementCriterias) {
        this.departementCriterias = departementCriterias;
    }

    public BigDecimal getTotalSummDepartement() {
        return totalSummDepartement;
    }

    public void setTotalSummDepartement(BigDecimal totalSummDepartement) {
        this.totalSummDepartement = totalSummDepartement;
    }

    public List<SotimentItem> getSotimentItemsMixEdit() {
        return sotimentItemsMixEdit;
    }

    public void setSotimentItemsMixEdit(List<SotimentItem> sotimentItemsMixEdit) {
        this.sotimentItemsMixEdit = sotimentItemsMixEdit;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public int getCmp() {
        return cmp;
    }

    public void setCmp(int cmp) {
        this.cmp = cmp;
    }

    public List<Sortiment> getSortiments() {
        if (sortiments == null) {
            sortiments = sortimentFacade.findAll();
        }
        return sortiments;
    }

    public void setSortiments(List<Sortiment> sortiments) {
        this.sortiments = sortiments;
    }

    public String getSave() {
        return save;
    }

    public void setSave(String save) {
        this.save = save;
    }

    public Date getDateSysMin() {
        return dateSysMin;
    }

    public void setDateSysMin(Date dateSysMin) {
        this.dateSysMin = dateSysMin;
    }

    public Date getDateSysMax() {
        return dateSysMax;
    }

    public void setDateSysMax(Date dateSysMax) {
        this.dateSysMax = dateSysMax;
    }

    public List<String> getSelectedSortiemnts() {
        return selectedSortiemnts;
    }

    public void setSelectedSortiemnts(List<String> selectedSortiemnts) {
        this.selectedSortiemnts = selectedSortiemnts;
    }

}
