/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

/**
 *
 * @author delli
 */
public class SessionCookies {
    private final User user;
    private final String path;

    public SessionCookies(User user) {
        this.user = user;
        this.path = "Home";
    }

    public SessionCookies(User user, String path) {
        this.user = user;
        this.path = path;
    }
    
    public void GenCookies(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = new Cookie[6];
        
        cookies[0] = new Cookie("userID", Long.toString(this.user.getId()));
        cookies[1] = new Cookie("username", this.user.getUsername());
        cookies[2] = new Cookie("firstname", this.user.getFirstName());
        cookies[3] = new Cookie("lastname", this.user.getLastName());
        cookies[4] = new Cookie("userType", Character.toString(this.user.getUserType()));
        cookies[5] = new Cookie("accountState", Character.toString(this.user.getAccountState()));
        
        for(Cookie cookie : cookies){
            cookie.setMaxAge(60 * 60 * 24 * 7); // Cookie lifetime: 7 days
            cookie.setPath(this.path);
            response.addCookie(cookie);
        }
    }
    
    public static void DeleteCookies(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cookies = request.getCookies();
        
        for(Cookie cookie : cookies){
            switch(cookie.getName()){
                case "userID":
                case "username":
                case "firstname":
                case "lastname":
                case "userType":
                case "accountState":
                    // Delete the cookie
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                    break;
            }
        }
    }
    
    public static User ReadCookies(HttpServletRequest request, HttpServletResponse response){
        long userID = 0;
        String username = "";
        String firstname = "";
        String lastname = "";
        char userType = 'i';
        char accountState = 'i';
        
        Cookie[] cookies = request.getCookies();
        if(cookies == null || cookies.length <= 0)
            return null;
        
        int totalInfo = 0;
        for(Cookie cookie : cookies){
            switch(cookie.getName()){
                case "userID":
                    userID = Long.parseLong(cookie.getValue());
                    totalInfo++;
                    break;
                case "username":
                    username = cookie.getValue();
                    totalInfo++;
                    break;
                case "firstname":
                    firstname = cookie.getValue();
                    totalInfo++;
                    break;
                case "lastname":
                    lastname = cookie.getValue();
                    totalInfo++;
                    break;
                case "userType":
                    userType = cookie.getValue().charAt(0);
                    totalInfo++;
                    break;
                case "accountState":
                    accountState = cookie.getValue().charAt(0);
                    totalInfo++;
                    break;
            }
        }
        
        if(totalInfo != 6)
            return null;
        
        return new User(userID, username, firstname, lastname, userType, accountState);
    }
}
