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
import javax.servlet.http.HttpSession;
import models.Article;
import models.User;
import utility.SessionCookies;

/**
 *
 * @author delli
 */
@WebServlet(name = "Home", urlPatterns = {"/Home"})
public class Home extends HttpServlet {

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
        
        ArrayList<Article> recentArticles = ArticleDAO.GetRecentArticles();
        
        for (Article article : recentArticles){
            article.setArticleMultimedia(MultimediaDAO.GetArticleMultimeda(article.getId(), 'i'));
        }
        
        ArrayList<Article> topArticles = ArticleDAO.GetTopArticles();
        
        for (Article article : topArticles){
            article.setArticleMultimedia(MultimediaDAO.GetArticleMultimeda(article.getId(), 'i'));
        }
        
        // Check if there is logged user
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        if(user == null){
            // If not, try to load it from the cookies
            user = SessionCookies.ReadCookies(request, response);
            if(user != null){
                // If the cookies loaded successfully, set it into the session
                session.setAttribute("user", user);
            }
        }
        
        if(user != null){
            // Check if the logged user is suspended, if true, close session and clear cookies
            User userInfo = UserDAO.GetUserByID(user.getId());
            if(userInfo.getAccountState() == 's'){
                session.invalidate();
                SessionCookies.DeleteCookies(request, response);
            }
        }
        
        request.setAttribute("recentArticles", recentArticles);
        request.setAttribute("topArticles", topArticles);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
