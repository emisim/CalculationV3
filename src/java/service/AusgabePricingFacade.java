/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Ausgabe;
import bean.AusgabePricing;
import bean.DemandCategory;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author lcharaf
 */
@Stateless
public class AusgabePricingFacade extends AbstractFacade<AusgabePricing> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public void findByAusgabe (DemandCategory demandCategory) {
        demandCategory.setAusgabePricing(getUniqueResult("SELECT item FROM AusgabePricing item WHERE item.ausgabe.id = " + demandCategory.getAusgabe().getId()).getPrice());
    }
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AusgabePricingFacade() {
        super(AusgabePricing.class);
    }
    
}
