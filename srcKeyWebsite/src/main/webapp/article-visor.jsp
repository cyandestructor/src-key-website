<%-- 
    Document   : article-visor
    Created on : 10 dic 2020, 14:57:08
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
                <li class="nav-item">
                    <a class="nav-link nav-hover" href="/registration.html">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-hover" href="#">About us</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn site-btn-primary my-2 my-sm-0 material-icons" type="submit">search</button>
            </form>
            <div class="dropdown ml-2 user-button">
                <button class="btn dropdown-toggle" type="button" id="UserMenuButton" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
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
                            <input type="password" class="form-control" id="userFormEmail1" placeholder="Password">
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
            <!-- Article banner -->
            <div class="row">
                <div class="col-12">
                    <img src="/assets/img/user-banner-sample.jpg" alt="user banner" class="article-banner">
                </div>
            </div>
            <!-- Article-->
            <div class="row my-3">
                <article class="col-12">
                    <!-- Author card -->
                    <div class="float-left author-card mb-1 mr-3">
                        <div class="card" style="width: 15rem;">
                            <img class="card-img-top" src="/assets/img/stock (1).jpg" alt="Card image cap">
                            <div class="card-body">
                              <h5 class="card-title">About the author</h5>
                              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            </div>
                          </div>
                    </div>
                    <!-- Article header -->
                    <div class="article-header">
                        <h1 id="articleTitle">Sample article title</h1>
                        <p id="articleAuthor">Bryan Duarte</p>
                        <p id="articleDate">October 18th, 2020</p>
                    </div>
                    <!-- Article body text -->
                    <div class="article-body">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas enim orci, pretium vel dui
                            at,
                            commodo euismod felis. Donec vulputate porttitor accumsan. Aenean fermentum at massa a
                            venenatis. Quisque tristique tortor vel rutrum porta. Duis ac leo nisl. Morbi luctus eros
                            vulputate ex convallis, sed consectetur nibh convallis. Nunc maximus ac justo ultricies
                            dictum.
                            Nam fermentum felis et volutpat eleifend. Sed molestie convallis risus, quis blandit elit
                            dignissim quis. Nunc aliquet libero vel pharetra condimentum. Vivamus varius dignissim lacus
                            at
                            sodales. Praesent tincidunt non augue quis ultrices. Nunc aliquet, justo sodales gravida
                            suscipit, ipsum est rutrum augue, eu mattis tortor felis vitae ex. Vivamus blandit porta
                            sapien,
                            eu gravida libero tincidunt vitae. Morbi eget luctus odio.
                        </p>
                        <img class="article-image float-right" src="/assets/img/stock (2).jpg" alt="people working with a computer">
                        <p>
                            Vivamus mattis velit non enim rutrum porta. Vivamus quis odio condimentum, viverra ligula
                            eu,
                            venenatis arcu. Nunc in quam quam. Phasellus vel porta sem. Nulla felis orci, scelerisque ut
                            mi
                            vitae, malesuada dignissim elit. Morbi vehicula tellus consectetur hendrerit pharetra.
                            Maecenas
                            suscipit dolor ut tellus lacinia sollicitudin. Lorem ipsum dolor sit amet, consectetur
                            adipiscing elit. Duis non congue sapien. Donec vel enim ex. Nam quam velit, tincidunt in
                            purus
                            at, lacinia accumsan turpis. Maecenas accumsan tincidunt volutpat. Ut ultricies faucibus
                            libero
                            et posuere. Nam turpis risus, rutrum nec interdum at, mattis eu turpis. Sed ut sem nec enim
                            efficitur pretium. Etiam ex odio, aliquet a sodales pulvinar, accumsan mollis metus.
                        </p>
                        <p>
                            Cras faucibus finibus enim. In eu magna suscipit, tincidunt augue feugiat, ornare ipsum.
                            Nulla
                            erat nibh, viverra eget diam vel, pharetra hendrerit diam. Aliquam sodales sollicitudin
                            efficitur. Nullam ullamcorper, augue in mollis porttitor, quam justo semper velit, eu auctor
                            mauris urna ac arcu. Vestibulum id ante dui. Fusce sollicitudin lacinia condimentum. Nulla
                            et
                            facilisis metus. Mauris luctus erat quis lobortis suscipit. Aenean a molestie dui. Quisque
                            congue molestie odio efficitur eleifend. Vestibulum sit amet dui eleifend, suscipit nisl ac,
                            hendrerit nulla. Nulla ante ipsum, condimentum tincidunt ligula vel, fermentum mattis
                            libero.
                            Duis fermentum, arcu ut vehicula gravida, purus purus vulputate quam, id fringilla sapien
                            leo ut
                            sapien. Pellentesque quis commodo nulla, scelerisque facilisis odio.
                        </p>
                        <img class="article-image float-left" src="/assets/img/stock (3).jpg" alt="people working with a computer">
                        <p>
                            Aenean laoreet lorem nunc, nec sagittis massa varius vitae. Phasellus posuere, tortor ut
                            molestie varius, velit nulla consectetur massa, vitae egestas neque justo sed libero.
                            Integer at
                            est nunc. Praesent egestas dui a arcu euismod, in consequat mauris rutrum. Praesent
                            efficitur
                            non nibh ut sagittis. Phasellus ipsum lorem, mollis ut purus sagittis, cursus fermentum
                            urna.
                            Donec fringilla, eros in rhoncus consequat, arcu lorem auctor enim, eget condimentum massa
                            quam
                            ut nisi. Praesent imperdiet consectetur pretium. Aliquam tempus maximus diam, non
                            sollicitudin
                            metus fringilla et. Etiam bibendum suscipit dolor, id ornare enim viverra sed. In dui risus,
                            pharetra quis consequat sed, pellentesque eget nisl. Curabitur rutrum commodo nibh vitae
                            consequat. Donec in orci pellentesque, consequat mi vitae, imperdiet justo. Nulla id euismod
                            enim. Donec interdum a mauris in malesuada.
                        </p>
                        <p>
                            Donec lacus urna, elementum sit amet consequat ac, pellentesque at elit. Maecenas tempus
                            quis mi
                            eu sollicitudin. Integer eleifend sem neque, et dictum ligula hendrerit quis. Aenean
                            ullamcorper
                            ut dolor eget finibus. Phasellus laoreet suscipit turpis sit amet euismod. Morbi luctus
                            egestas
                            orci vitae sodales. Aenean porta ante id orci imperdiet dapibus. Nunc pulvinar augue nec
                            libero
                            laoreet pretium. In sit amet sapien ac massa laoreet euismod ac non dui. Nullam ac erat
                            hendrerit, eleifend erat vel, vulputate orci. Nunc mauris tellus, convallis id metus vel,
                            vestibulum aliquam purus. Proin tempor lacus quis ex tincidunt, eu euismod ante convallis.
                            Nunc
                            porttitor, mi nec malesuada eleifend, ipsum purus tristique nisi, eu hendrerit augue urna at
                            massa. Suspendisse potenti.
                        </p>
                    </div>
                </article>
            </div>
            <!-- Comment section -->
            <div class="row my-3">
                <div class="col-12 comment-section">
                    <h1>Comments</h1>
                    <ul class="list-unstyled">
                        <li class="comment-card bg-dark-secondary">
                            <div class="media">
                                <div class="comment-card-img mr-2">
                                    <img src="assets/img/stock (2).jpg" alt="Article image">
                                </div>
                                <div class="media-body">
                                <h5 class="mt-0">user1234</h5>
                                    <p style="margin: 0; font-size: 0.75em;">10/17/2020 14:23</p>
                                    Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante
                                    sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra
                                    turpis.
                                    <!-- <a href="#" class="site-text-link">Read more</a> -->
                                </div>
                            </div>
                            <div class="mt-2 d-flex justify-content-end">
                                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_up</a>
                                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">thumb_down</a>
                                <a href="#" class="btn btn-sm site-btn-primary ml-1 material-icons">report</a>
                            </div>
                        </li>
                    </ul>
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
