/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.HistoriqueConnexionUser;
import bean.User;
import controler.util.DateUtil;
import controler.util.SearchUtil;
import controler.util.SessionUtil;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author 
 */
@Stateless
public class HistoriqueConnexionFacade extends AbstractFacade<HistoriqueConnexionUser> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

   

   
    private void createTemplate(User user, boolean connexion) {
        System.out.println("ha user :: "+user.getLogin());
        HistoriqueConnexionUser historiqueConnexion = new HistoriqueConnexionUser(user, new Date(), connexion);
        edit(historiqueConnexion);
    }

    public void createConnexion(User user) {
        createTemplate(user, true);
    }

    public List<HistoriqueConnexionUser> rechercher(Date dateMin, Date dateMax, Boolean type, User user) {
        String requette = "SELECT h FROM HistoriqueConnexionUser h where  1=1 ";
        requette+=SearchUtil.addConstraintMinMaxDateTimestamp("h", "dateAction", dateMin, dateMax);
        requette+=SearchUtil.addConstraint("h", "connexion","=", type);
        if (user != null ) {
        requette+=SearchUtil.addConstraint("h", "user.login","=", user.getLogin());
        }
        System.out.println(requette);
        return em.createQuery(requette).getResultList();

    }

    public void createDeConnexion() {
        System.out.println("le user de la session ==> " + SessionUtil.getConnectedUser());
        createTemplate(SessionUtil.getConnectedUser(), false);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HistoriqueConnexionFacade() {
        super(HistoriqueConnexionUser.class);
    }

}
