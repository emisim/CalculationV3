package controler;

import bean.Backup;
import controler.util.Downloader;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import java.io.IOException;
import service.BackupFacade;

import java.io.Serializable;
import java.util.List;
import java.util.ResourceBundle;
import javax.ejb.Schedule;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.ejb.Schedule;
import javax.ejb.Stateless;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

@ManagedBean(name = "backupController")
@SessionScoped
@Stateless
public class BackupController implements Serializable {

    @EJB
    private BackupFacade ejbFacade;
    private List<Backup> items = null;
    private Backup selected;
    private static String fileBackUpOrigine = "C:\\backup\\Dropbox\\";
    private static String path2 = "C:\\backup\\";

    //@Schedule(second = "0", minute = "00", hour = "18", dayOfWeek = "*", persistent = false)
    public void recapDb() throws IOException, InterruptedException {
        System.out.println("hahwa dkhel l 1");
        ejbFacade.addBackup(fileBackUpOrigine);
    }
    
    public void prepareDownload(Backup backup){
        Downloader.setFileName(backup.getNom());
        Downloader.setFilePath(fileBackUpOrigine);
    }

    public List<Backup> backups() {
        return ejbFacade.findAll();
    }

    public String donloadBackup(String nom) {
        return fileBackUpOrigine + nom;
    }

    public BackupController() {
    }

    public Backup getSelected() {
        return selected;
    }

    public void setSelected(Backup selected) {
        this.selected = selected;
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private BackupFacade getFacade() {
        return ejbFacade;
    }

    public Backup prepareCreate() {
        selected = new Backup();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("BackupCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("BackupUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("BackupDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<Backup> getItems() {
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

    public Backup getBackup(java.lang.Long id) {
        return getFacade().find(id);
    }

    public List<Backup> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<Backup> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = Backup.class)
    public static class BackupControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            BackupController controller = (BackupController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "backupController");
            return controller.getBackup(getKey(value));
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
            if (object instanceof Backup) {
                Backup o = (Backup) object;
                return getStringKey(o.getId());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), Backup.class.getName()});
                return null;
            }
        }

    }

}
