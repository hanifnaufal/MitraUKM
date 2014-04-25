<%-- 
    Document   : adminKategori
    Created on : Apr 25, 2014, 1:49:47 PM
    Author     : hanifnaufal
--%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Category"%>
<%
    boolean isSubmitted = request.getParameter("delete") != null;
    if(isSubmitted){
        int id = Integer.parseInt(request.getParameter("deletedId"));
        DatabaseInfo db = new DatabaseInfo();
        db.doUpdate("DELETE FROM category WHERE id="+id);
    }
    
    DatabaseInfo db = new DatabaseInfo();
    ArrayList<Category> categories = db.getAllCategory();    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Daftar Kategori</h2>
        <a href="createCategory.jsp">Buat Kategori</a>        
            <%
                int no = 1;
            %>            
        <table>
            <thead>
                <td>No.</td>
                <td>Nama</td>
                <td>Deskripsi</td>
                <td>Action</td>
            </thead>
            <%for(Category c:categories){%>
            <tr>
                <td><%= no++%></td>
                <td><%= c.getName()%></td>
                <td><%= c.getDescription()%></td>
                <td>
                    <form method="post" action="editCategory.jsp">
                        <input type="hidden" value="<%=c.getId()%>" name="id">
                        <input type="submit" name="submit" value="Ubah">
                    </form>

                    <form method="post">
                        <input type="hidden" value="<%=c.getId()%>" name="deletedId">
                        <input type="submit" name="delete" value="hapus">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>        
    </body>
</html>
