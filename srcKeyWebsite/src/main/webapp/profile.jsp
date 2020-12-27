<%-- 
    Document   : profile
    Created on : 10 dic 2020, 14:49:05
    Author     : delli
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Article"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) request.getAttribute("user");
    User currentUser = (User) request.getSession().getAttribute("user");
    
    ArrayList<Article> userArticles = (ArrayList<Article>) request.getAttribute("userArticles");
    if (userArticles == null) {
        userArticles = new ArrayList<Article>();
    }
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Almendra:wght@700&family=Open+Sans:wght@400;700&display=swap"
              rel="stylesheet">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <link rel="stylesheet" href="styles/desktop-home.css">
        <link rel="stylesheet" href="styles/profile.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="shortcut icon" href="assets/img/src-key-logo-dark.svg" type="image/x-icon">
        <title>src key - development and programming news</title>
    </head>

    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="page-container page-background bg-dark-page"">
            <div class=" page-content mx-auto py-4 bg-white">
                <div class="container">
                    <!-- User banner -->
                    <div class="row">
                        <div class="col-12">
                            <img src="assets/img/user-banner-sample.jpg" alt="user banner" class="user-banner">
                        </div>
                    </div>
                    <!-- User info and activity -->
                    <div class="row my-3">
                        <!-- Info -->
                        <div class="col-12 col-md-3 user-info bg-dark-secondary">
                            <%
                                if (!user.getProfilePic().isBlank()) {
                            %>
                            <div class="user-profile-pic">
                                <img src="/images/<%= user.getProfilePic()%>" alt="user profile picture">
                            </div>
                            <%
                            } else {
                            %>
                            <div class="user-profile-pic">
                                <img src="assets/img/user-propic-default-1.png" alt="user profile picture">
                            </div>
                            <%
                                }
                            %>
                            <!-- User name + lastname -->
                            <h2><%= user.getFirstName() + " " + user.getLastName()%></h2>
                            <h3><%= user.getUsername()%></h3>
                            <span style="font-weight: bold;">Level: </span><span id="userLevel"><%= user.getLevel()%></span>
                            <span style="font-weight: bold;">Contributions: </span><span id="userContributions"><%= userArticles.size()%></span>
                            <div style="font-weight: bold;">About:</div>
                            <p id="userDescription" class="mb-2">
                                <%= user.getDescription().isBlank() ? "Nothing yet" : user.getDescription()%>
                            </p>
                            <%
                                if (currentUser != null) {
                                    if (currentUser.getId() == user.getId()) {
                            %>
                            <a href="ProfileEditor" class="btn btn-sm site-btn-primary">Edit profile</a>
                            <%
                                    }
                                }
                            %>
                            <%
                                if(currentUser != null && currentUser.getUserType() == 'a'){
                            %>
                            <form action="UserRoll" method="POST">
                                <div class="form-group">
                                    <input type="hidden" value="<%= user.getId()%>" name="userID">
                                    <label for="userTypeSelect">User roll</label>
                                    <select name="userType" class="form-control" id="userTypeSelect">
                                        <option value="u">User</option>
                                        <option value="c">Content creator</option>
                                        <option value="e">Editor</option>
                                        <option value="m">Moderator</option>
                                        <option value="a">Administrator</option>
                                    </select>
                                </div>
                                <button class="btn btn-sm site-btn-primary" type="submit">Change user roll</button>
                            </form>
                            <%
                                }
                            %>
                        </div>
                        <!-- Activity -->
                        <div class="col-12 col-md-9">
                            <div class="user-activity">
                                <!-- Activity list -->
                                <h2>Published by this user</h2>
                                <ul class="list-unstyled">
                                    <%
                                        for (Article article : userArticles) {
                                    %>
                                    <li>
                                        <div class="media article-card bg-dark-secondary">
                                            <div class="align-self-center article-card-img">
                                                <img class="mr-3" src="/images/<%=article.getArticleMultimedia().get(0).getPath()%>" alt="Article image">
                                            </div>
                                            <div class="media-body">
                                                <h5 class="mt-0"><%= article.getTitle()%></h5>
                                                <p style="margin: 0; font-size: 0.75em;">Author: <%= article.getAuthorName()%> | Date: <%= article.getArticleDate()%>
                                                </p>
                                                <%= article.getDescription()%>
                                                <a href="ArticleVisor?articleID=<%= article.getId()%>" class="site-text-link">Read more</a>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        }
                                    %>
                                </ul>
                                <nav aria-label="User's articles" style="display:none;">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item site-page-item disabled"><a class="page-link" href="#">Previous</a>
                                        </li>
                                        <li class="page-item site-page-item site-active"><a class="page-link" href="#">1</a>
                                        </li>
                                        <li class="page-item site-page-item disabled"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item site-page-item disabled"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item site-page-item disabled"><a class="page-link" href="#">Next</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
        <!-- Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    </body>

</html>
