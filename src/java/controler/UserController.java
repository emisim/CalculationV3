package controler;

import bean.Question;
import bean.User;
import controler.util.AccessDepartement;
import controler.util.DeviceUtil;
import controler.util.HashageUtil;
import controler.util.JsfUtil;
import controler.util.JsfUtil.PersistAction;
import controler.util.Message;
import controler.util.MessageManager;
import controler.util.SessionUtil;
import java.io.IOException;
import service.UserFacade;

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
import service.DeviceFacade;
import service.QuestionFacade;

@Named("userController")
@SessionScoped
public class UserController implements Serializable {

    @EJB
    private service.UserFacade ejbFacade;
    private List<User> items = null;
    private User selected;
    private List<User> userProfils;
    private User connectedUser;
    private Message message;
    private String oldPassword;
    private String newPassword;
    private String newRepetePassword;
    private String pwdForUpdate;

    private List<Question> verificationQuestions;
    private Question selectedQuestion;
    private List<Question> questions;

    @EJB
    private QuestionFacade questionFacade;
    @EJB
    private DeviceFacade deviceFacade;

    public UserController() {
    }

    public boolean checkUser() {
        if (SessionUtil.getConnectedUser().getAdmin() == 1) {
            return true;
        } else {
            return false;
        }
    }

    public String seConnnecter() throws IOException {
        int res = ejbFacade.seConnnecter(selected, DeviceUtil.getDevice());
        AccessDepartement.populateMaps();
        System.out.println("resss " + res);
        if (res > 0) {
            if (SessionUtil.getConnectedUser().isMdpChanged()) {
                System.out.println("meenu");
                return "/menu/menu?faces-redirect=true";
            } else {
                return "/user/ChangePassword?faces-redirect=true";
            }
        } else if (res == -6) {
            System.out.println("hnaaaa verification");
            return "/verification?faces-redirect=true";
        }
        validteConnexionForm(res);
        return null;
    }

    /**
     * this method at the first step verifies the users list of device to see if
     * he is connected from a trusted device if that is the case it will grrant
     * him to continue and log-in if not it will ask him to answer a sequence of
     * security questions, in cas he answered all the questions crrectly the new
     * device will be registred to the list of trusted devices, if the question
     * is false the user will be blocked until getting autorized by the admin.
     *
     * @return a redirect to the appropriate page depending on the state of the
     * user, the type of the device and other factors
     */
    public String verifierReponses() {
        User loaded = ejbFacade.find(getSelected().getLogin());
        if (questionFacade.checkAnswers(loaded, verificationQuestions)) {
            deviceFacade.save(DeviceUtil.getDevice(), loaded);
//            SessionUtil.attachUserToCommune(loaded);
//            historiqueConnexionFacade.createConnexion(loaded);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("NewDeviceRegistered"));
            return "/menu/menu?faces-redirect=true";

        } else {
            loaded.setBlocked(1);
            ejbFacade.edit(loaded);
            JsfUtil.addSuccessMessage(ResourceBundle.getBundle("/Bundle").getString("DeviceCouldNotBeVerified"));
            return "/index?faces-redirect=true";
        }
    }

    private void validteConnexionForm(int res) {
        message = MessageManager.createErrorMessage(res, "");
        if (res == -1) {
            message.setText("Socie ist zur Zeit blokiert, bitte kontaktieren Sie Ihren Admin");
        } else if (res == -2) {
            message.setText("Ihre Account ist zur Zeit blokiert, bitte melden Sie sich bei Ihren Admin an");
        } else if (res == -3) {
            message.setText("Oups,falsches Passwort. Wiederholen Sie es noch einmal!");
        } else if (res == -4) {
            message.setText("Falsches login, Versuchen Sie es noch einmal!");
        } else if (res == -5) {
            message.setText("Bitte geben Sie hier Ihre login an!");
        }
        MessageManager.showMessage(message);
    }

