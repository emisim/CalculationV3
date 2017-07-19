/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Departement;
import bean.DepartementCriteria;
import bean.DepartementCriteriaItem;
import controler.util.SearchUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class DepartementCriteriaItemFacade extends AbstractFacade<DepartementCriteriaItem> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public List<DepartementCriteriaItem> findByDepartementCriteria(DepartementCriteria departementCriteria) {
        String query = "SELECT item FROM DepartementCriteriaItem item WHERE 1=1";
        if (departementCriteria != null && departementCriteria.getId() != null) {
            query += SearchUtil.addConstraint("item", "departementCriteria.id", "=", departementCriteria.getId());
        }
        return em.createQuery(query).getResultList();
    }
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DepartementCriteriaItemFacade() {
        super(DepartementCriteriaItem.class);
    }

    
    
}
