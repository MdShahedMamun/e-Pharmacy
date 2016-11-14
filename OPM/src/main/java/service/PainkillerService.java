/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import database.Config;
import database.DatabaseConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;
import model.Product;
import model.Wishlist;

/**
 *
 * 
 */
public class PainkillerService {

    private static ArrayList<Product> painkillerList;
    private static DatabaseConnection databaseConnection;

    public static void insertCartData(Cart cart) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "insert into cart values ( " + cart.getCart_id() + "," + cart.getProduct_id() + "," + cart.getQuantity() + " )";
        databaseConnection.executeUpdatePerform(query);
    }

    public static void insertWishlistData(Wishlist wishlist) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "insert into wishlist values ( '" + wishlist.getEmail() + "'," + wishlist.getProduct_id() + ")";
        databaseConnection.executeUpdatePerform(query);
    }

    public static void deleteCartData(Cart cart) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String queryString = "delete from cart where cart_id =" + cart.getCart_id() + " and product_id=" + cart.getProduct_id() + " ";
        databaseConnection.executeUpdatePerform(queryString);
    }

    public static void deleteWishlistData(Wishlist wishlist) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String queryString = "delete from wishlist where email ='" + wishlist.getEmail() + "' and product_id=" + wishlist.getProduct_id() + " ";
        databaseConnection.executeUpdatePerform(queryString);
    }

    public static int countCart(Cart cart) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "select count(*) as cnt from cart where cart_id=" + cart.getCart_id() + " ";
        ResultSet rs = databaseConnection.retriveData(querysString);
        rs.next();
        int countCart = rs.getInt("cnt");
        return countCart;
    }

    public static HashMap<Integer, Boolean> getCartHashMap(Cart cart, HashMap<Integer, Boolean> cartHashMap) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "select * from cart where cart_id=" + cart.getCart_id() + " and product_id=" + cart.getProduct_id() + " ";
        ResultSet rs = databaseConnection.retriveData(querysString);

        Boolean flag = rs.next();
        cartHashMap.put(cart.getProduct_id(), flag);
        return cartHashMap;
    }

    public static int countWishlist(String email) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "select count(*) as cnt from wishlist where email='" + email + "' ";
        ResultSet rs = databaseConnection.retriveData(querysString);
        rs.next();
        int countWishlist = rs.getInt("cnt");
        return countWishlist;
    }

    public static HashMap<Integer, Boolean> getWishlistHashMap(Wishlist wishlist, HashMap<Integer, Boolean> wishlistHashMap) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "select*from wishlist where email='" + wishlist.getEmail() + "' and product_id= " + wishlist.getProduct_id() + " ";
        ResultSet rs = databaseConnection.retriveData(querysString);

        Boolean flag = rs.next();
        wishlistHashMap.put(wishlist.getProduct_id(), flag);
        return wishlistHashMap;
    }

    public static ResultSet getProductData(String query) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        return databaseConnection.retriveData(query);
    }

    public static ArrayList<Product> getPainkillerList() {
        try {
            painkillerList = new ArrayList<>();

            String query = "select*from product where subcategory_id=2 or subcategory_id=3 or subcategory_id=4";
            ResultSet productResultSet = getProductData(query);

            while (productResultSet.next()) {
                Product product = new Product();
                product.setProduct_id(productResultSet.getInt("product_id"));
                product.setProduct_description(productResultSet.getString("product_description"));
                product.setProduct_sell_price(productResultSet.getDouble("product_sell_price"));
                product.setUnit(productResultSet.getString("unit"));
                painkillerList.add(product);    // ei productList theke product for-each loop use kore extract kora
//                System.out.println("i: " + product.getProduct_id() + "  d: " + product.getProduct_description() + "  s: " + product.getProduct_sell_price() + "  u: " + product.getUnit());
            }
        } catch (SQLException ex) {
            Logger.getLogger(HomePageService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return painkillerList;
    }
}
