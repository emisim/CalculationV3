
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
import controler.util.SessionUtil;
import java.math.BigDecimal;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author lcharaf
 */
@Stateless
public class DemandCategoryFacade extends AbstractFacade<DemandCategory> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @EJB
    SotimentItemFacade sotimentItemFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public void save(DemandCategory demandCategory, boolean simulation) {
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

        
        demandCategory.setId(generate("DemandCategory", "id"));
        if (!simulation) {
            create(demandCategory);
        }
        sotimentItemFacade.save(demandCategory, simulation);

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

}
