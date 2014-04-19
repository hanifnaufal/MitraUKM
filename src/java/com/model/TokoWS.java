/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.model;

import com.javawebprogramming.DatabaseInfo;
import java.util.List;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author hanifnaufal
 */
@WebService(serviceName = "TokoWS")
public class TokoWS {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getProductList")
    public List<Product> getProductList() {
        
        return new DatabaseInfo().getFeaturedProduct(-1);
    }
}
