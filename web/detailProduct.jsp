<%-- 
    Document   : detailProduct
    Created on : Apr 19, 2014, 1:27:38 PM
    Author     : hanifnaufal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Product"%>
   
<%
    DatabaseInfo db = new DatabaseInfo();    
    int id = Integer.parseInt(request.getParameter("id"));
    Product product = db.getProduct(id);
%>
<jsp:include page="layout/site/header.jsp"></jsp:include>

    <div class="content">
        <div class="container">
            <h3><%= product.getName()%></h3>
            <p><%= product.getDetail()%></p> 
            <p><%= product.getPrice()%></p> 
            <p><img src="<%= product.getFile_picture()%>"></p>
            <form method="post" class="text-center" action="AddCartHandler">
                <input type="hidden" name="id" value="<%=product.getId()%>"/>
                <button type="submit" name="action" value="add to cart" class="btn btn-default btn-lg" style="font-size: 14px" value="">
                    <span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
                </button>
            </form>                                            
        </div>
    </div>
    
<jsp:include page="layout/site/footer.jsp"></jsp:include>
