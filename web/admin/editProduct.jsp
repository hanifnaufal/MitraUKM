<%-- 
    Document   : editCategory
    Created on : Apr 25, 2014, 2:33:58 PM
    Author     : hanifnaufal
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Product"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Category"%>
<%

    boolean isSubmitted = request.getParameter("edit") != null;
    if (isSubmitted) {
//        out.print("masuk");
        DatabaseInfo db = new DatabaseInfo();
        db.doUpdate("UPDATE product SET "
                + "name='" + request.getParameter("name") + "' ,"
                + "isFeatured=" + request.getParameter("isFeatured") + ", "
                + "price=" + request.getParameter("price") + ", "
                + "stock=" + request.getParameter("stock") + ", "
                + "detail='" + request.getParameter("detail") + "', "
                + "file_picture='" + request.getParameter("file_picture") + "', "
                + "idcategory=" + request.getParameter("idcategory") + " "
                + "WHERE id=" + Integer.parseInt(request.getParameter("idSubmit")));
        response.sendRedirect("adminProduct.jsp");
        return;
//        db.doUpdate("UPDATE product SET name = 'embleerrs' WHERE id = 14");
    } else {

        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        DatabaseInfo db = new DatabaseInfo();
//    Category category = db.getCategory(id);    
        Product product = db.getProduct(id);

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Ubah Produk</h2>

        <form method="post">
            Name:<input type="text" name="name" value="<%= product.getName()%>"/><br>
            Featured:
            <select name="isFeatured">
                <option value="1" <%= product.isIsFeatured() ? "selected" : ""%>>YES</option>
                <option value="0" <%= product.isIsFeatured() ? "" : "selected"%>>NO</option>
            </select><br>
            Price:<input type="text" name="price" value="<%= product.getPrice()%>"/><br>
            Stock:<input type="text" name="stock" value="<%= product.getStock()%>"/><br>
            Detail:<textarea name="detail"> <%= product.getDetail()%> </textarea><br>
            Image:<input type="file" name="file_picture" value="<%= product.getFile_picture()%>"/><br>
            Category:
            <select name="idcategory">
                <% ArrayList<Category> categories;// = new ArrayList<Category>();
                    categories = (new DatabaseInfo()).getAllCategory();
                    for (Category category : categories) {
                %>
                <option value="<%= category.getId()%>"  <%= category.getId() == product.getIdcategory() ? "selected" : ""%> > <%= category.getName()%></option>
                <% }%>
            </select><br>

            <input type="hidden" value="<%=product.getId()%>" name="idSubmit">
            <input type="submit" value="ubah" name="edit">
        </form>
        <% }%>
    </body>
</html>
