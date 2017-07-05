package controler;

import bean.DemandCategory;
import bean.DemandCategoryValidationItem;
import bean.Departement;
import bean.DepartementDetail;
import bean.Sortiment;
import bean.SotimentItem;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import controler.util.SessionUtil;
import service.DemandCategoryFacade;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
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

@Named("demandCategoryController")
@SessionScoped
public class DemandCategoryController implements Serializable {

    @EJB
    private service.DemandCategoryFacade ejbFacade;
    @EJB
    private service.DepartementCriteriaFacade departementCriteriaFacade;
    @EJB
    private service.DemandCategoryValidationItemFacade demandCategoryValidationItemFacade;
    @EJB
    private service.DemandCategoryValidationFacade demandCategoryValidationFacade;
    @EJB
    private service.SortimentFacade sortimentFacade;
    @EJB
    private service.SotimentItemFacade sortimentItemFacade;
    private List<DemandCategory> items = null;
    private DemandCategory selected;
    private DemandCategory selectedForSearch;
    private Sortiment sortiment;
    private SotimentItem sortimentItem;
    private List<SotimentItem> sotimentItems;
    private List<DemandCategoryValidationItem> demandCategoryValidationItems;
    private int index;
    private int cmp = 0;

    public DemandCategoryController() {
    }

    public void removeSortimentItem(SotimentItem sItem) {
        System.out.println("hahowa element a supprimer : " + sItem.getWert());
        index = sItem.getId().intValue();

        sotimentItems.remove(sItem);
    }
    
    public void prepareValidateItems(DemandCategory demandCategory){
        demandCategoryValidationItems = demandCategoryValidationItemFacade.findByValidation(demandCategory.getDemandCategoryValidation());
    }
    
    public void calculAnzahlBestandArtikel(){
        DemandCategoryCalculationFacade.calculateAnzahlBestandArtikel(selected);
    }
    
    public void calculAnzahlGenerierungUpdateSeitenn(){
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(selected);
    }
    
    public void calculAnzahlSonderSteinAndAnzahlGenerierungUpdateSeitenn(){
        DemandCategoryCalculationFacade.calculateAnzahlSonderSeiten(selected);
        DemandCategoryCalculationFacade.calculateAnzahlGenerierungUpdateSeitenn(selected);
        
    }
    
    public void calculAnzahlBestandProdukt(){
        DemandCategoryCalculationFacade.calculateAnzahlBestandProdukt(selected);
    }

    public boolean renderAttribute(String attribute) {
        boolean isSet = ejbFacade.renderAttribute(attribute);
        return isSet;
    }
    
    public boolean renderAttributeForList(String attribute) {
        System.out.println("Attribute :::::::: " + attribute);
        boolean isSet = ejbFacade.renderAttributeForList(attribute);
        System.out.println("Is Set :::::::::::;;; " + isSet);
        return isSet;
    }

    public List<Sortiment> findAllSortiment() {
        return sortimentFacade.findAll();
    }

    public void checkDruck() {
        System.out.println("hahowa druck : " + selected.isDruck());
    }

    public void addSortimentItem() {

        System.out.println("hahowa wert : " + sortimentItem.getWert());

        sotimentItems.add(sortimentItemFacade.clone(sortimentItem, sotimentItems));
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
        items = ejbFacade.search(selectedForSearch);
    }

    public int checkDemandValidation(DemandCategory demandCategory) {
        return demandCategoryValidationItemFacade.checkUserValidation(demandCategory);
    }

    public void validate(DemandCategory demandCategory) {
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
            items = getFacade().findAll();
        }
        return items;
    }

    public List<DepartementDetail> departementeDetails() throws ScriptException {
        List<DepartementDetail> departementCriterias = new ArrayList<>();
        Departement departement = SessionUtil.getConnectedUser().getDepartement();
        if (departement != null && departement.getId() != null) {
            System.out.println("Selected caat ::::::: "+selected);
            departementCriterias = departementCriteriaFacade.detailDepartement(selected,departement);
        }
        return departementCriterias;
    }

    public List allDepartements() {
        return departementCriteriaFacade.allDetailDepartements();
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction == PersistAction.CREATE) {
                    getFacade().save(selected, SessionUtil.getConnectedUser().getDepartement(), false);
                } else if (persistAction == PersistAction.UPDATE) {
                    getFacade().edit(selected);
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

    public List<DemandCategoryValidationItem> getDemandCategoryValidationItems() {
        if(demandCategoryValidationItems == null){
            demandCategoryValidationItems = new ArrayList<>();
        }
        return demandCategoryValidationItems;
    }

    public void setDemandCategoryValidationItems(List<DemandCategoryValidationItem> demandCategoryValidationItems) {
        this.demandCategoryValidationItems = demandCategoryValidationItems;
    }
    
    
}
