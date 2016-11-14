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
import model.User;

/**
 *
 * 
 */
public class UserService {

    private static DatabaseConnection databaseConnection;

    public static ResultSet getUserData(User user) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "select * from customer where customer_email='" + user.getEmail() + "' ";
//        System.out.println(query);
        return databaseConnection.retriveData(query);
    }

    public static boolean verifyUser(User user) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "select * from customer where customer_email='" + user.getEmail() + "' and customer_password='" + user.getPassword() + "'";
        ResultSet res = databaseConnection.retriveData(query);
        return res.next();
    }

    public static void insertUserData(User user) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String query = "insert into customer(customer_name,customer_address,customer_city,customer_email,customer_password) values ('"
                + user.getName() + "','" + user.getAddress()
                + "','" + user.getCity() + "','" + user.getEmail() + "','" + user.getPassword() + "') ";
        databaseConnection.executeUpdatePerform(query);
    }

//    public static void main(String[] args) {
//        User user = new User();
//        user.setName("blabla");
//        user.setEmail("blabla@gmail.com");
//        try {
//            insertUserData(user);
//            ResultSet res = getUserData(user);
//            if (res.next()) {
//                System.out.println(res.getString("customer_name"));
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(UserService.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
