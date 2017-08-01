/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controler.util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Younes
 */
public class Downloader extends HttpServlet {
    
    private static String fileName;
    private static String filePath;

    public static String getFileName() {
        return fileName;
    }

    public static void setFileName(String fileName) {
        Downloader.fileName = fileName;
    }

    public static String getFilePath() {
        return filePath;
    }

    public static void setFilePath(String filePath) {
        Downloader.filePath = filePath;
    }
    
    
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(fileName == null || filePath == null){
            response.sendRedirect("../menu/404.xhtml");
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
//        fileName = "download.txt";
//        filePath = "c:\\backup\\";
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

        java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filePath + fileName);

        int i;
        while ((i = fileInputStream.read()) != -1) {
            out.write(i);
        }
        fileInputStream.close();
        out.close();
        fileName = null;
        filePath = null;
    }

}
