<%-- 
    Document   : adminKategori
    Created on : Apr 25, 2014, 1:49:47 PM
    Author     : hanifnaufal
--%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Product"%>
<%
    boolean isSubmitted = request.getParameter("delete") != null;
    if(isSubmitted){
        int id = Integer.parseInt(request.getParameter("deletedId"));
        DatabaseInfo db = new DatabaseInfo();
        db.doUpdate("DELETE FROM product WHERE id="+id);
    }
    
    DatabaseInfo db = new DatabaseInfo();
    ArrayList<Product> products = db.getAllProduct();  
    
    String pathAdmin = request.getContextPath()+"/admin/";
   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="../assets/css/bootstrap-theme.css">
        <link rel="stylesheet" href="../assets/css/main.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Daftar Produk</h2>
        <a href="<%=pathAdmin%>createProduct.jsp" class="btn btn-success">Tambah Produk</a>        
            <%
                int no = 1;
            %>            
        <table class="table">
            <thead>
                <td>No.</td>
                <td>Nama</td>
                <td>Gambar</td>
                <td>Kategori</td>
                <td>Detail</td>
                <td>Harga</td>
                <td>Stock</td>
                <td>isFeatured</td>
                <td>Action</td>
            </thead>
            <%for(Product p:products){%>
            <tr>
                <td><%= no++%></td>
                <td><%= p.getName()%></td>
                <td><%= p.getFile_picture() %></td>
                <td><%= (new DatabaseInfo()).getCategory(p.getIdcategory()).getName() %></td>
                <td><%= p.getDetail() %></td>
                <td><%= "Rp " + p.getPrice() %></td>
                <td><%= p.getStock() %></td>
                <td><%= p.isIsFeatured() %></td>
                <td>
                    <form method="post" action="<%=pathAdmin%>editProduct.jsp">
                        <input type="hidden" value="<%=p.getId()%>" name="id">
                        <input type="submit" name="submit" value="Ubah" class="btn btn-default btn-block">
                    </form>

                    <form method="post">
                        <input type="hidden" value="<%=p.getId()%>" name="deletedId">
                        <input type="submit" name="delete" value="hapus" class="btn btn-danger btn-block">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>        
    </body>
</html>
