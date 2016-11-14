/*
 */
package service;

import database.Config;
import database.DatabaseConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 *
 */
public class StatService {

    private final Map<String, Integer> medicineSellStat;
    private final Map<String, Integer> medicineSellStat2;
    private static DatabaseConnection databaseConnection;

    public StatService() {
        String product_name;
        int quantity_sold;
        medicineSellStat = new HashMap<>();
        medicineSellStat2 = new HashMap<>();
//        medicineSellStat.put("Ace Plus", 1500);
//        medicineSellStat.put("Napa", 500);
//        medicineSellStat.put("Ciprocine", 2300);
        try {

            databaseConnection = Config.getDatabaseConnection();
            String query = "select product.product_description,log_.quantity_sold from log_,product where log_.product_id=product.product_id and product.product_company='Square' ";
            ResultSet rs = databaseConnection.retriveData(query);
            while (rs.next()) {
                product_name = rs.getString("product_description");
                quantity_sold = rs.getInt("quantity_sold");
//                System.out.println("product_name: " + product_name + "  quantity_sold: " + quantity_sold);
                medicineSellStat.put(product_name, quantity_sold);

                query = "select subcategory_id from product where product_description='" + product_name + "'";
                ResultSet rs1 = databaseConnection.retriveData(query);
                rs1.next();
                int subcategory_id = rs1.getInt("subcategory_id");

                query = "select sum(log_.quantity_sold) as total from log_,product where log_.product_id=product.product_id and product.subcategory_id=" + subcategory_id + "";
                ResultSet rs2 = databaseConnection.retriveData(query);
                rs2.next();
                int totalSold = rs2.getInt("total");  //total sold for all product within the generic name for a product
                System.out.println("product_name: " + product_name + "  totalSold: " + totalSold);
                medicineSellStat2.put(product_name, totalSold);
                System.out.println("see: "+medicineSellStat2.get(product_name)); 
            }

        } catch (SQLException ex) {
            Logger.getLogger(StatService.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Map<String, Integer> getMedicineSellStat() {
        return medicineSellStat;
    }

    public Map<String, Integer> getMedicineSellStat2() {
        return medicineSellStat2;
    }

}
