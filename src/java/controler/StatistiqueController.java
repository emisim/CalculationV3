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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.CategoryAxis;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.PieChartModel;
import service.StatistiqueFacade;

/**
 *
 * @author youness
 */
@Named(value = "statistiqueController")
@SessionScoped
public class StatistiqueController implements Serializable {

    @EJB
    StatistiqueFacade statistiqueFacade;
    //attribute for DemandCategory statistique
    private int firstYear;
    private int secondYear;
    private int typeSum;
    private int typeAxeX;
    private Integer validationLevel;

    private BarChartModel barModel;
    private LineChartModel lineModel;
    private PieChartModel pieChartModel;
    private DemandCategory demandCategory;
    private DemandCategory selectedForSearch;
    private Date date = new Date();
    private List<String> departements;

    /**
     * Creates a new instance of statistiqueController
     */
    
     public void createDemandeCategoryStat() {
        System.out.println("------------------------------------------- createDemandeCategoryStat() --------------------------------");
        barModel = null;
        lineModel = null;
        pieChartModel = null;
        System.out.println("selectedForSearch-->" + selectedForSearch);
        ChartSeries seriesFirstYear = statistiqueFacade.createDemandeCategoryStat(firstYear, typeSum, typeAxeX, demandCategory, departements,selectedForSearch,validationLevel);
        ChartSeries serieSecondYear = statistiqueFacade.createDemandeCategoryStat(secondYear, typeSum, typeAxeX, demandCategory, departements,selectedForSearch,validationLevel);
        if (typeAxeX == 1 || typeAxeX==0) {
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

            pieChartModel = statistiqueFacade.createDemandeCategoryPieModel(demandCategory);
        }
        seriesFirstYear = new ChartSeries();
        serieSecondYear = new ChartSeries();
        System.out.println("------------------------------------------- END ------------------------------------------------------------");
    }
    public StatistiqueController() {
    }

    public int getFirstYear() {
        if (firstYear == 0) {
            firstYear = date.getYear() + 1900 -1;
        }
        return firstYear;
    }

    public void setFirstYear(int firstYear) {
        this.firstYear = firstYear;
    }

    public int getSecondYear() {
        if (secondYear == 0) {
            secondYear = date.getYear() + 1900;
        }
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

    public DemandCategory getDemandCategory() {
        if (demandCategory == null) {
            demandCategory = new DemandCategory();
        }
        return demandCategory;
    }

    public void setDemandCategory(DemandCategory demandCategory) {
        this.demandCategory = demandCategory;
    }

    public List<String> getDepartements() {
        System.out.println("departements ---> " + departements);
        if (departements == null) {
            departements = new ArrayList<>();
        }
        return departements;
    }

    public void setDepartements(List<String> departements) {
        this.departements = departements;
    }

    public DemandCategory getSelectedForSearch() {
        if (selectedForSearch == null) {
            selectedForSearch = new DemandCategory();
        }
        return selectedForSearch;
    }

    public void setSelectedForSearch(DemandCategory selectedForSearch) {
        this.selectedForSearch = selectedForSearch;
    }

    public Integer getValidationLevel() {
        return validationLevel;
    }

    public void setValidationLevel(Integer validationLevel) {
        this.validationLevel = validationLevel;
    }
    
    

   

}
