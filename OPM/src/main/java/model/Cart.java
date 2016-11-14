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
public class Cart {

    private int cart_id;
    private int product_id;
    private int quantity;

    public Cart() {
    }

    public int getCart_id() {
        return cart_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
