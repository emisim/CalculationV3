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
import javax.persistence.ManyToOne;

/**
 *
 * @author
 */
@Entity
public class AuflageSeitenCoverMatrix implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Auflage auflage;
    @ManyToOne
    private Seiten seiten;

    @ManyToOne
    private FormatAuswaehlen formatAuswaehlen;
    @ManyToOne
    private Farbigkeit farbigkeit;
    @ManyToOne
    private Baukasten baukasten;

    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal price;

    public Baukasten getBaukasten() {
        return baukasten;
    }

    public void setBaukasten(Baukasten baukasten) {
        this.baukasten = baukasten;
    }

    public FormatAuswaehlen getFormatAuswaehlen() {
        return formatAuswaehlen;
    }

    public void setFormatAuswaehlen(FormatAuswaehlen formatAuswaehlen) {
        this.formatAuswaehlen = formatAuswaehlen;
    }

    public Farbigkeit getFarbigkeit() {
        return farbigkeit;
    }

    public void setFarbigkeit(Farbigkeit farbigkeit) {
        this.farbigkeit = farbigkeit;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Auflage getAuflage() {
        return auflage;
    }

    public void setAuflage(Auflage auflage) {
        this.auflage = auflage;
    }

    public Seiten getSeiten() {
        return seiten;
    }

    public void setSeiten(Seiten seiten) {
        this.seiten = seiten;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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
        if (!(object instanceof AuflageSeitenCoverMatrix)) {
            return false;
        }
        AuflageSeitenCoverMatrix other = (AuflageSeitenCoverMatrix) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return id + "";
    }

}
