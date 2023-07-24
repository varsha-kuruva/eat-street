<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("a").on('click', function (event) {
                if (this.hash !== "") {
                    event.preventDefault();
                    let hash = this.hash;
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 800, function () {
                        window.location.hash = hash;
                    });
                }
            });
        });
    </script>
    <link rel="icon" href="images/restaurant-logo_1.png"/>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
          rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
          rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css"
          rel="stylesheet"/>
    <style>
        body::-webkit-scrollbar {
            width: 5px;
        }

        /* Track */
        body::-webkit-scrollbar-track {
            opacity: 0.5;
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        body::-webkit-scrollbar-thumb {
            background: grey;
            border-radius: 10px;
        }

        /* Handle on hover */
        body::-webkit-scrollbar-thumb:hover {
            background: #adadad;
        }
    </style>
</head>
<body style="overflow-x: hidden">

<nav class="navbar navbar-expand-lg navbar-dark text-center"
     style="position: absolute; width: 100%; background-color: transparent">
    <a class="navbar-brand" href="index.htm">
        <img src="images/restaurant-logo_1.png" height="80" width="138" alt="Restaurant Logo" style="margin-left: 50px">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav" style="font-size: 20px;">
            <li class="nav-item active">
                <a class="nav-link" href="index.htm">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#carouselDarkVariant">Specialities</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="menu_error.htm">Menu</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#footer-end">Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.htm">Login</a>
            </li>
        </ul>
    </div>
</nav>

<div style="background-image: url('images/login.jpg'); height : 840px; background-size: contain; display:cover">
    <div style="background: rgb(21,21,21);
background: linear-gradient(90deg, rgba(21,21,21,1) 48%, rgba(255,255,255,0) 100%);height : 860px">
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100" style="background: transparent;">
                <div class="row justify-content-left align-items-center h-100" style="background: transparent;">
                    <div class="col-12 col-lg-9 col-xl-7" style="background: transparent">
                        <div class="card text-white"
                             style="border-radius: 1rem;margin-top: 85px; margin-left : -30px; background-color: rgba(21,21,21,0)">
                            <div class="card-body p-4 p-md-5">
                                <h3 class="fw-bold mb-4 text-uppercase" style="color: white; margin-left: 190px">
                                    Registration Form</h3>
                                <p class="text-white-50 mb-5" style="margin-left: 240px;">Please enter your details!</p>
                                <form:form method="POST"
                                           action="createaccount.htm">
                                    <div class="row" style="margin-top: 50px">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-white">
                                                <label class="text-white-50">Full Name </label>
                                                <input type="text" name="customerFullName"
                                                       class="form-control form-control-lg bg-dark"
                                                       autofocus
                                                       required placeholder="John"
                                                       style="margin-left: -12px"/>
                                            </div>

                                        </div>
                                        <!-- <div class="col-md-6 mb-4">

                                            <div class="form-white">
                                                <label class="text-white-50">Lastname </label>
                                                <input type="text" name="lastName" style="margin-left: -12px"
                                                       class="form-control form-control-lg bg-dark"
                                                       placeholder="Smith"/>
                                            </div>

                                        </div> -->
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-white">
                                                <label class="text-white-50">Email </label>
                                                <input type="email" name="customerEmail"
                                                       style="margin-left: -12px"
                                                       required
                                                       placeholder="johnsmit@gmail.com"
                                                       class="form-control form-control-lg bg-dark"/>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-white">
                                                <label class="text-white-50">Phone Number </label>
                                                <input type="number" name="customerPhoneNo"
                                                       style="margin-left: -12px"
                                                       required
                                                       placeholder="(123)-123-1234"
                                                       class="form-control form-control-lg bg-dark"/>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-white">
                                                <label class="text-white-50">Password </label>

                                                <input type="password" name="customerPassword"
                                                       placeholder="Must be 8-20 characters long."
                                                       required
                                                       style="margin-left: -12px"
                                                       class="form-control form-control-lg bg-dark"/>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4 pb-2">

                                            <div class="form-white">
                                                <label class="text-white-50">Confirm Password </label>
                                                <input type="password" name="customerConfirmPassword"
                                                       placeholder="Must match above entered password"
                                                       required
                                                       style="margin-left: -12px"
                                                       class="form-control form-control-lg bg-dark"/>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="mt-4 pt-2">
                                        <button class="btn btn-outline-light btn-lg px-5"
                                                type="submit"
                                                style="margin-left: 250px">Sign Up
                                        </button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>


<!-- Footer -->
<footer id="footer-end" class="text-center text-lg-start bg-dark text-muted">
    <!-- Section: Links  -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
             style="background-image: linear-gradient(to right,rgb(21,21,21),rgb(21,21,21), rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20) ,rgb(21,21,21));">
        <div class="container text-center text-md-start mt-5">

    <!-- Section: Links  -->
    <!-- Copyright -->
    <div class="text-center bg-dark p-4"
         style="background-image: linear-gradient(to right,rgb(21,21,21),rgb(21,21,21), rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20) ,rgb(21,21,21));">
        © 2022 Copyright:
        <a class="text-reset fw-bold" href="https://www.northeastern.edu/">Northeastern University</a>
    </div>
    <!-- Copyright -->
</footer>
</body>
</html>
