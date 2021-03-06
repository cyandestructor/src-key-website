/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import utility.SessionCookies;

/**
 *
 * @author delli
 */
@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("logUsername");
        String password = request.getParameter("logPassword");
        boolean rememberAccount = request.getParameter("rememberAccount") != null;
        
        User user = UserDAO.LogIn(username, password);
        
        if(user != null){
            if(user.getAccountState() != 's'){
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                
                if(rememberAccount){
                    // Generate cookies
                    SessionCookies cookies = new SessionCookies(user);
                    cookies.GenCookies(request, response);
                }

                response.sendRedirect("Home");
            }
            else{
                response.sendRedirect("suspended-account.jsp");
            }
        }
        else{
            response.sendRedirect("registration.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
