/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

/**
 *
 * @author hanifnaufal
 */
public class Orderlist {
   private int id, idProduct, idOrder, kuantitas; 

    public Orderlist() {
    }

    public Orderlist(int id, int idProduct, int idOrder, int kuantitas) {
        this.id = id;
        this.idProduct = idProduct;
        this.idOrder = idOrder;
        this.kuantitas = kuantitas;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    public int getKuantitas() {
        return kuantitas;
    }

    public void setKuantitas(int kuantitas) {
        this.kuantitas = kuantitas;
    }
   
}
