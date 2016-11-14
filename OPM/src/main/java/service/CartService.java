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
import model.Log;

/**
 *
 * 
 */
public class CartService {

    private static DatabaseConnection databaseConnection;

    public static double pricePerUnit(int product_id) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "SELECT product_sell_price from product where product_id=" + product_id + " ";
        ResultSet rs = databaseConnection.retriveData(querysString);
        rs.next();
        double perUnitPrice = rs.getDouble("product_sell_price");
        return perUnitPrice;
    }

    public static void insertLogListData(ArrayList<Log> logList) throws SQLException {
        System.out.println("stat jfj   ldk ");
        for (Log log : logList) {
            int product_id = log.getProduct_id();
            int quantity_sold = log.getQuantity_sold();
            //jodi age thekei log table e current product_id thake tobe oi id te update korte hobe
            databaseConnection = Config.getDatabaseConnection();
            String query = "SELECT count(*) as cnt from log_ where product_id=" + product_id + " ";
            ResultSet rs = databaseConnection.retriveData(query);
            rs.next();
            int cnt = rs.getInt("cnt");

            databaseConnection = Config.getDatabaseConnection();
            if (cnt == 0) {
                query = "insert into log_(product_id,quantity_sold) values (" + product_id + "," + quantity_sold + ") ";
                databaseConnection.executeUpdatePerform(query);
            } else {
                query = "update log_  set quantity_sold=quantity_sold+" + quantity_sold + " where product_id=" + product_id + " ";         //update query
                databaseConnection.executeUpdatePerform(query);
            }
        }
    }

}
