<%-- 
    Document   : account
    Created on : Mar 31, 2016, 8:09:54 PM
    Author     : shahed
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Account |  e-Pharmacy</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->




    <body>

        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 ">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href="http://localhost:8084/e-SHOPPER/contact-us.jsp"><i class="fa fa-phone"></i> 01767123252 </a></li>
                                    <li><a href="http://localhost:8084/e-SHOPPER/contact-us.jsp"><i class="fa fa-envelope"></i>  ePharmacy@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="http://facebook.com"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="http://twitter.com"><i class="fa fa-twitter"></i></a></li>
                                    <li><a href="http://linkedin.com"><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href="http://drrible.com"><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

            <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="index.jsp"><img src="images/home/logo.jpg" alt="" /></a>
                            </div>

                        </div>

                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <%
                                        Integer countCart = (Integer) session.getAttribute("countCart");
                                        Integer countWishlist = (Integer) session.getAttribute("countWishlist");

                                        if (session.getAttribute("userEmail") != null && (!session.getAttribute("userEmail").toString().endsWith("0"))) {%>
                                    <li><a href="wishlist.jsp"><i class="fa fa-star"></i> Wishlist(<%=countWishlist%>)</a></li>
                                    <li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i> Cart(<%=countCart%>)</a></li>
                                    <li><a href="AccountServlet"><%=session.getAttribute("userEmail")%></a></li>
                                    <li><a href="logout.jsp"><i class="fa fa-unlock"></i> Logout</a></li>
                                        <%} else {%>
                                    <li><a href="loginSignup.jsp"><i class="fa fa-star"></i> Wishlist(<%=countWishlist%>)</a></li>
                                    <li><a href="loginSignup.jsp"><i class="fa fa-shopping-cart"></i> Cart(<%=countCart%>)</a></li>
                                    <li><a href="loginSignup.jsp"><i class="fa fa-crosshairs"></i> Register</a></li>
                                    <li><a href="loginSignup.jsp"><i class="fa fa-lock"></i> Login</a></li>
                                        <%}%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->
            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">

                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="index.jsp" class="active">Home</a></li> 
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div><!--/header-bottom-->
        </header>
        <!--/header-->
        <section id="form"><!--form-->
            <div class="container">
                <div class="col-sm-4">
                    <div class="signup-form"><!--sign up form-->
                        <h1>Profile</h1>
                        <div style="margin-left:  80px;">
                            <img src="images/user.jpg" alt="Profile picture" style="height:150px;width:150px;">
                        </div>
                        <h2>Edit Details:</h2>
                        <%

                            User user = (User) request.getAttribute("user");
                            String name = user.getName();
                            String email = request.getSession().getAttribute("userEmail").toString();
                            if (request.getAttribute("passFlag") != null) {
                                boolean passFlag = (Boolean) request.getAttribute("passFlag");
                                if (passFlag) {%>
                        Successfully updated your details:)
                        <%
                        } else if (passFlag == false) {%>
                        Password Incorrect! Try Again
                        <%}
                        } else {
                        %>
                        Please fill the required fields
                        <%}%> 

                        <form action="AccountServlet" method="post">
                            <br>
                            Name:<input type="text" name="name"  Value="<%=name%>"/>
                            Email:<input type="text" name="email"  Value="<%=email%>"/>
                            Old Password<input type="password" name="oldPassword" placeholder="Old Password" />
                            New Password<input type="password" name="newPassword" placeholder="New Password"/>
                            <input type="hidden" name="changereq" value="yes">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>

                    </div><!--/sign up form-->
                </div>
            </div>
        </section><!--/form-->


        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                    </div>
                </div>
            </div>

            <div class="footer-widget">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Service</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Contact Us</a></li>
                                    <li><a href="">FAQ?s</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Terms of Use</a></li>
                                    <li><a href="">Privacy Policy</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Company Information</a></li>
                                    <li><a href="">About Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left"></p>
                        <p class="pull-right"><span> </span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

