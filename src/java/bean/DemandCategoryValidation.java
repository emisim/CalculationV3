/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
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
public class DemandCategoryValidation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    
    @OneToMany(mappedBy = "demandCategoryValidation")
    private List<DemandCategoryValidationItem> demandCategoryValidationItems;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<DemandCategoryValidationItem> getDemandCategoryValidationItems() {
        return demandCategoryValidationItems;
    }

    public void setDemandCategoryValidationItems(List<DemandCategoryValidationItem> demandCategoryValidationItems) {
        this.demandCategoryValidationItems = demandCategoryValidationItems;
    }

    @Override
    public String toString() {
        return "DemandCategoryValidation{" + "id=" + id + ", demandCategoryValidationItems=" + demandCategoryValidationItems + '}';
    }

    
   
    
}
