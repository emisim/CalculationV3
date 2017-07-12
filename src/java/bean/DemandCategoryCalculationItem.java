/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author lcharaf
 */
@Entity
public class DemandCategoryCalculationItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private DepartementCriteriaItem departementCriteriaItem;
    private BigDecimal price;
    private BigDecimal priceGlobal;
    private boolean calcultaed;
    @ManyToOne
    private DemandCategoryCalculation demandCategoryCalculation;

    public DemandCategoryCalculation getDemandCategoryCalculation() {
        return demandCategoryCalculation;
    }

    public void setDemandCategoryCalculation(DemandCategoryCalculation demandCategoryCalculation) {
        this.demandCategoryCalculation = demandCategoryCalculation;
    }

    public DepartementCriteriaItem getDepartementCriteriaItem() {
        return departementCriteriaItem;
    }

    public void setDepartementCriteriaItem(DepartementCriteriaItem departementCriteriaItem) {
        this.departementCriteriaItem = departementCriteriaItem;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    
    public BigDecimal getPriceGlobal() {
        return priceGlobal;
    }

    public void setPriceGlobal(BigDecimal priceGlobal) {
        this.priceGlobal = priceGlobal;
    }

    public boolean getCalcultaed() {
        return calcultaed;
    }

    public void setCalcultaed(boolean calcultaed) {
        this.calcultaed = calcultaed;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DemandCategoryCalculationItem)) {
            return false;
        }
        DemandCategoryCalculationItem other = (DemandCategoryCalculationItem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "DemandCategoryCalculationItem{" + "id=" + id + ", price=" + price + ", priceGlobal=" + priceGlobal + ", calcultaed=" + calcultaed + '}';
    }

  

}
