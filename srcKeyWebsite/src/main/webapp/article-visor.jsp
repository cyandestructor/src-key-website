<%-- 
    Document   : article-visor
    Created on : 10 dic 2020, 14:57:08
    Author     : delli
--%>

<%@page import="models.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.User"%>
<%@page import="models.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Article currentArticle = (Article)request.getAttribute("article");
    User author = (User)request.getAttribute("author");
    
    ArrayList<Comment> articleComments = (ArrayList<Comment>)request.getAttribute("articleComments");
    if (articleComments == null){
        articleComments = new ArrayList<Comment>();
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
    <link rel="stylesheet" href="styles/article-visor.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="shortcut icon" href="assets/img/src-key-logo-dark.svg" type="image/x-icon">
    <title>src key - development and programming news</title>
</head>

<body>
    <jsp:include page="navbar.jsp"/>
    <div class="page-container page-background bg-dark-page"">
        <div class=" page-content mx-auto py-4 bg-white">
        <div class="container">
            <!-- Article banner -->
            <div class="row">
                <div class="col-12">
                    <img src="assets/img/user-banner-sample.jpg" alt="user banner" class="article-banner">
                </div>
            </div>
            <!-- Article-->
            <div class="row my-3">
                <article class="col-12">
                    <!-- Author card -->
                    <div class="float-left author-card mb-1 mr-3">
                        <div class="card" style="width: 15rem;">
                            <img class="card-img-top" src="assets/img/stock (1).jpg" alt="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title">About the author</h5>
                              <p class="card-text"><%= author.getDescription().isBlank() ? "Nothing yet" : author.getDescription() %></p>
                            </div>
                          </div>
                    </div>
                    <!-- Article header -->
                    <div class="article-header">
                        <h1 id="articleTitle"><%= currentArticle.getTitle() %></h1>
                        <p id="articleAuthor"><%= currentArticle.getAuthorName() %></p>
                        <p id="articleDate"><%= currentArticle.getArticleDate()%></p>
                    </div>
                    <!-- Article body text -->
                    <div class="article-body">
                        <p>
                            <%= currentArticle.getBody()%>
                        </p>
                        <img class="article-image float-right" src="assets/img/stock (2).jpg" alt="people working with a computer">
                    </div>
                </article>
                <a href="MarkArticle?articleID=<%= currentArticle.getId()%>" class="btn btn-sm site-btn-primary">Mark as favorite</a>
                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_up</a>
                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_down</a>
            </div>
            <!-- Comment section -->
            <div class="row my-3">
                <div class="col-12 comment-section">
                    <h1>Comments</h1>
                    <form action="CreateComment" method="POST">
                        <div class="form-group mx-1">
                            <input type="hidden" name="articleID" value="<%= currentArticle.getId() %>">
                            <input type="text" name="commentBody" class="form-control" id="commentBox" placeholder="What do you think?">
                        </div>
                        <button type="submit" class="btn btn-sm site-btn-primary">Submit</button>
                    </form>
                    <ul class="list-unstyled mt-2">
                        <%
                            for (Comment comment : articleComments){
                        %>
                        <li class="comment-card bg-dark-secondary mb-1" id="comment<%= comment.getId() %>">
                            <div class="media">
                                <div class="comment-card-img mr-2">
                                    <img src="assets/img/stock (2).jpg" alt="user profile pic">
                                </div>
                                <div class="media-body">
                                    <p class="mt-0" style="font-size: 1.25em;">
                                        <a href="Profile?userId=<%= comment.getUserId()%>" class="site-text-link">
                                            <%= comment.getPosterUsername()%>
                                        </a>
                                    </p>
                                    <!--<p style="margin: 0; font-size: 0.75em;">10/17/2020 14:23</p>-->
                                    <%
                                        if(comment.getParentID()!=0){
                                            Comment parent = comment.getParentComment();
                                    %>
                                    <div class="border p-1 mb-2">
                                        <a href="#comment<%= parent.getId()%>" class="site-text-link">
                                            @<%= parent.getPosterUsername()%>
                                        </a>
                                        <p style="margin: 0; font-size: 0.75em;"><%= parent.getCommentText()%></p>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <%= comment.getCommentText() %>
                                </div>
                            </div>
                            <div class="mt-2 d-flex justify-content-end dropdown">
                                <button class="btn btn-sm site-btn-primary dropdown-toggle" type="button" id="commentRespondButton<%= comment.getId() %>" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Respond
                                </button>
                                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_up</a>
                                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_down</a>
                                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">report</a>
                                <div class="dropdown-menu" aria-labelledby="commentRespondButton<%= comment.getId()%>">
                                    <form action="RespondComment" method="POST" class="p-1">
                                        <div class="form-group mx-1">
                                            <input type="hidden" name="articleID" value="<%= currentArticle.getId() %>">
                                            <input type="hidden" name="parentID" value="<%= comment.getId() %>">
                                            <input type="text" name="commentBody" class="form-control" placeholder="What do you think?">
                                        </div>
                                        <button type="submit" class="btn btn-sm site-btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
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
