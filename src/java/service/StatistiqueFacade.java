/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.ArtDerWeiterverarbeitung;
import bean.DemandCategory;
import bean.DemandCategoryDepartementCalculation;
import controler.util.SearchUtil;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.PieChartModel;

/**
 *
 * @author
 */
@Stateless
public class StatistiqueFacade extends AbstractFacade<ArtDerWeiterverarbeitung> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB
    DemandCategoryFacade demandCategoryFacade;
    private @EJB
    DemandCategoryDepartementCalculationFacade demandCategoryDepartementCalculationFacade;

    private BigDecimal[] generateStatForYear(int year, int typeSum, List<String> departements, DemandCategory selectedForSearch, Integer validationLevel) {
        BigDecimal[] summs = new BigDecimal[12];
        for (int i = 1; i <= 12; i++) {
            summs[i - 1] = generateStatForMonthAndYear(year, i, typeSum, departements, selectedForSearch, validationLevel);
        }
        return summs;
    }

    public BigDecimal[][] generateStatForYear(int firstYear, int secondYear, int typeSum, List<String> departements, DemandCategory selectedForSearch, Integer validationLevel) {
        BigDecimal[][] res = new BigDecimal[2][12];
        res[0] = generateStatForYear(firstYear, typeSum, departements, selectedForSearch, validationLevel);
        res[1] = generateStatForYear(secondYear, typeSum, departements, selectedForSearch, validationLevel);
        return res;
    }

    private BigDecimal generateStatForMonthAndYear(int year, int month, int typeSum, List<String> departements, DemandCategory selectedForSearch, Integer validationLevel) {
        String[] queryHelper = constructQueryHelper(month, departements, typeSum);
        String query = "SELECT " + queryHelper[0] + " FROM " + queryHelper[1] + " WHERE " + queryHelper[2];
        query += " AND dc.dateDemandCategory LIKE '" + year + "-" + queryHelper[3] + "-%'";
        query += demandCategoryFacade.constructSearchQuery(selectedForSearch, validationLevel, "dc");
        if (departements != null && !departements.isEmpty()) {
            query += SearchUtil.addConstraintOr("dcdc", "departement.name", "=", departements);
        }
        System.out.println("reauet--| " + query);
        List<BigDecimal> res = em.createQuery(query).getResultList();
        if (res != null && !res.isEmpty() && res.get(0) != null) {
            return res.get(0);
        }
        return new BigDecimal(0);
    }
    private String[] constructQueryHelper(int month, List<String> departements, int typeSum) {
        String monthInQuery = "" + month;
        String beanAbreviation = "dc";
        String summQuery = "";
        String fromQuery = "DemandCategory dc";
        String wherequery = "1=1";
        if (month < 10) {
            monthInQuery = "0" + month;
        }
        if (departements != null && !departements.isEmpty()) {
            fromQuery += " , DemandCategoryDepartementCalculation dcdc";
            
        }
        if (typeSum == 1) {
            summQuery = " SUM(" + beanAbreviation + ".summTotal)";
        } else if (typeSum == 2) {
            summQuery = " SUM(" + beanAbreviation + ".summDruck)";
        } else if (typeSum == 3) {
            summQuery = " SUM(" + beanAbreviation + ".summDruck" + " + " + beanAbreviation + ".summTotal)";
        } else {
            if (departements != null && !departements.isEmpty()) {
                beanAbreviation = "dcdc";
                summQuery = "SUM(" + beanAbreviation + ".summe)";
                wherequery = " dcdc.demandCategory.id=dc.id";
            }
//            } else {
//                /*
//                    if departements == null et typeSum != {1,2,3} we return requet always false( wherequery = " 1=0 " ) 
//                    resultat return = String[]{"SUM(" + beanAbreviation + ".summTotal)", "DemandCategory dc", " 1=0 ", monthInQuery}
//                */
//                wherequery = " 1=0 ";
//                //requet toujours faux quelque soit summQuery
//                summQuery = summQuery = " SUM(" + beanAbreviation + ".summTotal)";
//            }

        }
        return new String[]{summQuery, fromQuery, wherequery, monthInQuery};
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StatistiqueFacade() {
        super(ArtDerWeiterverarbeitung.class);
    }

}
