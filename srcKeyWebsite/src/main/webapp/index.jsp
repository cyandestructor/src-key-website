<%-- 
    Document   : index
    Created on : 10 dic 2020, 14:31:44
    Author     : delli
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Article"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Article> recentArticles = (ArrayList<Article>) request.getAttribute("recentArticles");
    if(recentArticles == null){
        recentArticles = new ArrayList<Article>();
    }
    ArrayList<Article> topArticles = (ArrayList<Article>) request.getAttribute("topArticles");
    if(topArticles == null){
        topArticles = new ArrayList<Article>();
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
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="shortcut icon" href="assets/img/src-key-logo-dark.svg" type="image/x-icon">
        <title>src key - development and programming news</title>
    </head>

    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="page-container page-background bg-dark-page"">
            <div class=" page-content mx-auto py-4 bg-white">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-8">
                            <h2>Highlights</h2>
                            <div id="highlightsCarousel" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <%
                                        for (int i = 0; i< topArticles.size(); i++) {
                                            if (i == 0) {
                                    %>
                                    <li data-target="#highlightsCarousel" data-slide-to="<%= i %>" class="active"></li>
                                    <%
                                            }
                                            else {
                                    %>
                                    <li data-target="#highlightsCarousel" data-slide-to="<%= i %>"></li>
                                    <%
                                            }
                                        }
                                    %>
                                </ol>
                                <div class="carousel-inner">
                                    <%
                                        for (int i = 0; i< topArticles.size(); i++) {
                                            if (i == 0) {
                                    %>
                                    <div class="carousel-item active">
                                        <a href="ArticleVisor?articleID=<%= topArticles.get(i).getId() %>">
                                            <img src="/images/<%= topArticles.get(i).getArticleMultimedia().get(0).getPath() %>" class="d-block w-100" alt="...">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5><%= topArticles.get(i).getTitle() %></h5>
                                                <p><%= topArticles.get(i).getDescription() %></p>
                                            </div>
                                        </a>
                                    </div>
                                    <%
                                            }
                                            else {
                                    %>
                                    <div class="carousel-item">
                                        <a href="ArticleVisor?articleID=<%= topArticles.get(i).getId() %>">
                                            <img src="/images/<%= topArticles.get(i).getArticleMultimedia().get(0).getPath() %>" class="d-block w-100" alt="...">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5><%= topArticles.get(i).getTitle() %></h5>
                                                <p><%= topArticles.get(i).getDescription() %></p>
                                            </div>
                                        </a>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                                <a class="carousel-control-prev" href="#highlightsCarousel" role="button" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </a>
                                <a class="carousel-control-next" href="#highlightsCarousel" role="button" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-12 col-md-4">
                            <div class="recent-container overflow-auto">
                                <h2>Recent articles</h2>
                                <ul class="list-unstyled">
                                    <%
                                        for (Article article : recentArticles){
                                    %>
                                    <li>
                                        <div class="card" style="width: 18rem;">
                                            <a href="ArticleVisor?articleID=<%= article.getId()%>">
                                                <img src="/images/<%= article.getArticleMultimedia().get(0).getPath()%>" class="card-img-top" alt="...">
                                            </a>
                                            <div class="card-body">
                                                <h5><%= article.getTitle()%></h5>
                                                <p class="card-text"><%= article.getDescription()%></p>
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
