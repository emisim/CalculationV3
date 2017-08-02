/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import bean.DemandCategoryDepartementCalculation;
import bean.Departement;
import controler.util.SearchUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;

/**
 *
 * @author
 */
@Stateless
public class DemandCategoryDepartementCalculationFacade extends AbstractFacade<DemandCategoryDepartementCalculation> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB
    DemandCategoryCalculationFacade demandCategoryCalculationFacade;
    private @EJB
    DepartementFacade departementFacade;
    private @EJB
    DepartementCriteriaFacade departementCriteriaFacade;

    public List<DemandCategoryDepartementCalculation> findWithItemsByDemandCategory(DemandCategory demandCategory, Departement departement) {
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = findByDemandCategory(demandCategory, departement);
        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            demandCategoryDepartementCalculation.setDemandCategoryCalculations(demandCategoryCalculationFacade.findWithItemsByDemandCategoryDepartementCalculation(demandCategoryDepartementCalculation));
        }
        return demandCategoryDepartementCalculations;
    }

    public List<DemandCategoryDepartementCalculation> findByDemandCategory(DemandCategory demandCategory, Departement departement) {
        String query = "SELECT item FROM DemandCategoryDepartementCalculation item WHERE 1=1";
        if (demandCategory != null && demandCategory.getId() != null) {
            query += SearchUtil.addConstraint("item", "demandCategory.id", "=", demandCategory.getId());
        }
        if (departement != null && departement.getId() != null) {
            query += SearchUtil.addConstraint("item", "departement.id", "=", departement.getId());
        }
        return em.createQuery(query).getResultList();
    }

    public List<DemandCategoryDepartementCalculation> save(DemandCategory demandCategory, Departement departement, boolean similuer, boolean isSave) throws ScriptException {
        List<DemandCategoryDepartementCalculation> res = new ArrayList();
        List<Departement> departements = new ArrayList();
        if (departement == null || departement.getId() == null) {
            departements = departementFacade.findAll();
        } else {
            departements.add(departement);
        }
        for (Departement myDepartement : departements) {
            DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = createOrFind(myDepartement, demandCategory);
            if (!similuer) {
                if (isSave) {
                    create(demandCategoryDepartementCalculation);
                } else {
                    edit(demandCategoryDepartementCalculation);
                }
             //   System.out.println("hana savite demandCategoryDepartementCalculation ==> " + demandCategoryDepartementCalculation);
            }

            //Save calculation
            demandCategoryDepartementCalculation.setDemandCategoryCalculations(demandCategoryCalculationFacade.save(demandCategory, demandCategoryDepartementCalculation, similuer, isSave));
            demandCategoryDepartementCalculation.setSumme(calculerSum(demandCategoryDepartementCalculation.getDemandCategoryCalculations(), "summ"));
            demandCategoryDepartementCalculation.setSummeGlobal(calculerSum(demandCategoryDepartementCalculation.getDemandCategoryCalculations(), "summGlobal"));
            if (!similuer) {
                edit(demandCategoryDepartementCalculation);
         //       System.out.println("hana editer demandCategoryDepartementCalculation ==> " + demandCategoryDepartementCalculation);
            }
            res.add(demandCategoryDepartementCalculation);
        }
        return res;
    }

    public List<DemandCategoryDepartementCalculation> detail(DemandCategory demandCategory, Departement departement) throws ScriptException {
        List<DemandCategoryDepartementCalculation> res = new ArrayList();
        List<Departement> departements = new ArrayList();
        if (departement == null || departement.getId() == null) {
            departements = departementFacade.findAll();
        } else {
            departements.add(departement);
        }
        for (Departement myDepartement : departements) {
            DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = find(myDepartement, demandCategory);
            demandCategoryDepartementCalculation.setDemandCategoryCalculations(demandCategoryCalculationFacade.detail(demandCategory, demandCategoryDepartementCalculation));
            demandCategoryDepartementCalculation.setSumme(calculerSum(demandCategoryDepartementCalculation.getDemandCategoryCalculations(), "summ"));
            demandCategoryDepartementCalculation.setSummeGlobal(calculerSum(demandCategoryDepartementCalculation.getDemandCategoryCalculations(), "summGlobal"));
            res.add(demandCategoryDepartementCalculation);
        }
        return res;
    }

    private DemandCategoryDepartementCalculation createOrFind(Departement departement, DemandCategory demandCategory) {
        String query = "SELECT item FROM DemandCategoryDepartementCalculation item WHERE "
                + "item.demandCategory.id=" + demandCategory.getId() + " AND item.departement.id=" + departement.getId();
 //       System.out.println("haa query ==> " + query);
        List<DemandCategoryDepartementCalculation> res = em.createQuery(query).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
       //     System.out.println("rah l9ite DemandCategoryDepartementCalculation f bd ha son id " + res.get(0).getId());
            return res.get(0);
        }
//        System.out.println("rah maaa l9itechhh DemandCategoryDepartementCalculation f bd ");
//        System.out.println("Id ===========>" + generate("DemandCategoryDepartementCalculation", "id"));
        DemandCategoryDepartementCalculation demandCategoryDepartementCalculation = new DemandCategoryDepartementCalculation();
        demandCategoryDepartementCalculation.setId(generate("DemandCategoryDepartementCalculation", "id"));
        demandCategoryDepartementCalculation.setDemandCategory(demandCategory);
        demandCategoryDepartementCalculation.setDepartement(departement);
        return demandCategoryDepartementCalculation;
    }

    private DemandCategoryDepartementCalculation find(Departement departement, DemandCategory demandCategory) {
        String query = "SELECT item FROM DemandCategoryDepartementCalculation item WHERE "
                + "item.demandCategory.id=" + demandCategory.getId() + " AND item.departement.id=" + departement.getId();
   //     System.out.println("haa query ==> " + query);
        List<DemandCategoryDepartementCalculation> res = em.createQuery(query).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
    //        System.out.println("rah l9ite DemandCategoryDepartementCalculation f bd ha son id " + res.get(0).getId());
            return res.get(0);
        }
        return new DemandCategoryDepartementCalculation();
    }

    private BigDecimal calculerSum(List<DemandCategoryCalculation> demandCategoryCalculations, String flag) {
        BigDecimal sum = new BigDecimal(0);
        if (flag.equals("summ")) {
            for (DemandCategoryCalculation demandCategoryCalculation : demandCategoryCalculations) {
                if (demandCategoryCalculation.getSumme() != null) {
                    sum = sum.add(demandCategoryCalculation.getSumme());
                }
            }
        }
        if (flag.equals("summGlobal")) {
            for (DemandCategoryCalculation demandCategoryCalculation : demandCategoryCalculations) {
                if (demandCategoryCalculation.getSummeGlobal()!= null) {
                    sum = sum.add(demandCategoryCalculation.getSummeGlobal());
                }
            }
        }
        return sum;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DemandCategoryDepartementCalculationFacade() {
        super(DemandCategoryDepartementCalculation.class);
    }

    

}
