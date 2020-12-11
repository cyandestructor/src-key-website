/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ArticleDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Article;
import models.Category;
import models.User;

/**
 *
 * @author delli
 */
@WebServlet(name = "SubmitArticle", urlPatterns = {"/SubmitArticle"})
public class SubmitArticle extends HttpServlet {

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
        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String body = request.getParameter("body");
        
        HttpSession session = request.getSession();
        User currentUser = (User)session.getAttribute("user");
        if (currentUser != null){
            long author = currentUser.getId();
            
            Article article = new Article(title, description, body, author);
            int articleID = ArticleDAO.SubmitArticle(article);
            if(articleID >= 0){
                String categoriesString = request.getParameter("categories");
                String[] categoryList = categoriesString.trim().split(",");
                for(String category : categoryList){
                    long ctgID = CategoryDAO.RegisterCategory(new Category(category));
                    if(ctgID > 0){
                        ArticleDAO.SetArticleCategory(articleID, ctgID);
                    }
                }
            }
            
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
