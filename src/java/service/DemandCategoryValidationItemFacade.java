/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryValidation;
import bean.DemandCategoryValidationItem;
import controler.util.SessionUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
 */
@Stateless
public class DemandCategoryValidationItemFacade extends AbstractFacade<DemandCategoryValidationItem> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DemandCategoryValidationItemFacade() {
        super(DemandCategoryValidationItem.class);
    }

    public int checkUserValidation(DemandCategory demandCategory) {
        List<DemandCategoryValidationItem> demandCategoryValidationItems = em.createQuery("SELECT v FROM DemandCategoryValidationItem v WHERE v.demandCategoryValidation.demandCategory.id=" + demandCategory.getId() + " and v.user.login = '" + SessionUtil.getConnectedUser().getLogin() + "'").getResultList();
        if (demandCategoryValidationItems != null && demandCategoryValidationItems.size() > 0) {
            return 1;
        }
        return -1;
    }
    
    public DemandCategoryValidationItem getValidationItemByDemandAndUser(DemandCategory demandCategory) {
        List<DemandCategoryValidationItem> demandCategoryValidationItems = em.createQuery("SELECT v FROM DemandCategoryValidationItem v WHERE v.demandCategoryValidation.demandCategory.id=" + demandCategory.getId() + " and v.user.login = '" + SessionUtil.getConnectedUser().getLogin() + "'").getResultList();
        if (demandCategoryValidationItems != null && demandCategoryValidationItems.size() > 0) {
            return demandCategoryValidationItems.get(0);
        }
        return null;
    }

    public List<DemandCategoryValidationItem> findByValidation(DemandCategoryValidation demandCategoryValidation) {
        String requette = "select item from DemandCategoryValidationItem item where item.demandCategoryValidation.id ="+demandCategoryValidation.getId();
        return em.createQuery(requette).getResultList();
    
    }

   
    
   

}
