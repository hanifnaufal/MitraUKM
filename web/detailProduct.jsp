<%-- 
    Document   : detailProduct
    Created on : Apr 19, 2014, 1:27:38 PM
    Author     : hanifnaufal
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%--<%@page import="com.model.Product"%>--%>
<%@page import="com.entity.Product"%>
<%@page import="com.javawebprogramming.CreateEntity"%>
   
<%
//    DatabaseInfo db = new DatabaseInfo();    
    int id = Integer.parseInt(request.getParameter("id"));
    EntityManager em = CreateEntity.getInstance();
//    Product product = db.getProduct(id);
    Product product = em.find(Product.class, id);    
%>
<jsp:include page="layout/site/header.jsp"></jsp:include>

    <div class="content">
        <div class="container">
            <div class="col-md-4">
            <h3><%= product.getName()%></h3>
            <p><%= product.getDetail()%></p> 
            <p><% out.write("Rp." + new DecimalFormat("##.##").format(product.getPrice()).replace(",", ".")); %></p> 
            <p><img src="<%= product.getFilePicture()%>"></p>
            <form method="post" class="text-left" action="AddCartHandler">
                <input type="hidden" name="id" value="<%=product.getId()%>"/>
                <button type="submit" name="action" value="add to cart" class="btn btn-block btn-lg btn-info" style="font-size: 14px" value="">
                    <span class="glyphicon glyphicon-shopping-cart"></span> Tambahkan
                </button>
            </form>
            </div>
        </div>
    </div>
    
<jsp:include page="layout/site/footer.jsp"></jsp:include>
