/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.ArtDerWeiterverarbeitung;
import bean.Departement;
import bean.User;
import controler.util.AccessDepartement;
import controler.util.SessionUtil;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class AccessFacade extends AbstractFacade<ArtDerWeiterverarbeitung> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    public AccessFacade() {
        super(ArtDerWeiterverarbeitung.class);
    }

    
     public boolean isAdminOrInTheSameDepartement(User user,String departementName) {
         if(user.getAdmin()==1)
             return true;
         else if(user.getDepartement() != null && user.getDepartement().getName().equals(departementName)){
             System.out.println("ha dep ==> "+departementName);
             return true;
         }
         return false;
     }
     public boolean renderAttribute(String attribute) {
        User user = SessionUtil.getConnectedUser();
        Departement dep = user.getDepartement();

        if (user.getAdmin() == 1) {
            return true;
        } else {
            if (dep.getName().equals("Content Management")) {
                if (AccessDepartement.getContentManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("Daten Management")) {
                if (AccessDepartement.getDatenManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("Database Publishing ")) {
                if (AccessDepartement.getDatabasePublishingMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("Project Management")) {
                if (AccessDepartement.getProjectManagementMap().containsKey(attribute)) {
                    return true;
                }
            }
            
            if (dep.getName().equals("Asset Management")) {
                if (AccessDepartement.getAssetManagementMap().containsKey(attribute)){
                    return true;
                }
            }
            
            if (dep.getName().equals("Media IT")) {
                if (AccessDepartement.getMediaITMap().containsKey(attribute)){
                    return true;
                }
            }
            return false;

        }
    }

    public boolean renderAttributeForList(String attribute) {
        User user = SessionUtil.getConnectedUser();
        Departement dep = user.getDepartement();

        if (user.getAdmin() == 1) {
            if (AccessDepartement.getAdminMap().containsKey( attribute)) {
                return true;
            }
        } else {
            if (dep.getName().equals("Content Management")) {
                if (AccessDepartement.getContentManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("Daten Management")) {
                if (AccessDepartement.getDatenManagementMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("Database Publishing")) {
                if (AccessDepartement.getDatabasePublishingMap().containsKey(attribute)) {
                    return true;
                }
            }

            if (dep.getName().equals("Project Management")) {
                if (AccessDepartement.getProjectManagementMap().containsKey(attribute)) {
                    return true;
                }
            }
            if (dep.getName().equals("Asset Management")) {
                if (AccessDepartement.getAssetManagementMap().containsKey(attribute)) {
                    return true;
                }
            }
            
            if (dep.getName().equals("Media IT")) {
                if (AccessDepartement.getMediaITMap().containsKey(attribute)) {
                    return true;
                }
            }
            

        }
        return false;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

   

}
