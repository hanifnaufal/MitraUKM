/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import java.text.DecimalFormat;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author hanifnaufal
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name="Product",propOrder={"id","name","price","stock","detail","file_picture","isFeatured"})
public class Product {
    @XmlElement(name="id",required = true)
    private int id;
    @XmlElement(name="name",required = true)
    private String name;
    @XmlElement(name="price",required = true)
    private double price;
    @XmlElement(name="stock",required = true)
    private int stock;
    @XmlElement(name="detail",required = true)
    private String detail;
    @XmlElement(name="file_pictured",required = true)
    private String file_picture;
    @XmlElement(name="isFeatured",required = true)
    private boolean isFeatured;
    @XmlElement(name="idcategory",required = true)
    private int idcategory;

    public int getIdcategory() {
        return idcategory;
    }

    public void setIdcategory(int idcategory) {
        this.idcategory = idcategory;
    }

    public Product() {
    }

    
    public Product(int id, String name, double price, int stock, String detail, String file_picture, boolean isFeatured, int idcategory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.detail = detail;
        this.file_picture = file_picture;
        this.isFeatured = isFeatured;
        this.idcategory = idcategory;
    }
    public String getRupiahPrice(){     
        DecimalFormat format = new DecimalFormat("###,###");                
        return "Rp. " + format.format(this.price).replace(",", ".");    
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

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getFile_picture() {
        return file_picture;
    }

    public void setFile_picture(String file_picture) {
        this.file_picture = file_picture;
    }

    public boolean isIsFeatured() {
        return isFeatured;
    }

    public void setIsFeatured(boolean isFeatured) {
        this.isFeatured = isFeatured;
    }
    
}
