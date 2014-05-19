/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.entity;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author hanifnaufal
 */
@Entity
@Table(name = "orderlist")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orderlist.findAll", query = "SELECT o FROM Orderlist o"),
    @NamedQuery(name = "Orderlist.findById", query = "SELECT o FROM Orderlist o WHERE o.orderlistPK.id = :id"),
    @NamedQuery(name = "Orderlist.findByIdOrder", query = "SELECT o FROM Orderlist o WHERE o.orderlistPK.idOrder = :idOrder"),
    @NamedQuery(name = "Orderlist.findByKuantitas", query = "SELECT o FROM Orderlist o WHERE o.kuantitas = :kuantitas")})
public class Orderlist implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected OrderlistPK orderlistPK;
    @Column(name = "kuantitas")
    private Integer kuantitas;
    @JoinColumn(name = "idProduct", referencedColumnName = "id")
    @ManyToOne
    private Product idProduct;
    @JoinColumn(name = "idOrder", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Order1 order1;

    public Orderlist() {
    }

    public Orderlist(OrderlistPK orderlistPK) {
        this.orderlistPK = orderlistPK;
    }

    public Orderlist(int id, int idOrder) {
        this.orderlistPK = new OrderlistPK(id, idOrder);
    }

    public OrderlistPK getOrderlistPK() {
        return orderlistPK;
    }

    public void setOrderlistPK(OrderlistPK orderlistPK) {
        this.orderlistPK = orderlistPK;
    }

    public Integer getKuantitas() {
        return kuantitas;
    }

    public void setKuantitas(Integer kuantitas) {
        this.kuantitas = kuantitas;
    }

    public Product getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Product idProduct) {
        this.idProduct = idProduct;
    }

    public Order1 getOrder1() {
        return order1;
    }

    public void setOrder1(Order1 order1) {
        this.order1 = order1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderlistPK != null ? orderlistPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orderlist)) {
            return false;
        }
        Orderlist other = (Orderlist) object;
        if ((this.orderlistPK == null && other.orderlistPK != null) || (this.orderlistPK != null && !this.orderlistPK.equals(other.orderlistPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.entity.Orderlist[ orderlistPK=" + orderlistPK + " ]";
    }
    
}
