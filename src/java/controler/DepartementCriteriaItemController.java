package controler;

import bean.DepartementCriteriaItem;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import service.DepartementCriteriaItemFacade;

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

@Named("departementCriteriaItemController")
@SessionScoped
public class DepartementCriteriaItemController implements Serializable {

    @EJB
    private service.DepartementCriteriaItemFacade ejbFacade;
    private List<DepartementCriteriaItem> items = null;
    private DepartementCriteriaItem selected;

    public DepartementCriteriaItemController() {
    }

    public DepartementCriteriaItem getSelected() {
        return selected;
    }

    public void setSelected(DepartementCriteriaItem selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private DepartementCriteriaItemFacade getFacade() {
        return ejbFacade;
    }

    public DepartementCriteriaItem prepareCreate() {
        selected = new DepartementCriteriaItem();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("DepartementCriteriaItemCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("DepartementCriteriaItemUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("DepartementCriteriaItemDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<DepartementCriteriaItem> getItems() {
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

    public DepartementCriteriaItem getDepartementCriteriaItem(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<DepartementCriteriaItem> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<DepartementCriteriaItem> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = DepartementCriteriaItem.class)
    public static class DepartementCriteriaItemControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            DepartementCriteriaItemController controller = (DepartementCriteriaItemController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "departementCriteriaItemController");
            return controller.getDepartementCriteriaItem(getKey(value));
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
            if (object instanceof DepartementCriteriaItem) {
                DepartementCriteriaItem o = (DepartementCriteriaItem) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), DepartementCriteriaItem.class.getName()});
                return null;
            }
        }

    }

}
