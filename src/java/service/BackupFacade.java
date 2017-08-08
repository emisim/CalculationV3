/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Backup;
import controler.util.BackupUtil;
import controler.util.CreateFileUtil;
import controler.util.DateUtil;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author 
 */
@Stateless
public class BackupFacade extends AbstractFacade<Backup> {

    @PersistenceContext(unitName = "kt_FST_2PU")
    private EntityManager em;
//    private CreateFileUtil createFileUtil;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public BackupFacade() {
        super(Backup.class);
    }

    public void addBackup(String path) {
        System.out.println("ha 2");
        Backup b = prepareBackUp(path);
        create(b);
        long nbrEnregistrements = (long) em.createQuery("SELECT count( b.id ) from Backup b").getSingleResult();
        System.out.println("count le nombre d'enregistrement " + nbrEnregistrements);
        if (nbrEnregistrements > 30) {
            List<Backup> backups = em.createQuery("SELECT b FROM Backup b ORDER BY b.id").setMaxResults(1).getResultList();
            if (backups != null && !backups.isEmpty() && backups.get(0) != null) {
                em.createQuery("DELETE FROM Backup b WHERE b.id = " + backups.get(0).getId()).executeUpdate();
            }
        }
    }
    
    private Backup prepareBackUp(String path){
        System.out.println("ha 3");
        Date dateBackup = new Date();
        String nom = DateUtil.formateDate("yyyy-MM-dd", dateBackup) + ".sql";
        int annee = dateBackup.getYear() + 1900;
        int mois = dateBackup.getMonth()+1;
        String path1 = path + annee +"\\" + mois;
        String backup = path + annee + "\\" + mois + "\\" +nom;
        System.out.println("haa chemin "+backup);
        Backup b = new Backup(nom, dateBackup);
        System.out.println("ha backup "+backup.toString());
        try {
            CreateFileUtil.createBackUp(path1);
        } catch (Exception ex) {
            System.out.println("************* mochkiiill f création *********");
            Logger.getLogger(BackupFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
        BackupUtil.recapDb(backup);
//        controler.util.BackupUtil.recapDb("C:\\backup\\"+nom);
        return b;
    }


}
