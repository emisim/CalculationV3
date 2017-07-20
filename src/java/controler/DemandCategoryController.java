package controler;

import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import bean.DemandCategoryCalculationItem;
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
import javax.enterprise.context.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;
import service.DemandCategoryCalculationFacade;
import javax.script.ScriptException;
import service.DemandCategoryCalculationItemFacade;
import service.DemandCategoryDepartementCalculationFacade;

@Named("demandCategoryController")
@SessionScoped
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
   
    
    private List<DemandCategory> items = null;
    private DemandCategory selected;
    private DemandCategory selectedForSearch;
    private Sortiment sortiment;
    private SotimentItem sortimentItem;
    private List<SotimentItem> sotimentItems;
    private List<Sortiment> selectedSortiemnts;
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

    

    @PostConstruct
    public void prepareSearchForm(){
         User connectedUser = SessionUtil.getConnectedUser();
        if(connectedUser.getAdmin() == 0){
            getSelectedForSearch().setDepartment(connectedUser.getDepartement());
            getSelectedForSearch().setUser(connectedUser);
            
        }
    }
    public boolean adminAccess(){
         return SessionUtil.getConnectedUser().getAdmin()==1;
    }
    public DemandCategoryController() {
    }

    public BigDecimal findSummByDepartement(DemandCategory demandCategory) {
        return ejbFacade.findSummByDepartement(demandCategory);
    }
    public void simuler() throws ScriptException {
        demandCategoryDepartementCalculationFacade.findWithItemsByDemandCategory(selected, SessionUtil.getConnectedUser().getDepartement());
    }
    
    public void findSortimentItem(){
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
    
    public void prepareValidateItems(DemandCategory demandCategory) {
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
        selected.setSotimentItems(sotimentItems);
        DemandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlGesamtProdukt(selected);
    }
    
    public void calculAnzahlBestandArtikelAndAnzahlNeueProdukt() {
        selected.setSotimentItems(sotimentItems);
        DemandCategoryCalculationFacade.calculAnzahlBestandArtikelAndAnzahlNeueProdukt(selected);
    }
    
    public void calculAnzahlBestandProdukt() {
        DemandCategoryCalculationFacade.calculateAnzahlBestandProdukt(selected);
    }

//    public void calculAnzahlNeuProdukt() {
//        selected.setSotimentItems(sotimentItems);
//        DemandCategoryCalculationFacade.calculAnzahlNeuProdukt(selected);
//    }
    public boolean renderAttribute(String attribute) {
        boolean isSet = ejbFacade.renderAttribute(attribute);
        return isSet;
    }
    
    public boolean renderAttributeForList(String attribute) {
        boolean isSet = ejbFacade.renderAttributeForList(attribute);
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
        }else{
            System.out.println("item ajouter avec wert = "+sortimentItem.getWert());
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
        items = ejbFacade.search(selectedForSearch, sotimentItemsForCheckBox, selectedSortiemnts);
    }
    
    public int checkDemandValidation(DemandCategory demandCategory) {
        return demandCategoryValidationFacade.findByConnectedUserAndDemandCategory(demandCategory)==null?0:1;
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
        if (departementDetails != null && !departementDetails.isEmpty()) {
            for (DepartementDetail departementCriteria : departementDetails) {
                DemandCategoryCalculation demandCategoryCalculation = demandCategoryCalculationFacade.find(departementCriteria.getDemandCategoryCalcuationId());
                demandCategoryCalculation.setSumme(new BigDecimal(departementCriteria.getSummCriteria()));
                demandCategoryCalculationFacade.edit(demandCategoryCalculation);
                DemandCategoryCalculationItem demandCategoryCalculationItem = demandCategoryCalculationItemFacade.find(departementCriteria.getDemandCategoryCalculationItemId());
                demandCategoryCalculationItem.setPrice(new BigDecimal(departementCriteria.getPrice()));
                demandCategoryCalculationItemFacade.edit(demandCategoryCalculationItem);
                departementCriteria.getDemandCategoryDepartementCalculationId();
                DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = demandCategoryDepartementCalculationFacade.find(departementCriteria.getDemandCategoryDepartementCalculationId());
                
            }
            JsfUtil.addSuccessMessage("Details updated");
        }
    }
    
    public void updateDetailDepCritarias(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, departementCriterias);
    }
    
    public void updateDepartementCriterias(){
        updateDepItems(departementCriterias);
    }
        
    public void updateDetailContentManagement(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, contentManagement);
    }
    public void updateContentManagement(){
        updateDepItems(contentManagement);
    }
    
    public void updateDetailDatenManagement(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, datenManagement);
    }
    public void updateDatenManagement(){
        updateDepItems(datenManagement);
    }
    
    public void updateDetailDatabasePublishing(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, databasePublisihing);
    }
    public void updateDatabasePublisihing(){
        updateDepItems(databasePublisihing);
    }
    
    public void updateDetailProjectManagement(DepartementDetail departementDetail) throws ScriptException {
        updateDetails(departementDetail, projectManagement);
    }
     public void updateProjectManagement(){
        updateDepItems(projectManagement);
    }
    
    private void updateDetails(DepartementDetail loadedDepartementDetail, List<DepartementDetail> departementDetails) {
        if (departementDetails != null && !departementDetails.isEmpty() && loadedDepartementDetail != null) {
            for (DepartementDetail departementDetail1 : departementDetails) {
                if (departementDetail1.isChecked() == false) {
                    System.out.println("false");
                    if (departementDetail1.getNomDepCritera().equals(loadedDepartementDetail.getNomDepCritera())) {
                        BigDecimal subTotal = new BigDecimal(loadedDepartementDetail.getSummCriteria()).subtract(new BigDecimal(loadedDepartementDetail.getPrice()));
                        BigDecimal total = new BigDecimal(loadedDepartementDetail.getSummDepartement()).subtract(subTotal);
                        loadedDepartementDetail.setSummCriteria(subTotal + "");
                        loadedDepartementDetail.setSummDepartement(total+"");
                        loadedDepartementDetail.setPrice("0");
                        loadedDepartementDetail.setPriceGlobal("0");
                        departementDetails.set(departementDetails.indexOf(loadedDepartementDetail), loadedDepartementDetail);
                    }
                    
                    for (DepartementDetail departementDetail2 : departementDetails) {
                        if (loadedDepartementDetail.getNomDepCritera().equals(departementDetail2.getNomDepCritera())) {
                            departementDetail2.setSummCriteria(loadedDepartementDetail.getSummCriteria());
                            departementDetail2.setSummDepartement(loadedDepartementDetail.getSummDepartement());
                        }
                    }
                }
            }
            
        }
    }
    
    public void feedLists() {
        contentManagement = params.get("contentManagement");
        datenManagement = params.get("datenManagement");
        databasePublisihing = params.get("databasePublisihing");
        projectManagement = params.get("projectManagement");
        
    }
    
    public List allDepartements() {
        return departementCriteriaFacade.allDetailDepartements();
    }
    
    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction == PersistAction.CREATE) {
                    getFacade().save(sotimentItems, selected, SessionUtil.getConnectedUser().getDepartement(), false, true);
                } else if (persistAction == PersistAction.UPDATE) {
                    sortimentItemFacade.delete(detailSotimentItems);
                    getFacade().save(sotimentItems, selected, SessionUtil.getConnectedUser().getDepartement(), false, false);
                } else {
                    getFacade().remove(selected);
                }
                JsfUtil.addSuccessMessage(successMessage);
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
    
    public List<DemandCategoryValidation> getDemandCategoryValidations() {
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

    public List<Sortiment> getSelectedSortiemnts() {
        if(selectedSortiemnts == null){
            selectedSortiemnts = new ArrayList<>();
        }
        return selectedSortiemnts;
    }

    public void setSelectedSortiemnts(List<Sortiment> selectedSortiemnts) {
        this.selectedSortiemnts = selectedSortiemnts;
    }

    public List<Sortiment> getSortiments() {
        if(sortiments == null){
            sortiments = sortimentFacade.findAll();
        }
        return sortiments;
    }

    public void setSortiments(List<Sortiment> sortiments) {
        this.sortiments = sortiments;
    }

}
