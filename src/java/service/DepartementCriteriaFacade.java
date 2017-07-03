/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Departement;
import bean.DepartementCriteria;
import bean.DepartementCriteriaItem;
import bean.DepartementDetail;
import controler.util.SearchUtil;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Younes
 */
@Stateless
public class DepartementCriteriaFacade extends AbstractFacade<DepartementCriteria> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;

    private @EJB
    DepartementCriteriaItemFacade departementCriteriaItemFacade;
    @EJB
    private DepartementFacade departementFacade;

    public List<DepartementCriteria> findDepartementCriteriaWithItemsByDepartement(Departement departement) {
        List<DepartementCriteria> departementCriterias = findByDepartement(departement);
        for (DepartementCriteria departementCriteria : departementCriterias) {
            departementCriteria.setDepartementCriteriaItems(departementCriteriaItemFacade.findByDepartementCriteria(departementCriteria));
        }
        return departementCriterias;
    }

    private List<DepartementCriteria> findByDepartement(Departement departement) {
        String query = "SELECT item FROM DepartementCriteria item WHERE 1=1";
        if (departement != null && departement.getId() != null) {
            query += SearchUtil.addConstraint("item", "departement.id", "=", departement.getId());
        }
        return em.createQuery(query).getResultList();
    }

    public List<DepartementDetail> detailDepartement(Departement departement) {

        List<DepartementDetail> departementDetails = new ArrayList<>();
        List<DepartementCriteria> departementCriterias = findDepartementCriteriaWithItemsByDepartement(departement);

        for (DepartementCriteria departementCriteria : departementCriterias) {
            for (DepartementCriteriaItem departementCriteriaItem : departementCriteria.getDepartementCriteriaItems()) {
                DepartementDetail departementDetail = new DepartementDetail();
                departementDetail.setNomDepCritera(departementCriteria.getName());
                departementDetail.setDescrDepCriteriaItem(departementCriteriaItem.getDescription());
                departementDetail.setArithmitiqueExpresionForUnitePrice(departementCriteriaItem.getArithmitiqueExpresionForUnitePrice());
                departementDetail.setArithmitiqueExpresionForGlobalPrice(departementCriteriaItem.getArithmitiqueExpresionForGlobalPrice());
                departementDetails.add(departementDetail);
            }
        }

        return departementDetails;
    }

    public List<List<DepartementDetail>> allDetailDepartements() {
        List<Departement> departements = departementFacade.findAll();
        List<List<DepartementDetail>> departementDetails = new ArrayList<>();
        for (Departement departement : departements) {
            departementDetails.add(detailDepartement(departement));
        }
        return departementDetails;
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DepartementCriteriaFacade() {
        super(DepartementCriteria.class);
    }

}
