/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author simo
 */
public class DepartementDetail {
    
    private String nomDepCritera;
    private String descrDepCriteriaItem;
    private String arithmitiqueExpresionForUnitePrice;
    private String arithmitiqueExpresionForGlobalPrice;
    private String price;
    private String priceGlobal;
    private String summCriteria;
    private String summDepartement;

    public DepartementDetail() {
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
    
    

    @Override
    public String toString() {
        return "DepartementDetail{" + "nomDepCritera=" + nomDepCritera + ", descrDepCriteriaItem=" + descrDepCriteriaItem + ", arithmitiqueExpresionForUnitePrice=" + arithmitiqueExpresionForUnitePrice + ", arithmitiqueExpresionForGlobalPrice=" + arithmitiqueExpresionForGlobalPrice + '}';
    }
    
    
    
}
