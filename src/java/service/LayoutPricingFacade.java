/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.Layout;
import bean.LayoutPricing;
import java.math.BigDecimal;
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

    public BigDecimal findByCriteriaAndLayout(String departementCriteriaItemDescription, DemandCategory demandCategory) {
        return findByCriteriaAndLayout(departementCriteriaItemDescription, demandCategory.getLayout());
    }

    private BigDecimal findByCriteriaAndLayout(String departementCriteriaItemDescription, Layout layout) {
        LayoutPricing layoutPricing = getUniqueResult("SELECT item FROM LayoutPricing item WHERE "
                + "item.departementCriteriaItem.description='" + departementCriteriaItemDescription + "'"
                + " AND item.layout.id=" + layout.getId());
        System.out.println("SELECT item FROM LayoutPricing item WHERE "
                + "item.departementCriteriaItem.description='" + departementCriteriaItemDescription + "'"
                + " AND item.layout.id=" + layout.getId());
        if (layoutPricing == null) {
            return new BigDecimal(0);
        }
        return layoutPricing.getPrice();
    }

    public LayoutPricingFacade() {
        super(LayoutPricing.class);
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
