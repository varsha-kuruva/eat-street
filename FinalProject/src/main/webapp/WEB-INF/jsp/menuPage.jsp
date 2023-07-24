<%@ page import="com.webtools.FinalProject.pojos.Item" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.webtools.FinalProject.pojos.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
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
<body>
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
                if(session.getAttribute("customer") == null){
                    out.println("<li class=\"nav-item\">\n" +
                            "                <a class=\"nav-link\" href=\"index.htm\">Home <span class=\"sr-only\">(current)</span></a>\n" +
                            "            </li>");
                }
            %>

            <li class="nav-item">
                <a class="nav-link active" href="menu1.htm">Menu</a>
            </li>
            <%
                if(session.getAttribute("customer") != null){
                    out.println("<li class=\"nav-item\">\n" +
                            "                <a class=\"nav-link\" href=\"orders.htm\">Orders</a>\n" +
                            "            </li>");
                }
            %>

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
                    if(session.getAttribute("countCart")!=null){
                        count = (int)session.getAttribute("countCart");
                    }
                    out.println("<li class=\"nav-item\">\n" +
                            "                <a class=\"nav-link\" href=\"viewCart.htm\">\n" +
                            "                    <i class=\"fa\" style=\"font-size:20px\">&#xf07a;</i>\n" +
                            "                    <span class='badge badge-warning' id='lblcountCart'> "+count+" </span>\n" +
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
        <h1 class="display-4 justify-content-center">Our Menu</h1>
    </div>
</div>

<div class="d-flex align-content-start flex-wrap" style="background-color: rgb(21,21,21); width: 100%">
    <%
        Map<Long, Item> itemsList = (Map<Long, Item>) request.getAttribute("itemsList");
        int counter = 1;
        for (long i : itemsList.keySet()) {
            if (counter % 3 == 1) {
                out.println("<div class=\"row\" style=\"width:100%; margin-left:inherit\">");
            }
            out.println("<div class=\"card col-sm-4 bg-dark text-white m-2\" style=\"width: 30%; height: 300px;\">");
            out.println("<div class=\"card-body shadow-sm bg-dark\">");
            out.println("<h5 class=\"card-title\">" + itemsList.get(i).getItemName() + "</h5>");
            out.println("<p class=\"card-text\">" + itemsList.get(i).getItemDescription() + "</p>");
            out.println("<p class=\"card-text\">$ " + itemsList.get(i).getItemPrice() + "</p>");
            if (session.getAttribute("customer") != null) {
                out.println("<a href=\"addItemToCart.htm?itemId="+itemsList.get(i).getItemId()+"\" class=\"btn btn-dark text-white btn-sm\">Add To Cart</a>");
            }
            out.println("</div>");
            out.println("</div>");
            if (counter % 3 == 0 || counter == itemsList.size()) {
                out.println("</div>");
            }
            counter++;
        }
    %>
</div>

<nav aria-label="Page navigation example text-white"
     style="background-color: rgb(21,21,21); height: 50px;padding-right: 30px">
    <ul class="pagination justify-content-end">
        <%
            if ((Integer) request.getAttribute("p") == 1)
                out.println("<li class=\"page-item disabled\" style=\"margin: 2px\"><a class=\"page-link bg-dark text-white\" href=\"menu1.htm\">1</a></li>");
            else
                out.println("<li class=\"page-item \" style=\"margin: 2px\"><a class=\"page-link bg-dark text-white\" href=\"menu1.htm\">1</a></li>");
        %>
        <%
            if ((Integer) request.getAttribute("p") == 2)
                out.println("<li class=\"page-item disabled\" style=\"margin: 2px\"><a class=\"page-link bg-dark text-white\" href=\"menu2.htm\">2</a></li>");
            else
                out.println("<li class=\"page-item \" style=\"margin: 2px\"><a class=\"page-link bg-dark text-white\" href=\"menu2.htm\">2</a></li>");
        %>
        <%
            if ((Integer) request.getAttribute("p") == 3)
                out.println("<li class=\"page-item disabled\" style=\"margin: 2px\"><a class=\"page-link bg-dark text-white\" href=\"menu3.htm\">3</a></li>");
            else
                out.println("<li class=\"page-item \" style=\"margin: 2px\"><a class=\"page-link bg-dark text-white\" href=\"menu3.htm\">3</a></li>");
        %>
    </ul>
</nav>
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
