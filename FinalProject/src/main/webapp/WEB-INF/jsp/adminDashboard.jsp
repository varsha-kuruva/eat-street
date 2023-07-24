<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.webtools.FinalProject.pojos.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Dashboard</title>
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

        .table-responsive::-webkit-scrollbar {
            width: 5px;
        }

        /* Track */
        .table-responsive::-webkit-scrollbar-track {
            opacity: 0.5;
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        .table-responsive::-webkit-scrollbar-thumb {
            background: grey;
            border-radius: 10px;
        }

        /* Handle on hover */
        .table-responsive::-webkit-scrollbar-thumb:hover {
            background: #adadad;
        }

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

        .ui-w-40 {
            width: 40px !important;
            height: auto;
        }

        .card {
            box-shadow: 0 1px 15px 1px rgba(52, 40, 104, .08);
        }

        .ui-product-color {
            display: inline-block;
            overflow: hidden;
            margin: .144em;
            width: .875rem;
            height: .875rem;
            border-radius: 10rem;
            -webkit-box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.15) inset;
            vertical-align: middle;
        }
    </style>
</head>
<body style="background-color: rgb(21,21,21)">
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<nav class="navbar navbar-expand-lg navbar-dark text-center"
     style="background-color: rgb(21,21,21); width: 100%;">
    <a class="navbar-brand" href="index.htm">
        <img src="images/restaurant-logo_1.png" height="80" width="138" alt="Restaurant Logo" style="margin-left: 50px">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav" style="font-size: 20px;">
            <li class="nav-item dropdown">
                <a type="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                   aria-expanded="false">Items</a>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="addItemForm.htm">Add item</a></li>
                    <li><a class="dropdown-item" href="viewItemsAdmin.htm">View/Delete item</a></li>
                </ul>
            </li>
            <li class="nav-item dropdown">
                <a type="button" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"
                   aria-expanded="false">Customers</a>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <li><a class="dropdown-item" href="viewCustomerAdmin.htm">View/Delete Customer</a></li>
                </ul>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#footer-end">Contact Us</a>
            </li>
<%--            <%--%>

<%--                Admin admin = (Admin) session.getAttribute("admin");--%>

<%--                out.println("<li class=\"nav-item dropdown\">\n" +--%>
<%--                        "                <a type=\"button\" class=\"nav-link dropdown-toggle\"\n" +--%>
<%--                        "                   data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n" +--%>
<%--                        admin.getAdminName() +--%>
<%--                        "                </a>\n" +--%>
<%--                        "                <ul class=\"dropdown-menu\">\n" +--%>
<%--                        "                    <li><a href=\"#\" class=\"dropdown-item\">Change Password</a></li>\n" +--%>
<%--                        "                    <li><a href=\"logout.htm\" class=\"dropdown-item\">Logout</a></li>\n" +--%>
<%--                        "                </ul>\n" +--%>
<%--                        "            </li>");--%>

<%--            %>--%>
            <li class="nav-item dropdown">
                <a type="button" class="nav-link dropdown-toggle"
                   data-bs-toggle="dropdown" aria-expanded="false">
                    ${sessionScope.get("admin").getAdminName()}
                </a>
                <ul class="dropdown-menu">
                    <li><a href="adminchangePasswordForm.htm"  class="dropdown-item">Change Password</a></li>
<%--                    <li><a href="<c:url value = "/logout.htm"/>" class="dropdown-item">Logout</a></li>--%>
<%--                    ${sessionScope.get("admin").getAdminName()}--%>
                    <li><a href="<c:url value = "/adminlogout.htm"/>" class="dropdown-item">Logout</a></li>
                </ul>
            </li>

        </ul>
    </div>
</nav>

<div class="jumbotron jumbotron-fluid"
     style="background-color: rgb(21,21,21);
            height: 200px;
            padding-top: 30px;
            text-align: center;">
    <div class="container text-white" style="background-color: rgb(21,21,21)">
        <h1 class="display-4 justify-content-center">Hello, ${sessionScope.get("admin").getAdminName()}!</h1>
    </div>
</div>

<footer id="footer-end" class="text-center text-lg-start bg-dark text-muted">

    <div class="text-center bg-dark p-4"
         style="background-image: linear-gradient(to right,rgb(21,21,21),rgb(21,21,21), rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20),rgb(20,20,20) ,rgb(21,21,21));">
        © 2022 Copyright:
        <a class="text-reset fw-bold" href="https://www.northeastern.edu/">Northeastern University</a>
    </div>
    <!-- Copyright -->
</footer>

</body>
</html>