    public void isNotConnected() throws IOException {
        if (SessionUtil.getConnectedUser() == null) {
            SessionUtil.redirect("../index.xhtml");
        }
    }

    public String changePassword() {
        User user = ejbFacade.find(selected.getLogin());
        System.out.println("alter hash : " + HashageUtil.sha256(user.getPassword()));
        System.out.println("neuer hash : " + HashageUtil.sha256(newPassword));
        System.out.println("altes PW : " + user.getPassword());
        System.out.println("neuen PW: " + newPassword);
        if (newPassword.equals(newRepetePassword) && !newPassword.equals("") && newPassword != null && !HashageUtil.sha256(newPassword).equals(user.getPassword())) {

            user.setPassword(HashageUtil.sha256(newPassword));
            user.setMdpChanged(true);
            ejbFacade.edit(user);
            return seDeConnnecter();
        } else {
            JsfUtil.addErrorMessage("Probleme während die Passwortänderung");
            return "";
        }

    }

    public int getTimout() {
        return SessionUtil.getSession().getMaxInactiveInterval();
    }

    /*public int getTimout() {
        return SessionUtil.getSession().getMaxInactiveInterval();
    }*/
    public String seDeConnnecter() {
        //
        ejbFacade.seDeConnnecter();
        return "/index?faces-redirect=true";

    }

    /**
     * this method ads the created question to the list of questions
     */
    public void addQuestion() {
        questions = getQuestions();
        questions.add(questionFacade.clone(selectedQuestion));
        prepareQuestionCreate();
    }

    /**
     * this method is used to initialise the fields of the form
     *
     * @return
     */
    public Question prepareQuestionCreate() {
        selectedQuestion = null;
        selectedQuestion = getSelectedQuestion();
        return selectedQuestion;
    }

    /**
     * this deletes an element from the list of questions
     *
     * @param question
     */
    public void deleteQuestion(Question question) {
        questions.remove(question);
    }

    /**
     * this method nullifies the questions list so we get an empty list when we
     * persist a list of questions or when we cancel the action of the creation.
     */
    public void prepareQuestionList() {
        System.out.println("we are deleting the previous questions");
        questions = null;
    }

    public boolean isQuestionNumberRight() {
        questions = getQuestions();
        return questions.size() > 2;
    }

    public User getConnectedUser() {
        if (connectedUser == null) {
            connectedUser = SessionUtil.getConnectedUser();
        }
        return connectedUser;
    }

