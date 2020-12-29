<%-- 
    Document   : profile-editor
    Created on : 18 dic 2020, 11:50:06
    Author     : delli
--%>

<%@page import="models.User"%>
<%
    User user = (User)request.getAttribute("user");
%>

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
        <link rel="stylesheet" href="styles/profile-editor.css">
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
                        <div class="col-12 col-md-8 mx-auto">
                            <form action="ProfileEditor" method="POST" enctype="multipart/form-data" onsubmit="return validateProfileEdition()">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="col-12">
                                            <div class="profile-pic-btn d-flex justify-content-center bg-dark-secondary mx-auto mb-3">
                                            <label for="imgFileControl" class="btn btn-lg btn-block material-icons my-auto">image</label>
                                            <input type="file" name="profilePic" accept=".jpg,.png" style="display:none;" id="imgFileControl">
                                        </div>
                                        </div>
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">First and last name</span>
                                        </div>
                                        <input type="text" id="firstnameInput" name="firstName" value="<%= user.getFirstName() %>" maxlength="50" placeholder="First name" class="form-control">
                                        <input type="text" id="lastnameInput" name="lastName" value="<%= user.getLastName() %>" maxlength="50" placeholder="Last name" class="form-control">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Description</span>
                                        </div>
                                        <textarea id="descriptionInput" class="form-control" name="userDescription" maxlength="255" placeholder="Tell your story..." aria-label="Description"><%= user.getDescription() %></textarea>
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="email">Email</span>
                                        </div>
                                        <input type="email" id="emailInput" name="userEmail" value="<%= user.getEmail() %>" maxlength="50" class="form-control" placeholder="email@example.com" aria-label="Email" aria-describedby="email">
                                    </div>
                                    <h5>Change the password</h5>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="oldPassword">Old password</span>
                                        </div>
                                        <input type="password" name="oldPassword" class="form-control" aria-label="Old password" maxlength="20" aria-describedby="oldPassword">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="newPassword">New password</span>
                                        </div>
                                        <input type="password" name="newPassword" class="form-control" aria-label="New password" maxlength="20" aria-describedby="newPassword">
                                    </div>
                                </div>
                                <button class="btn btn-block site-btn-primary" type="submit">Save</button>
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
        <script src="scripts/profile-editor.js"></script>
    </body>

</html>
