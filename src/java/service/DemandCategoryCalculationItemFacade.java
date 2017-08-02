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
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;

/**
 *
 * @author
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

    //Wichtig Calculation
    public List<DemandCategoryCalculationItem> save(DemandCategoryCalculation demandCategoryCalculation, DemandCategory demandCategory, boolean simuler, boolean isSave) throws ScriptException {
        List<DemandCategoryCalculationItem> res = new ArrayList();
        DepartementCriteria departementCriteria = demandCategoryCalculation.getDepartementCriteria();
        //Hier werden die einzelne CriteriaItem
        List<DepartementCriteriaItem> departementCriteriaItems = departementCriteriaItemFacade.findByDepartementCriteria(departementCriteria);
        for (DepartementCriteriaItem departementCriteriaItem : departementCriteriaItems) {
            DemandCategoryCalculationItem demandCategoryCalculationItem = createOrFind(departementCriteriaItem, demandCategoryCalculation);
            //evalFunction SErvice ALBATAL pour calcul
            BigDecimal price = new BigDecimal(calculationExpressionFacade.evalFunction(departementCriteriaItem.getArithmitiqueExpresionForUnitePrice(), demandCategory, demandCategoryCalculationItem.getCalcultaed()) + "");
            BigDecimal priceGlobal = new BigDecimal(calculationExpressionFacade.evalFunction(departementCriteriaItem.getArithmitiqueExpresionForGlobalPrice(), demandCategory, demandCategoryCalculationItem.getCalcultaed()) + "");
            demandCategoryCalculationItem.setPrice(price);
            demandCategoryCalculationItem.setPriceUpdate(price);
            demandCategoryCalculationItem.setPriceGlobal(priceGlobal);
            demandCategoryCalculationItem.setPriceGlobalUpdate(priceGlobal);
            if (!simuler) {
                if (isSave) {
                    create(demandCategoryCalculationItem);
                } else {
                    edit(demandCategoryCalculationItem);
                }
               // System.out.println("hana edite demandCategoryCalculationItem ==> " + demandCategoryCalculationItem);
            }
            res.add(demandCategoryCalculationItem);
        }
        return res;
    }

    public List<DemandCategoryCalculationItem> detail(DemandCategoryCalculation demandCategoryCalculation, DemandCategory demandCategory) throws ScriptException {
        List<DemandCategoryCalculationItem> res = new ArrayList();
        DepartementCriteria departementCriteria = demandCategoryCalculation.getDepartementCriteria();
        List<DepartementCriteriaItem> departementCriteriaItems = departementCriteriaItemFacade.findByDepartementCriteria(departementCriteria);
        for (DepartementCriteriaItem departementCriteriaItem : departementCriteriaItems) {
            DemandCategoryCalculationItem demandCategoryCalculationItem = find(departementCriteriaItem, demandCategoryCalculation);
            demandCategoryCalculationItem.setPrice(new BigDecimal(calculationExpressionFacade.evalFunction(departementCriteriaItem.getArithmitiqueExpresionForUnitePrice(), demandCategory, demandCategoryCalculationItem.getCalcultaed()) + ""));
            demandCategoryCalculationItem.setPriceGlobal(new BigDecimal(calculationExpressionFacade.evalFunction(departementCriteriaItem.getArithmitiqueExpresionForGlobalPrice(), demandCategory, demandCategoryCalculationItem.getCalcultaed()) + ""));
            demandCategoryCalculationItem.setDepartementCriteriaItem(departementCriteriaItem);
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

    private DemandCategoryCalculationItem find(DepartementCriteriaItem departementCriteriaItem, DemandCategoryCalculation demandCategoryCalculation) {
        String query = "SELECT item FROM DemandCategoryCalculationItem item WHERE "
                + "item.demandCategoryCalculation.id=" + demandCategoryCalculation.getId() + " AND item.departementCriteriaItem.id=" + departementCriteriaItem.getId();
        List<DemandCategoryCalculationItem> res = em.createQuery(query).getResultList();
//        System.out.println("queryyy MMMMMMMMMMMMMMMMMm " + query);
//        System.out.println("DemandCategoryCalculationItem.size MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM " + res);
        if (res != null && !res.isEmpty() && res.get(0) != null) {
          //  System.out.println("DemandCategoryCalculationItem.size and list is not null MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM " + res.get(0));
            return res.get(0);
        }
        return new DemandCategoryCalculationItem();
    }

    public DemandCategoryCalculationItemFacade() {
        super(DemandCategoryCalculationItem.class);
    }

    public List<DemandCategoryCalculationItem> findByDemandCategoryCalculation(DemandCategoryCalculation demandCategoryCalculation) {
        String query = "SELECT item FROM DemandCategoryCalculationItem item WHERE 1=1";
        if (demandCategoryCalculation != null && demandCategoryCalculation.getId() != null) {
            query += SearchUtil.addConstraint("item", "demandCategoryCalculation.id", "=", demandCategoryCalculation.getId());
        }
        return em.createQuery(query).getResultList();

    }
}
