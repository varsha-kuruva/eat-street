<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Eat Street</title>
    <link rel="icon" href="images/restaurant-logo_1.png"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
          rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css"
          rel="stylesheet"/>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.js"></script>
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
<!--<body style="overflow-x: hidden;">-->
<nav class="navbar navbar-expand-lg navbar-dark text-center"
     style="position: absolute; width: 400%; background-color: black">
    <a class="navbar-brand" href="index.htm">
        <img src="images/restaurant-logo_1.png" height="80" width="138" alt="Restaurant Logo" style="margin-left: 50px">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav" style="font-size: 20px">
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
                <a class="nav-link" href="admin.htm">Admin Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.htm">Customer Login</a>
            </li>
        </ul>
    </div>
</nav>
<div>
    <img src="images/index.jpg" class="img-fluid" alt="Responsive image" width="1500px">
</div>

<div
        id="carouselDarkVariant"
        class="carousel slide carousel-fade carousel-light"
        data-mdb-ride="carousel"
        style="height: 700px; width: 100%; padding: 25px;background-image: linear-gradient(to right,rgb(29,29,29),rgb(32,33,35), rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20) ,rgb(21,21,21));"
>
    <!-- Indicators -->
    <div class="carousel-indicators" style="margin-bottom: 50px">
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="0"
                class="active"
                aria-current="true"
                aria-label="Slide 1"
        ></button>
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="1"
                aria-label="Slide 1"
        ></button>
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="2"
                aria-label="Slide 1"
        ></button>
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="3"
                aria-label="Slide 2"
        ></button>
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="4"
                aria-label="Slide 3"
        ></button>
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="5"
                aria-label="Slide 3"
        ></button>
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="6"
                aria-label="Slide 3"
        ></button>
        <button
                data-mdb-target="#carouselDarkVariant"
                data-mdb-slide-to="7"
                aria-label="Slide 3"
        ></button>
    </div>

    <!-- Inner -->
    <div class="carousel-inner" style="height: 650px; width: 100%; align-items: center;">
        <!-- Single item -->
        <div class="carousel-item active" style="height: 600px; width: 1280px; margin-left: 3.5%">
            <img
                    src="images/cro.jpg"
                    class="d-block w-100"
                    alt="..." style="height: auto;width: 1280px"
            />
            <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0,.5); margin-left: 0">
                <h5>Blueberry Croissant</h5>
            </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item" style="height: 600px; width: 1280px; margin: 3.5%">
            <img
                    src="images/doughnut.jpg"
                    class="d-block w-100"
                    alt="..." style="height: auto;width: 1280px"
            />
            <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0,.5); margin-left: 0">
                <h5>Rainbow Doughnuts</h5>
            </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item" style="height: 600px; width: 1280px; margin: 3.5%">
            <img
                    src="images/macaroon.jpg"
                    class="d-block w-100"
                    alt="..." style="height: auto;width: 1280px"
            />
            <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0,.5); margin-left: 0">
                <h5>Macaroons</h5>
            </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item" style="height: 600px; width: 1280px; margin: 3.5%">
            <img
                    src="images/cookies.jpg"
                    class="d-block w-100"
                    alt="..." style="height: auto;width: 1280px"
            />
            <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0,.5); margin-left: 0">
                <h5>Chocolate Chip Cookies</h5>
            </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item" style="height: 600px; width: 1280px; margin: 3.5%">
            <img
                    src="images/coffee.jpg"
                    class="d-block w-100"
                    alt="..." style="height: auto;width: 1280px"
            />
            <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0,.5); margin-left: 0">
                <h5>Cappuccino</h5>
            </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item" style="height: 600px; width: 1280px; margin: 3.5%">
            <img
                    src="images/waffles.jpg"
                    class="d-block w-100"
                    alt="..." style="height: auto;width: 1280px"
            />
            <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0,.5); margin-left: 0">
                <h5>Waffles</h5>
            </div>
        </div>

        <!-- Single item -->
        <div class="carousel-item" style="height: 600px; width: 1280px; margin: 3.5%">
            <img
                    src="images/pastry.jpg"
                    class="d-block w-100"
                    alt="..." style="height: auto;width: 1280px"
            />
            <div class="carousel-caption d-none d-md-block" style="background-color: rgba(0,0,0,.5); margin-left: 0">
                <h5>Birthday Cakes</h5>
            </div>
        </div>
    </div>
    <!-- Inner -->

    <!-- Controls -->
    <button
            class="carousel-control-prev"
            type="button"
            data-mdb-target="#carouselDarkVariant"
            data-mdb-slide="prev" style="color: white; margin-left: -20px"
    >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button
            class="carousel-control-next"
            type="button"
            data-mdb-target="#carouselDarkVariant"
            data-mdb-slide="next" style="color: white;margin-right: -20px"
    >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- Footer -->
<footer id="footer-end" class="text-center text-lg-start bg-dark text-muted" >
    <!-- Section: Links  -->
    <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom" style="background-image: linear-gradient(to right,rgb(29,29,29),rgb(32,33,35), rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20) ,rgb(21,21,21));">
        <div class="container text-center text-md-start mt-5">

    <!-- Section: Links  -->
    <!-- Copyright -->
    <div class="text-center bg-dark p-4" style="background-image: linear-gradient(to right,rgb(29,29,29),rgb(32,33,35), rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20) ,rgb(21,21,21));">
        © 2022 Copyright:
        <a class="text-reset fw-bold" href="https://www.northeastern.edu/">Northeastern University</a>
    </div>
    <!-- Copyright -->
</footer>
<!-- Footer -->
</body>
</html>