    public void setConnectedUser(User connectedUser) {
        this.connectedUser = connectedUser;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getNewRepetePassword() {
        return newRepetePassword;
    }

    public List<User> getUserProfils() {
        userProfils = new ArrayList();
        userProfils.add(SessionUtil.getConnectedUser());
        return userProfils;
    }

    public void setUserProfils(List<User> userProfils) {
        this.userProfils = userProfils;
    }

    public void setNewRepetePassword(String newRepetePassword) {
        this.newRepetePassword = newRepetePassword;
    }

    public User getSelected() {
        if (selected == null) {
            selected = new User();
        }
        return selected;
    }

    public void setSelected(User selected) {
        this.selected = selected;
    }

    public String getPwdForUpdate() {
        return pwdForUpdate;
    }

    public void setPwdForUpdate(String pwdForUpdate) {
        this.pwdForUpdate = pwdForUpdate;
    }

    public List<Question> getVerificationQuestions() {
        if (verificationQuestions == null) {
            prepareVerificationQuestions();
        }
        return verificationQuestions;
    }

    public void setVerificationQuestions(List<Question> verificationQuestions) {
        this.verificationQuestions = verificationQuestions;
    }

    public Question getSelectedQuestion() {
        if (selectedQuestion == null) {
            selectedQuestion = new Question();
            selectedQuestion.setUser(selected);
        }
        return selectedQuestion;
    }

    public void setSelectedQuestion(Question selectedQuestion) {
        this.selectedQuestion = selectedQuestion;
    }

    public List<Question> getQuestions() {
        if (questions == null) {
            questions = new ArrayList();
        }
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    /**
     * this method help us prepare the list of questions to ask the user it gets
     * them from the datbase and then empties the response so we can ask the
     * user for its own answers.
     */
    public void prepareVerificationQuestions() {
        User loaded = ejbFacade.find(getSelected().getLogin());
        verificationQuestions = questionFacade.getQuestions(loaded);
        for (int i = 0; i < verificationQuestions.size(); i++) {
            verificationQuestions.get(i).setReponse("");
        }
    }

    protected void setEmbeddableKeys() {
    }

    protected void initializeEmbeddableKey() {
    }

    private UserFacade getFacade() {
        return ejbFacade;
    }

    public User prepareCreate() {
        selected = new User();
        initializeEmbeddableKey();
        return selected;
    }

    public void create() {
        persist(PersistAction.CREATE, ResourceBundle.getBundle("/Bundle").getString("UserCreated"));
        if (!JsfUtil.isValidationFailed()) {
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public void update() {
        persist(PersistAction.UPDATE, ResourceBundle.getBundle("/Bundle").getString("UserUpdated"));
    }

    public void destroy() {
        persist(PersistAction.DELETE, ResourceBundle.getBundle("/Bundle").getString("UserDeleted"));
        if (!JsfUtil.isValidationFailed()) {
            selected = null; // Remove selection
            items = null;    // Invalidate list of items to trigger re-query.
        }
    }

    public List<User> getItems() {
        if (items == null) {
            items = getFacade().findAll();
        }
        return items;
    }

    private void persist(PersistAction persistAction, String successMessage) {
        if (selected != null) {
            setEmbeddableKeys();
            try {
                
                if (persistAction == PersistAction.CREATE) {
                    selected.setPassword(HashageUtil.sha256(selected.getPassword()));
                    if (getFacade().checkExistance(selected.getLogin()) < 0) {
                        getFacade().create(selected);
                        questionFacade.saveAll(questions);
                        prepareQuestionList();
                        JsfUtil.addSuccessMessage(successMessage);
                    } else {
                        JsfUtil.addErrorMessage("Login existe déjà");
                    }
                } else if (persistAction == PersistAction.UPDATE) {
                    System.out.println("hhaani f creat dial user" + selected.getLogin());
                    getFacade().edit(selected);
                    System.out.println("hhaani f creat dial user");
                    JsfUtil.addSuccessMessage(successMessage);
                } else if (persistAction == PersistAction.DELETE) {
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

    public User getUser(java.lang.String id) {
        return getFacade().find(id);
    }

    public List<User> getItemsAvailableSelectMany() {
        return getFacade().findAll();
    }

    public List<User> getItemsAvailableSelectOne() {
        return getFacade().findAll();
    }

    @FacesConverter(forClass = User.class)
    public static class UserControllerConverter implements Converter {

        @Override
        public Object getAsObject(FacesContext facesContext, UIComponent component, String value) {
            if (value == null || value.length() == 0) {
                return null;
            }
            UserController controller = (UserController) facesContext.getApplication().getELResolver().
                    getValue(facesContext.getELContext(), null, "userController");
            return controller.getUser(getKey(value));
        }

        java.lang.String getKey(String value) {
            java.lang.String key;
            key = value;
            return key;
        }

        String getStringKey(java.lang.String value) {
            StringBuilder sb = new StringBuilder();
            sb.append(value);
            return sb.toString();
        }

        @Override
        public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
            if (object == null) {
                return null;
            }
            if (object instanceof User) {
                User o = (User) object;
                return getStringKey(o.getLogin());
            } else {
                Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, "object {0} is of type {1}; expected type: {2}", new Object[]{object, object.getClass().getName(), User.class.getName()});
                return null;
            }
        }

    }

}
