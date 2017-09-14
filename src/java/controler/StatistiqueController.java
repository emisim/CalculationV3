/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler;

import bean.DemandCategory;
import bean.Departement;
import controler.util.MathUtil;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import org.primefaces.model.chart.Axis;
import org.primefaces.model.chart.AxisType;
import org.primefaces.model.chart.BarChartModel;
import org.primefaces.model.chart.BarChartSeries;
import org.primefaces.model.chart.CartesianChartModel;
import org.primefaces.model.chart.ChartSeries;
import org.primefaces.model.chart.LineChartModel;
import org.primefaces.model.chart.LineChartSeries;
import org.primefaces.model.chart.PieChartModel;
import service.DemandCategoryDepartementCalculationFacade;
import service.DepartementFacade;
import service.StatistiqueFacade;

/**
 *
 * @author 
 */
@Named(value = "statistiqueController")
@SessionScoped
public class StatistiqueController implements Serializable {

    @EJB
    StatistiqueFacade statistiqueFacade;
    @EJB
    DemandCategoryDepartementCalculationFacade demandCategoryDepartementCalculationFacade;
    @EJB
    DepartementFacade departementFacade;
    //attribute for DemandCategory statistique
    private int firstYear;
    private int secondYear;
    private int typeSum;
    private int typeAxeX = 2;
    private Integer validationLevel;

    private PieChartModel pieChartModel;
    private DemandCategory demandCategory;
    private DemandCategory selectedForSearch;
    private Date date = new Date();
    private Date dateMin;
    private Date dateMax;
    private List<String> departements;
    private int typeChart;
    private CartesianChartModel cartesianChartModel;

    private BigDecimal max;

    public void afficherDepartementPieChart() {
        pieChartModel = new PieChartModel();

        for (Departement dep : departementFacade.findAll()) {
            if (dep != null) {
                pieChartModel.set("" + dep.getName(), statistiqueFacade.findByDateMinMax(selectedForSearch,validationLevel,dateMin, dateMax, dep.getName()));
            }

        }
        pieChartModel.setTitle("Departement Chart");
        pieChartModel.setLegendPosition("e");
        pieChartModel.setShowDataLabels(true);
        pieChartModel.setDiameter(370);
    }

    @PostConstruct
    public void init() {
         cartesianChartModel = new BarChartModel();
        ChartSeries annee1 = new ChartSeries();
        for (int i = 0; i < 12; i++) {
            annee1.set("Monat " + (i + 1), 0);
        }
        cartesianChartModel.addSeries(annee1);
        
        pieChartModel = new PieChartModel();
        pieChartModel.set("", 0);
    }

    /**
     * Creates a new instance of statistiqueController
     */
    public void afficherChart() {
        cartesianChartModel = new BarChartModel();
        creatChartModel();

    }

    public void creatChartModel() {
        cartesianChartModel = initCategoryModel();
        paramGraphForConstruction(cartesianChartModel);
    }

    private CartesianChartModel initCategoryModel() {
        attachResultatToModelForConstrution(cartesianChartModel);
        return cartesianChartModel;
    }

    private void paramGraphForConstruction(CartesianChartModel model) {
        System.out.println("Statistiken vom Jahr " + firstYear + " und " + secondYear);
        model.setTitle("Statistics from " + firstYear + " and " + secondYear);
        model.setLegendPosition("e");
        model.setAnimate(true);
        Axis yAxis = model.getAxis(AxisType.Y);
        yAxis.setLabel("Sum");
        yAxis.setMin(0);
        yAxis.setMax(max.multiply(new BigDecimal(1.1)));
        Axis xAxis = model.getAxis(AxisType.X);
        xAxis.setMin(0);
        xAxis.setTickAngle(-30);
    }

    private void attachResultatToModelForConstrution(CartesianChartModel model) {
        BigDecimal[][] resultats = statistiqueFacade.generateStatForYear(firstYear, secondYear, typeSum, departements, selectedForSearch, validationLevel);
        for (int i = 0; i < 12; i++) {
            System.out.println("ha res " + resultats[0][i]);
            System.out.println("ha res " + resultats[1][i]);
        }
        max = MathUtil.calculerMax(resultats);
        System.out.println("haaaa lmax" + max);
        ChartSeries annee1;
        ChartSeries annee2;
        if (typeChart == 1) {
            annee1 = new LineChartSeries();
            annee1.setLabel("Year " + firstYear);

            annee2 = new LineChartSeries();
            annee2.setLabel("Year " + secondYear);
        } else {
            annee1 = new BarChartSeries();
            annee1.setLabel("Year " + firstYear);
            annee2 = new BarChartSeries();
            annee2.setLabel("Year " + secondYear);
        }

        for (int i = 0; i < 12; i++) {
            annee1.set("Month " + (i + 1), resultats[0][i]);
            annee2.set("Month " + (i + 1), resultats[1][i]);

        }
        System.out.println("annee1 ::: " + annee1);
        System.out.println("annee2 ::: " + annee2);
        model.addSeries(annee1);
        model.addSeries(annee2);
    }

    public void setTypeChart(int typeChart) {
        this.typeChart = typeChart;
    }


    public StatistiqueController() {
    }

    public int getFirstYear() {
        if (firstYear == 0) {
            firstYear = date.getYear() + 1900 - 1;
        }
        return firstYear;
    }

    public void setFirstYear(int firstYear) {
        this.firstYear = firstYear;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public int getTypeChart() {
        return typeChart;
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

    public PieChartModel getPieChartModel() {
        if (pieChartModel == null) {
            pieChartModel = new PieChartModel();
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

    public Date getDateMin() {
        if (dateMin == null) {
            dateMin = new Date();
        }
        return dateMin;
    }

    public void setDateMin(Date dateMin) {
        this.dateMin = dateMin;
    }

    public Date getDateMax() {
        if (dateMax == null) {
            dateMax = new Date();
        }
        return dateMax;
    }

    public void setDateMax(Date dateMax) {
        this.dateMax = dateMax;
    }

    public CartesianChartModel getCartesianChartModel() {
        return cartesianChartModel;
    }

    public void setCartesianChartModel(CartesianChartModel cartesianChartModel) {
        this.cartesianChartModel = cartesianChartModel;
    }

}
