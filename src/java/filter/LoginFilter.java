/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import bean.User;
import java.io.IOException;
import javax.faces.application.ResourceHandler;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author elhazdour
 */
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        boolean resourceRequest = req.getRequestURI().startsWith(req.getContextPath() + "/faces" + ResourceHandler.RESOURCE_IDENTIFIER);
        User user = (User) session.getAttribute("user");
        try {
            if ((session.getAttribute("user") != null && user.getLogin() != null) || req.getRequestURI().endsWith("index.xhtml") || req.getRequestURI().endsWith("/") || resourceRequest) {
                System.out.println("do filter");
                chain.doFilter(request, response);
            } else {
                System.out.println("else filter");
                HttpServletResponse res = (HttpServletResponse) response;
                res.sendRedirect("../index.xhtml");
                return;
            }
        } catch (IOException | ServletException e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {
    }
}
