package com.entity;

import com.entity.Orderlist;
import com.entity.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-05-19T13:30:27")
@StaticMetamodel(Order1.class)
public class Order1_ { 

    public static volatile SingularAttribute<Order1, Integer> id;
    public static volatile SingularAttribute<Order1, Short> isComplete;
    public static volatile SingularAttribute<Order1, Boolean> isConfirmed;
    public static volatile SingularAttribute<Order1, User> idUser;
    public static volatile SingularAttribute<Order1, Date> tanggalOrder;
    public static volatile CollectionAttribute<Order1, Orderlist> orderlistCollection;

}