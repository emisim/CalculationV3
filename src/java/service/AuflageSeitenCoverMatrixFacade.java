/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Auflage;
import bean.AuflageSeitenCoverMatrix;
import bean.Baukasten;
import bean.Farbigkeit;
import bean.FormatAuswaehlen;
import bean.Seiten;
import controler.util.SearchUtil;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class AuflageSeitenCoverMatrixFacade extends AbstractFacade<AuflageSeitenCoverMatrix> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public AuflageSeitenCoverMatrix findByCriteria(Auflage auflage, Seiten seiten,
            FormatAuswaehlen formatAuswaehlen, Farbigkeit farbigkeit,Baukasten baukasten) {
        if (auflage == null || auflage.getId() == null || seiten == null
                || seiten.getId() == null || formatAuswaehlen == null
                || formatAuswaehlen.getId() == null || farbigkeit == null
                || farbigkeit.getId() == null|| baukasten == null|| baukasten.getId() == null) {
            return null;
        } else {
            String query = "SELECT item FROM AuflageSeitenCoverMatrix item WHERE 1=1";
            query += SearchUtil.addConstraint("item", "auflage.id", "=", auflage.getId());
            query += SearchUtil.addConstraint("item", "seiten.id", "=", seiten.getId());
            query += SearchUtil.addConstraint("item", "formatAuswaehlen.id", "=", formatAuswaehlen.getId());
            query += SearchUtil.addConstraint("item", "farbigkeit.id", "=", farbigkeit.getId());
            query += SearchUtil.addConstraint("item", "baukasten.id", "=", baukasten.getId());
            return getUniqueResult(query);
        }
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AuflageSeitenCoverMatrixFacade() {
        super(AuflageSeitenCoverMatrix.class);
    }

}
