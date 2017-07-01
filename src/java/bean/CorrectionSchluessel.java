/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author lcharaf
 */
@Entity
public class CorrectionSchluessel implements Serializable {

   
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // Hier wird der Wert der durch die Bechnung von 100* gesamtArtikel/New_Artikel
    private int percent;
    private BigDecimal wert;

    @OneToMany(mappedBy = "correctionSchluessel")
    private List<DemandCategory> demandCategorys;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<DemandCategory> getDemandCategorys() {
        if(demandCategorys == null)
            demandCategorys = new ArrayList<>();
        return demandCategorys;
    }

    public void setDemandCategorys(List<DemandCategory> demandCategorys) {
        this.demandCategorys = demandCategorys;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }

    public BigDecimal getValue() {
        return wert;
    }

    public void setValue(BigDecimal wert) {
        this.wert = wert;
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
        if (!(object instanceof CorrectionSchluessel)) {
            return false;
        }
        CorrectionSchluessel other = (CorrectionSchluessel) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return percent+"|"+wert;
    }
    
}
