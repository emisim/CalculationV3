package controler;

import bean.HistoriqueConnexionUser;

import bean.User;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import service.HistoriqueConnexionFacade;

import java.io.Serializable;
import java.util.Date;
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

@ManagedBean(name = "historiqueConnexionUserController")
@SessionScoped
public class HistoriqueConnexionUserController implements Serializable {

    @EJB
    private service.HistoriqueConnexionFacade ejbFacade;
    @EJB
    private service.UserFacade userFacade;
    private List<User> users;
    private List<HistoriqueConnexionUser> items;
    private HistoriqueConnexionUser selected;
    private Date dateMin;
    private Date dateMax;
   
    private User user;

    
    public void findAll() {
        items = ejbFacade.findAll();
    }

   

    private int verificationDonne() {
        if (dateMax == null || dateMin == null) {
            return 3;
        }
        if (dateMax != null && dateMin != null) {
            if (dateMax.getTime() > dateMin.getTime()) {
                return 1;
            }
            return -2;
        }
        return -1;
    }

    public void rechercher() {
        if (verificationDonne() > 0) {
            items = ejbFacade.rechercher(dateMin, dateMax, selected.getConnexion(), user);
        }
    }

    public String typeCnx(Boolean connexion) {
        if (connexion == true) {
            return "Connexion";
        }
        if (connexion == false) {
            return "Deconnexion";
        }
        return null;
    }

    public HistoriqueConnexionUserController() {
//         dateMin= new Date();
//         dateMin.setHours(0);
//         dateMin.setMinutes(0);
//         dateMin.setSeconds(0);
   }

    public User getUser() {
        if (user == null) {
            user = new User();
        }
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<User> getUsers() {
        if(users == null){
            users = userFacade.findAll();
        }
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
    

  

    public HistoriqueConnexionUser getSelected() {
        if (selected == null) {
            selected = new HistoriqueConnexionUser();
        }
        return selected;
    }

    public void setSelected(HistoriqueConnexionUser selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private HistoriqueConnexionFacade getFacade() {
        return ejbFacade;
    }

    public HistoriqueConnexionUser prepareCreate() {
        selected = new HistoriqueConnexionUser();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("HistoriqueConnexionCreated"));
        if (!JsfUtil.isValidationFailed()) {
            // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("HistoriqueConnexionUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("HistoriqueConnexionDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            // Invalidate list of items to trigger re-query.
        }
    }

    public List<HistoriqueConnexionUser> getItems() {
        if (items == null) {
            rechercher();
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

    public HistoriqueConnexionUser getHistoriqueConnexion(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<HistoriqueConnexionUser> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<HistoriqueConnexionUser> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    public Date getDateMin() {
        return dateMin;
    }

    public void setDateMin(Date dateMin) {
        this.dateMin = dateMin;
    }

    public Date getDateMax() {
        return dateMax;
    }

    public void setDateMax(Date dateMax) {
        this.dateMax = dateMax;
    }

    @FacesConverter(forClass = HistoriqueConnexionUser.class)
    public static class HistoriqueConnexionControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            HistoriqueConnexionUserController controller = (HistoriqueConnexionUserController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "historiqueConnexionController");
            return controller.getHistoriqueConnexion(getKey(value));
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
            if (object instanceof HistoriqueConnexionUser) {
                HistoriqueConnexionUser o = (HistoriqueConnexionUser) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), HistoriqueConnexionUser.class.getName()});
                return null;
            }
        }

    }

}
