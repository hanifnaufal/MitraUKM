package com.entity;

import com.entity.Category;
import com.entity.Orderlist;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-05-19T13:30:26")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, Integer> id;
    public static volatile SingularAttribute<Product, String> detail;
    public static volatile SingularAttribute<Product, Double> price;
    public static volatile SingularAttribute<Product, Integer> stock;
    public static volatile SingularAttribute<Product, Category> idcategory;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile SingularAttribute<Product, Short> isFeatured;
    public static volatile SingularAttribute<Product, String> filePicture;
    public static volatile CollectionAttribute<Product, Orderlist> orderlistCollection;

}