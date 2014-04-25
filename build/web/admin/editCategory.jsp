<%-- 
    Document   : editCategory
    Created on : Apr 25, 2014, 2:33:58 PM
    Author     : hanifnaufal
--%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Category"%>
<%
    boolean isSubmitted = request.getParameter("edit") != null;
    if(isSubmitted){                
        DatabaseInfo db = new DatabaseInfo();
        db.doUpdate("UPDATE category SET name='"+request.getParameter("name")+"', description='"+request.getParameter("description")+"' WHERE id="+Integer.parseInt(request.getParameter("idSubmit")));
        response.sendRedirect("adminCategory.jsp");
        return;
    }
    
    String idString = request.getParameter("id");    
    int id = Integer.parseInt(idString);
    DatabaseInfo db = new DatabaseInfo();        
    Category category = db.getCategory(id);    
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Ubah Kategori</h2>
        <form method="post">
            Nama:<input type="text" name="name" value="<%out.print(category.getName());%>"><br>
            Deskripsi:<textarea name="description"><%out.print(category.getDescription());%></textarea>
            <input type="hidden" value="<%=category.getId()%>" name="idSubmit">
            <input type="submit" value="ubah" name="edit">
        </form>
    </body>
</html>
