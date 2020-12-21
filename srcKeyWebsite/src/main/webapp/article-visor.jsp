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
    
    User currentUser = (User)request.getSession().getAttribute("user");
    boolean admin = currentUser != null;
    
    String userProfilePic = "assets/img/user-propic-default-1.png";
    
    if(author != null){
        userProfilePic = author.getProfilePic().isBlank() ? userProfilePic : "/images/" + author.getProfilePic();
    }
    
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
    <!-- Suspend User modal -->
    <%
        if(admin){
    %>
    <div class="modal fade" id="suspendUserModal" tabindex="-1" role="dialog" aria-labelledby="suspendUserModalLabel1" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="suspendUserModalLabel1">Suspend User Account</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Describe the reason of the suspension to confirm
                    <form action="SuspendUser" method="POST">
                        <div class="form-group">
                            <input type="hidden" name="userID">
                            <label for="message-text" class="col-form-label">Message:</label>
                            <textarea class="form-control" id="message-text" name="description"></textarea>
                        </div>
                        <button type="submit" class="btn site-btn-primary my-2">Confirm and suspend</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn site-btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
    <div class="modal fade" id="deleteCommentModal" tabindex="-1" role="dialog" aria-labelledby="deleteCommentLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteCommentLabel">Are you sure you want to delete this comment?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="DeleteComment" method="POST">
                        <input type="hidden" name="commentID">
                        <button type="button" class="btn site-btn-primary" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn site-btn-primary">Yes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
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
                            <img class="card-img-top" src="<%= userProfilePic %>" alt="Author image">
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
                <div class="col-12">
                    <a href="MarkArticle?articleID=<%= currentArticle.getId()%>" class="btn btn-sm site-btn-primary">Mark as favorite</a>
                    <a href="VoteArticle?articleID=<%= currentArticle.getId()%>&vote=true" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_up</a>
                    <a href="VoteArticle?articleID=<%= currentArticle.getId()%>&vote=false" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_down</a>
                </div>
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
                                String profilePic = comment.getPosterImg().isBlank() ? "assets/img/user-propic-default-1.png" : "/images/" + comment.getPosterImg();
                                String posterUsername = comment.getPosterUsername();
                                posterUsername += comment.getUserId() == author.getId() ? " &#9733;" : "";
                        %>
                        <li class="comment-card bg-dark-secondary mb-1" id="comment<%= comment.getId() %>">
                            <div class="media">
                                <div class="comment-card-img mr-2">
                                    <img src="<%= profilePic %>" alt="user profile pic">
                                </div>
                                <div class="media-body">
                                    <p class="mt-0" style="font-size: 1.25em;">
                                        <a href="Profile?userId=<%= comment.getUserId()%>" class="site-text-link">
                                            <%= posterUsername %>
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
                                    Reply
                                </button>
                                <span class="mx-1 my-auto"><%= comment.getUpVotes() %></span><a href="VoteComment?articleID=<%= currentArticle.getId() %>&commentID=<%= comment.getId() %>&vote=true" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_up</a>
                                <a href="VoteComment?articleID=<%= currentArticle.getId() %>&commentID=<%= comment.getId() %>&vote=false" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_down</a>
                                <%
                                    if(admin){
                                %>
                                <button type="button" class="btn btn-sm site-btn-primary ml-1 material-icons" data-toggle="modal" data-target="#suspendUserModal" data-username="<%= comment.getPosterUsername() %>" data-user="<%= comment.getUserId() %>">
                                    report
                                </button>
                                <%
                                    }
                                %>
                                <%
                                    if(currentUser != null && currentUser.getId() == comment.getId() || admin){
                                %>
                                <button type="button" class="btn btn-sm site-btn-primary ml-1 material-icons" data-toggle="modal" data-target="#deleteCommentModal" data-comment="<%= comment.getId() %>">
                                    delete_forever
                                </button>
                                <%
                                    }
                                %>
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
    <script>
    $('#suspendUserModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var username = button.data('username')
        var userID = button.data('user')
        
        var modal = $(this)
        modal.find('.modal-title').text('Suspend User: ' + username)
        modal.find('.modal-body input').val(userID)
    })
    
    $('#deleteCommentModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget) // Button that triggered the modal
        var comment = button.data('comment')
        
        var modal = $(this)
        modal.find('.modal-body input').val(comment)
    })
    </script>
</body>

</html>
