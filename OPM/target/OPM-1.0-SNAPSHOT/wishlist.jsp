<%-- 
    Document   : wishlist
    Created on : Mar 23, 2016, 6:39:24 AM
   
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>

        <style type="text/css">
            #what{ 
                background-color :orange;
                height:30px;
                width:40px;
                font-size: 18px;
            }

            .hell
            { 
                height:30px;
                width:70px;
                text-align: center;
                font-size: 20px;
            }
        </style>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Wishlist | e-Pharmacy</title>
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
                                    <li><a href=""><i class="fa fa-phone"></i> 01767123252 </a></li>
                                    <li><a href=""><i class="fa fa-envelope"></i> ePharmacy@gmail.com</a></li>
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
                            <div class="btn-group pull-right">			
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
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="index.jsp" class="active">Home</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="breadcrumbs">
                        <ol class="breadcrumb" style="font-size: 17px;">
                            <li><a href="wishlist.jsp">WISHLIST</a>
                        </ol>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->

        <section id="cart_items">
            <div class="container">

                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price</td>
                                <td class="quantity"></td>
                                <td class="total"></td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                if (session.getAttribute("productList") != null) {
                                    ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("productList");

                                    HashMap<Integer, Boolean> cartHashMap = (HashMap<Integer, Boolean>) session.getAttribute("cartHashMap");

                                    HashMap<Integer, Boolean> wishlistHashMap = (HashMap<Integer, Boolean>) session.getAttribute("wishlistHashMap");

                                    for (Product product : productList) {
                                        int product_id = product.getProduct_id();
                                        Boolean wishlistFlag = wishlistHashMap.get(product_id);
                                        Boolean cartFlag = cartHashMap.get(product_id);
                                        if (wishlistFlag == false) {
                                            continue;
                                        }

                                        String name = product.getProduct_description();
                                        String unit = product.getUnit();
                                        double price = product.getProduct_sell_price();
                                        String source = "images/" + product_id + ".jpg";


                            %>

                            <tr >
                                <td class="cart_product">
                                    <a href=""><img style="height:100px;width:100px;" src="<%=source%>" alt=""></a>
                                </td>
                                <td class="cart_description">
                                    <h5><%=name%></h5>
                                    <p>Product ID: <%=product_id%></p>
                                </td>
                                <td class="cart_price">
                                    <p>Tk.<%=price%></p>
                                </td>
                                <%
                                    if (cartFlag == false) {
                                %>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post"
                                          <input type="hidden" name="fromWishlist2" value="fromWishlist2">
                                        <input type="hidden" name="cart_in" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                    </form>
                                </td>
                                <%} else {%>
                                <td></td>
                                <%}%>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post">
                                        <input type="hidden" name="fromWishlist" value="fromWishlist">
                                        <input type="hidden" name="wishlist_out" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from wishlist</button>
                                    </form>
                                </td>

                            </tr>

                            <%}
                                }%>



                            <%-- pain killer start--%>     
                            <%
                                if (session.getAttribute("painkillerList") != null) {

                                    ArrayList<Product> painkillerList = (ArrayList<Product>) session.getAttribute("painkillerList");
                                    HashMap<Integer, Boolean> cartHashMap = (HashMap<Integer, Boolean>) session.getAttribute("cartHashMap");
                                    HashMap<Integer, Boolean> wishlistHashMap = (HashMap<Integer, Boolean>) session.getAttribute("wishlistHashMap");

                                    for (Product product : painkillerList) {
                                        int product_id = product.getProduct_id(); 
                                        Boolean wishlistFlag = wishlistHashMap.get(product_id);
                                        Boolean cartFlag = cartHashMap.get(product_id);
                                        if (wishlistFlag == false) {
                                            continue;
                                        }

                                        String name = product.getProduct_description();
                                        String unit = product.getUnit();
                                        double price = product.getProduct_sell_price();
                                        String source = "images/" + product_id + ".jpg";


                            %>

                            <tr >
                                <td class="cart_product">
                                    <a href=""><img style="height:100px;width:100px;" src="<%=source%>" alt=""></a>
                                </td>
                                <td class="cart_description">
                                    <h5><%=name%></h5>
                                    <p>Product ID: <%=product_id%></p>
                                </td>
                                <td class="cart_price">
                                    <p>Tk.<%=price%></p>
                                </td>
                                <%
                                    if (cartFlag == false) {
                                %>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post"
                                          <input type="hidden" name="fromWishlist2" value="fromWishlist2">
                                        <input type="hidden" name="cart_in" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                    </form>
                                </td>
                                <%} else {%>
                                <td></td>
                                <%}%>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post">
                                        <input type="hidden" name="fromWishlist" value="fromWishlist">
                                        <input type="hidden" name="wishlist_out" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from wishlist</button>
                                    </form>
                                </td>

                            </tr>

                            <%}
                                }%>
                            <%-- pain killer end--%>     


                            <%-- blood pressure start--%>     
                            <%
                                if (session.getAttribute("bloodPressureList") != null) {

                                    ArrayList<Product> bloodPressureList = (ArrayList<Product>) session.getAttribute("bloodPressureList");
                                    HashMap<Integer, Boolean> cartHashMap = (HashMap<Integer, Boolean>) session.getAttribute("cartHashMap");
                                    HashMap<Integer, Boolean> wishlistHashMap = (HashMap<Integer, Boolean>) session.getAttribute("wishlistHashMap");

                                    for (Product product : bloodPressureList) {
                                        int product_id = product.getProduct_id();
                                        Boolean wishlistFlag = wishlistHashMap.get(product_id);
                                        Boolean cartFlag = cartHashMap.get(product_id);
                                        if (wishlistFlag == false) {
                                            continue;
                                        }

                                        String name = product.getProduct_description();
                                        String unit = product.getUnit();
                                        double price = product.getProduct_sell_price();
                                        String source = "images/" + product_id + ".jpg";


                            %>

                            <tr >
                                <td class="cart_product">
                                    <a href=""><img style="height:100px;width:100px;" src="<%=source%>" alt=""></a>
                                </td>
                                <td class="cart_description">
                                    <h5><%=name%></h5>
                                    <p>Product ID: <%=product_id%></p>
                                </td>
                                <td class="cart_price">
                                    <p>Tk.<%=price%></p>
                                </td>
                                <%
                                    if (cartFlag == false) {
                                %>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post"
                                          <input type="hidden" name="fromWishlist2" value="fromWishlist2">
                                        <input type="hidden" name="cart_in" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                    </form>
                                </td>
                                <%} else {%>
                                <td></td>
                                <%}%>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post">
                                        <input type="hidden" name="fromWishlist" value="fromWishlist">
                                        <input type="hidden" name="wishlist_out" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from wishlist</button>
                                    </form>
                                </td>

                            </tr>

                            <%}
                                }%>
                            <%-- blood pressure end--%>    


                            
                             <%-- fever start--%>     
                            <%
                                if (session.getAttribute("feverList") != null) {

                                    ArrayList<Product> feverList = (ArrayList<Product>) session.getAttribute("feverList");
                                    HashMap<Integer, Boolean> cartHashMap = (HashMap<Integer, Boolean>) session.getAttribute("cartHashMap");
                                    HashMap<Integer, Boolean> wishlistHashMap = (HashMap<Integer, Boolean>) session.getAttribute("wishlistHashMap");

                                    for (Product product : feverList) {
                                        int product_id = product.getProduct_id();
                                        Boolean wishlistFlag = wishlistHashMap.get(product_id);
                                        Boolean cartFlag = cartHashMap.get(product_id);
                                        if (wishlistFlag == false) {
                                            continue;
                                        }

                                        String name = product.getProduct_description();
                                        String unit = product.getUnit();
                                        double price = product.getProduct_sell_price();
                                        String source = "images/" + product_id + ".jpg";


                            %>

                            <tr >
                                <td class="cart_product">
                                    <a href=""><img style="height:100px;width:100px;" src="<%=source%>" alt=""></a>
                                </td>
                                <td class="cart_description">
                                    <h5><%=name%></h5>
                                    <p>Product ID: <%=product_id%></p>
                                </td>
                                <td class="cart_price">
                                    <p>Tk.<%=price%></p>
                                </td>
                                <%
                                    if (cartFlag == false) {
                                %>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post"
                                          <input type="hidden" name="fromWishlist2" value="fromWishlist2">
                                        <input type="hidden" name="cart_in" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                    </form>
                                </td>
                                <%} else {%>
                                <td></td>
                                <%}%>
                                <td>
                                    <form style="float: right" action="HomePageServlet" method="post">
                                        <input type="hidden" name="fromWishlist" value="fromWishlist">
                                        <input type="hidden" name="wishlist_out" value=<%=product_id%>>
                                        <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from wishlist</button>
                                    </form>
                                </td>

                            </tr>

                            <%}
                                }%>
                            <%-- fever end--%>   

                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->

        <!--/#do_action-->

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
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
                                    <li><a href="">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Terms of Use</a></li>
                                    <li><a href="#">Privecy Policy</a></li>
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
                        <p class="pull-left">Copyright ©e-pharmacy Inc. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href=""></a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
