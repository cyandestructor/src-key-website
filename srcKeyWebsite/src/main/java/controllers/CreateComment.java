/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CommentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Comment;
import models.User;

/**
 *
 * @author delli
 */
@WebServlet(name = "CreateComment", urlPatterns = {"/CreateComment"})
public class CreateComment extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

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
        
        HttpSession session = request.getSession();
        User currentUser = (User)session.getAttribute("user");
        
        Long articleID = Long.parseLong(request.getParameter("articleID"));
        String bodyText = request.getParameter("commentBody");
        
        String editor = request.getParameter("editor");
        
        if(currentUser != null){
            Comment comment = new Comment(bodyText);
            if(editor != null){
                CommentDAO.CreateEditorComment(comment, articleID, currentUser.getId());
            }
            else{
                CommentDAO.CreateComment(comment, articleID, currentUser.getId());
            }
        }
        else{
            Comment comment = new Comment(bodyText);
            String altUsername = request.getParameter("altUsername");
            CommentDAO.CreateGuestComment(comment, articleID, altUsername);
        }
        
        response.sendRedirect(request.getHeader("referer"));
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
