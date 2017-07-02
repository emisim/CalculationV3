/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategoryCalculation;
import bean.DemandCategoryCalculationItem;
import controler.util.SearchUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
 */
@Stateless
public class DemandCategoryCalculationItemFacade extends AbstractFacade<DemandCategoryCalculationItem> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DemandCategoryCalculationItemFacade() {
        super(DemandCategoryCalculationItem.class);
    }

    List<DemandCategoryCalculationItem> findByDemandCategoryCalculation(DemandCategoryCalculation demandCategoryCalculation) {
        String query = "SELECT item FROM DepartementCriteriaItem item WHERE 1=1";
        if (demandCategoryCalculation != null && demandCategoryCalculation.getId() != null) {
            query += SearchUtil.addConstraint("item", "demandCategoryCalculation.id", "=", demandCategoryCalculation.getId());
        }
        return em.createQuery(query).getResultList();

    }
}
