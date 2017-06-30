package controler;

import bean.ArtDerWeiterverarbeitung;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import service.ArtDerWeiterverarbeitungFacade;

import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;


@ManagedBean(name="artDerWeiterverarbeitungController")
@SessionScoped
public class ArtDerWeiterverarbeitungController implements Serializable {


    @EJB private service.ArtDerWeiterverarbeitungFacade ejbFacade;
    private List<ArtDerWeiterverarbeitung> items = null;
    private ArtDerWeiterverarbeitung selected;

    public ArtDerWeiterverarbeitungController() {
    }

    public ArtDerWeiterverarbeitung getSelected() {
        return selected;
    }

    public void setSelected(ArtDerWeiterverarbeitung selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private ArtDerWeiterverarbeitungFacade getFacade() {
        return ejbFacade;
    }

    public ArtDerWeiterverarbeitung prepareCreate() {
        selected = new ArtDerWeiterverarbeitung();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("ArtDerWeiterverarbeitungCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("ArtDerWeiterverarbeitungUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("ArtDerWeiterverarbeitungDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<ArtDerWeiterverarbeitung> getItems() {
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


    public List<ArtDerWeiterverarbeitung> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<ArtDerWeiterverarbeitung> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass=ArtDerWeiterverarbeitung.class)
    public static class ArtDerWeiterverarbeitungControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            ArtDerWeiterverarbeitungController controller = (ArtDerWeiterverarbeitungController)facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "artDerWeiterverarbeitungController");
            return controller.getFacade().find(getKey(value));
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
            if (object instanceof ArtDerWeiterverarbeitung) {
                ArtDerWeiterverarbeitung o = (ArtDerWeiterverarbeitung) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), ArtDerWeiterverarbeitung.class.getName()});
                return null;
            }
        }

    }

}
