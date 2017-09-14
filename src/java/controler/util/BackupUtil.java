/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler.util;

import java.util.Date;

/**
 *
 * @author 
 */
public class BackupUtil {

    public static void recapDb(String path) {
        Process p = null;
        try {
            Runtime runtime = Runtime.getRuntime();
            
            //WIndows
            //String commande = "C:\\xampp\\mysql\\bin\\mysqldump -u root -p --add-drop-database -B kt_fst_2 -r " + path;
            String commande = "/Applications/MySQLWorkbench.app/Contents/MacOS/mysqldump  -u root -p --add-drop-database -B kt_fst_2 -r" + path;
//            String commande = "C:\\xampp\\mysql\\bin\\mysqldump -uroot --password= --add-drop-database -B taxe_commune_zouani -r " + path;
            System.out.println("commande " + commande);
            p = runtime.exec(commande);
            //change the dbpass and dbname with your dbpass and dbname
            int processComplete = p.waitFor();

            if (processComplete == 0) {
                // save("recapDb.zip","sql\\Filename187-2016.sql");
                System.out.println("Backup created successfully!");

            } else {
                System.out.println("Could not create the backup");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
