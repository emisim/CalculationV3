/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.DemandCategory;
import bean.DemandCategoryCalculation;
import bean.DemandCategoryValidation;
import bean.DemandCategoryValidationItem;
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
 * @author lcharaf
 */
@Stateless
public class DemandCategoryValidationFacade extends AbstractFacade<DemandCategoryValidation> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    @EJB
    private DemandCategoryValidationItemFacade demandCategoryValidationItemFacade;
    @EJB
    private DemandCategoryFacade demandCategoryFacade;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DemandCategoryValidationFacade() {
        super(DemandCategoryValidation.class);
    }

    public void checkExistanceOrCreate(DemandCategory demandCategory) {
        System.out.println("im in checkExistanceOrCreate before if");
        User user = SessionUtil.getConnectedUser();
        int check = demandCategoryValidationItemFacade.checkUserValidation(demandCategory);
        if (check == 1) {
            System.out.println("unvalidate");
            DemandCategoryValidationItem demandCategoryValidationItem = demandCategoryValidationItemFacade.getValidationItemByDemandAndUser(demandCategory);
            demandCategoryValidationItemFacade.remove(demandCategoryValidationItem);
            int nbrtTotalValidation = demandCategory.getNbrTotalValidation() - 1;
            demandCategory.setNbrTotalValidation(nbrtTotalValidation > 0 ? nbrtTotalValidation : 0);
            demandCategoryFacade.edit(demandCategory);
        } else {
            System.out.println("validate");
            if (demandCategory != null && demandCategory.getId() != null && user != null) {
                System.out.println("im in checkExistanceOrCreate after if");
                List<DemandCategoryValidation> demandCategorys = em.createQuery("SELECT v FROM DemandCategoryValidation v WHERE v.demandCategory.id=" + demandCategory.getId()).getResultList();
                DemandCategoryValidationItem demandCategoryValidationItem = new DemandCategoryValidationItem();
                if (user.getAdmin() == 1) {
                    demandCategoryValidationItem.setDepartement("NONE");
                } else {
                    demandCategoryValidationItem.setDepartement(user.getDepartement().getName());
                }
                demandCategoryValidationItem.setSysDate(new Date());
                demandCategoryValidationItem.setUser(user);
                if (demandCategorys != null && demandCategorys.size() == 1) {
                    demandCategoryValidationItem.setDemandCategoryValidation(demandCategorys.get(0));
                    demandCategoryValidationItemFacade.create(demandCategoryValidationItem);
                    demandCategory.setNbrTotalValidation(demandCategory.getNbrTotalValidation() + 1);
                    demandCategoryFacade.edit(demandCategory);
                } else {
                    DemandCategoryValidation demandCategoryValidation = new DemandCategoryValidation();
                    demandCategoryValidation.setDemandCategory(demandCategory);
                    create(demandCategoryValidation);
                    demandCategoryValidationItem.setDemandCategoryValidation(demandCategoryValidation);
                    demandCategoryValidationItemFacade.create(demandCategoryValidationItem);
                    demandCategory.setNbrTotalValidation(demandCategory.getNbrTotalValidation() + 1);
                    demandCategoryFacade.edit(demandCategory);
                }
            }
        }

    }

}
