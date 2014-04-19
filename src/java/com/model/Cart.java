/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hanifnaufal
 */
public class Cart {   
    private Cookie cookie;
    /**
     * Constructor
     * @param cookies cookie pada web browser
     */
    public Cart(Cookie[] cookies) {        
        if(cookies != null){
            for (Cookie ck : cookies) {
                if(ck.getName().equals("id")){
                    cookie = ck;
                    break;
                }
            }
        }
        
        if(cookie == null){
            cookie = new Cookie("id", "");
        }                
    }    
    
    /**
     * Menambahkan produk ke dalam cookie
     * @param id id produk
     * @param response http response
     */
    public void addProduct(String id, HttpServletResponse response){
        String value = cookie.getValue();
        value += id + "#";
        cookie = new Cookie("id", value);
        response.addCookie(cookie);
    }
    
    public void addProduct(String id, int count, HttpServletResponse response){
        removeProduct(id, response);
        String value = cookie.getValue();        
        for (int i = 0; i < count; i++) {      
            value += id + "#";            
        }   
        cookie = new Cookie("id", value);
        response.addCookie(cookie);            
    }
    
    /**
     * Menghapus produk pada cookie
     * @param id id produk
     * @param response http response
     */
    public void removeProduct(String id, HttpServletResponse response){
        String value = cookie.getValue();
        value = value.replaceAll(id + "#", "");
        
        cookie = new Cookie("id", value);
        response.addCookie(cookie);
    }
    
    /**
     * Mengambil list id produk yang terdapat pada cookie
     * @return id produk yang ada di cookies
     */
    public String[] getList(){
        return cookie.getValue().split("#");
    }
   
}
