
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Device;
import bean.User;
import controler.util.HashageUtil;
import controler.util.SessionUtil;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class UserFacade extends AbstractFacade<User> {

    @EJB
    private DeviceFacade deviceFacade;
    @EJB
    private HistoriqueConnexionFacade historiqueConnexionFacade;
    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public int seConnnecter(User user, Device connectedDevice) {
        if (user == null || user.getLogin() == null) {
            return -5;
        } else {
            //Trouver utilisateur en fonction du login
            User loadedUser = find(user.getLogin());
            if (loadedUser == null) {
                return -4;
                //Verification du Mot de passe
            } else if (!loadedUser.getPassword().equals(HashageUtil.sha256(user.getPassword()))) {
                //Nombre de connexions
                if (loadedUser.getNbrCnx() < 3) {
                    System.out.println("loadedUser.getNbrCnx() < 3 ::: " + loadedUser.getNbrCnx());
                    loadedUser.setNbrCnx(loadedUser.getNbrCnx() + 1);
                } else if (loadedUser.getNbrCnx() >= 3) {
                    System.out.println("loadedUser.getNbrCnx() >= 3::: " + loadedUser.getNbrCnx());
                    loadedUser.setBlocked(1);
                }
                return -3;
                //Verifier si l'utilisateur est bloqué
            } else if (loadedUser.getBlocked() == 1) {
                return -2;
            } else {
                loadedUser.setNbrCnx(0);
                user = clone(loadedUser);
                user.setDepartement(loadedUser.getDepartement());
                user.setMdpChanged(loadedUser.isMdpChanged());
                user.setPassword(null);
                //Device
                int resDevice = deviceFacade.checkDevice(user, connectedDevice);
                if (resDevice > 0) {
                    if (resDevice == 1) {
                        deviceFacade.save(connectedDevice, user);
                    }
//
                    //Création historique
                    historiqueConnexionFacade.createConnexion(user);

                    SessionUtil.registerUser(user);
                    return 1;
                } else {
                    return -6;
                }

            }
        }

    }

    public User clone(User user) {
        User clone = new User();
        clone.setLogin(user.getLogin());
        clone.setBlocked(user.getBlocked());
        clone.setAdmin(user.getAdmin());
        clone.setDepartement(user.getDepartement());
        clone.setEmail(user.getEmail());
        clone.setMdpChanged(user.isMdpChanged());
        clone.setNbrCnx(user.getNbrCnx());
        clone.setNom(user.getNom());
        clone.setPassword(user.getPassword());
        clone.setPrenom(user.getPrenom());
        clone.setTel(user.getTel());
        return clone;
    }

    public void seDeConnnecter() {
        historiqueConnexionFacade.createDeConnexion();
        SessionUtil.getSession().invalidate();

    }
    
    public int checkExistance(String login) {
        List<User> users = em.createQuery("SELECT u FROM User u WHERE u.login = '" + login + "'").getResultList();
        if (users != null && users.size() > 0) {
            return 1;
        }
        return -1;
    }

    public UserFacade() {
        super(User.class);
    }

}
