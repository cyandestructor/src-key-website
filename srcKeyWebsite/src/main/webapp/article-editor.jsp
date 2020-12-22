<%-- 
    Document   : article-editor
    Created on : 10 dic 2020, 14:58:32
    Author     : delli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <div class="row">
                        <div class="col-12">
                            <form class="article-editor-form" action="SubmitArticle" method="POST" enctype="multipart/form-data" >
                                <div class="form-group">
                                    <div class="article-banner d-flex justify-content-center bg-dark-secondary">
                                        <label for="imgFileControl" class="btn btn-lg btn-block material-icons my-auto">image</label>
                                        <input type="file" accept=".jpg,.png" style="display:none;" id="imgFileControl" name="images" multiple>
                                    </div>
                                    <label for="articleTitle">Title</label>
                                    <input type="text" id="articleTitle" name="title" class="form-control">
                                    <label for="articleDescription">Description</label>
                                    <textarea id="articleDescription" rows="5" name="description" class="form-control"></textarea>
                                    <label for="articleBodyText">Body</label>
                                    <textarea id="articleBodyText" rows="20" name="body" class="form-control"></textarea>
                                    <label for="videoFileControl">Video file input</label>
                                    <input type="file" accept="video/*" name="video" class="form-control-file" id="videoFileControl">
                                    <label for="articleCategories">Categories</label>
                                    <input type="text" id="articleCategories" name="categories" class="form-control" placeholder="gamedev, webdev, hardware...">
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
    </body>

</html>
