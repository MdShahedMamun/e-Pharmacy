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
import service.SearchService;

/**
 *
 * @author shahed
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

    private HashMap<Integer, Boolean> cartHashMap;
    private HashMap<Integer, Boolean> wishlistHashMap;
    private int countCart;
    private int countWishlist;
    private String userEmail;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            userEmail = (String) request.getSession().getAttribute("userEmail");

            String searchString = request.getParameter("product");
            searchString = searchString.toLowerCase();
            System.out.println("searchString: " + searchString);
            ArrayList<Product> searchList = SearchService.getSearchList(searchString);
            request.getSession().setAttribute("searchList", searchList);

            //nicher 4 ta reference er janno object create kori ni but session theke ei reference e HomePageServlet e create kora object er reference assign korsi
            cartHashMap = (HashMap<Integer, Boolean>) request.getSession().getAttribute("cartHashMap");
            countCart = (int) request.getSession().getAttribute("countCart");
            wishlistHashMap = (HashMap<Integer, Boolean>) request.getSession().getAttribute("wishlistHashMap");
            countWishlist = (int) request.getSession().getAttribute("countWishlist");

//            for(Product product:searchList){
//                System.out.println("2i: " + product.getProduct_id() + "  d: " + product.getProduct_description() + "  s: " + product.getProduct_sell_price() + "  u: " + product.getUnit());
//            }
            if (request.getParameter("cart_in") != null || request.getParameter("cart_out") != null) {
                int cartProduct_id;
                Cart cart = new Cart();
                cart.setCart_id((Integer) request.getSession().getAttribute("cartid"));
                if (request.getParameter("cart_in") != null) {
                    cartProduct_id = Integer.parseInt(request.getParameter("cart_in"));
                    cart.setProduct_id(cartProduct_id);
                    cart.setQuantity(1);
                    SearchService.insertCartData(cart);
                    request.getSession().setAttribute("cart_in", null);
                } else if (request.getParameter("cart_out") != null) {
                    cartProduct_id = Integer.parseInt(request.getParameter("cart_out"));
                    cart.setProduct_id(cartProduct_id);

                    SearchService.deleteCartData(cart);
                    request.getSession().setAttribute("cart_out", null);
                }
                // 2 method call
                countCart = SearchService.countCart(cart);
//                System.out.println("countCart: " + countCart);
//                System.out.println("cart_id: " + cart.getCart_id());
                cartHashMap = SearchService.getCartHashMap(cart, cartHashMap);
//              System.out.println("product_id: " + cart.getCart_id() + "  map to: " + cartHashMap.get(cart.getProduct_id()));

                countWishlist = SearchService.countWishlist(userEmail);
                request.getSession().setAttribute("countWishlist", countWishlist);

                request.getSession().setAttribute("cartHashMap", cartHashMap);
                request.getSession().setAttribute("countCart", countCart);
            }

            if (request.getParameter("wishlist_in") != null || request.getParameter("wishlist_out") != null) {
                int wishlistProduct_id;
                Wishlist wishlist = new Wishlist();
                wishlist.setEmail(request.getSession().getAttribute("userEmail").toString());
                if (request.getParameter("wishlist_in") != null) {
                    wishlistProduct_id = Integer.parseInt(request.getParameter("wishlist_in"));
                    wishlist.setProduct_id(wishlistProduct_id);
                    SearchService.insertWishlistData(wishlist);
                    request.getSession().setAttribute("wishlist_in", null);
//                    System.out.println("win");
                } else if (request.getParameter("wishlist_out") != null) {
                    wishlistProduct_id = Integer.parseInt(request.getParameter("wishlist_out"));
                    wishlist.setProduct_id(wishlistProduct_id);
                    SearchService.deleteWishlistData(wishlist);
                    request.getSession().setAttribute("wishlist_out", null);
                }

                countWishlist = SearchService.countWishlist(userEmail);

                wishlistHashMap = SearchService.getWishlistHashMap(wishlist, wishlistHashMap);
//                System.out.println("countWishlist: " + countWishlist + " wishlistHashMap value" + wishlistHashMap.get(wishlist.getProduct_id()));
                request.getSession().setAttribute("wishlistHashMap", wishlistHashMap);
                request.getSession().setAttribute("countWishlist", countWishlist);
            }

            RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
            rd.forward(request, response);

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
