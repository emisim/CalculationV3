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
            summQuery = "SUM(" + beanAbreviation + ".summTotal)";
        } else if (typeSum == 2) {
            summQuery = "SUM(" + beanAbreviation + ".summDruck)";
        } else if (typeSum == 3) {
            summQuery = "SUM(" + beanAbreviation + ".summDruck)" + " , SUM(" + beanAbreviation + ".summTotal)";
        } else {
            if (departements != null && !departements.isEmpty()) {
                beanAbreviation = "dcdc";
                summQuery = "SUM(" + beanAbreviation + ".summe)";
                wherequery = " dcdc.demandCategory.id=dc.id";
            }

        }
        return new String[]{summQuery, fromQuery, wherequery, monthInQuery};
    }
////////////////////////////////////////////// CODE DYIAL DAK SYED ////////////////////////////////////////

    private ChartSeries createDemandeCategoryStat(int year, int typeSum, int typeAxe, DemandCategory demandCategory, List<String> departements, DemandCategory selectedForSearch, Integer validationLevel) {
        ChartSeries chartSeries = new ChartSeries();

        if (typeAxe == 2) {
            chartSeries.set("summTotal", calculerSum(demandCategory));
            chartSeries.set("summDruck", demandCategory.getSummDruck());
            return chartSeries;
        } else {

            String query = "SELECT dc FROM DemandCategory dc WHERE 1=1 ";
            if (selectedForSearch != null) {
                query += demandCategoryFacade.constructSearchQuery(selectedForSearch, validationLevel, "dc");
            }

            if (typeAxe == 0 && !departements.isEmpty()) {

                query += " AND (";
                for (String departement : departements) {
                    query += (departements.size() != 2 && departements.indexOf(departement) == (departements.size() - 1) || departements.indexOf(departement) == 0) ? " " : " OR ";
                    query += "dc.department.name='" + departement + "'";
                }
                query += " )";

            }
            query += " AND dc.dateDemandCategory LIKE '" + year + "-%-%'";
            System.out.println("reauet--| " + query);
            List<DemandCategory> demandCategorys = em.createQuery(query).getResultList();
            System.out.println("methode createDemandeCategoryStat -> demandCategorys :" + demandCategorys);
            chartSeries = charSerieParAnne(year, typeSum, demandCategorys);

            chartSeries.setLabel("" + year);

            return chartSeries;
        }

    }

    private ChartSeries charSerieParAnne(int year, int typeSum, List<DemandCategory> demandCategorys) {
        ChartSeries series = new ChartSeries();
        for (int i = 1; i <= 12; i++) {
            BigDecimal summ = new BigDecimal(BigInteger.ZERO);
            for (DemandCategory demandCategory : demandCategorys) {
                if (demandCategory.getDateDemandCategory() != null && demandCategory.getDateDemandCategory().getMonth() + 1 == i && demandCategory.getDateDemandCategory().getYear() + 1900 == year) {
                    if (typeSum == 1) {
                        summ = summ.add(calculerSum(demandCategory));
                    } else {
                        summ = summ.add(demandCategory.getSummDruck());
                    }
                }
            }
            System.out.println("summ value (a)" + summ);
            series.set("mois " + i, summ);
        }
        return series;
    }

    private BigDecimal calculerSum(DemandCategory demandCategory) {

        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findByDemandCategory(demandCategory, null);
        System.out.println("demandCategorys-->" + demandCategoryDepartementCalculations.size());
        BigDecimal sum = new BigDecimal(0);
        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            if (demandCategoryDepartementCalculation.getSumme() != null) {
                sum = sum.add(demandCategoryDepartementCalculation.getSumme());
            }
        }
        System.out.println("sum ---> " + sum);
        return sum;
    }

    private BigDecimal calculerSumDruck(DemandCategory demandCategory) {

        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findByDemandCategory(demandCategory, null);
        System.out.println("demandCategorys-->" + demandCategoryDepartementCalculations.size());
        BigDecimal sum = new BigDecimal(0);

        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            if (demandCategoryDepartementCalculation.getSumme() != null) {
                sum = sum.add(demandCategoryDepartementCalculation.getSumme());
            }
        }
        System.out.println("sum ---> " + sum);
        return sum;
    }

    private PieChartModel createDemandeCategoryPieModel(DemandCategory demandCategory) {
        PieChartModel pieModel = new PieChartModel();
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findByDemandCategory(demandCategory, null);
        for (DemandCategoryDepartementCalculation demandCategoryDepartementCalculation : demandCategoryDepartementCalculations) {
            pieModel.set("dc.Departement Calculation( " + demandCategoryDepartementCalculation + " )", demandCategoryDepartementCalculation.getSumme());
        }
        pieModel.setTitle("detail summTotal for demand Category(dc)");
        pieModel.setLegendPosition("w");
        pieModel.setShowDataLabels(true);
        pieModel.setDiameter(360);

        return pieModel;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StatistiqueFacade() {
        super(ArtDerWeiterverarbeitung.class);
    }

}
