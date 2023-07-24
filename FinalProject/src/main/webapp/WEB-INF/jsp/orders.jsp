<%@ page import="com.webtools.FinalProject.pojos.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="com.webtools.FinalProject.pojos.Item" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.webtools.FinalProject.pojos.Customer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${sessionScope.get('customer') == null}">
    <c:redirect url="/index.htm"/>
</c:if>
<html>
<head>
    <title>Orders</title>
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

        .cell-1 {
            border-collapse: separate;
            border-spacing: 0 4em;
            background: #fff;
            border-bottom: 5px solid transparent;
            background-clip: padding-box
        }

        thead {
            background: #dddcdc
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
</head>
<body style="overflow-x: hidden; background-color: rgb(21,21,21)">
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
                <a class="nav-link active disabled" href="orders.htm">Orders</a>
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
                            "                <a class=\"nav-link\" href=\"viewCart.htm\">\n" +
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
        <h1 class="display-4 justify-content-center">Order History</h1>
    </div>
</div>

<div class="container mt-5">
    <div class="d-flex justify-content-center row">
        <div class="col-md-10">
            <div class="rounded">
                <div class="table-responsive table-borderless">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Order #</th>
                            <th>Status</th>
                            <th>Items</th>
                            <th>Total</th>
                            <th>Created</th>
                        </tr>
                        </thead>
                        <tbody class="table-body">
                        <%

                            List<Orders> orderList = customer.getCustomerOrders();

                            if (orderList.size() == 0) {
                                out.println("<tr class=\"cell-1\">");
                                out.println("<td>-</td>");
                                out.println("<td><span class=\"text-primary\">-</span></td>");
                                out.println("<td>-</td>");
                                out.println("<td>-</td>");
                                out.println("<td>-</td>");
                                out.println("</tr>");
                            } else {
                                for (Orders o : orderList) {
                                    HashMap<Item, Integer> itemsList = new HashMap<>();
                                    for (Item i : o.getItemsOrder()) {
                                        if (itemsList.containsKey(i))
                                            itemsList.put(i, itemsList.get(i) + 1);
                                        else
                                            itemsList.put(i, 1);
                                    }
                                    StringBuilder items = new StringBuilder();
                                    for (Item i : itemsList.keySet()) {
                                        items.append(i.getItemName()).append("(").append(itemsList.get(i)).append("),");
                                    }
                                    out.println("<tr class=\"cell-1\">");
                                    out.println("<td>" + o.getOrderId() + "</td>");
                                    if (o.getOrderStatus().equals("Confirmed")) {
                                        out.println("<td><span class=\"text-success\">Confirmed</span></td>");
                                    } else if (o.getOrderStatus().equals("Fulfilled")) {
                                        out.println("<td><span class=\"text-info\">Fulfilled</span></td>");
                                    }
                                    out.println("<td>" + items + "</td>");
                                    out.println("<td>$" + o.getOrderTotal() + "</td>");
                                    out.println("<td>" + o.getOrderDate() + "</td>");
                                    out.println("</tr>");
                                }
                            }

                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
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
