/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import bean.DemandCategory;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import javax.ejb.EJB;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.PieChartModel;
import service.DemandCategoryFacade;

/**
 *
 * @author youness
 */
@Named(value = "statistiqueController")
@SessionScoped
public class StatistiqueController implements Serializable {

    @EJB
    DemandCategoryFacade demandCategoryFacade;
    //attribute for DemandCategory statistique
    private int firstYear;
    private int secondYear;
    private int typeSum;
    private int typeAxeX;
    private int typeChart = 2;
    private BarChartModel barModel;
    private LineChartModel lineModel;
    private PieChartModel pieChartModel;
    private DemandCategory demandCategory;

    /**
     * Creates a new instance of statistiqueController
     */
    public StatistiqueController() {
    }

    public int getFirstYear() {
        return firstYear;
    }

    public void setFirstYear(int firstYear) {
        this.firstYear = firstYear;
    }

    public int getSecondYear() {
        return secondYear;
    }

    public int getTypeSum() {
        return typeSum;
    }

    public void setTypeSum(int typeSum) {
        this.typeSum = typeSum;
    }

    public int getTypeAxeX() {
        return typeAxeX;
    }

    public void setTypeAxeX(int typeAxeX) {
        this.typeAxeX = typeAxeX;
    }

    public void setSecondYear(int secondYear) {
        this.secondYear = secondYear;
    }

    public BarChartModel getBarModel() {
        if (barModel == null) {
            barModel = new BarChartModel();
            barModel.addSeries(new ChartSeries(""));
            Axis xAxis = barModel.getAxis(AxisType.X);
            Axis yAxis = barModel.getAxis(AxisType.Y);
        }
        return barModel;
    }

    public void setBarModel(BarChartModel barModel) {
        this.barModel = barModel;
    }

    public LineChartModel getLineModel() {
        if (lineModel == null) {
            lineModel = new LineChartModel();
            lineModel.addSeries(new ChartSeries(""));
            Axis xAxis = lineModel.getAxis(AxisType.X);
            Axis yAxis = lineModel.getAxis(AxisType.Y);
        }
        return lineModel;
    }

    public void setLineModel(LineChartModel lineModel) {
        this.lineModel = lineModel;
    }

    public PieChartModel getPieChartModel() {
        if (pieChartModel == null) {
            pieChartModel = new PieChartModel();
            pieChartModel.set("", 0);
        }
        return pieChartModel;
    }

    public void setPieChartModel(PieChartModel pieChartModel) {
        this.pieChartModel = pieChartModel;
    }

    public int getTypeChart() {
        return typeChart;
    }

    public void setTypeChart(int typeChart) {
        this.typeChart = typeChart;
    }

    public DemandCategory getDemandCategory() {
        if (demandCategory == null) {
            demandCategory = new DemandCategory();
        }
        return demandCategory;
    }

    public void setDemandCategory(DemandCategory demandCategory) {
        this.demandCategory = demandCategory;
    }

    public void createDemandeCategoryStat() {
        System.out.println("------------------------------------------- createDemandeCategoryStat() --------------------------------");
        barModel=null;
        lineModel=null;
        pieChartModel=null;
        ChartSeries seriesFirstYear = demandCategoryFacade.createDemandeCategoryStat(firstYear, typeSum, typeAxeX,demandCategory);
        ChartSeries serieSecondYear = demandCategoryFacade.createDemandeCategoryStat(secondYear, typeSum, typeAxeX,demandCategory);
        if (typeAxeX == 1) {
//            if (typeChart == 1) {
            System.out.println("statistique lineModel ");
            lineModel = new LineChartModel();
            lineModel.addSeries(seriesFirstYear);
            lineModel.addSeries(serieSecondYear);
            lineModel.setTitle("Statistique");
            lineModel.setLegendPosition("ne");
            lineModel.setAnimate(true);
            Axis xAxis = lineModel.getAxis(AxisType.X);
            lineModel.getAxes().put(AxisType.X, new CategoryAxis(""));
            xAxis.setLabel("mois");
            Axis yAxis = lineModel.getAxis(AxisType.Y);
            yAxis.setLabel("Montant");
            yAxis.setMin(0);
//            } else if (typeChart == 2) {
//                System.out.println("case 2");
//                barModel = new BarChartModel();
//                barModel.addSeries(seriesFirstYear);
//                barModel.addSeries(serieSecondYear);
//                barModel.setTitle("Statistique");
//                barModel.setLegendPosition("ne");
//                barModel.setAnimate(true);
//                Axis xAxis = barModel.getAxis(AxisType.X);
//                xAxis.setLabel("Date Debut");
//                Axis yAxis = barModel.getAxis(AxisType.Y);
//                yAxis.setLabel("Montant");
//                yAxis.setMin(0);
//            }
        } else if (typeAxeX == 2) {
            System.out.println("typeAxeX " + typeAxeX);
            barModel = new BarChartModel();
            barModel.addSeries(seriesFirstYear);
            barModel.setTitle("Statistique");
            barModel.setLegendPosition("ne");
            barModel.setAnimate(true);
            Axis xAxis = barModel.getAxis(AxisType.X);
            xAxis.setLabel("");
            Axis yAxis = barModel.getAxis(AxisType.Y);
            yAxis.setLabel("Values");
            yAxis.setMin(0);

            pieChartModel = demandCategoryFacade.createDemandeCategoryPieModel(demandCategory);
        }

        System.out.println("------------------------------------------- END ------------------------------------------------------------");
    }

}
