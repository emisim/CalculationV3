/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.List;
import java.util.Objects;

/**
 *
 * @author 
 */
public class DepartementDetail {
    
    private Long id;
    private String nomDepCritera;
    private String descrDepCriteriaItem;
    private String descrDepCriteriaItemGlobal;
    private String arithmitiqueExpresionForUnitePrice;
    private String arithmitiqueExpresionForGlobalPrice;
    private String price;
    private String priceUpdate;
    private String priceGlobal;
    private String priceGlobalUpdate;
    private String summCriteria;
    private String summCriteriaGlobal;
    private String summDepartement;
    private String summDepartementGlobal;
    private boolean checked;
    private DemandCategoryCalculation demandCategoryCalcuation;
    private DemandCategoryDepartementCalculation demandCategoryDepartementCalculation;
    private DemandCategoryCalculationItem demandCategoryCalculationItem;
    private DemandCategory demandCategory;
    private List<SotimentItem> sotimentItems;
    private String summTotal;
    private String summDruck;

    public DepartementDetail() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    
    
    public String getNomDepCritera() {
        return nomDepCritera;
    }

    public void setNomDepCritera(String nomDepCritera) {
        this.nomDepCritera = nomDepCritera;
    }

    public String getDescrDepCriteriaItem() {
        return descrDepCriteriaItem;
    }

    public void setDescrDepCriteriaItem(String descrDepCriteriaItem) {
        this.descrDepCriteriaItem = descrDepCriteriaItem;
    }

    public String getArithmitiqueExpresionForUnitePrice() {
        return arithmitiqueExpresionForUnitePrice;
    }

    public void setArithmitiqueExpresionForUnitePrice(String arithmitiqueExpresionForUnitePrice) {
        this.arithmitiqueExpresionForUnitePrice = arithmitiqueExpresionForUnitePrice;
    }

    public String getArithmitiqueExpresionForGlobalPrice() {
        return arithmitiqueExpresionForGlobalPrice;
    }

    public void setArithmitiqueExpresionForGlobalPrice(String arithmitiqueExpresionForGlobalPrice) {
        this.arithmitiqueExpresionForGlobalPrice = arithmitiqueExpresionForGlobalPrice;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPriceGlobal() {
        return priceGlobal;
    }

    public void setPriceGlobal(String priceGlobal) {
        this.priceGlobal = priceGlobal;
    }

    public String getSummCriteria() {
        return summCriteria;
    }

    public void setSummCriteria(String summCriteria) {
        this.summCriteria = summCriteria;
    }

    public String getSummDepartement() {
        return summDepartement;
    }

    public void setSummDepartement(String summDepartement) {
        this.summDepartement = summDepartement;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public DemandCategoryCalculation getDemandCategoryCalcuation() {
        return demandCategoryCalcuation;
    }

    public void setDemandCategoryCalcuation(DemandCategoryCalculation demandCategoryCalcuation) {
        this.demandCategoryCalcuation = demandCategoryCalcuation;
    }

    public DemandCategoryDepartementCalculation getDemandCategoryDepartementCalculation() {
        return demandCategoryDepartementCalculation;
    }

    public void setDemandCategoryDepartementCalculation(DemandCategoryDepartementCalculation demandCategoryDepartementCalculation) {
        this.demandCategoryDepartementCalculation = demandCategoryDepartementCalculation;
    }

    public DemandCategoryCalculationItem getDemandCategoryCalculationItem() {
        return demandCategoryCalculationItem;
    }

    public void setDemandCategoryCalculationItem(DemandCategoryCalculationItem demandCategoryCalculationItem) {
        this.demandCategoryCalculationItem = demandCategoryCalculationItem;
    }

    public DemandCategory getDemandCategory() {
        return demandCategory;
    }

    public void setDemandCategory(DemandCategory demandCategory) {
        this.demandCategory = demandCategory;
    }

    public List<SotimentItem> getSotimentItems() {
        return sotimentItems;
    }

    public void setSotimentItems(List<SotimentItem> sotimentItems) {
        this.sotimentItems = sotimentItems;
    }


    public String getPriceUpdate() {
        return priceUpdate;
    }

    public void setPriceUpdate(String priceUpdate) {
        this.priceUpdate = priceUpdate;
    }

    public String getPriceGlobalUpdate() {
        return priceGlobalUpdate;
    }

    public void setPriceGlobalUpdate(String priceGlobalUpdate) {
        this.priceGlobalUpdate = priceGlobalUpdate;
    }

    public String getDescrDepCriteriaItemGlobal() {
        return descrDepCriteriaItemGlobal;
    }

    public void setDescrDepCriteriaItemGlobal(String descrDepCriteriaItemGlobal) {
        this.descrDepCriteriaItemGlobal = descrDepCriteriaItemGlobal;
    }

    public String getSummTotal() {
        return summTotal;
    }

    public void setSummTotal(String summTotal) {
        this.summTotal = summTotal;
    }

    public String getSummDruck() {
        return summDruck;
    }

    public void setSummDruck(String summDruck) {
        this.summDruck = summDruck;
    }

    public String getSummCriteriaGlobal() {
        return summCriteriaGlobal;
    }

    public void setSummCriteriaGlobal(String summCriteriaGlobal) {
        this.summCriteriaGlobal = summCriteriaGlobal;
    }

    public String getSummDepartementGlobal() {
        return summDepartementGlobal;
    }

    public void setSummDepartementGlobal(String summDepartementGlobal) {
        this.summDepartementGlobal = summDepartementGlobal;
    }
    
    
    
    @Override
    public int hashCode() {
        int hash = 3;
        hash = 43 * hash + Objects.hashCode(this.id);
        hash = 43 * hash + Objects.hashCode(this.nomDepCritera);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final DepartementDetail other = (DepartementDetail) obj;
        if (!Objects.equals(this.nomDepCritera, other.nomDepCritera)) {
            return false;
        }
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }
    
    

    @Override
    public String toString() {
        return "DepartementDetail{" + "id=" + id + ", nomDepCritera=" + nomDepCritera + '}';
    }
   
    
}
