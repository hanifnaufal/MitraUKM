/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author hanifnaufal
 */
@Embeddable
public class OrderlistPK implements Serializable {
    @Basic(optional = false)
    @Column(name = "id")
    private int id;
    @Basic(optional = false)
    @Column(name = "idOrder")
    private int idOrder;

    public OrderlistPK() {
    }

    public OrderlistPK(int id, int idOrder) {
        this.id = id;
        this.idOrder = idOrder;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) id;
        hash += (int) idOrder;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderlistPK)) {
            return false;
        }
        OrderlistPK other = (OrderlistPK) object;
        if (this.id != other.id) {
            return false;
        }
        if (this.idOrder != other.idOrder) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.OrderlistPK[ id=" + id + ", idOrder=" + idOrder + " ]";
    }
    
}
