<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
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
    <a class="navbar-brand" href="index.htm" style="margin-left: 16%">
        <img src="images/restaurant-logo_1.png" height="80" width="138" alt="Restaurant Logo" style="margin-left: 50px">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

</nav>
<div style="background-image: url('images/login.jpg'); background-size: cover; height: 800px">
    <div style="background: rgb(21,21,21);
background: linear-gradient(90deg, rgba(21,21,21,1) 48%, rgba(255,255,255,0) 100%);height : 860px">
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-left align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card text-white"
                             style="border-radius: 1rem;width: 400px;margin-top: 70px; margin-left: 50px; background-color: rgba(21,21,21,0.5)">
                            <div class="card-body p-5 text-center" style="height: 600px;">
                                <form method="POST" role="form"
                                      action="adminLogin.htm">
                                    <div class="mb-md-5 mt-md-4 pb-5">

                                        <h2 class="fw-bold mb-2 text-uppercase">Admin Login</h2>
                                        <p class="text-white-50 mb-5">Please enter your login and password!</p>

                                        <div class="form-dark mb-4">
                                            <label class="text-white-50" for="typeEmailX"
                                                   style="margin-left: -240px;">Email</label>
                                            <input type="email" id="typeEmailX" name="userEmail"
                                                   class="form-control form-control-lg bg-dark"
                                                   autofocus placeholder="Enter your Email ID" style="border: white"/>
                                            <%
                                                String validEmail = (String) request.getAttribute("validEmail");
                                                if (validEmail != null)
                                                    out.println("<small id=\"emailHelp\" className=\"form-text text-danger\" style=\"color:red\">"+validEmail+"\n" +
                                                            "                                        </small>");
                                            %>
                                        </div>

                                        <div class=" form-white mb-4">
                                            <label class="text-white-50" for="typePasswordX"
                                                   style="margin-left: -210px;">Password</label>
                                            <input type="password" id="typePasswordX" name="password"
                                                   class="form-control form-control-lg bg-dark"
                                                   placeholder="Must be 8-20 characters long."/>
                                            <%
                                                String incorrectPassword = (String) request.getAttribute("incorrectPassword");
                                                if (incorrectPassword != null)
                                                    out.println("<small id=\"emailHelp\" className=\"form-text text-danger\" style=\"color:red\"" +
                                                            ">"+incorrectPassword+"\n" +
                                                            "                                        </small>");
                                            %>
                                        </div>
                                        <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="adminforgotPasswordForm.htm">Forgot
                                            password?</a>
                                        </p>
                                        <button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
                                    </div>
                                </form>
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

    <div class="text-center bg-dark p-4"
         style="background-image: linear-gradient(to right,rgb(21,21,21),rgb(21,21,21), rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20) ,rgb(21,21,21));">
        © 2022 Copyright:
        <a class="text-reset fw-bold" href="https://www.northeastern.edu/">Northeastern University</a>
    </div>
    <!-- Copyright -->
</footer>
</body>
</html>
