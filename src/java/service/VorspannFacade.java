/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Vorspann;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author t3500
 */
@Stateless
public class VorspannFacade extends AbstractFacade<Vorspann> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VorspannFacade() {
        super(Vorspann.class);
    }
    
}
