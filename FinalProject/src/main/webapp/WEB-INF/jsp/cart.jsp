<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.webtools.FinalProject.pojos.Customer" %>
<%@ page import="com.webtools.FinalProject.pojos.Item" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
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
            <%
                if (session.getAttribute("customer") == null) {
                    out.println("<li class=\"nav-item\">\n" +
                            "                <a class=\"nav-link\" href=\"index.htm\">Home <span class=\"sr-only\">(current)</span></a>\n" +
                            "            </li>");
                }
            %>

            <li class="nav-item">
                <a class="nav-link" href="menu1.htm">Menu</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="orders.htm">Orders</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#footer-end">Contact Us</a>
            </li>
            <%

            Customer customer = (Customer) session.getAttribute("customer");
                if (customer == null) {
                    out.println("<li class=\"nav-item\">\n" +
                            "                <a class=\"nav-link\" href=\"login.htm\">Login</a>\n" +
                            "            </li>");
                } else {
                    int count = 0;
                    if (session.getAttribute("countCart") != null) {
                        count = (int) session.getAttribute("countCart");
                    }
                    out.println("<li class=\"nav-item\">\n" +
                            "                <a class=\"nav-link active disabled\" href=\"#\">\n" +
                            "                    <i class=\"fa\" style=\"font-size:20px\">&#xf07a;</i>\n" +
                            "                    <span class='badge badge-warning' id='lblcountCart'> " + count + " </span>\n" +
                            "                    </a>\n" +
                            "            </li>");
                    out.println("<li class=\"nav-item dropdown\">\n" +
                            "                <a type=\"button\" class=\"nav-link dropdown-toggle\"\n" +
                            "                   data-bs-toggle=\"dropdown\" aria-expanded=\"false\">\n" +
                            customer.getCustomerName() +
                            "                </a>\n" +
                            "                <ul class=\"dropdown-menu\">\n" +
                            "                    <li><a href=\"#\" class=\"dropdown-item\">Change Password</a></li>\n" +
                            "                    <li><a href=\"logout.htm\" class=\"dropdown-item\">Logout</a></li>\n" +
                            "                </ul>\n" +
                            "            </li>");
                }
            %>

        </ul>
    </div>
</nav>

<div class="jumbotron jumbotron-fluid"
     style="background-color: rgb(21,21,21);
            height: 200px;
            padding-top: 30px;
            text-align: center;">
    <div class="container text-white" style="background-color: rgb(21,21,21)">
        <h1 class="display-4 justify-content-center">Your Cart</h1>
    </div>
</div>

<div class="container px-3 my-5 clearfix">
    <!-- Shopping cart table -->
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered m-0">
                    <thead>
                    <tr>
                        <!-- Set columns width -->
                        <th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
                        <th class="text-right py-3 px-4" style="width: 100px;">Price</th>
                        <th class="text-center py-3 px-4" style="width: 120px;">Quantity</th>
                        <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
                        <th class="text-center align-middle py-3 px-0" style="width: 40px;"><a href="#"
                                                                                               class="shop-tooltip float-none text-light"
                                                                                               title=""
                                                                                               data-original-title="Clear cart"><i
                                class="ino ion-md-trash"></i></a></th>
                    </tr>
                    </thead>
                    <tbody>

                    <%

                        double total = 0;

                        HashMap<Item, Integer> items = (HashMap) session.getAttribute("items");
                        for (Item i : items.keySet()) {
                            out.println("<tr>");
                            out.println("<td class=\"text-right font-weight-semibold align-middle p-4\">" + i.getItemName() + "</td>");
                            out.println("<td class=\"text-right font-weight-semibold align-middle p-4\">" + i.getItemPrice() + "</td>");
                            out.println("<td class=\"text-center align-middle p-4\">" + items.get(i) + "</td>");
                            out.println("<td class=\"text-right font-weight-semibold align-middle p-4\" >" + i.getItemPrice() * items.get(i) + "</td>");
                            out.println("<td class=\"text-center align-middle px-0\"><a href=\"removeItem.htm?itemId=" + i.getItemId() + "\" class=\"shop-tooltip close float-none text-danger\" title=\"\" data-original-title=\"Remove\">×</a></td>");
                            out.println("</tr>");
                            total += i.getItemPrice() * items.get(i);
                        }

                    %>
                    </tbody>
                </table>
            </div>
            <!-- / Shopping cart table -->

            <div class="d-flex flex-wrap justify-content-between align-items-center p-2 pb-4">
                <div class="mt-4 p-2">
<!--                    <label class="text-muted font-weight-normal">Promocode</label>
                    <input type="text" placeholder="ABC" class="form-control">-->
                </div>
                <div class="d-flex p-2">
                    <div class="text-right mt-4 mr-5 p-2">
<%--                        <label class="text-muted font-weight-normal m-0">Discount</label>--%>
<%--                        <div class="text-large"><strong>$00</strong></div>--%>
                    </div>
                    <div class="text-right mt-4 p-2">
                        <label class="text-muted font-weight-normal m-0">Total price</label>
                        <div class="text-large"><strong>$<%out.println(String.format("%.2f", total));%></strong></div>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-row-reverse mr-3">
                <form action="createOrder.htm" method="post">
                    <a href="/FinalProject/menu1.htm" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3" style="margin-right: 4px">Back
                        to Menu</a>
                    <button type="submit" class="btn btn-lg btn-dark mt-2" style="margin-right: 4px">Place Order
                    </button>
                </form>
            </div>

        </div>
    </div>
</div>


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
