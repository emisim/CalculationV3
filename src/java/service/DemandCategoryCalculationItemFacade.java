/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import bean.DemandCategoryCalculationItem;
import bean.DepartementCriteria;
import bean.DepartementCriteriaItem;
import controler.util.SearchUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;

/**
 *
 * @author Younes
 */
@Stateless
public class DemandCategoryCalculationItemFacade extends AbstractFacade<DemandCategoryCalculationItem> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;
    private @EJB
    DepartementCriteriaItemFacade departementCriteriaItemFacade;
    private @EJB
    CalculationExpressionFacade calculationExpressionFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public List<DemandCategoryCalculationItem> save(DemandCategoryCalculation demandCategoryCalculation, DemandCategory demandCategory, boolean simuler) throws ScriptException {
        List<DemandCategoryCalculationItem> res = new ArrayList();
        DepartementCriteria departementCriteria = demandCategoryCalculation.getDepartementCriteria();
        List<DepartementCriteriaItem> departementCriteriaItems = departementCriteriaItemFacade.findByDepartementCriteria(departementCriteria);
        for (DepartementCriteriaItem departementCriteriaItem : departementCriteriaItems) {
            DemandCategoryCalculationItem demandCategoryCalculationItem = createOrFind(departementCriteriaItem, demandCategoryCalculation);
            demandCategoryCalculationItem.setPrice(new BigDecimal(calculationExpressionFacade.evalFunction(departementCriteriaItem.getArithmitiqueExpresionForUnitePrice(), demandCategory) + ""));
            demandCategoryCalculationItem.setPriceGlobal(new BigDecimal(calculationExpressionFacade.evalFunction(departementCriteriaItem.getArithmitiqueExpresionForGlobalPrice(), demandCategory) + ""));
            if (!simuler) {
                edit(demandCategoryCalculationItem);
            }
            res.add(demandCategoryCalculationItem);
        }
        return res;
    }

    private DemandCategoryCalculationItem createOrFind(DepartementCriteriaItem departementCriteriaItem, DemandCategoryCalculation demandCategoryCalculation) {
        List<DemandCategoryCalculationItem> res = em.createQuery("SELECT item FROM DemandCategoryCalculationItem item WHERE "
                + "item.demandCategoryCalculation.id=" + demandCategoryCalculation.getId() + " AND item.departementCriteriaItem.id=" + departementCriteriaItem.getId()).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
            return res.get(0);
        }
        DemandCategoryCalculationItem demandCategoryCalculationItem = new DemandCategoryCalculationItem();
        demandCategoryCalculationItem.setId(generate("DemandCategoryCalculationItem", "id"));
        demandCategoryCalculationItem.setDepartementCriteriaItem(departementCriteriaItem);
        demandCategoryCalculationItem.setDemandCategoryCalculation(demandCategoryCalculation);
        return demandCategoryCalculationItem;
    }

    public DemandCategoryCalculationItemFacade() {
        super(DemandCategoryCalculationItem.class);
    }

    List<DemandCategoryCalculationItem> findByDemandCategoryCalculation(DemandCategoryCalculation demandCategoryCalculation) {
        String query = "SELECT item FROM DemandCategoryCalculationItem item WHERE 1=1";
        if (demandCategoryCalculation != null && demandCategoryCalculation.getId() != null) {
            query += SearchUtil.addConstraint("item", "demandCategoryCalculation.id", "=", demandCategoryCalculation.getId());
        }
        return em.createQuery(query).getResultList();

    }
}
