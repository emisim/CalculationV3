/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Baukasten;
import bean.BaukastenPricing;
import bean.Cover;
import controler.util.SearchUtil;
import java.math.BigDecimal;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author 
 */
@Stateless
public class BaukastenPricingFacade extends AbstractFacade<BaukastenPricing> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public BigDecimal findByCoverAndBaukasten(Cover cover, Baukasten baukasten) {
        String query = "SELECT item FROM BaukastenPricing item WHERE 1=1 ";
        if (cover != null) {
            query+=SearchUtil.addConstraint("item", "cover.id", "=", cover.getId());
        }
        if (baukasten != null) {
           query+= SearchUtil.addConstraint("item", "baukasten.id", "=", baukasten.getId());
        }
        BaukastenPricing baukastenPricing = getUniqueResult(query);
        if (baukastenPricing == null || baukastenPricing.getPrice() == null) {
            return new BigDecimal(0);
        }
        return baukastenPricing.getPrice();
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BaukastenPricingFacade() {
        super(BaukastenPricing.class);
    }

}
