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
            <h3>Profil</h3>         
              <p><label>Nama </label> <% out.write(user.getNama());%></p>
              <p><label>Alamat </label><% out.write(user.getAlamat());%></p>
              <p><label>Telepon </label><% out.write(user.getTelepon());%></p>              
            <a href="editProfil.jsp" class="btn btn-default">Ubah</a>
          </form>                                           
        </div>
    </div>
    
<jsp:include page="layout/site/footer.jsp"></jsp:include>
