/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author
 */
@Entity
public class DemandCategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(mappedBy = "demandCategory")
    private DemandCategoryValidation demandCategoryValidation;

    @ManyToOne
    private Category category;

    @ManyToOne
    private Product product;

    //Sortiment
    @OneToMany(mappedBy = "demandCategory")
    private List<SotimentItem> sotimentItems;

    @ManyToOne
    private Layout layout;

    @ManyToOne
    private Katalogart katalogart;

    @ManyToOne
    private Prozess prozess;

    @ManyToOne
    private Ausgabe ausgabe;

    @ManyToOne
    private Register register;

    // Schlüssel beinhaltet mehrere Keys: Layout Ausgabe....
    @ManyToOne
    private Schluessel Schluessel;

    private int umfang = 0;

    //Seiten
    private int anzahlGesamtSeiten;
    //Druck Seiten
    @ManyToOne
    private Seiten druckSeiten;
    //10% für den ANzahl dere Seiten
    private int percentSeitenFaktor = 10;
    private int anzahlSonderSeiten = 0;
    private int anzahlGenerierungUpdateSeiten = 0;
    private int anzahlIHVZSeiten = 0;
    private int anzahlBestellNrSeiten = 0;

    //Artikel
    private int anzahlGesamtArtikel = 0;
    private int anzahlNeueArtikel = 0;
    private int anzahlBestandArtikel = 0;
    private int anzahlÜbernahmeArtikel = 0;

    //Produkt
    private int anzahlGesamtProdukt = 0;
    private int anzahlNeueProdukt = 0;
    private int anzahlBestandProdukt = 0;

    //Lieferant   
    private int anzahlLieferantGesamt = 0;
    private int anzahlLieferantNeu = 0;

    //Warengruppe Kapitel
    private int anzahlKapitetel = 0;

    private int nbrTotalValidation;

    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal artikelPerPagelFaktor = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal lKSchluesselFaktor = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal mKSchluesselFaktor = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal productSchluesselFaktor = new BigDecimal(0);

    //Aufwand für Allg.Änderung    
    @ManyToOne
    private CorrectionSchluessel correctionSchluessel;

    //ja/nein MitgliederKorrektur && Wec hselfassung && Konzept
    @ManyToOne
    private MitgliederkorrekturFaktor mitgliederkorrekturFaktor;

    @ManyToOne
    private WechselfassungVariantFaktor wechselfassungVariantFaktor;

    //Teilnehmerzahl
    private int teilnehmerZahl = 0; // <=20 ==> teilnehmerZahl=1 || 20<<=35 ==> 1.2 || >35 ==> 35
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal teilnehmerZahlPricing = new BigDecimal(0);
    @ManyToOne
    private ParticipantFaktor participantFaktor;

    //KonzeptbearbeitungFaktor
    @ManyToOne
    private KonzeptbearbeitungFaktor konzeptbearbeitungFaktor;

    //Für den Druck
    private boolean druck = false;

    @ManyToOne
    private FormatAuswaehlen formatAuswaehlen;

    @ManyToOne
    private PapierMaterialAuswaehlen papierMaterialAuswaehlen;

    private int seitenanzahl = 0;
    @ManyToOne
    private Farbigkeit farbigkeit;

    @ManyToOne
    private ArtDerWeiterverarbeitung artDerWeiterverarbeitung;
    @ManyToOne
    private Veredlung veredlung;

    private boolean umschlag;
    @ManyToOne
    private UmschlagPapierAuswaehlen umschlagPapierAuswaehlen;
    @ManyToOne
    private UmschlagFarbigkeit umschlagFarbigkeit;
    @ManyToOne
    private Cover cover;
    @ManyToOne
    private Bindung bindung;
    @ManyToOne
    private Auflage auflage;
    @ManyToOne
    private Baukasten baukasten;
    //Date de Livraisoin
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date liefertermin = new Date();

    //Bearbeitungszeit
    private int bearbeitungszeit = 0;

    //Beteiligten Anzahl die die Initialcosts beinflüssen
    private int anzahlBeteiligten = 0;

    //Mitglieder Anzahl
    private int anzahlMitglieder = 0;

    //Datum falls die einzelne Preise geändert werden
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateDemandCategory = new Date();

    //Berechnete Summen 
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal summDruck = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal summUnitPrice = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal summeGlobal = new BigDecimal(0);

    @OneToMany(mappedBy = "demandCategory")
    private List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations;

    @ManyToOne
    private User user;
    @ManyToOne
    private Departement department;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateSystem = new Date();

    @ManyToOne
    private UmschlagFarbigkeitElement umschlagFarbigkeitElement;
    @ManyToOne
    private Vorspann vorspann;
    @ManyToOne
    private Nachspann nachspann;
    @ManyToOne
    private Nachsatz nachsatz;

    //Druck Pricing
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal nachsatzPricing = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal nachspannPricing = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal vorspannPricing = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal umschlagFarbigkeitElementPricing = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal baukastenPricing = new BigDecimal(0);
    private @Column(columnDefinition = "DECIMAL(10,2)")
    BigDecimal ausgabePricing = new BigDecimal(0);

    public BigDecimal getAusgabePricing() {
        return ausgabePricing;
    }

    public void setAusgabePricing(BigDecimal ausgabePricing) {
        this.ausgabePricing = ausgabePricing;
    }

    public BigDecimal getNachsatzPricing() {
        return nachsatzPricing;
    }

    public void setNachsatzPricing(BigDecimal nachsatzPricing) {
        this.nachsatzPricing = nachsatzPricing;
    }

    public BigDecimal getNachspannPricing() {
        return nachspannPricing;
    }

    public void setNachspannPricing(BigDecimal nachspannPricing) {
        this.nachspannPricing = nachspannPricing;
    }

    public BigDecimal getVorspannPricing() {
        return vorspannPricing;
    }

    public void setVorspannPricing(BigDecimal vorspannPricing) {
        this.vorspannPricing = vorspannPricing;
    }

    public BigDecimal getUmschlagFarbigkeitElementPricing() {
        return umschlagFarbigkeitElementPricing;
    }

    public void setUmschlagFarbigkeitElementPricing(BigDecimal umschlagFarbigkeitElementPricing) {
        this.umschlagFarbigkeitElementPricing = umschlagFarbigkeitElementPricing;
    }

    public BigDecimal getBaukastenPricing() {
        return baukastenPricing;
    }

    public void setBaukastenPricing(BigDecimal baukastenPricing) {
        this.baukastenPricing = baukastenPricing;
    }

    public Vorspann getVorspann() {
        return vorspann;
    }

    public void setVorspann(Vorspann vorspann) {
        this.vorspann = vorspann;
    }

    public Nachspann getNachspann() {
        return nachspann;
    }

    public void setNachspann(Nachspann nachspann) {
        this.nachspann = nachspann;
    }

    public Nachsatz getNachsatz() {
        return nachsatz;
    }

    public void setNachsatz(Nachsatz nachsatz) {
        this.nachsatz = nachsatz;
    }

    public UmschlagFarbigkeitElement getUmschlagFarbigkeitElement() {
        return umschlagFarbigkeitElement;
    }

    public void setUmschlagFarbigkeitElement(UmschlagFarbigkeitElement umschlagFarbigkeitElement) {
        this.umschlagFarbigkeitElement = umschlagFarbigkeitElement;
    }

    public Baukasten getBaukasten() {
        return baukasten;
    }

    public void setBaukasten(Baukasten baukasten) {
        this.baukasten = baukasten;
    }

    public BigDecimal getSummeGlobal() {
        return summeGlobal;
    }

    public void setSummeGlobal(BigDecimal summeGlobal) {
        this.summeGlobal = summeGlobal;
    }

    public BigDecimal getTeilnehmerZahlPricing() {
        return teilnehmerZahlPricing;
    }

    public void setTeilnehmerZahlPricing(BigDecimal teilnehmerZahlPricing) {
        this.teilnehmerZahlPricing = teilnehmerZahlPricing;
    }

    public Seiten getDruckSeiten() {
        return druckSeiten;
    }

    public BigDecimal getArtikelPerPagelFaktor() {
        return artikelPerPagelFaktor;
    }

    public void setArtikelPerPagelFaktor(BigDecimal artikelPerPagelFaktor) {
        this.artikelPerPagelFaktor = artikelPerPagelFaktor;
    }

    public BigDecimal getlKSchluesselFaktor() {
        return lKSchluesselFaktor;
    }

    public void setlKSchluesselFaktor(BigDecimal lKSchluesselFaktor) {
        this.lKSchluesselFaktor = lKSchluesselFaktor;
    }

    public BigDecimal getmKSchluesselFaktor() {
        return mKSchluesselFaktor;
    }

    public void setmKSchluesselFaktor(BigDecimal mKSchluesselFaktor) {
        this.mKSchluesselFaktor = mKSchluesselFaktor;
    }

    public BigDecimal getProductSchluesselFaktor() {
        return productSchluesselFaktor;
    }

    public void setProductSchluesselFaktor(BigDecimal ProductSchluesselFaktor) {
        this.productSchluesselFaktor = ProductSchluesselFaktor;
    }

    public void setDruckSeiten(Seiten druckSeiten) {
        this.druckSeiten = druckSeiten;
    }

    public int getAnzahlGesamtSeiten() {
        return anzahlGesamtSeiten;
    }

    public void setAnzahlGesamtSeiten(int anzahlGesamtSeiten) {
        this.anzahlGesamtSeiten = anzahlGesamtSeiten;
    }

    public Register getRegister() {
        return register;
    }

    public void setRegister(Register register) {
        this.register = register;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Departement getDepartment() {
        return department;
    }

    public void setDepartment(Departement department) {
        this.department = department;
    }

    public Date getDateSystem() {
        return dateSystem;
    }

    public void setDateSystem(Date dateSystem) {
        this.dateSystem = dateSystem;
    }

    public List<DemandCategoryDepartementCalculation> getDemandCategoryDepartementCalculations() {
        return demandCategoryDepartementCalculations;
    }

    public void setDemandCategoryDepartementCalculations(List<DemandCategoryDepartementCalculation> demandCategoryDepartementCalculations) {
        this.demandCategoryDepartementCalculations = demandCategoryDepartementCalculations;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public DemandCategoryValidation getDemandCategoryValidation() {
        if (demandCategoryValidation == null) {
            demandCategoryValidation = new DemandCategoryValidation();
        }
        return demandCategoryValidation;
    }

    public void setDemandCategoryValidation(DemandCategoryValidation demandCategoryValidation) {
        this.demandCategoryValidation = demandCategoryValidation;
    }

    public BigDecimal getSummDruck() {
        return summDruck;
    }

    public void setSummDruck(BigDecimal summDruck) {
        this.summDruck = summDruck;
    }

    public BigDecimal getSummUnitPrice() {
        return summUnitPrice;
    }

    public void setSummUnitPrice(BigDecimal summUnitPrice) {
        this.summUnitPrice = summUnitPrice;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<SotimentItem> getSotimentItems() {
        return sotimentItems;
    }

    public void setSotimentItems(List<SotimentItem> sotimentItems) {
        this.sotimentItems = sotimentItems;
    }

    public Layout getLayout() {
        return layout;
    }

    public void setLayout(Layout layout) {
        this.layout = layout;
    }

    public Katalogart getKatalogart() {
        return katalogart;
    }

    public int getUmfang() {
        return umfang;
    }

    public void setUmfang(int umfang) {
        this.umfang = umfang;
    }

    public void setKatalogart(Katalogart katalogart) {
        this.katalogart = katalogart;
    }

    public Prozess getProzess() {
        return prozess;
    }

    public void setProzess(Prozess prozess) {
        this.prozess = prozess;
    }

    public Ausgabe getAusgabe() {
        return ausgabe;
    }

    public void setAusgabe(Ausgabe ausgabe) {
        this.ausgabe = ausgabe;
    }

    public Schluessel getSchluessel() {
        return Schluessel;
    }

    public void setSchluessel(Schluessel Schluessel) {
        this.Schluessel = Schluessel;
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

    public MitgliederkorrekturFaktor getMitgliederkorrekturFaktor() {
        return mitgliederkorrekturFaktor;
    }

    public void setMitgliederkorrekturFaktor(MitgliederkorrekturFaktor mitgliederkorrekturFaktor) {
        this.mitgliederkorrekturFaktor = mitgliederkorrekturFaktor;
    }

    public WechselfassungVariantFaktor getWechselfassungVariantFaktor() {
        return wechselfassungVariantFaktor;
    }

    public void setWechselfassungVariantFaktor(WechselfassungVariantFaktor wechselfassungVariantFaktor) {
        this.wechselfassungVariantFaktor = wechselfassungVariantFaktor;
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

    public KonzeptbearbeitungFaktor getKonzeptbearbeitungFaktor() {
        return konzeptbearbeitungFaktor;
    }

    public void setKonzeptbearbeitungFaktor(KonzeptbearbeitungFaktor konzeptbearbeitungFaktor) {
        this.konzeptbearbeitungFaktor = konzeptbearbeitungFaktor;
    }

    public boolean isDruck() {
        return druck;
    }

    public void setDruck(boolean druck) {
        this.druck = druck;
    }

    public FormatAuswaehlen getFormatAuswaehlen() {
        return formatAuswaehlen;
    }

    public void setFormatAuswaehlen(FormatAuswaehlen formatAuswaehlen) {
        this.formatAuswaehlen = formatAuswaehlen;
    }

    public PapierMaterialAuswaehlen getPapierMaterialAuswaehlen() {
        return papierMaterialAuswaehlen;
    }

    public void setPapierMaterialAuswaehlen(PapierMaterialAuswaehlen papierMaterialAuswaehlen) {
        this.papierMaterialAuswaehlen = papierMaterialAuswaehlen;
    }

    public int getSeitenanzahl() {
        return seitenanzahl;
    }

    public void setSeitenanzahl(int seitenanzahl) {
        this.seitenanzahl = seitenanzahl;
    }

    public Farbigkeit getFarbigkeit() {
        return farbigkeit;
    }

    public void setFarbigkeit(Farbigkeit farbigkeit) {
        this.farbigkeit = farbigkeit;
    }

    public ArtDerWeiterverarbeitung getArtDerWeiterverarbeitung() {
        return artDerWeiterverarbeitung;
    }

    public void setArtDerWeiterverarbeitung(ArtDerWeiterverarbeitung artDerWeiterverarbeitung) {
        this.artDerWeiterverarbeitung = artDerWeiterverarbeitung;
    }

    public Veredlung getVeredlung() {
        return veredlung;
    }

    public void setVeredlung(Veredlung veredlung) {
        this.veredlung = veredlung;
    }

    public boolean isUmschlag() {
        return umschlag;
    }

    public void setUmschlag(boolean umschlag) {
        this.umschlag = umschlag;
    }

    public UmschlagPapierAuswaehlen getUmschlagPapierAuswaehlen() {
        return umschlagPapierAuswaehlen;
    }

    public void setUmschlagPapierAuswaehlen(UmschlagPapierAuswaehlen umschlagPapierAuswaehlen) {
        this.umschlagPapierAuswaehlen = umschlagPapierAuswaehlen;
    }

    public UmschlagFarbigkeit getUmschlagFarbigkeit() {
        return umschlagFarbigkeit;
    }

    public void setUmschlagFarbigkeit(UmschlagFarbigkeit umschlagFarbigkeit) {
        this.umschlagFarbigkeit = umschlagFarbigkeit;
    }

    public Cover getCover() {
        return cover;
    }

    public void setCover(Cover cover) {
        this.cover = cover;
    }

    public Bindung getBindung() {
        return bindung;
    }

    public void setBindung(Bindung bindung) {
        this.bindung = bindung;
    }

    public Auflage getAuflage() {
        return auflage;
    }

    public void setAuflage(Auflage auflage) {
        this.auflage = auflage;
    }

    public Date getLiefertermin() {
        return liefertermin;
    }

    public void setLiefertermin(Date liefertermin) {
        this.liefertermin = liefertermin;
    }

    public int getBearbeitungszeit() {
        return bearbeitungszeit;
    }

    public void setBearbeitungszeit(int bearbeitungszeit) {
        this.bearbeitungszeit = bearbeitungszeit;
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

    public Date getDateDemandCategory() {
        return dateDemandCategory;
    }

    public void setDateDemandCategory(Date dateDemandCategory) {
        this.dateDemandCategory = dateDemandCategory;
    }

    public int getNbrTotalValidation() {
        return nbrTotalValidation;
    }

    public void setNbrTotalValidation(int nbrTotalValidation) {
        this.nbrTotalValidation = nbrTotalValidation;
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
