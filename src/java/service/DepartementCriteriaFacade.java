/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DepartementCriteria;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author pc&
 */
@Stateless
public class DepartementCriteriaFacade extends AbstractFacade<DepartementCriteria> {
    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DepartementCriteriaFacade() {
        super(DepartementCriteria.class);
    }
    
}
