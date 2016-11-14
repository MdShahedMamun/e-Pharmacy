package database;

import java.sql.SQLException;

public class Config {

    static final String DATABASE_URL = "jdbc:mysql://localhost:3306/medicine";
    static final String USER = "root";
    static final String PASSWORD = "";

    private static DatabaseConnection dbConnection;

    public static DatabaseConnection getDatabaseConnection() throws SQLException {
        if (dbConnection != null) {
//            System.out.println("00000");
            return dbConnection;
        } else {
            dbConnection = new DatabaseConnection(DATABASE_URL, USER, PASSWORD);
            return dbConnection;
        }
    }

}
