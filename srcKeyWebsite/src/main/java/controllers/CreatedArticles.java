/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ArticleDAO;
import dao.MultimediaDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Article;
import models.User;

/**
 *
 * @author delli
 */
@WebServlet(name = "CreatedArticles", urlPatterns = {"/CreatedArticles"})
public class CreatedArticles extends HttpServlet {

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
        
        ArrayList<Article> articles = new ArrayList<Article>();
        User user = (User)request.getSession().getAttribute("user");
        
        if (user != null){
            articles = ArticleDAO.GetUserArticles(user.getId());
        }
        
        for (Article article : articles){
            article.setArticleMultimedia(MultimediaDAO.GetArticleMultimeda(article.getId(), 'i'));
            article.setAuthorName(UserDAO.GetUserFullName(article.getAuthor()));
        }
        
        request.setAttribute("articles", articles);
        
        request.getRequestDispatcher("created-articles.jsp").forward(request, response);
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
