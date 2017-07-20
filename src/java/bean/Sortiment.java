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
import java.util.Objects;
import javax.faces.convert.BigDecimalConverter;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author
 */
@Entity
public class Sortiment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private BigDecimal productSchluessel = new BigDecimal(0);
    private BigDecimal artikelPerPage = new BigDecimal(0);
    private BigDecimal lKSchluessel = new BigDecimal(0);
    private BigDecimal mKSchluessel = new BigDecimal(0);

    @OneToMany(mappedBy = "sortiment")
    private List<SotimentItem> sotimentItems;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<SotimentItem> getSotimentItems() {
        return sotimentItems;
    }

    public void setSotimentItems(List<SotimentItem> sotimentItems) {
        this.sotimentItems = sotimentItems;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getProductSchluessel() {
        return productSchluessel;
    }

    public void setProductSchluessel(BigDecimal productSchluessel) {
        this.productSchluessel = productSchluessel;
    }

    public BigDecimal getArtikelPerPage() {
        return artikelPerPage;
    }

    public void setArtikelPerPage(BigDecimal artikelPerPage) {
        this.artikelPerPage = artikelPerPage;
    }

    public BigDecimal getlKSchluessel() {
        return lKSchluessel;
    }

    public void setlKSchluessel(BigDecimal lKSchluessel) {
        this.lKSchluessel = lKSchluessel;
    }

    public BigDecimal getmKSchluessel() {
        return mKSchluessel;
    }

    public void setmKSchluessel(BigDecimal mKSchluessel) {
        this.mKSchluessel = mKSchluessel;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 73 * hash + Objects.hashCode(this.id);
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
        final Sortiment other = (Sortiment) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return id + "";
    }

}
