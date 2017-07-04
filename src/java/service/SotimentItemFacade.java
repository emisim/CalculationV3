/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.SotimentItem;
import java.math.BigDecimal;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
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

    public void save(DemandCategory demandCategory, boolean simulation) {
        List<SotimentItem> sotimentItems = demandCategory.getSotimentItems();
        if (sotimentItems == null || sotimentItems.isEmpty()) {
            return;
        } else if (sotimentItems.size() == 1) {
            sotimentItems.get(0).setWert(new BigDecimal(100));
        }
        for (SotimentItem sotimentItem : sotimentItems) {
            sotimentItem.setDemandCategory(demandCategory);
            if (!simulation) {
                edit(sotimentItem);
            }
        }
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SotimentItemFacade() {
        super(SotimentItem.class);
    }

}
