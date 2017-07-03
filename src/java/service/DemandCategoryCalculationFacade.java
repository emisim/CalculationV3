/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import bean.DemandCategoryCalculationItem;
import static bean.DemandCategoryCalculationItem_.demandCategoryCalculation;
import bean.Departement;
import bean.DepartementCriteria;
import static com.sun.tools.xjc.reader.Ring.add;
import controler.util.SearchUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;
import static com.sun.tools.xjc.reader.Ring.add;
import static com.sun.tools.xjc.reader.Ring.add;
import static com.sun.tools.xjc.reader.Ring.add;

/**
 *
 * @author Younes
 */
@Stateless
public class DemandCategoryCalculationFacade extends AbstractFacade<DemandCategoryCalculation> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB
    DemandCategoryCalculationItemFacade demandCategoryCalculationItemFacade;
    private @EJB
    DepartementCriteriaFacade departementCriteriaFacade;

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

    public List<DemandCategoryCalculation> save(DemandCategory demandCategory, Departement departement, boolean similuer) throws ScriptException {
        List<DemandCategoryCalculation> res = new ArrayList();
        List<DepartementCriteria> departementCriterias = departementCriteriaFacade.findDepartementCriteriaWithItemsByDepartement(departement);
        for (DepartementCriteria departementCriteria : departementCriterias) {
            DemandCategoryCalculation demandCategoryCalculation = createOrFind(departementCriteria, demandCategory);
            if (!similuer) {
                edit(demandCategoryCalculation);
            }
            demandCategoryCalculation.setDemandCategoryCalculationItems(demandCategoryCalculationItemFacade.save(demandCategoryCalculation, demandCategory, similuer));
            demandCategoryCalculation.setSumme(calculerSum(demandCategoryCalculation.getDemandCategoryCalculationItems()));
            if (!similuer) {
                edit(demandCategoryCalculation);
            }
            res.add(demandCategoryCalculation);
        }
        return res;
    }

    private DemandCategoryCalculation createOrFind(DepartementCriteria departementCriteria, DemandCategory demandCategory) {
        String query="SELECT item FROM DemandCategoryCalculation item WHERE "
                + "item.demandCategory.id=" + demandCategory.getId() + " AND item.departementCriteria.id=" + departementCriteria.getId();
        System.out.println("haa query ==> "+query);
        List<DemandCategoryCalculation> res = em.createQuery(query).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
            System.out.println("rah l9ite DemandCategoryCalculation f bd ha son id " + res.get(0).getId());
            return res.get(0);
        }
        System.out.println("rah maaa l9itechhh DemandCategoryCalculation f bd ");
        DemandCategoryCalculation demandCategoryCalculation = new DemandCategoryCalculation();
        demandCategoryCalculation.setId(generate("DemandCategoryCalculation", "id"));
        demandCategoryCalculation.setDepartementCriteria(departementCriteria);
        demandCategoryCalculation.setDemandCategory(demandCategory);
        return demandCategoryCalculation;
    }

    private BigDecimal calculerSum(List<DemandCategoryCalculationItem> demandCategoryCalculationItems) {
        BigDecimal sum = new BigDecimal(0);
        for (DemandCategoryCalculationItem demandCategoryCalculationItem : demandCategoryCalculationItems) {
            sum = sum.add(demandCategoryCalculationItem.getPrice());
        }
        return sum;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DemandCategoryCalculationFacade() {
        super(DemandCategoryCalculation.class);
    }

}
