/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Younes
 */
@Entity
public class TeilnehmerZahlPricing implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Integer teilnehmerZahlMin;
    private String teilnehmerZahlMinOperator;
    private Integer teilnehmerZahlMax;
    private String teilnehmerZahlMaxOperator;
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal price = new BigDecimal(0);

    public String getTeilnehmerZahlMinOperator() {
        return teilnehmerZahlMinOperator;
    }

    public void setTeilnehmerZahlMinOperator(String teilnehmerZahlMinOperator) {
        this.teilnehmerZahlMinOperator = teilnehmerZahlMinOperator;
    }

    public String getTeilnehmerZahlMaxOperator() {
        return teilnehmerZahlMaxOperator;
    }

    public void setTeilnehmerZahlMaxOperator(String teilnehmerZahlMaxOperator) {
        this.teilnehmerZahlMaxOperator = teilnehmerZahlMaxOperator;
    }

    public Integer getTeilnehmerZahlMin() {
        return teilnehmerZahlMin;
    }

    public void setTeilnehmerZahlMin(Integer teilnehmerZahlMin) {
        this.teilnehmerZahlMin = teilnehmerZahlMin;
    }

    public Integer getTeilnehmerZahlMax() {
        return teilnehmerZahlMax;
    }

    public void setTeilnehmerZahlMax(Integer teilnehmerZahlMax) {
        this.teilnehmerZahlMax = teilnehmerZahlMax;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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
        if (!(object instanceof TeilnehmerZahlPricing)) {
            return false;
        }
        TeilnehmerZahlPricing other = (TeilnehmerZahlPricing) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.TeilnehmerZahlPricing[ id=" + id + " ]";
    }

}
