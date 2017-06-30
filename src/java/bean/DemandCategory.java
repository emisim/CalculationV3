/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;

/**
 *
 * @author lcharaf
 */
@Entity
public class DemandCategory implements Serializable {
   

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    //Seiten
    private int anzahlGesamtSeiten;
    //10% für den ANzahl dere Seiten
    private int percentSeitenFaktor = 10;
    private int anzahlSonderSeiten;
    private int anzahlGenerierungUpdateSeiten;
    private int anzahlIHVZSeiten;
    private int anzahlBestellNrSeiten;
    
    //Artikel
    private int anzahlGesamtArtikel;
    private int anzahlNeueArtikel;
    private int anzahlBestandArtikel;
    private int anzahlÜbernahmeArtikel;
   
    //Produkt
    private int anzahlGesamtProdukt;
    private int anzahlNeueProdukt;
    private int anzahlBestandProdukt;
 
    //Lieferant   
    private int anzahlLieferantGesamt;
    private int anzahlLieferantNeu;
    
    //Warengruppe Kapitel
    private int anzahlKapitetel;
    
    //Bearbeitungszeit
    private int bearbeitungszeit;
    
    //Beteiligten Anzahl 
    private int anzahlBeteiligten;
    
    //Mitglieder Anzahl
    private int anzahlMitglieder;
    
    //Sortiment
    @ManyToOne
    private Sortiment sortiment;
    
    //Datum falls die einzelne Preise geändert werden
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateDemandCategory;  

    public Date getDateDemandCategory() {
        return dateDemandCategory;
    }

    public void setDateDemandCategory(Date dateDemandCategory) {
        this.dateDemandCategory = dateDemandCategory;
    }
    
    
    
    @ManyToOne
    private Category category;
    
    @ManyToOne
    private CorrectionSchluessel correctionSchluessel;
    
    private int teilnehmerZahl;
    @ManyToOne
    private ParticipantFaktor participantFaktor;
    
    @ManyToOne
    private Schluessel Schluessel;
    
    private int anzahlProduktGesamt;

    public Sortiment getSortiment() {
        
        if(sortiment == null)
            sortiment = new Sortiment();
        return sortiment;
    }

    public void setSortiment(Sortiment sortiment) {
        this.sortiment = sortiment;
    }

    public int getAnzahlBeteiligten() {
        return anzahlBeteiligten;
    }

    public void setAnzahlBeteiligten(int anzahlBeteiligten) {
        this.anzahlBeteiligten = anzahlBeteiligten;
    }

    public int getAnzahlMitglieder() {
        return anzahlMitglieder;
    }

