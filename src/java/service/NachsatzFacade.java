/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Cover;
import bean.Nachsatz;
import controler.util.SearchUtil;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author t3500
 */
@Stateless
public class NachsatzFacade extends AbstractFacade<Nachsatz> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public List<Nachsatz> findByCover(Cover cover) {
        String query = "SELECT item FROM Nachsatz item WHERE 1=1 ";
        if (cover != null) {
            SearchUtil.addConstraint("item", "cover.id", "=", cover.getId());
        }
       
        List<Nachsatz> nachsatzs = getMultipleResult(query);
        if (nachsatzs == null ) {
            return new ArrayList();
        }
        return nachsatzs;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NachsatzFacade() {
        super(Nachsatz.class);
    }

}
