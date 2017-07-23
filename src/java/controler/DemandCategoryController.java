package controler;

import bean.DemandCategory;
import bean.DemandCategoryDepartementCalculation;
import bean.DemandCategoryValidation;
import bean.Departement;
import bean.DepartementDetail;
import bean.Sortiment;
import bean.SotimentItem;
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
import service.DemandCategoryCalculationItemFacade;
import service.DemandCategoryDepartementCalculationFacade;

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
    private DemandCategoryCalculationItemFacade demandCategoryCalculationItemFacade;
    @EJB
    private AccessFacade accessFacade;

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
    private BigDecimal totalSummDepartement;
    private Integer validationSearch;
    private boolean save = false;
    private Date dateSysMin;
    private Date dateSysMax;

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

    public boolean adminAccess() {
        return SessionUtil.getConnectedUser().getAdmin() == 1;
    }

    public DemandCategoryController() {
    }

    public BigDecimal findSummByDepartement(DemandCategory demandCategory) {
        return ejbFacade.findSummByDepartement(demandCategory);
    }

    public void simuler() throws ScriptException {
        save = false;
        List<DepartementDetail> myDepartementCriterias = new ArrayList<>();
        User user = SessionUtil.getConnectedUser();
        Departement departement = SessionUtil.getConnectedUser().getDepartement();
        if (selected != null && selected.getSotimentItems()!=null && !selected.getSotimentItems().isEmpty()) {
            if (departement != null && departement.getId() != null && user.getAdmin() == 0) {
                demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.save(selected, SessionUtil.getConnectedUser().getDepartement(), true, false);
                departementCriterias = departementCriteriaFacade.detailDepartement(demandCategoryDepartementCalculations);
            }
            if (departement == null && user.getAdmin() == 1) {
                List<Departement> departements = departementFacade.findAll();
                if (departements != null && !departements.isEmpty()) {
                    for (Departement departement1 : departements) {
                        demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.save(selected, SessionUtil.getConnectedUser().getDepartement(), true, false);
                        myDepartementCriterias = departementCriteriaFacade.detailDepartement(demandCategoryDepartementCalculations);
                        params.put(departement1.getName(), myDepartementCriterias);
                    }
                }
            }
            feedLists();
            RequestContext context = RequestContext.getCurrentInstance();
            context.execute("PF('DemandCategoryDetailDialog').show();");
        } else {
            JsfUtil.addWrningMessage("Sortiment items required");
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
            JsfUtil.addWrningMessage("Please, select one demand category");
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

    public void calculAnzahlGenerierungUpdateSeitenn() {
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(selected);
    }

    public void calculAnzahlSonderSteinAndAnzahlGenerierungUpdateSeitenn() {
        DemandCategoryCalculationFacade.calculateAnzahlSonderSeiten(selected);
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(selected);

    }

    public void calculAnzahlBestandArtikelAndAnzahlGesamtProdukt() {
        demandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlGesamtProdukt(selected, sotimentItems);

    }

    public void calculAnzahlBestandArtikelAndAnzahlNeueProdukt() {
        demandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlNeueProdukt(selected, sotimentItems);

    }

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
            JsfUtil.addErrorMessage("Item deja dans la liste");
        } else if (res == -2) {
            JsfUtil.addErrorMessage("Die Summe der Werte ist nicht gleich 100!");
        } else {
            System.out.println("item ajouter avec wert = " + sortimentItem.getWert());
        }
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
        items = ejbFacade.search(selectedForSearch, sotimentItemsForCheckBox, selectedSortiemnts, validationSearch, dateSysMin, dateSysMax);
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
        save = true;
        selected = demandCategory;
        prepareValidate(demandCategory);
        prepareSortimentItems(demandCategory);
        List<DepartementDetail> myDepartementCriterias = new ArrayList<>();
        User user = SessionUtil.getConnectedUser();
        Departement departement = SessionUtil.getConnectedUser().getDepartement();
        if (departement != null && departement.getId() != null && user.getAdmin() == 0) {
            demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findWithItemsByDemandCategory(demandCategory, departement);
            departementCriterias = departementCriteriaFacade.detailDepartement(demandCategoryDepartementCalculations);
        }
        if (departement == null && user.getAdmin() == 1) {
            List<Departement> departements = departementFacade.findAll();
            if (departements != null && !departements.isEmpty()) {
                for (Departement departement1 : departements) {
                    demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findWithItemsByDemandCategory(demandCategory, departement1);
                    myDepartementCriterias = departementCriteriaFacade.detailDepartement(demandCategoryDepartementCalculations);
                    params.put(departement1.getName(), myDepartementCriterias);
                }
            }

        }
        feedLists();

    }

    private void updateDepItems(List<DepartementDetail> departementDetails) {
        ejbFacade.updateDepItems(departementDetails);
    }

    public void updateDetailDepCritarias(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, departementCriterias);
    }

    public void updateDepartementCriterias() {
        updateDepItems(departementCriterias);
    }

    public void updateDetailContentManagement(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, contentManagement);
    }

    public void updateContentManagement() {
        updateDepItems(contentManagement);
    }

    public void updateDetailDatenManagement(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, datenManagement);
    }

    public void updateDatenManagement() {
        updateDepItems(datenManagement);
    }

    public void updateDetailDatabasePublishing(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, databasePublisihing);
    }

    public void updateDatabasePublisihing() {
        updateDepItems(databasePublisihing);
    }

    public void updateDetailProjectManagement(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, projectManagement);
    }

    public Integer getValidationSearch() {
        return validationSearch;
    }

    public void setValidationSearch(Integer validationSearch) {
        this.validationSearch = validationSearch;
    }

    public void updateProjectManagement() {
        updateDepItems(projectManagement);
    }

    private void updateDetails(DepartementDetail loadedDepartementDetail, List<DepartementDetail> departementDetails) {
        if (departementDetails != null && !departementDetails.isEmpty() && loadedDepartementDetail != null) {

            if (loadedDepartementDetail.isChecked() == false) {
                System.out.println("false");
                BigDecimal price = new BigDecimal(loadedDepartementDetail.getPriceUpdate());
                BigDecimal subTotal = new BigDecimal(loadedDepartementDetail.getSummCriteria()).subtract(new BigDecimal(loadedDepartementDetail.getPriceUpdate()));
                System.out.println("Subtotal :::::: " + subTotal);
                BigDecimal total = new BigDecimal(loadedDepartementDetail.getSummDepartement()).subtract(price);
                System.out.println("Toootaaaal ::::::::::::::::::::::::::::::; " + total);
                loadedDepartementDetail.setSummCriteria(subTotal + "");
                loadedDepartementDetail.setSummDepartement(total + "");
                loadedDepartementDetail.setPriceUpdate("0");
                loadedDepartementDetail.setPriceGlobalUpdate("0");
                departementDetails.set(departementDetails.indexOf(loadedDepartementDetail), loadedDepartementDetail);
            }

            if (loadedDepartementDetail.isChecked() == true) {
                System.out.println("True");
                System.out.println("Totaaal ::::: " + loadedDepartementDetail.getSummDepartement());
                BigDecimal price = new BigDecimal(loadedDepartementDetail.getPrice());
                BigDecimal priceGlobal = new BigDecimal(loadedDepartementDetail.getPriceGlobal());
                BigDecimal subTotal = new BigDecimal(loadedDepartementDetail.getSummCriteria()).add(price);
                BigDecimal total = new BigDecimal(loadedDepartementDetail.getSummDepartement()).add(price);
                loadedDepartementDetail.setSummCriteria(subTotal + "");
                loadedDepartementDetail.setSummDepartement(total + "");
                loadedDepartementDetail.setPriceUpdate(price + "");
                loadedDepartementDetail.setPriceGlobalUpdate(priceGlobal + "");
                departementDetails.set(departementDetails.indexOf(loadedDepartementDetail), loadedDepartementDetail);
            }

            for (DepartementDetail departementDetail2 : departementDetails) {
                if (loadedDepartementDetail.getNomDepCritera().equals(departementDetail2.getNomDepCritera())) {
                    System.out.println("vrai");
                    departementDetail2.setSummCriteria(loadedDepartementDetail.getSummCriteria());
                }
                departementDetail2.setSummDepartement(loadedDepartementDetail.getSummDepartement());
            }
        }
    }

    public void feedLists() {
        if (params != null && !params.isEmpty()) {
            contentManagement = params.get("contentManagement");
            datenManagement = params.get("datenManagement");
            databasePublisihing = params.get("databasePublisihing");
            projectManagement = params.get("projectManagement");
        }

    }

    public List allDepartements() {
        return departementCriteriaFacade.allDetailDepartements();
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction == PersistAction.CREATE) {
                    if (getSotimentItems() != null && !getSotimentItems().isEmpty()) {
                        getFacade().save(getSotimentItems(), getSelected(), SessionUtil.getConnectedUser().getDepartement(), false, true);
                        JsfUtil.addSuccessMessage(successMessage);
                    } else {
                        JsfUtil.addWrningMessage("Sortiement items required");
                    }
                } else if (persistAction == PersistAction.UPDATE) {
                    sortimentItemFacade.delete(detailSotimentItems);
                    if (getSotimentItems() != null && !getSotimentItems().isEmpty()) {
                        getFacade().save(getSotimentItems(), getSelected(), SessionUtil.getConnectedUser().getDepartement(), false, false);
                        JsfUtil.addSuccessMessage(successMessage);
                    } else {
                        JsfUtil.addWrningMessage("Sortiement items required");
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

    public boolean isSave() {
        
        return save;
    }

    public void setSave(boolean save) {
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
