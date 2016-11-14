/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Product;
import model.Wishlist;
import service.HomePageService;

/**
 *
 * 
 */
@WebServlet(name = "HomePageServlet", urlPatterns = {"/HomePageServlet"})
public class HomePageServlet extends HttpServlet {

    private HashMap<Integer, Boolean> cartHashMap;
    private HashMap<Integer, Boolean> wishlistHashMap;
    private int countCart;
    private int countWishlist;
    private String userEmail;
    private boolean wishFlag;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            int mx = HomePageService.maxCart_id();

            userEmail = (String) request.getSession().getAttribute("userEmail");
//            System.out.println("userEmail: " + userEmail);
//            if (userEmail == null) {
//                userEmail = "shahed@gmail.com";
//            }
            Integer cartId = (Integer) request.getSession().getAttribute("cartid");

            //   if (val == null || (!(val.compareTo("1000000") < 0
            //        && val.compareTo("0") > 0))) {
            if (cartId == null) {
                request.getSession().setAttribute("cartid", mx);
//                System.out.println("first access > mx: " + mx);
//                System.out.println("email: " + userEmail);
                cartHashMap = new HashMap<>();
                wishlistHashMap = new HashMap<>();
                for (int i = 1; i <= 124; i++) {
                    cartHashMap.put(i, false);
                    wishlistHashMap.put(i, false);
                }

                countCart = 0;
                countWishlist = HomePageService.countWishlist(userEmail);
                wishlistHashMap = HomePageService.getPreviousWishlistHashMap(userEmail, wishlistHashMap);

//                System.out.println("count wish list: " + countWishlist);
                //System.out.println(countCart);
                request.getSession().setAttribute("cartHashMap", cartHashMap);
                request.getSession().setAttribute("countCart", countCart);
                request.getSession().setAttribute("wishlistHashMap", wishlistHashMap);
                request.getSession().setAttribute("countWishlist", countWishlist);

                // code for log(popular product) in home page                 
                ArrayList<Product> productList = HomePageService.getList();    // getList() method called **(only one) for each session
                request.getSession().setAttribute("productList", productList);                        // ei productList theke product for-each loop use kore extract kora
            }

            if (request.getParameter("cart_in") != null || request.getParameter("cart_out") != null) {
                int cartProduct_id;
                Cart cart = new Cart();
                cart.setCart_id((Integer) request.getSession().getAttribute("cartid"));
                if (request.getParameter("cart_in") != null) {
                    cartProduct_id = Integer.parseInt(request.getParameter("cart_in"));
                    cart.setProduct_id(cartProduct_id);
                    cart.setQuantity(1);
                    HomePageService.insertCartData(cart);
                    request.getSession().setAttribute("cart_in", null);
                } else if (request.getParameter("cart_out") != null) {
                    cartProduct_id = Integer.parseInt(request.getParameter("cart_out"));
                    cart.setProduct_id(cartProduct_id);

                    HomePageService.deleteCartData(cart);
                    request.getSession().setAttribute("cart_out", null);
                }
                // 2 method call
                countCart = HomePageService.countCart(cart);
//                System.out.println("countCart: " + countCart);
//                System.out.println("cart_id: " + cart.getCart_id());
                cartHashMap = HomePageService.getCartHashMap(cart, cartHashMap);
//              System.out.println("product_id: " + cart.getCart_id() + "  map to: " + cartHashMap.get(cart.getProduct_id()));

                countWishlist = HomePageService.countWishlist(userEmail);
                request.getSession().setAttribute("countWishlist", countWishlist);

                request.getSession().setAttribute("cartHashMap", cartHashMap);
                request.getSession().setAttribute("countCart", countCart);

//                System.out.println("see c: " + request.getParameter("fromWishlist2"));
//                System.out.println("see c2: " + request.getParameter("cart_in"));
                wishFlag = "fromWishlist".equals(request.getParameter("fromWishlist2"));
                if (wishFlag) {
//                    System.out.println("wishFlag w: " + wishFlag);
                    RequestDispatcher rd = request.getRequestDispatcher("wishlist.jsp");
                    rd.forward(request, response);
                } else {
//                    System.out.println("wishFlag w: " + wishFlag);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
            }

            if (request.getParameter("wishlist_in") != null || request.getParameter("wishlist_out") != null) {
                int wishlistProduct_id;
                Wishlist wishlist = new Wishlist();
                wishlist.setEmail(request.getSession().getAttribute("userEmail").toString());
                if (request.getParameter("wishlist_in") != null) {
                    wishlistProduct_id = Integer.parseInt(request.getParameter("wishlist_in"));
                    wishlist.setProduct_id(wishlistProduct_id);
                    HomePageService.insertWishlistData(wishlist);
                    request.getSession().setAttribute("wishlist_in", null);
//                    System.out.println("win");
                } else if (request.getParameter("wishlist_out") != null) {
                    wishlistProduct_id = Integer.parseInt(request.getParameter("wishlist_out"));
                    wishlist.setProduct_id(wishlistProduct_id);
                    HomePageService.deleteWishlistData(wishlist);
                    request.getSession().setAttribute("wishlist_out", null);
                }

                countWishlist = HomePageService.countWishlist(userEmail);

                wishlistHashMap = HomePageService.getWishlistHashMap(wishlist, wishlistHashMap);
//                System.out.println("countWishlist: " + countWishlist + " wishlistHashMap value" + wishlistHashMap.get(wishlist.getProduct_id()));
                request.getSession().setAttribute("wishlistHashMap", wishlistHashMap);
                request.getSession().setAttribute("countWishlist", countWishlist);

//                System.out.println("see c : " + request.getParameter("fromWishlist"));
                wishFlag = "fromWishlist".equals(request.getParameter("fromWishlist"));
                if (wishFlag) {
//                    System.out.println("wishFlag w: " + wishFlag);
                    RequestDispatcher rd = request.getRequestDispatcher("wishlist.jsp");
                    rd.forward(request, response);
                } else {
//                    System.out.println("wishFlag w: " + wishFlag);
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(HomePageServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
