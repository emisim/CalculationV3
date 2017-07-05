
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Departement;
import bean.DepartementCriteria;
import bean.User;
import controler.util.SessionUtil;
import java.util.List;
import javax.ejb.EJB;
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
    @EJB
    private DepartementCriteriaFacade departementCriteriaFacade;

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

    public List<Departement> findDepartementByUser() {
        User connectedUser = SessionUtil.getConnectedUser();
        String requette = "SELECT distinct(dep) FROM Departement dep, User us WHERE 1=1";
        if(connectedUser.getAdmin() == 0){
            requette += " and dep.id = '"+connectedUser.getDepartement().getId()+"'";
        }
        
        return em.createQuery(requette).getResultList();
    }

    public void deleteDepartementWithCriteria(Departement departement) {
        String requette = "select criteria from DepartementCriteria criteria where criteria.departement.id = '"+departement.getId()+"'";
        List<DepartementCriteria> departementCriterias = em.createQuery(requette).getResultList();
        
        for (DepartementCriteria departementCriteria : departementCriterias) {
            departementCriteriaFacade.deleteCriteriaWithCriteriaItem(departementCriteria);
            
        }
        
        remove(departement);
    
    }

   
}
