/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.Date;

/**
 *
 * @author delli
 */
public class User {
    private long id;
    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String description;
    private String profilePic;
    private int level;
    private char userType;
    private char accountState;
    private Date registrationDate;
    private Date lastConnection;

    public User(long id, String username, String email, String firstName, String lastName, String description, String profilePic, int level, char userType, char accountState, Date registrationDate, Date lastConnection) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.description = description;
        this.profilePic = profilePic;
        this.level = level;
        this.userType = userType;
        this.accountState = accountState;
        this.registrationDate = registrationDate;
        this.lastConnection = lastConnection;
    }

    
    
    public User(String username, String password, String email, String firstName, String lastName) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public User(long id, String username, String firstName, String lastName, char userType, char accountState) {
        this.id = id;
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userType = userType;
        this.accountState = accountState;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public char getUserType() {
        return userType;
    }

    public void setUserType(char userType) {
        this.userType = userType;
    }

    public char getAccountState() {
        return accountState;
    }

    public void setAccountState(char accountState) {
        this.accountState = accountState;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public Date getLastConnection() {
        return lastConnection;
    }

    public void setLastConnection(Date lastConnection) {
        this.lastConnection = lastConnection;
    }
    
}
