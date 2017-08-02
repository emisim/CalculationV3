/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.Sortiment;
import bean.SotimentItem;
import java.math.BigDecimal;
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
public class SotimentItemFacade extends AbstractFacade<SotimentItem> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public SotimentItem clone(SotimentItem sortimentItem, List<SotimentItem> list) {

        SotimentItem clone = new SotimentItem();
        int id = 0;
        try {
            id = list.get(list.size() - 1).getId().intValue() + 1;
        } catch (Exception e) {
        }

        clone.setId(new Long(id));
        clone.setSortiment(sortimentItem.getSortiment());
        clone.setValue(sortimentItem.getValue());
        clone.setWert(sortimentItem.getWert());

        return clone;
    }

    public void save(List<SotimentItem> sotimentItems, DemandCategory demandCategory, boolean simulation, boolean isSave) {

        if (sotimentItems == null || sotimentItems.isEmpty()) {
            return;
        } else if (sotimentItems.size() == 1) {
            sotimentItems.get(0).setWert(new BigDecimal(100));
        }
        for (SotimentItem sotimentItem : sotimentItems) {
          //  System.out.println("settttttteeeeeeeeeegf");
            sotimentItem.setDemandCategory(demandCategory);
            if (!simulation) {
                if (isSave) {
                    create(sotimentItem);
                } else {
                    edit(sotimentItem);
                }
            }
        }
    }

    public List<SotimentItem> findBySortiement(Sortiment sortiment) {
        List<SotimentItem> sotimentItems = new ArrayList<>();
        if (sortiment != null && sortiment.getId() != null) {
           // System.out.println("je suis dans findBySortiement");
            String query = "SELECT s FROM SotimentItem s WHERE s.sortiment.id = " + sortiment.getId();
           // System.out.println(query);
            sotimentItems = em.createQuery(query).getResultList();
        }
        return sotimentItems;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SotimentItemFacade() {
        super(SotimentItem.class);
    }

    public List<SotimentItem> findByDemandeCategory(DemandCategory demandCategory) {

        String requette = "select item from SotimentItem item where item.demandCategory.id = '" + demandCategory.getId() + "'";
        return em.createQuery(requette).getResultList();

    }

    public void delete(List<SotimentItem> detailSotimentItems) {
        
        for (SotimentItem detailSotimentItem : detailSotimentItems) {
            remove(detailSotimentItem);
        }
    
    }

}
