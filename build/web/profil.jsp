<%-- 
    Document   : profil
    Created on : Apr 18, 2014, 1:53:04 PM
    Author     : hanifnaufal
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.User"%>
   
<%
    HttpSession sess = request.getSession();    
    //mengambil isi session username
    Object username = sess.getAttribute("username");
    DatabaseInfo db = new DatabaseInfo();
    User user = db.getUser(username.toString());    
    if(user.getNama() == null){
        response.sendRedirect("editProfil.jsp");
        return;
    }
%>
<jsp:include page="layout/site/header.jsp"></jsp:include>

    <div class="content">
        <div class="container">
            <div class="col-md-5">
                 <table width="100%">
                    <tr>
                        <td colspan="3">
                            <h3>Profil</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h7>Nama </h7>
                        </td>
                        <td class="text-right">
                            <h7 class="text-right">:&nbsp;&nbsp;</h7>
                        </td>
                        <td>
                            <h7><% out.write(user.getNama());%></h7>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h7>Alamat </h7>
                        </td>
                        <td class="text-right">
                            <h7 class="text-right">:&nbsp;&nbsp;</h7>
                        </td>
                        <td>
                            <h7><% out.write(user.getAlamat());%></h7>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h7>Telepon </h7>
                        </td>
                        <td class="text-right">
                        <h7 class="text-right">: &nbsp;&nbsp;</h7>
                        </td>
                        <td>
                            <h7><% out.write(user.getTelepon());%></h7>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="editProfil.jsp" class="btn btn-default">Ubah</a>
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                </table>
        </div>
    </div>
</div>                         
    
<jsp:include page="layout/site/footer.jsp"></jsp:include>
