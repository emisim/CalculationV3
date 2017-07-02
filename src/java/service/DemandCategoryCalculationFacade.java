/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import controler.util.SearchUtil;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
 */
@Stateless
public class DemandCategoryCalculationFacade extends AbstractFacade<DemandCategoryCalculation> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB DemandCategoryCalculationItemFacade demandCategoryCalculationItemFacade;
    


    public List<DemandCategoryCalculation> findDemandCalculationWithItemsByDemandCategory(DemandCategory demandCategory) {
        List<DemandCategoryCalculation> demandCategoryCalculations = findByDemandCategory(demandCategory);
        for (DemandCategoryCalculation demandCategoryCalculation : demandCategoryCalculations) {
            demandCategoryCalculation.setDemandCategoryCalculationItems(demandCategoryCalculationItemFacade.findByDemandCategoryCalculation(demandCategoryCalculation));
        }
        return demandCategoryCalculations;
    }
    
    
    private List<DemandCategoryCalculation> findByDemandCategory(DemandCategory demandCategory) {
        String query = "SELECT item FROM DemandCategoryCalculation item WHERE 1=1";
        if (demandCategory != null && demandCategory.getId() != null) {
            query += SearchUtil.addConstraint("item", "demandCategory.id", "=", demandCategory.getId());
        }
        return em.createQuery(query).getResultList();
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DemandCategoryCalculationFacade() {
        super(DemandCategoryCalculation.class);
    }
    
//    public void save(DemandCategory demandCategory){
//        departementCriteriaFacade.findDepartementCriteriaWithItemsByDepartement(departement)
//        
//    }
}
