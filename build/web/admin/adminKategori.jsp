<%-- 
    Document   : adminKategori
    Created on : Apr 25, 2014, 1:49:47 PM
    Author     : hanifnaufal
--%>

<%
    
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
        <form>
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
                <tr>
                    <td><%= no++%></td>
                    <td></td>
                </tr>
            </table>
        </form>
    </body>
</html>
