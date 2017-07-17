/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;

/**
 *
 * @author
 */
@Entity
public class DemandCategoryValidationItem implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private DemandCategoryValidation demandCategoryValidation;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date sysDate;
    @ManyToOne
    private User user;
    private String departement;
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public DemandCategoryValidation getDemandCategoryValidation() {
        return demandCategoryValidation;
    }

    public void setDemandCategoryValidation(DemandCategoryValidation demandCategoryValidation) {
        this.demandCategoryValidation = demandCategoryValidation;
    }

    public Date getSysDate() {
        return sysDate;
    }

    public void setSysDate(Date sysDate) {
        this.sysDate = sysDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDepartement() {
        return departement;
    }

    public void setDepartement(String departement) {
        this.departement = departement;
    }

    @Override
    public String toString() {
        return "DemandCategoryValidationItem{" + "id=" + id + ", demandCategoryValidation=" + demandCategoryValidation + ", sysDate=" + sysDate + ", user=" + user + ", departement=" + departement + '}';
    }

    
}
