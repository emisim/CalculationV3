/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.ArtDerWeiterverarbeitung;
import bean.DemandCategory;
import bean.DemandCategoryDepartementCalculation;
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
    
    private @EJB DemandCategoryFacade demandCategoryFacade;
    private @EJB DemandCategoryDepartementCalculationFacade demandCategoryDepartementCalculationFacade;

    public ChartSeries createDemandeCategoryStat(int year, int typeSum, int typeAxe, DemandCategory demandCategory, List<String> departements, DemandCategory selectedForSearch,Integer validationLevel) {
        ChartSeries chartSeries = new ChartSeries();

        if (typeAxe == 2) {
            chartSeries.set("summTotal", calculerSum(demandCategory));
            chartSeries.set("summDruck", demandCategory.getSummDruck());
            return chartSeries;
        } else {

            String query = "SELECT dc FROM DemandCategory dc WHERE 1=1 ";
            if (selectedForSearch != null) {
                query += demandCategoryFacade.constructSearchQuery(selectedForSearch,validationLevel, "dc");
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

    public ChartSeries charSerieParAnne(int year, int typeSum, List<DemandCategory> demandCategorys) {
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

        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findByDemandCategory(demandCategory,null);
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

        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findByDemandCategory(demandCategory,null);
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

    public PieChartModel createDemandeCategoryPieModel(DemandCategory demandCategory) {
        PieChartModel pieModel = new PieChartModel();
        List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations = demandCategoryDepartementCalculationFacade.findByDemandCategory(demandCategory,null);
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
