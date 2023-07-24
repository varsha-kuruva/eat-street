<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up Error</title>
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
</head>
<body style="background-color: rgb(21,21,21)">
<div style="text-align: center; margin: 10%;">
    <dl>
        <dt><img src="images/restaurant-logo_1.png" alt="" style="height: 20%; width: 20%"></dt>
        <dd>
            <h2 style="margin-top: 20px"><%out.println(request.getAttribute("error"));%></h2>
            <p class="text-white-50 mb-5"><a href="login.htm"> Customer Page</a> | <a href="admin.htm"> Admin Page</a></p>
        </dd>
    </dl>
</div>
</body>
</html>
