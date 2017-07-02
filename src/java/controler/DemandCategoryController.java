package controler;

import bean.DemandCategory;
import bean.Sortiment;
import bean.SotimentItem;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import service.DemandCategoryFacade;

import java.io.Serializable;
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

@Named("demandCategoryController")
@SessionScoped
public class DemandCategoryController implements Serializable {

    @EJB
    private service.DemandCategoryFacade ejbFacade;
    private List<DemandCategory> items = null;
    private DemandCategory selected;
    private Sortiment sortiment;
    private List<SotimentItem> sotimentItems;

    public DemandCategoryController() {
    }

    public boolean renderAttribute(String attribute) {
        boolean isSet = ejbFacade.renderAttribute(attribute);
        return isSet;
    }

    public DemandCategory getSelected() {
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

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                if (persistAction != PersistAction.DELETE) {
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
        return sotimentItems;
    }

    public void setSotimentItems(List<SotimentItem> sotimentItems) {
        this.sotimentItems = sotimentItems;
    }

}
