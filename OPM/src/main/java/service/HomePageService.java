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

public class HomePageService {

    private static ArrayList<Product> productList;
    private static DatabaseConnection databaseConnection;

    public static ResultSet getLogsData() throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "select product_id,sum(quantity_sold) as sm from log_  group by product_id order by sm desc";
        return databaseConnection.retriveData(query);
    }

    public static ResultSet getProductData(String query) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        return databaseConnection.retriveData(query);
    }

    public static int maxCart_id() throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "select max(cart_id)+1 as mx from cart";
        ResultSet rs = databaseConnection.retriveData(query);
        rs.next();
        int mx = rs.getInt("mx");
        return mx;
    }

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

//    public static int countWishlist(Wishlist wishlist) throws SQLException {
//        databaseConnection = Config.getDatabaseConnection();
//        String querysString = "select count(*) as cnt from wishlist where email=" + wishlist.getEmail() + " and product_id= " + wishlist.getProduct_id() + " ";
//        ResultSet rs = databaseConnection.retriveData(querysString);
//        rs.next();
//        int countWishlist = rs.getInt("cnt");
//        return countWishlist;
//    }
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
    
// to see pevious wishlist and add or remove option according to that

    public static HashMap<Integer, Boolean> getPreviousWishlistHashMap(String email, HashMap<Integer, Boolean> wishlistHashMap) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "select product_id from wishlist where email='" + email + "' ";
        ResultSet rs = databaseConnection.retriveData(querysString);

        while (rs.next()) {
            wishlistHashMap.put(rs.getInt("product_id"), true);
        }
        return wishlistHashMap;
    }

    public static ArrayList<Product> getList() {
        try {
            productList = new ArrayList<>();
            int count = 1;
            ResultSet logsResultSet = getLogsData();

            while (logsResultSet.next() && count <= 9) {
                Product product = new Product();

                String query = "select product_id,product_description,product_sell_price,unit from product where product_id=" + logsResultSet.getInt("product_id") + "";
                ResultSet productResultSet = getProductData(query);
                productResultSet.next();

                product.setProduct_id(productResultSet.getInt("product_id"));
                product.setProduct_description(productResultSet.getString("product_description"));
                product.setProduct_sell_price(productResultSet.getDouble("product_sell_price"));
                product.setUnit(productResultSet.getString("unit"));
                productList.add(product);    // ei productList theke product for-each loop use kore extract kora
                count++;
            }

        } catch (SQLException ex) {
            Logger.getLogger(HomePageService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return productList;
    }

}
