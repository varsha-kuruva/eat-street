<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${sessionScope.get('customer') == null}">
    <c:redirect url="/index.htm"/>
</c:if>
<html>
<head>
    <title>Dashboard</title>
    <link rel="icon" href="images/restaurant-logo_1.png"/>
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
        .badge {
            padding-left: 9px;
            padding-right: 9px;
            -webkit-border-radius: 9px;
            -moz-border-radius: 9px;
            border-radius: 9px;
        }

        .label-warning[href],
        .badge-warning[href] {
            background-color: #c67605;
        }

        #lblcountCart {
            font-size: 12px;
            background: #ff0000;
            color: #fff;
            padding: 0 5px;
            vertical-align: top;
            margin-left: -10px;
        }
    </style>
</head>
<body style="overflow-x: hidden">
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!-- <nav class="navbar navbar-expand-lg navbar-dark text-center"
     style="position: absolute; width: 100%; background-color: transparent">
    <a class="navbar-brand" href="index.htm">
        <img src="images/restaurant-logo_1.png" height="80" width="138" alt="Restaurant Logo" style="margin-left: 50px">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav" style="font-size: 20px">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value = "/menu1.htm"/>">Menu</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="orders.htm">Orders</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#footer-end">Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="viewCart.htm">
                    <i class="fa" style="font-size:20px">&#xf07a;</i>
                    <span class='badge badge-warning' id='lblcountCart'> <%
                        if (session.getAttribute("countCart") == null) {
                            out.println("0");
                        } else {
                            int count = (int) session.getAttribute("countCart");
                            out.println(count);
                        }
                    %> </span>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a type="button" class="nav-link dropdown-toggle"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    ${sessionScope.get("customer").getCustomerName()}
                </a>
                <ul class="dropdown-menu">
                    <li><a href="changePasswordForm.htm"  class="dropdown-item">Change Password</a></li>
                    <li><a href="<c:url value = "/logout.htm"/>" class="dropdown-item">Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav> -->
<!-- <div style="background-image: url('images/userlogin.jpeg'); background-size: cover; height: 800px">
</div> -->

<div style="text-align: center; margin: 10%;">
    <dl>
        <dt><img src="images/restaurant-logo_1.png" alt="" style="height: 20%; width: 20%"></dt>
        <dd>
            <h2 style="margin-top: 20px">Order Placed Successfully!</h2>
                
            <!-- <p class="text-white-50 mb-5"><a href="orders.htm">Your Orders</a> -->
            <a href="logout.htm">Done!</a></p>
            
        </dd>
    </dl>
</div>


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
