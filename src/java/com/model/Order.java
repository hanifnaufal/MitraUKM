/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.util.Date;

/**
 *
 * @author hanifnaufal
 */
public class Order {
    private int id;
    private boolean isConfirmed;
    private boolean isComplete;
    private Date tanggalOrder;    
    private int idUser;

    public Order() {
    }

    public Order(Date tanggalOrder,  int idUser) {
        this.tanggalOrder = tanggalOrder;        
        this.idUser = idUser;
    }
    
    public Order(boolean isConfirmed, boolean isComplete, Date tanggalOrder, int idUser) {
        this.isConfirmed = isConfirmed;
        this.isComplete = isComplete;
        this.tanggalOrder = tanggalOrder;        
        this.idUser = idUser;
    }
    
    public Order(int id, boolean isConfirmed, boolean isComplete, Date tanggalOrder, int idUser) {
        this.id = id;
        this.isConfirmed = isConfirmed;
        this.isComplete = isComplete;
        this.tanggalOrder = tanggalOrder;        
        this.idUser = idUser;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isIsConfirmed() {
        return isConfirmed;
    }

    public void setIsConfirmed(boolean isConfirmed) {
        this.isConfirmed = isConfirmed;
    }

    public boolean isIsComplete() {
        return isComplete;
    }

    public void setIsComplete(boolean isComplete) {
        this.isComplete = isComplete;
    }

    public Date getTanggalOrder() {
        return tanggalOrder;
    }

    public void setTanggalOrder(Date tanggalOrder) {
        this.tanggalOrder = tanggalOrder;
    }    

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
    
    
    
}
