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
 * @author shahed
 */
public class AccountService {

    private static DatabaseConnection databaseConnection;

    public static String getOldPassword(String oldEmail) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "select customer_password from customer where customer_email like '" + oldEmail + "' ";
        ResultSet rs = databaseConnection.retriveData(querysString);
        rs.next();
        String customer_password = rs.getString("customer_password");
        return customer_password;
    }

    public static void updateUser(User user, String oldEmail) throws SQLException {
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "update customer set customer_name='" + user.getName()
                + "',customer_email='" + user.getEmail() + "',customer_password='" + user.getPassword() + "' where customer_email='" + oldEmail + "' ";
        databaseConnection.executeUpdatePerform(querysString);
    }

    public static User getDetails(String oldEmail) throws SQLException {
        User user = new User();
        databaseConnection = Config.getDatabaseConnection();
        String querysString = "select customer_name,customer_email,customer_password from customer where customer_email like '" + oldEmail + "' ";
        ResultSet rs = databaseConnection.retriveData(querysString);
        rs.next();
        user.setPassword(rs.getString("customer_password"));
        user.setName(rs.getString("customer_name"));
        user.setEmail(rs.getString("customer_email"));
        return user;
    }

}
