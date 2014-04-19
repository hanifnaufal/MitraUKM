/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.text.DecimalFormat;

/**
 *
 * @author hanifnaufal
 */
public class CartEntry {
    public int id;
    public String name;
    public double price;
    public int count;   
    
    public double total(){
        DecimalFormat format = new DecimalFormat("#.##");
        return Double.valueOf(format.format(count * price));
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }    
}
