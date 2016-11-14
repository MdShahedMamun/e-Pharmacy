<%-- 
    Document   : fever
    Created on : Mar 28, 2016, 4:05:24 PM
    
--%>
<%@page import="java.util.HashMap"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Fever | e-pharmacy </title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head>
    <body> 

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
                                <li><a href="index.jsp" class="active"> Home </a></li>
                            </ul>

                        </div>

                        <form style="font-size:17px; text-align:right" name="input" action="SearchServlet" method="post">
                            <input name="found_something" type="hidden" value="0" > Find Product: 
                            <input style="width:300px" type="text" name="product" placeholder="Search your product">
                            <input type="submit" value="Search" style="background-color: #FF9933;color:#FFFFFF">
                        </form>
                    </div>
                </div>
            </div>
        </div><!--/header-bottom-->

        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#slider-carousel" data-slide-to="1"></li>
                                <li data-target="#slider-carousel" data-slide-to="2"></li>
                            </ol>

                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="col-sm-6">
                                        <br><br><br>
                                        <a href=""><button type="button" style="margin-left:50px;" class="btn btn-default get">Get it now</button></a>

                                        <h2>10% discount</h2> 

                                        <p> collection limited </p>
                                    </div>
                                    <div class="col-sm-6">

                                        <img src="images/home/image1.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="col-sm-6">
                                        <br><br><br>
                                        <a href=""><button type="button" style="margin-left:10px;" class="btn btn-default get">Get it now</button></a>

                                        <h2>20 Tk off </h2>
                                        <p> Omeprazole 1 file is at 200 taka  </p>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/image2.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="col-sm-6">
                                        <br><br><br>
                                        <a href=""><button type="button" style="margin-left:20px;" class="btn btn-default get">Get it now</button></a>

                                        <h2>5% discount </h2>
                                        <p> only for this month </p>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/image3.jpg" class="girl img-responsive" alt="" />
                                    </div>
                                </div>

                            </div>

                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </section><!--/slider-->

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <div class="breadcrumbs">

                            </div>
                            <h2>Category</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#fever">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Fever
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="fever" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="FeverServlet">Paracetamol </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#painKiller">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Pain killer
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="painKiller" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="PainkillerServlet">Diclofenac</a></li>
                                                <li><a href="PainkillerServlet">Aceclofenac</a></li>
                                                <li><a href="PainkillerServlet">Naproxen</a></li>       
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#bloodPressure">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Blood Preasure
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="bloodPressure" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="BloodPressureServlet">Losartan Potassium</a></li>
                                                <li><a href="BloodPressureServlet">Ramipril</a></li>
                                                <li><a href="BloodPressureServlet">Amlodipin</a></li>       
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#cholesterol">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Blood Cholesterol
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="cholesterol" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Antrovastatin</a></li>
                                                <li><a href="">Rosuvastatin</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>


                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#gastric">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Gastric Ulcer
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="gastric" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Antacid</a></li>
                                                <li><a href="">Omeprazol</a></li>
                                                <li><a href="">Pantropazol</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Antibiotic">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Antibiotic(Infection)
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Antibiotic" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Cephanadine</a></li>
                                                <li><a href="">Cefuroxime</a></li>
                                                <li><a href="">Cefixime</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Antispasmotic">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Antispasmotic
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Antispasmotic" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Tymonium Methaile sulphate</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Diuretics">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Diuretics(Increase Urine Output)
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Diuretics" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">furosemide</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Antihistamin">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Antihistamin
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Antihistamin" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Lonatidine</a></li>
                                                <li><a href="">Fexofendin</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Calcium">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Calcium Preparation
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Calcium" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Calcium Vit D3</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Asthmetic">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Anti Asthmetic
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Asthmetic" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Montelucast</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Sedative">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Sedative
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Sedative" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Midazolam</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Antihelminthic">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Antihelminthic
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Antihelminthic" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Albendazole</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Fungal">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Anti Fungal
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Fungal" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Fluconazole</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#Antiemetic">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                Antiemetic
                                            </a>
                                        </h4>
                                    </div>

                                    <div id="Antiemetic" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <ul>
                                                <li><a href="">Ondensetron</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div><!--/category-products-->
                        </div>
                    </div>


                    <%--<jsp:include page="/servlet/HomePageServlet" flush="true" />--%>


                    <div class="col-sm-9 padding-right">
                        <div class="features_items"><!--features_items-->
                            <h2 class="title text-center">Popular Items</h2>

                            <%
                                ArrayList<Product> productList = (ArrayList<Product>) session.getAttribute("feverList");

                                HashMap<Integer, Boolean> cartHashMap = (HashMap<Integer, Boolean>) session.getAttribute("cartHashMap");
                                HashMap<Integer, Boolean> wishlistHashMap = (HashMap<Integer, Boolean>) session.getAttribute("wishlistHashMap");

                                for (Product product : productList) {
                                    String name = product.getProduct_description();
                                    String unit = product.getUnit();
                                    double price = product.getProduct_sell_price();
                                    int product_id = product.getProduct_id();
//                                    out.print("pid: " + product_id+"   size: "+productList.size() );
                                    Boolean CartFlag = cartHashMap.get(product_id);
                                    Boolean wishlistFlag = wishlistHashMap.get(product_id);
                                    String source = "images/" + product_id + ".jpg";
                                    //out.println(source);
                            %>

                            <div class="col-sm-4">
                                <div class="product-image-wrapper">

                                    <%if (CartFlag == false) {
                                    %>
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src=<%=source%>  alt="Swapno" />
                                            <h2><%out.print(price);%> taka<li style="font-size: 15px; font-style: italic; color: green"><%out.print(unit);%></li></h2>
                                            <p style="color: darkcyan"><%out.print(name.substring(0, Math.min(20, name.length())));%></p>
                                            <!--CART-->
                                            <form action="FeverServlet" method="post">

                                                <input type="hidden" name="cart_in" value=<%=product_id%>>
                                                <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                            </form>

                                        </div>

<!--                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2><%out.print(price);%> taka</h2>
                                                <p><%out.print(name);%></p>
                                                <form action="FeverServlet" method="post">

                                                    <input type="hidden" name="cart_in" value=<%=product_id%>>
                                                    <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                </form>
                                            </div>
                                        </div>-->

                                    </div>

                                    <%} else {%>
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img src=<%=source%>  alt="Swapno" />
                                            <h2><%out.print(price);%> taka<li style="font-size: 15px; font-style: italic; color: green"><%out.print(unit);%></li></h2>
                                            <p style="color: darkcyan"><%out.print(name.substring(0, Math.min(20, name.length())));%></p>
                                            <!--CART-->
                                            <form action="FeverServlet" method="post">
                                                <input type="hidden" name="cart_out" value=<%=product_id%>>
                                                <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from cart</button>
                                            </form>

                                        </div>


<!--                                        <div class="product-overlay">
                                            <div class="overlay-content">
                                                <h2><%out.print(price);%> taka</h2>
                                                <p><%out.print(name);%></p>
                                                <form action="FeverServlet" method="post">

                                                    <input type="hidden" name="cart_out" value=<%=product_id%>>
                                                    <button type="submit" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Remove from cart</button>
                                                </form>
                                            </div>
                                        </div>-->

                                    </div>

                                    <%}
                                        if (wishlistFlag == false) { %>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><form action="<%if (session.getAttribute("userEmail") != null) {%>FeverServlet<%} else {%>loginSignup.jsp<%}%>" method="post">

                                                    <input type="hidden" name="wishlist_in" value=<%=product_id%>>
                                                    <button type="submit" class="btn btn-default add-to-cart">Add to wishlist</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>

                                    <%} else {%>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><form action="FeverServlet" method="post">

                                                    <input type="hidden" name="wishlist_out" value=<%=product_id%>>
                                                    <button type="submit" class="btn btn-default add-to-cart">Remove from wishlist</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                            <%}%>
                        </div><!--features_items-->
                    </div>
                </div>
            </div>                            
        </section>

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
                                    <li><a href="">Privecy Policy</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Pharmacy</h2>
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
                        <p class="pull-right"> <span> </span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
