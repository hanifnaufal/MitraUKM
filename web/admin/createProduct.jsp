<%-- 
    Document   : createProduct
    Created on : Apr 26, 2014, 14:11:58 PM
    Author     : Ida Bagus Prawira
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Category"%>
<%@page import="com.model.Product"%>
<%
    boolean isSubmitted = request.getParameter("submit") != null;
    if (isSubmitted) {
%>
<jsp:useBean id="newproduct" class="com.tokoonline.bean.NewProductBean" scope="session" />
<jsp:setProperty name="newproduct" property="*" />
<%
        DatabaseInfo db = new DatabaseInfo();
        
        db.doUpdate("INSERT INTO product(name,isfeatured,price,stock,detail,file_picture,idcategory) VALUES('"
                + newproduct.getName() + "',"
                + (newproduct.isIsFeatured()?1:0) + ","
                + newproduct.getPrice() + ","
                + newproduct.getStock() + ",'"
                + newproduct.getDetail() + "','"
                + newproduct.getFile_picture() + "',"
                + newproduct.getIdcategory()
                + ")");
//                out.write("nama:"+newproduct.getName());
//                out.write("\nisfeatured:"+ (newproduct.isIsFeatured()?"a":"b"));
//                out.write("\nprice:"+newproduct.getPrice()+"");
//                out.write("\nstock:"+newproduct.getStock());
//                out.write("\ndetail:"+newproduct.getDetail());
//                out.write("\nfilepicture:"+newproduct.getFile_picture());
//                out.write("\ncategoryid:"+newproduct.getIdcategory());
        
//        db.doUpdate("INSERT INTO product(name,isfeatured,price,stock,detail,file_picture,idcategory) "
//                + "VALUES('haha',1,1000,10,'hahaha','gambar',1)");
        response.sendRedirect("adminProduct.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Tambah Produk</h2>
        <form method="post">
            Name:<input type="text" name="name"/><br>
            Featured:
            <select name="isFeatured">
                <option value="true">YES</option>
                <option value="false">NO</option>
            </select><br>
            Price:<input type="text" name="price"/><br>
            Stock:<input type="text" name="stock"/><br>
            Detail:<textarea name="detail"></textarea><br>
            Image:<input type="file" name="file_picture"/><br>
            Category:
            <select name="idcategory">
                <% ArrayList<Category> categories;// = new ArrayList<Category>();
                    categories = (new DatabaseInfo()).getAllCategory();
                    for (Category category : categories) {
                %>
                <option value="<%= category.getId()%>"><%= category.getName()%></option>
                <% }%>
            </select><br>
            <input type="submit" value="buat" name="submit">
        </form>
    </body>
</html>
