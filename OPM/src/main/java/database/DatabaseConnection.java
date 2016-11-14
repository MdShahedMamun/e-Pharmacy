package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DatabaseConnection {

    private final Connection connection;
    private ResultSet resultSet = null;
    private boolean connectedToDatabase = false;

    public DatabaseConnection(String url, String username, String password) throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        connection = DriverManager.getConnection(url, username, password);
        connectedToDatabase = true;
    }

    public Connection getConnection() {
        return connection;
    }

    public void executeUpdatePerform(String query) throws SQLException, IllegalStateException {
        if (!connectedToDatabase) {
            throw new IllegalStateException("Not Connected to Database");
        }
        Statement statement = connection.createStatement();
        statement.executeUpdate(query);
    }

    public ResultSet retriveData(String query) throws SQLException {
        if (connectedToDatabase) {
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            return resultSet;
        }
        return null;
    }

    public void disconnectFromDatabase() {

        if (connectedToDatabase) {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                connection.close();
            } catch (SQLException sqlException) {
            } finally {
                connectedToDatabase = false;
            }
        }
    }
}
