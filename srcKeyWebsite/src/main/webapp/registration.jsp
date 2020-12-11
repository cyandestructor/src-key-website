<%-- 
    Document   : registration
    Created on : 10 dic 2020, 14:50:50
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="shortcut icon" href="assets/img/src-key-logo-dark.svg" type="image/x-icon">
    <title>src key - development and programming news</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark-main">
        <!-- Brand -->
        <a class="navbar-brand" href="/index.html">
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
                <li class="nav-item">
                    <a class="nav-link nav-hover" href="/index.html">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-hover" href="#">Recent</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-hover" href="#">Top</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link nav-hover" href="/registration.html">Register</a>
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
                    <form class="px-4 py-3">
                        <div class="form-group">
                            <label for="userFormEmail">Email address</label>
                            <input type="email" class="form-control" id="userFormEmail1"
                                placeholder="email@example.com">
                        </div>
                        <div class="form-group">
                            <label for="userFormPassword1">Password</label>
                            <input type="password" class="form-control" id="userFormEmail1"
                                placeholder="Password">
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMeCheck">
                            <label class="form-check-label" for="rememberMeCheck">
                                Remember me
                            </label>
                        </div>
                        <button type="submit" class="btn site-btn-primary">Sign in</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item site-dropdown-item" href="#">Not a member? Join the community</a>
                    <a class="dropdown-item site-dropdown-item" href="#">Forgot password?</a>
                </div>
            </div>
        </div>
    </nav>
    <div class="page-container page-background bg-dark-page"">
        <div class=" page-content mx-auto py-4 bg-white">
            <div class="container">
                <div class="row">
                    <!-- Registration form -->
                    <div class="col-4 mx-auto py-3 border rounded">
                        <form action="Register" method="POST">
                            <h1>Register your keys</h1>
                            <div class="form-group">
                                <label for="userNameInput">Username</label>
                                <input type="text" class="form-control" name = "username" id="userNameInput" placeholder="How you want to be called...">
                                <label for="nameInput">Name</label>
                                <input type="text" class="form-control" name = "firstName" id="nameInput" placeholder="Your name...">
                                <label for="lastnameInput">Lastname</label>
                                <input type="text" class="form-control" name = "lastName" id="lastnameInput" placeholder="Your lastname...">
                                <label for="emailInput">Email</label>
                                <input type="email" class="form-control" name = "email" id="emailInput" placeholder="email@example.com">
                                <label for="passwordInput">Password</label>
                                <input type="password" class="form-control" name = "password" id="passwordInput" placeholder="The key for your lock...">
                            </div>
                            <button class="btn btn-block site-btn-primary" type="submit">Register keys</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="page-footer">
        <div class="container-fluid bg-dark-main">
            <div class="container">
                <div class="row">
                    <div class="col-6 p-3">
                        <h5>src-key</h5>
                        <p>
                            src-key is a news website for software developers. Get the latest news about programming
                            languages, frameworks, and more...
                        </p>
                    </div>
                    <div class="col-6 p-3">
                        <h5>Links</h5>
                        <ul class="list-unstyled">
                            <li>
                                <a href="#" class="list-link">Home</a>
                            </li>
                            <li>
                                <a href="#" class="list-link">Recent</a>
                            </li>
                            <li>
                                <a href="#" class="list-link">Top</a>
                            </li>
                            <li>
                                <a href="#" class="list-link">About us</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright bg-dark-secondary py-2">
            <a href="/index.html" class="list-link" title="Home">&copy; src-key</a>
            <p>
                Icons designed by <a class="list-link" href="http://www.freepik.com/" title="Freepik">Freepik</a>
                from <a class="list-link" href="https://www.flaticon.es/" title="Flaticon"> www.flaticon.es</a>
            </p>
        </div>
    </footer>
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
