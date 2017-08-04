/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DepartementCriteriaItem;
import bean.Layout;
import bean.LayoutPricing;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class LayoutPricingFacade extends AbstractFacade<LayoutPricing> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;
//database publishing
    public LayoutPricing findByCriteriaAndLayout(DepartementCriteriaItem departementCriteriaItem, Layout layout) {
        return getUniqueResult("SELECT item FROM LayoutPricing item WHERE item.departementCriteriaItem.id=" + departementCriteriaItem.getId()
                + " AND item.layout.id=" + layout.getId());
        
    }

    public LayoutPricingFacade() {
        super(LayoutPricing.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
