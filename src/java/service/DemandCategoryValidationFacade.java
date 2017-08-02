/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryValidation;
import bean.User;
import controler.util.SessionUtil;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author
 */
@Stateless
public class DemandCategoryValidationFacade extends AbstractFacade<DemandCategoryValidation> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @EJB
    private DemandCategoryFacade demandCategoryFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    public DemandCategoryValidationFacade() {
        super(DemandCategoryValidation.class);
    }

    private String findByUserAndDemandCategory(DemandCategory demandCategory, User user) {
        String query = "SELECT v FROM DemandCategoryValidation v WHERE v.demandCategory.id=" + demandCategory.getId();
        if (user != null && user.getLogin() != null) {
            query += " and v.user.login = '" + user.getLogin() + "'";
        }
       // System.out.println("haa query ==> "+query);
        return query;
    }

    public DemandCategoryValidation findByConnectedUserAndDemandCategory(DemandCategory demandCategory) {
        DemandCategoryValidation demandCategoryValidation= getUniqueResult(findByUserAndDemandCategory(demandCategory, SessionUtil.getConnectedUser()));
     //   System.out.println("ha res de validation "+demandCategoryValidation);
        return demandCategoryValidation;
    }

    public List<DemandCategoryValidation> findByDemandCategory(DemandCategory demandCategory) {
        return getMultipleResult(findByUserAndDemandCategory(demandCategory, null));
    }

    public void checkExistanceOrCreate(DemandCategory demandCategory) {
        User user = SessionUtil.getConnectedUser();
        DemandCategoryValidation demandCategoryValidation = findByConnectedUserAndDemandCategory(demandCategory);
        int nbrValidation = 0;
        if (demandCategoryValidation == null) {
            nbrValidation = demandCategory.getNbrTotalValidation() + 1;
            demandCategoryValidation = new DemandCategoryValidation();
            demandCategoryValidation.setDemandCategory(demandCategory);
            demandCategoryValidation.setUser(user);
            demandCategoryValidation.setSysDate(new Date());
            demandCategoryValidation.setDepartement(user.getDepartement());
            create(demandCategoryValidation);
        } else {
            nbrValidation = demandCategory.getNbrTotalValidation() - 1;
            remove(demandCategoryValidation);
        }

        demandCategory.setNbrTotalValidation(nbrValidation);
        demandCategoryFacade.edit(demandCategory);
    }

}