    public void setAnzahlMitglieder(int anzahlMitglieder) {
        this.anzahlMitglieder = anzahlMitglieder;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getBearbeitungszeit() {
        return bearbeitungszeit;
    }

    public void setBearbeitungszeit(int bearbeitungszeit) {
        this.bearbeitungszeit = bearbeitungszeit;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getAnzahlGesamtSeiten() {
        return anzahlGesamtSeiten;
    }

    public void setAnzahlGesamtSeiten(int anzahlGesamtSeiten) {
        this.anzahlGesamtSeiten = anzahlGesamtSeiten;
    }

    public int getPercentSeitenFaktor() {
        return percentSeitenFaktor;
    }

    public void setPercentSeitenFaktor(int percentSeitenFaktor) {
        this.percentSeitenFaktor = percentSeitenFaktor;
    }

    public int getAnzahlSonderSeiten() {
        return anzahlSonderSeiten;
    }

    public void setAnzahlSonderSeiten(int anzahlSonderSeiten) {
        this.anzahlSonderSeiten = anzahlSonderSeiten;
    }

    public int getAnzahlGenerierungUpdateSeiten() {
        return anzahlGenerierungUpdateSeiten;
    }

    public void setAnzahlGenerierungUpdateSeiten(int anzahlGenerierungUpdateSeiten) {
        this.anzahlGenerierungUpdateSeiten = anzahlGenerierungUpdateSeiten;
    }

    public int getAnzahlIHVZSeiten() {
        return anzahlIHVZSeiten;
    }

    public void setAnzahlIHVZSeiten(int anzahlIHVZSeiten) {
        this.anzahlIHVZSeiten = anzahlIHVZSeiten;
    }

    public int getAnzahlBestellNrSeiten() {
        return anzahlBestellNrSeiten;
    }

    public void setAnzahlBestellNrSeiten(int anzahlBestellNrSeiten) {
        this.anzahlBestellNrSeiten = anzahlBestellNrSeiten;
    }

    public int getAnzahlGesamtArtikel() {
        return anzahlGesamtArtikel;
    }

    public void setAnzahlGesamtArtikel(int anzahlGesamtArtikel) {
        this.anzahlGesamtArtikel = anzahlGesamtArtikel;
    }

    public int getAnzahlNeueArtikel() {
        return anzahlNeueArtikel;
    }

    public void setAnzahlNeueArtikel(int anzahlNeueArtikel) {
        this.anzahlNeueArtikel = anzahlNeueArtikel;
    }

    public int getAnzahlBestandArtikel() {
        return anzahlBestandArtikel;
    }

    public void setAnzahlBestandArtikel(int anzahlBestandArtikel) {
        this.anzahlBestandArtikel = anzahlBestandArtikel;
    }

    public int getAnzahlÜbernahmeArtikel() {
        return anzahlÜbernahmeArtikel;
    }

    public void setAnzahlÜbernahmeArtikel(int anzahlÜbernahmeArtikel) {
        this.anzahlÜbernahmeArtikel = anzahlÜbernahmeArtikel;
    }

    public int getAnzahlGesamtProdukt() {
        return anzahlGesamtProdukt;
    }

    public void setAnzahlGesamtProdukt(int anzahlGesamtProdukt) {
        this.anzahlGesamtProdukt = anzahlGesamtProdukt;
    }

    public int getAnzahlNeueProdukt() {
        return anzahlNeueProdukt;
    }

    public void setAnzahlNeueProdukt(int anzahlNeueProdukt) {
        this.anzahlNeueProdukt = anzahlNeueProdukt;
    }

    public int getAnzahlBestandProdukt() {
        return anzahlBestandProdukt;
    }

    public void setAnzahlBestandProdukt(int anzahlBestandProdukt) {
        this.anzahlBestandProdukt = anzahlBestandProdukt;
    }

    public int getAnzahlLieferantGesamt() {
        return anzahlLieferantGesamt;
    }

    public void setAnzahlLieferantGesamt(int anzahlLieferantGesamt) {
        this.anzahlLieferantGesamt = anzahlLieferantGesamt;
    }

    public int getAnzahlLieferantNeu() {
        return anzahlLieferantNeu;
    }

    public void setAnzahlLieferantNeu(int anzahlLieferantNeu) {
        this.anzahlLieferantNeu = anzahlLieferantNeu;
    }

    public int getAnzahlKapitetel() {
        return anzahlKapitetel;
    }

    public void setAnzahlKapitetel(int anzahlKapitetel) {
        this.anzahlKapitetel = anzahlKapitetel;
    }

    public CorrectionSchluessel getCorrectionSchluessel() {
        return correctionSchluessel;
    }

    public void setCorrectionSchluessel(CorrectionSchluessel correctionSchluessel) {
        this.correctionSchluessel = correctionSchluessel;
    }

    public int getTeilnehmerZahl() {
        return teilnehmerZahl;
    }

    public void setTeilnehmerZahl(int teilnehmerZahl) {
        this.teilnehmerZahl = teilnehmerZahl;
    }

    public ParticipantFaktor getParticipantFaktor() {
        return participantFaktor;
    }

    public void setParticipantFaktor(ParticipantFaktor participantFaktor) {
        this.participantFaktor = participantFaktor;
    }

    public Schluessel getSchluessel() {
        return Schluessel;
    }

    public void setSchluessel(Schluessel Schluessel) {
        this.Schluessel = Schluessel;
    }

    public int getAnzahlProduktGesamt() {
        return anzahlProduktGesamt;
    }

    public void setAnzahlProduktGesamt(int anzahlProduktGesamt) {
        this.anzahlProduktGesamt = anzahlProduktGesamt;
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
        if (!(object instanceof DemandCategory)) {
            return false;
        }
        DemandCategory other = (DemandCategory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "bean.DemandCategory[ id=" + id + " ]";
    }
    
}
