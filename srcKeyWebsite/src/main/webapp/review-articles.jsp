<%-- 
    Document   : review-articles
    Created on : 10 dic 2020, 14:52:30
    Author     : delli
--%>

<%@page import="models.Article"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Article> unreviewed = (ArrayList<Article>)request.getAttribute("unreviewed");
    if (unreviewed == null){
        unreviewed = new ArrayList<Article>();
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
    <link rel="stylesheet" href="styles/newsboard.css">
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
                <!-- Newsboard panel -->
                <div class="col-12 col-md-3 col-lg-2 newsboard-panel bg-dark-secondary">
                    <div class="user-profile-pic">
                        <img src="assets/img/user-propic-default-1.svg" alt="user profile picture">
                    </div>
                    <h2>Newsboard panel</h2>
                    <nav>
                        <ul class="list-unstyled">
                            <li><a href="#" class="list-link">Write new article</a></li>
                            <li><a href="#" class="list-link">Marked articles</a></li>
                            <li><a href="#" class="list-link">Created articles</a></li>
                            <li><a href="#" class="list-link">Review articles</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-12 col-md-9 col-lg-10">
                    <!-- Newsboard content -->
                    <div class="newsboard-content">
                        <ul class="list-unstyled">
                            <h2>Article review panel</h2>
                            <%
                                if(unreviewed.size()<=0){
                            %>
                            Nothing to review today... :)
                            <%
                                }
                            %>
                            <%
                                for(Article article : unreviewed){
                            %>
                            <li>
                                <div class="article-card bg-dark-secondary">
                                    <div class="media">
                                        <div class="align-self-center article-card-img">
                                            <img class="mr-3" src="<%= article.getArticleMultimedia().get(0).getPath() %>" alt="Article image">
                                        </div>
                                        <div class="media-body">
                                            <h5 class="mt-0"><%= article.getTitle() %></h5>
                                            <p style="margin: 0; font-size: 0.75em;">Author: <%= article.getAuthorName() %> | Date: <%= article.getArticleDate() %>
                                            </p>
                                            <%= article.getDescription() %>
                                            <a href="ArticleVisor?articleID=<%= article.getId()%>" class="site-text-link">Read more</a>
                                        </div>
                                    </div>
                                    <div class="mt-2 d-flex justify-content-end">
                                        <a href="ArticleVisor?articleID=<%= article.getId()%>" class="btn site-btn-primary ml-1">Review</a>
                                        <a href="ApproveArticle?articleID=<%=article.getId()%>&state=p" class="btn site-btn-primary ml-1">Approve</a>
                                        <a href="ApproveArticle?articleID=<%=article.getId()%>&state=r" class="btn site-btn-primary ml-1">Reject</a>
                                    </div>
                                </div>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                        <nav aria-label="User's articles" style="display:none">
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