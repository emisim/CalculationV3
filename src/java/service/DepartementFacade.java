
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Departement;
import bean.User;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author lcharaf
 */
@Stateless
public class DepartementFacade extends AbstractFacade<Departement> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public Departement findByUser(User user) {
        if (user != null && user.getLogin() != null) {
            String requette = "SELECT dep FROM Departement dep, User us WHERE us.departement.id=dep.id and us.login='" + user.getLogin() + "'";
            System.out.println("findByUser ==> " + requette);
             List<Departement> departements= em.createQuery(requette).getResultList();
             if(departements!=null && !departements.isEmpty() && departements.get(0)!=null){
                 return departements.get(0);
             }
        }
        return new Departement();
    }

    public DepartementFacade() {
        super(Departement.class);
    }

   
}
