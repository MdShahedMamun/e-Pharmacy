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
public class Product {

    private int product_id;
    private String product_description;
    private String unit;
    private double product_sell_price;

    public Product() {
    }

    public int getProduct_id() {
        return product_id;
    }

    public String getProduct_description() {
        return product_description;
    }

    public String getUnit() {
        return unit;
    }

    public double getProduct_sell_price() {
        return product_sell_price;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public void setProduct_description(String product_description) {
        this.product_description = product_description;
    }

    public void setProduct_sell_price(double product_sell_price) {
        this.product_sell_price = product_sell_price;
    }

}
