<%-- 
    Document   : createCategory
    Created on : Apr 25, 2014, 2:33:58 PM
    Author     : hanifnaufal
--%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Category"%>
<%
    boolean isSubmitted = request.getParameter("submit") != null;
    if(isSubmitted){
        %>
        <jsp:useBean id="newcategory" class="com.tokoonline.bean.NewCategoryBean" scope="session" />
        <jsp:setProperty name="newcategory" property="*" />
        <%
        
        DatabaseInfo db = new DatabaseInfo();
        db.doUpdate("INSERT INTO category(name,description) VALUES('"+newcategory.getName()+"','"+newcategory.getDescription()+"')");
        response.sendRedirect("adminCategory.jsp");
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
        <h2>Buat Kategori</h2>
        <form method="post">
            Nama:<input type="text" name="name"><br>
            Deskripsi:<textarea name="description"></textarea><br>
            <input type="submit" value="buat" name="submit">
        </form>
    </body>
</html>
