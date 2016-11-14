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
import model.Product;

/**
 *
 * @author shahed
 */

public class InsertService {

    private static ArrayList<Product> productList;
    private static DatabaseConnection databaseConnection;

    public static void insertNewData(String name, String company, String unit, String product_sell_price,
            String product_purchase_price, String product_exp_date, String product_offer, String stock) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "select max(product_id) as mx from product";
        ResultSet rs = databaseConnection.retriveData(query);
        rs.next();
        int id = rs.getInt("mx") + 1;

        databaseConnection = Config.getDatabaseConnection();
        query = "insert into product values(" + id + ",'" + name + "','" + company + "','" + unit + "','" + product_sell_price + "','" + product_purchase_price
                + "','" + product_exp_date + "','" + product_offer + "','" + stock + "','" + stock + "'," + 16 + ")";
        databaseConnection.executeUpdatePerform(query);
    }
}
