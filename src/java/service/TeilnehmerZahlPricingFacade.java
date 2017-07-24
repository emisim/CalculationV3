/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.TeilnehmerZahlPricing;
import java.math.BigDecimal;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class TeilnehmerZahlPricingFacade extends AbstractFacade<TeilnehmerZahlPricing> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public BigDecimal findPriceByTeilnehmerZahlValue(int teilnehmerZahl){
        TeilnehmerZahlPricing res= getUniqueResult("SELECT item FROM TeilnehmerZahlPricing item WHERE ("+teilnehmerZahl+" item.teilnehmerZahlMinOperator "
                + "item.teilnehmerZahlMin AND item.teilnehmerZahlMin!= null) AND ("+teilnehmerZahl+" item.teilnehmerZahlMaxOperator "
                + "item.teilnehmerZahlMax AND item.teilnehmerZahlMax!= null)");
        if(res!=null){
            return res.getPrice();
        }
        return new BigDecimal(0);
    }
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TeilnehmerZahlPricingFacade() {
        super(TeilnehmerZahlPricing.class);
    }

}
