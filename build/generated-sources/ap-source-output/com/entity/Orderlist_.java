package com.entity;

import com.entity.Order1;
import com.entity.OrderlistPK;
import com.entity.Product;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-05-19T13:30:26")
@StaticMetamodel(Orderlist.class)
public class Orderlist_ { 

    public static volatile SingularAttribute<Orderlist, OrderlistPK> orderlistPK;
    public static volatile SingularAttribute<Orderlist, Integer> kuantitas;
    public static volatile SingularAttribute<Orderlist, Order1> order1;
    public static volatile SingularAttribute<Orderlist, Product> idProduct;

}