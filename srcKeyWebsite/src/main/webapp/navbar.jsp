<%-- 
    Document   : navbar
    Created on : 11 dic 2020, 11:27:12
    Author     : delli
--%>

<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User currentUser = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark-main">
            <!-- Brand -->
            <a class="navbar-brand" href="Home">
                <img src="assets/img/src-key-logo-clear.svg" width="40" height="40" class="d-inline-block align-top"
                     alt="src-key logo" loading="lazy">
                src-key
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link nav-hover" href="Home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-hover" href="#">Recent</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-hover" href="#">Top</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-hover" href="registration.jsp">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-hover" href="#">About us</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn site-btn-primary my-2 my-sm-0 material-icons"
                            type="submit">search</button>
                </form>
                <%
                    if (currentUser == null) {
                %>
                <div class="dropdown ml-2 user-button">
                    <button class="btn dropdown-toggle" type="button" id="UserMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        User
                        <div class="user-icon">
                            <svg id="Layer_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512"
                                 width="512" xmlns="http://www.w3.org/2000/svg">
                            <g>
                            <path
                                d="m256 98.533c4.382 0 8.732.639 12.931 1.897l139.882 41.965c-13.907-44.82-50.205-87.798-118.196-102.935-11.55-2.567-19.617-12.624-19.617-24.464 0-8.284-6.716-14.996-15-14.996s-15 6.72-15 15.004c0 11.831-8.07 21.888-19.604 24.451-68.063 15.158-104.291 58.214-118.189 102.935l139.862-41.958c4.199-1.26 8.549-1.899 12.931-1.899z" />
                            <path
                                d="m420.978 177.366-160.667-48.2c-2.813-.844-5.809-.844-8.621 0l-160.667 48.2c-6.345 1.903-10.689 7.743-10.689 14.367v128.533c0 5.682 3.21 10.876 8.292 13.416l160.667 80.333c2.111 1.056 4.409 1.584 6.708 1.584s4.597-.528 6.708-1.584l160.667-80.333c5.082-2.54 8.292-7.734 8.292-13.416v-128.533c-.001-6.624-4.345-12.463-10.69-14.367zm-246.378 110.768c0 8.284-6.716 15-15 15s-15-6.716-15-15v-59.447c0-8.284 6.716-15 15-15s15 6.716 15 15zm64.266 24.099c0 8.284-6.716 15-15 15s-15-6.716-15-15v-102.827c0-8.284 6.716-15 15-15s15 6.716 15 15zm64.268 0c0 8.284-6.716 15-15 15s-15-6.716-15-15v-102.827c0-8.284 6.716-15 15-15s15 6.716 15 15zm64.267-24.099c0 8.284-6.716 15-15 15s-15-6.716-15-15v-59.447c0-8.284 6.716-15 15-15s15 6.716 15 15z" />
                            <path
                                d="m425.661 436.796s-12.046-9.026-25.702-19.276c-9.681-7.259-17.505-16.563-23.057-27.06l-100.778 50.389c-6.216 3.108-13.175 4.751-20.124 4.751s-13.908-1.643-20.124-4.751l-100.779-50.389c-5.553 10.496-13.376 19.8-23.057 27.062l-25.705 19.277c-4.529 3.396-6.761 9.053-5.77 14.627.991 5.573 5.036 10.114 10.458 11.741l160.667 48.2c1.406.422 2.858.633 4.311.633 1.452 0 2.904-.211 4.311-.633l160.667-48.2c5.423-1.627 9.468-6.169 10.458-11.744.989-5.574-1.244-11.233-5.776-14.627z" />
                            </g>
                            </svg>
                        </div>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="UserMenuButton">
                        <form class="px-4 py-3" action="LogIn" method="POST">
                            <div class="form-group">
                                <label for="userFormUsername">Username</label>
                                <input type="text" name="logUsername" class="form-control" id="userFormUsername"
                                       placeholder="username">
                            </div>
                            <div class="form-group">
                                <label for="userFormPassword1">Password</label>
                                <input type="password" name="logPassword" class="form-control" id="userFormEmail1"
                                       placeholder="Password">
                            </div>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="rememberMeCheck">
                                <label class="form-check-label" for="rememberMeCheck">
                                    Remember me
                                </label>
                            </div>
                            <button type="submit" class="btn site-btn-primary">Log in</button>
                        </form>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item site-dropdown-item" href="#">Not a member? Join the community</a>
                        <a class="dropdown-item site-dropdown-item" href="#">Forgot password?</a>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="dropdown ml-2 user-button">
                    <button class="btn dropdown-toggle" type="button" id="UserMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <%= currentUser.getUsername() %>
                        <div class="user-icon">
                            <svg id="Layer_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512"
                                 width="512" xmlns="http://www.w3.org/2000/svg">
                            <g>
                            <path
                                d="m256 98.533c4.382 0 8.732.639 12.931 1.897l139.882 41.965c-13.907-44.82-50.205-87.798-118.196-102.935-11.55-2.567-19.617-12.624-19.617-24.464 0-8.284-6.716-14.996-15-14.996s-15 6.72-15 15.004c0 11.831-8.07 21.888-19.604 24.451-68.063 15.158-104.291 58.214-118.189 102.935l139.862-41.958c4.199-1.26 8.549-1.899 12.931-1.899z" />
                            <path
                                d="m420.978 177.366-160.667-48.2c-2.813-.844-5.809-.844-8.621 0l-160.667 48.2c-6.345 1.903-10.689 7.743-10.689 14.367v128.533c0 5.682 3.21 10.876 8.292 13.416l160.667 80.333c2.111 1.056 4.409 1.584 6.708 1.584s4.597-.528 6.708-1.584l160.667-80.333c5.082-2.54 8.292-7.734 8.292-13.416v-128.533c-.001-6.624-4.345-12.463-10.69-14.367zm-246.378 110.768c0 8.284-6.716 15-15 15s-15-6.716-15-15v-59.447c0-8.284 6.716-15 15-15s15 6.716 15 15zm64.266 24.099c0 8.284-6.716 15-15 15s-15-6.716-15-15v-102.827c0-8.284 6.716-15 15-15s15 6.716 15 15zm64.268 0c0 8.284-6.716 15-15 15s-15-6.716-15-15v-102.827c0-8.284 6.716-15 15-15s15 6.716 15 15zm64.267-24.099c0 8.284-6.716 15-15 15s-15-6.716-15-15v-59.447c0-8.284 6.716-15 15-15s15 6.716 15 15z" />
                            <path
                                d="m425.661 436.796s-12.046-9.026-25.702-19.276c-9.681-7.259-17.505-16.563-23.057-27.06l-100.778 50.389c-6.216 3.108-13.175 4.751-20.124 4.751s-13.908-1.643-20.124-4.751l-100.779-50.389c-5.553 10.496-13.376 19.8-23.057 27.062l-25.705 19.277c-4.529 3.396-6.761 9.053-5.77 14.627.991 5.573 5.036 10.114 10.458 11.741l160.667 48.2c1.406.422 2.858.633 4.311.633 1.452 0 2.904-.211 4.311-.633l160.667-48.2c5.423-1.627 9.468-6.169 10.458-11.744.989-5.574-1.244-11.233-5.776-14.627z" />
                            </g>
                            </svg>
                        </div>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="UserMenuButton">
                        <a href="Profile?userId=<%=currentUser.getId()%>"><button class="btn site-btn-primary">Profile</button></a>
                        <a href="LogOut"><button class="btn site-btn-primary">Log out</button></a>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </nav>
</html>
