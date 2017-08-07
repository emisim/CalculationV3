/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.BaukastenPricing;
import bean.Cover;
import bean.UmschlagFarbigkeit;
import bean.UmschlagFarbigkeitElement;
import controler.util.SearchUtil;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class UmschlagFarbigkeitElementFacade extends AbstractFacade<UmschlagFarbigkeitElement> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public List<UmschlagFarbigkeitElement> findByUmschlagFarbigkeitAndCover(UmschlagFarbigkeit umschlagFarbigkeit, Cover cover) {

        String query = "SELECT item FROM UmschlagFarbigkeitElement item WHERE  1=1 ";
        if (cover != null) {
            query += SearchUtil.addConstraint("item", "cover.id", "=", cover.getId());
        } else {
            query += " AND item.cover.id = null";
        }
        if (umschlagFarbigkeit != null) {
            query += SearchUtil.addConstraint("item", "umschlagFarbigkeit.id", "=", umschlagFarbigkeit.getId());
        }
        List<UmschlagFarbigkeitElement> umschlagFarbigkeitElements = getMultipleResult(query);
        if (umschlagFarbigkeitElements == null) {
            return new ArrayList();
        }
        return umschlagFarbigkeitElements;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UmschlagFarbigkeitElementFacade() {
        super(UmschlagFarbigkeitElement.class);
    }

}
