/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author pc&
 */
@Entity
public class DepartementCriteriaItem implements Serializable {


    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String arithmitiqueExpresionForUnitePrice;
    private String arithmitiqueExpresionForGlobalPrice;
    private String description;
    @ManyToOne
    private DepartementCriteria departementCriteria;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public DepartementCriteria getDepartementCriteria() {
        return departementCriteria;
    }

    public void setDepartementCriteria(DepartementCriteria departementCriteria) {
        this.departementCriteria = departementCriteria;
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
        if (!(object instanceof DepartementCriteriaItem)) {
            return false;
        }
        DepartementCriteriaItem other = (DepartementCriteriaItem) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

   @Override
    public String toString() {
        return description;
    }

}
