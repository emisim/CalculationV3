/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.TeilnehmerZahlPricing;
import controler.util.SearchUtil;
import java.math.BigDecimal;
import java.util.List;
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

    public BigDecimal calcPriceByTeilnehmerZahlValue(DemandCategory demandCategory) {
        int teilnehmerZahl = demandCategory.getTeilnehmerZahl();
        BigDecimal price = new BigDecimal(0);
        List<TeilnehmerZahlPricing> teilnehmerZahlPricings = findAll();
        for (TeilnehmerZahlPricing teilnehmerZahlPricing : teilnehmerZahlPricings) {
            boolean maxEval = eval(teilnehmerZahl, teilnehmerZahlPricing.getTeilnehmerZahlMaxOperator(), teilnehmerZahlPricing.getTeilnehmerZahlMax() + "");
            boolean minEval = eval(teilnehmerZahl, teilnehmerZahlPricing.getTeilnehmerZahlMinOperator(), teilnehmerZahlPricing.getTeilnehmerZahlMin() + "");
            if (maxEval && minEval) {
                price = teilnehmerZahlPricing.getPrice();
            }
        }
        demandCategory.setTeilnehmerZahlPricing(price);

        return demandCategory.getTeilnehmerZahlPricing();
    }

    public boolean eval(int teilnehmerZahl, String operator, String value) {
        if (SearchUtil.isStringNullOrVide(operator)) {
            return true;
        } else if (operator.equals(">")) {
            return new BigDecimal(teilnehmerZahl).compareTo(new BigDecimal(value)) > 0;
        } else if (operator.equals(">=")) {
            return new BigDecimal(teilnehmerZahl).compareTo(new BigDecimal(value)) >= 0;
        } else if (operator.equals("<")) {
            return new BigDecimal(teilnehmerZahl).compareTo(new BigDecimal(value)) < 0;
        } else if (operator.equals("<=")) {
            return new BigDecimal(teilnehmerZahl).compareTo(new BigDecimal(value)) <= 0;
        }
        return true;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public TeilnehmerZahlPricingFacade() {
        super(TeilnehmerZahlPricing.class);
    }

}
