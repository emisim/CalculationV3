package controler;

import bean.UmschlagFarbigkeitElement;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;


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
import service.UmschlagFarbigkeitElementFacade;

@Named("umschlagFarbigkeitElementController")
@SessionScoped
public class UmschlagFarbigkeitElementController implements Serializable {

    @EJB
    private service.UmschlagFarbigkeitElementFacade ejbFacade;
    private List<UmschlagFarbigkeitElement> items = null;
    private UmschlagFarbigkeitElement selected;

    public UmschlagFarbigkeitElementController() {
    }

    public UmschlagFarbigkeitElement getSelected() {
        return selected;
    }

    public void setSelected(UmschlagFarbigkeitElement selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private UmschlagFarbigkeitElementFacade getFacade() {
        return ejbFacade;
    }

    public UmschlagFarbigkeitElement prepareCreate() {
        selected = new UmschlagFarbigkeitElement();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("UmschlagFarbigkeitElementCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("UmschlagFarbigkeitElementUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("UmschlagFarbigkeitElementDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<UmschlagFarbigkeitElement> getItems() {
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

    public UmschlagFarbigkeitElement getUmschlagFarbigkeitElement(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<UmschlagFarbigkeitElement> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<UmschlagFarbigkeitElement> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = UmschlagFarbigkeitElement.class)
    public static class UmschlagFarbigkeitElementControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            UmschlagFarbigkeitElementController controller = (UmschlagFarbigkeitElementController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "umschlagFarbigkeitElementController");
            return controller.getUmschlagFarbigkeitElement(getKey(value));
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
            if (object instanceof UmschlagFarbigkeitElement) {
                UmschlagFarbigkeitElement o = (UmschlagFarbigkeitElement) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), UmschlagFarbigkeitElement.class.getName()});
                return null;
            }
        }

    }

}
