/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * 
 */
public class Log{

    private String product_name;
    private int product_id;
    private int quantity_sold;

    public Log() {
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setQuantity_sold(int quantity_sold) {
        this.quantity_sold = quantity_sold;
    }

    public String getProduct_name() {
        return product_name;
    }

    public int getProduct_id() {
        return product_id;
    }

    public int getQuantity_sold() {
        return quantity_sold;
    }

}
