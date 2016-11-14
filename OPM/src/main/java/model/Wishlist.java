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
public class Wishlist {

    private String email;
    private int product_id;

    public Wishlist() {
    }

    public String getEmail() {
        return email;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

}
