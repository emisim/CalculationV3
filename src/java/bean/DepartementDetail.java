/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Objects;

/**
 *
 * @author simo
 */
public class DepartementDetail {
    
    private Long id;
    private String nomDepCritera;
    private String descrDepCriteriaItem;
    private String arithmitiqueExpresionForUnitePrice;
    private String arithmitiqueExpresionForGlobalPrice;
    private String price;
    private String priceUpdate;
    private String priceGlobal;
    private String priceGlobalUpdate;
    private String summCriteria;
    private String summDepartement;
    private boolean checked;
    private Long demandCategoryCalcuationId;
    private Long demandCategoryDepartementCalculationId;
    private Long demandCategoryCalculationItemId;

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

    public Long getDemandCategoryCalcuationId() {
        return demandCategoryCalcuationId;
    }

    public void setDemandCategoryCalcuationId(Long demandCategoryCalcuationId) {
        this.demandCategoryCalcuationId = demandCategoryCalcuationId;
    }

    public Long getDemandCategoryDepartementCalculationId() {
        return demandCategoryDepartementCalculationId;
    }

    public void setDemandCategoryDepartementCalculationId(Long demandCategoryDepartementCalculationId) {
        this.demandCategoryDepartementCalculationId = demandCategoryDepartementCalculationId;
    }

    public Long getDemandCategoryCalculationItemId() {
        return demandCategoryCalculationItemId;
    }

    public void setDemandCategoryCalculationItemId(Long demandCategoryCalculationItemId) {
        this.demandCategoryCalculationItemId = demandCategoryCalculationItemId;
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
