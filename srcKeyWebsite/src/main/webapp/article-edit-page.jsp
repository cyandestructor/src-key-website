<%-- 
    Document   : article-edit-page
    Created on : 23 dic 2020, 11:39:50
    Author     : delli
--%>

<%@page import="models.Multimedia"%>
<%@page import="models.Article"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Article article = (Article)request.getAttribute("article");
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
        <link rel="stylesheet" href="styles/article-editor.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="shortcut icon" href="assets/img/src-key-logo-dark.svg" type="image/x-icon">
        <title>src key - development and programming news</title>
    </head>

    <body>
        <jsp:include page="navbar.jsp"/>
        <!-- Delete comment modal -->
        <div class="modal fade" id="deleteFileModal" tabindex="-1" role="dialog" aria-labelledby="deleteFileLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteFileLabel">Are you sure you want to delete this file?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <span class="d-none" id="fileID"></span>
                        <button type="button" class="btn site-btn-primary" data-dismiss="modal">Cancel</button>
                        <button type="button" id="addFileDelete" class="btn site-btn-primary" data-dismiss="modal">Yes</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-container page-background bg-dark-page"">
            <div class=" page-content mx-auto py-4 bg-white">
                <div class="container">
                    <div class="row">
                        <%
                            for(Multimedia multimedia : article.getArticleMultimedia()){
                        %>
                        <div id="file<%= multimedia.getId() %>" class="col-4 col-md-2 mb-2 article-multimedia">
                            <div class="bg-dark-secondary aspect-ratio-box">
                                <div class="aspect-ratio-item">
                                    <%
                                        if (multimedia.getFileType() == 'i') {
                                    %>
                                    <img src="/images/<%= multimedia.getPath()%>">
                                    <%
                                    } else {
                                    %>
                                    <div class="w-100 h-100 text-center material-icons py-5">ondemand_video</div>
                                    <%
                                        }
                                    %>
                                    <button data-toggle="modal" data-target="#deleteFileModal" data-id="<%= multimedia.getId() %>" class="delete-btn btn btn-block material-icons">delete</button>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="col-4 col-md-2">
                            <div class="bg-dark-secondary aspect-ratio-box">
                                <label for="imgFileControl" class="btn btn-lg btn-block material-icons py-5 aspect-ratio-item">add_a_photo</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <form class="article-editor-form" action="EditArticle" method="POST" enctype="multipart/form-data" onsubmit="return validateArticleEdition()">
                                <div class="form-group">
                                    <input type="file" accept=".jpg,.png,.mp4" style="display:none;" id="imgFileControl" name="images" multiple>
                                    <input type="hidden" name="articleID" value="<%= article.getId() %>">
                                    <input type="hidden" id="multimediaToDelete" name="multimediaToDelete">
                                    <label for="articleTitle">Title</label>
                                    <input type="text" id="articleTitle" name="title" maxlength="80" class="form-control" value="<%= article.getTitle() %>">
                                    <label for="articleDescription">Description</label>
                                    <textarea id="articleDescription" rows="5" name="description" maxlength="100" class="form-control"><%= article.getDescription() %></textarea>
                                    <label for="articleBodyText">Body</label>
                                    <textarea id="articleBodyText" rows="20" name="body" class="form-control"><%= article.getBody() %></textarea>
                                </div>
                                <button class="btn btn-block site-btn-primary" type="submit">Send for review</button>
                            </form>
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
            $('#deleteFileModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var multimediaID = button.data('id');

                var modal = $(this);
                modal.find('#fileID').text(multimediaID);
            });
            $('#addFileDelete').on('click', function () {
                var multimediaID = $('#fileID').text();
                var element = '#file' + multimediaID;
                var toDelete = $('#multimediaToDelete').val();
                $('#multimediaToDelete').val(toDelete + multimediaID + ',');
                $(element).hide();
            });
        </script>
        <script src="scripts/article-edit-page.js"></script>
    </body>

</html>
