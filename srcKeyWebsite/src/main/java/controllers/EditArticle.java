/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ArticleDAO;
import dao.MultimediaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.Article;
import models.Multimedia;
import models.User;
import utility.FileUtils;
import utility.MultimediaFile;

/**
 *
 * @author delli
 */
@WebServlet(name = "EditArticle", urlPatterns = {"/EditArticle"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 10 * 5)
public class EditArticle extends HttpServlet {

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

        long articleID = Long.parseLong(request.getParameter("articleID"));
        Article currentArticle = ArticleDAO.GetArticleByID(articleID);

        if (currentArticle != null) {
            ArrayList<Multimedia> articleMultimedia = MultimediaDAO.GetArticleMultimeda(articleID);
            currentArticle.setArticleMultimedia(articleMultimedia);
        }

        request.setAttribute("article", currentArticle);

        request.getRequestDispatcher("article-edit-page.jsp").forward(request, response);
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
        User currentUser = (User) session.getAttribute("user");

        long articleID = Long.parseLong(request.getParameter("articleID"));
        Article article = ArticleDAO.GetArticleByID(articleID);

        // If there is no user logged or the user is not the article's author
        if (currentUser == null || article.getAuthor() != currentUser.getId()) {
            response.sendRedirect("Home");
            return;
        }

        // Get the multimedia id's to delete
        String multimediaToDelete = request.getParameter("multimediaToDelete");
        if (multimediaToDelete != null && !multimediaToDelete.isBlank()) {
            // Get ids from string
            String[] IDs = multimediaToDelete.trim().split(",");
            long[] multimediaIDs = new long[IDs.length];
            int index = 0;
            for (String element : IDs) {
                // Parse and store id
                multimediaIDs[index++] = Long.parseLong(element);
            }
            for (long id : multimediaIDs) {
                MultimediaDAO.DeleteMultimedia(id);
            }
        }

        // Add the new multimedia Files
        ArrayList<Part> parts = (ArrayList<Part>) request.getParts();
        ArrayList<MultimediaFile> files = new ArrayList<>();

        for (Part part : parts) {
            String contentType = part.getContentType();
            if (contentType != null) {
                if (FileUtils.GetFileType(contentType).equals("image")) {
                    files.add(FileUtils.UploadImage(part));
                } else if (FileUtils.GetFileType(contentType).equals("video")) {
                    files.add(FileUtils.UploadVideo(part));
                }
            }
        }

        for (MultimediaFile mf : files) {
            if (!mf.getFilePath().isBlank()) {
                ArticleDAO.SetArticleMultimedia(articleID, mf.getFilePath(), mf.getFileType());
            }
        }
        
        // Get text info
        article.setTitle(request.getParameter("title"));
        article.setDescription(request.getParameter("description"));
        article.setBody(request.getParameter("body"));

        // TODO: Get and edit article categories

        // Call the edit article method
        ArticleDAO.EditArticle(article);

        response.sendRedirect("CreatedArticles");
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
