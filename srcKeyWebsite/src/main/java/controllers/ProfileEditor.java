/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import models.User;

/**
 *
 * @author delli
 */
@WebServlet(name = "ProfileEditor", urlPatterns = {"/ProfileEditor"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 25)
public class ProfileEditor extends HttpServlet {

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
        
        HttpSession session = request.getSession();
        User currentUser = (User)session.getAttribute("user");
        
        if(currentUser != null){
            long userID = currentUser.getId();
            User user = UserDAO.GetUserByID(userID);
            request.setAttribute("user", user);
        }
        
        request.getRequestDispatcher("profile-editor.jsp").forward(request, response);
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
        
        if (currentUser != null) {
            long userID = currentUser.getId();
            
            Part profilePic = request.getPart("profilePic");

            if (profilePic != null && profilePic.getSize() > 0) {

                File fileSaveDir = new File(utility.FileUtils.RUTE_USER_IMAGE);
                if (!fileSaveDir.exists()) {
                    fileSaveDir.mkdirs();
                }

                String contentType = profilePic.getContentType();
                String nameImage = profilePic.getName() + System.currentTimeMillis() + utility.FileUtils.GetExtension(contentType);
                File imageFile = new File(fileSaveDir, nameImage);
                String fullPath = imageFile.toPath().toString();
                profilePic.write(fullPath);
                
                UserDAO.SetUserProfilePic(userID, nameImage);
            }

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("userEmail");
            String description = request.getParameter("userDescription");
            
            User user = new User(userID, email, firstName, lastName, description);
            
            UserDAO.EditUser(user);
            
            response.sendRedirect("Profile?userId=" + Long.toString(userID));
            return;
        }
        
        response.sendRedirect("Home");
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
