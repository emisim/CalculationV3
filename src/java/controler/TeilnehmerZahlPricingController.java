package controler;

import bean.TeilnehmerZahlPricing;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import service.TeilnehmerZahlPricingFacade;

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

@Named("teilnehmerZahlPricingController")
@SessionScoped
public class TeilnehmerZahlPricingController implements Serializable {

    @EJB
    private service.TeilnehmerZahlPricingFacade ejbFacade;
    private List<TeilnehmerZahlPricing> items = null;
    private TeilnehmerZahlPricing selected;

    public TeilnehmerZahlPricingController() {
    }

    public TeilnehmerZahlPricing getSelected() {
        return selected;
    }

    public void setSelected(TeilnehmerZahlPricing selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private TeilnehmerZahlPricingFacade getFacade() {
        return ejbFacade;
    }

    public TeilnehmerZahlPricing prepareCreate() {
        selected = new TeilnehmerZahlPricing();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("TeilnehmerZahlPricingCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("TeilnehmerZahlPricingUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("TeilnehmerZahlPricingDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<TeilnehmerZahlPricing> getItems() {
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

    public TeilnehmerZahlPricing getTeilnehmerZahlPricing(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<TeilnehmerZahlPricing> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<TeilnehmerZahlPricing> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = TeilnehmerZahlPricing.class)
    public static class TeilnehmerZahlPricingControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            TeilnehmerZahlPricingController controller = (TeilnehmerZahlPricingController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "teilnehmerZahlPricingController");
            return controller.getTeilnehmerZahlPricing(getKey(value));
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
            if (object instanceof TeilnehmerZahlPricing) {
                TeilnehmerZahlPricing o = (TeilnehmerZahlPricing) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), TeilnehmerZahlPricing.class.getName()});
                return null;
            }
        }

    }

}
