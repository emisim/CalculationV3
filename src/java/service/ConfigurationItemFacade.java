/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.ConfigurationItem;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class ConfigurationItemFacade extends AbstractFacade<ConfigurationItem> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public ConfigurationItem findByName(String name) {
        return (ConfigurationItem) em.createQuery("SELECT item FROM ConfigurationItem item WHERE item.name='" + name + "'").getSingleResult();
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ConfigurationItemFacade() {
        super(ConfigurationItem.class);
    }

}
