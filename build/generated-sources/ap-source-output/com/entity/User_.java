package com.entity;

import com.entity.Order1;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.0.v20130507-rNA", date="2014-05-19T13:30:26")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> username;
    public static volatile CollectionAttribute<User, Order1> order1Collection;
    public static volatile SingularAttribute<User, String> telepon;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, Short> isAdmin;
    public static volatile SingularAttribute<User, String> foto;
    public static volatile SingularAttribute<User, String> nama;
    public static volatile SingularAttribute<User, String> alamat;
    public static volatile SingularAttribute<User, String> password;

}