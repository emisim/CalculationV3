
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.Departement;
import bean.User;
import controler.util.AccessDepartement;
import controler.util.JsfUtil;
import controler.util.SearchUtil;
import controler.util.SessionUtil;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.script.ScriptException;

/**
 *
 * @author lcharaf
 */
@Stateless
public class DemandCategoryFacade extends AbstractFacade<DemandCategory> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB
    SotimentItemFacade sotimentItemFacade;
    private @EJB
    DemandCategoryDepartementCalculationFacade demandCategoryDepartementCalculationFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public void save(DemandCategory demandCategory, Departement departement, boolean simulation) throws ScriptException {
        if (!demandCategory.isDruck()) {
            demandCategory.setFormatAuswaehlen(null);
            demandCategory.setPapierMaterialAuswaehlen(null);
            demandCategory.setSeitenanzahl(0);
            demandCategory.setFarbigkeit(null);
            demandCategory.setArtDerWeiterverarbeitung(null);
            demandCategory.setVeredlung(null);
            demandCategory.setVeredlung(null);
            demandCategory.setUmschlag(false);
            demandCategory.setCover(null);
            demandCategory.setBindung(null);
            demandCategory.setAuflage(null);
            demandCategory.setBearbeitungszeit(0);
            demandCategory.setAnzahlBeteiligten(0);
            demandCategory.setAnzahlMitglieder(0);
            demandCategory.setSummDruck(new BigDecimal(0));
        }
        if (!demandCategory.isUmschlag()) {
            demandCategory.setUmschlagPapierAuswaehlen(null);
            demandCategory.setUmschlagFarbigkeit(null);
        }

        //demandCategory.setId(generate("DemandCategory", "id"));
        if (!simulation) {
            edit(demandCategory);
        }
        sotimentItemFacade.save(demandCategory, simulation);
        demandCategoryDepartementCalculationFacade.save(demandCategory, departement, simulation);

    }

    public List<DemandCategory> search(DemandCategory demandCategory) {
        List<DemandCategory> demandCategorys = new ArrayList<>();
        String query = "SELECT d from DemandCategory d WHERE 1=1";
        if (demandCategory != null) {
            if (demandCategory.getProduct() != null) {
                query += SearchUtil.addConstraint("d", "product.id", "=", demandCategory.getProduct().getId());
            }
            if (demandCategory.getCategory() != null) {
                query += SearchUtil.addConstraint("d", "category.id", "=", demandCategory.getCategory().getId());
            }
            if (demandCategory.getCorrectionSchluessel() != null) {
                query += SearchUtil.addConstraint("d", "correctionSchluessel.id", "=", demandCategory.getCorrectionSchluessel().getId());
            }
            if (demandCategory.getMitgliederkorrekturFaktor() != null) {
                query += SearchUtil.addConstraint("d", "mitgliederkorrekturFaktor.id", "=", demandCategory.getMitgliederkorrekturFaktor().getId());
            }
            if (demandCategory.getWechselfassungVariantFaktor() != null) {
                query += SearchUtil.addConstraint("d", "wechselfassungVariantFaktor.id", "=", demandCategory.getWechselfassungVariantFaktor().getId());
            }
            if (demandCategory.getParticipantFaktor() != null) {
                query += SearchUtil.addConstraint("d", "participantFaktor.id", "=", demandCategory.getParticipantFaktor().getId());
            }
            if (demandCategory.getKonzeptbearbeitungFaktor() != null) {
                query += SearchUtil.addConstraint("d", "konzeptbearbeitungFaktor.id", "=", demandCategory.getKonzeptbearbeitungFaktor().getId());
            }
        }
        demandCategorys = em.createQuery(query).getResultList();
        if (demandCategorys.isEmpty()) {
            JsfUtil.addErrorMessage("Aucun résultat trouvé");
        }

        return demandCategorys;
    }

    public DemandCategoryFacade() {
        super(DemandCategory.class);
    }

    public boolean renderAttribute(String attribute) {
        User user = SessionUtil.getConnectedUser();
        Departement dep = user.getDepartement();

        if (user.getAdmin() == 1) {
            return true;
        } else {
            if (dep.getName().equals("contentManagement")) {
                if (AccessDepartement.getContentManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("datenManagement")) {
                if (AccessDepartement.getDatenManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("databasePublishing")) {
                if (AccessDepartement.getDatabasePublishingMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("projectManagement")) {
                if (AccessDepartement.getProjectManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            return false;

        }
    }
    
    public boolean renderAttributeForList(String attribute) {
        User user = SessionUtil.getConnectedUser();
        Departement dep = user.getDepartement();

        if (user.getAdmin() == 1) {
            
                if (AccessDepartement.getAdminMap().containsKey(attribute)) {
                    return true;
                }
            
        } else {
            if (dep.getName().equals("contentManagement")) {
                if (AccessDepartement.getContentManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("datenManagement")) {
                if (AccessDepartement.getDatenManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("databasePublishing")) {
                if (AccessDepartement.getDatabasePublishingMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("projectManagement")) {
                if (AccessDepartement.getProjectManagementMap().containsKey(attribute)) {
                    return true;
                }
            }


        }
        return false;
    }

}
