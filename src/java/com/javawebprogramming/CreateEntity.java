/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.javawebprogramming;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author hanifnaufal
 */
public class CreateEntity {
    public static EntityManager getInstance(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TokoOnlinePU");
        return emf.createEntityManager();
    }
}
