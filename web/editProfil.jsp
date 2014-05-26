<%-- 
    Document   : profil
    Created on : Apr 18, 2014, 1:32:31 PM
    Author     : hanifnaufal
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.model.User"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>


<%
    out.print(application.getRealPath("/").replaceAll("\\\\", "/"));
    out.print("<br>");
    out.print(request.getContextPath());
//    out.print("abecde\\asldk".replaceAll("\\\\", "a"));
//    out.print(application.getRealPath("/"));
//    out.print(request.getServletPath());
    HttpSession sess = request.getSession();
    //mengambil isi session username
    Object username = sess.getAttribute("username");
    DatabaseInfo db = new DatabaseInfo();
    User user = db.getUser(username.toString());

    String alamat = "";
    String nama = "";
    String telepon = "";

    boolean isSubmitted = request.getParameter("submit") != null;
    if (isSubmitted) {
        alamat = request.getParameter("alamat");
        nama = request.getParameter("nama");
        telepon = request.getParameter("telepon");

        String query = "UPDATE user set nama='" + nama + "', alamat='" + alamat + "', telepon='" + telepon + "' WHERE username='" + username.toString() + "'";
        db.doUpdate(query);
        response.sendRedirect("profil.jsp");
    } else if(user.getAlamat() != null){
        alamat = user.getAlamat();
        nama = user.getNama();
        telepon = user.getTelepon();
    }
%>

<jsp:include page="layout/site/header.jsp"></jsp:include>

    <div class="content">
        <div class="container">
            <h3>Ubah Profil</h3>
            <form role="form" method="post">
                <div class="form-group">
                    <label>Nama</label>
                    <input type="text" class="form-control" placeholder="Nama" name="nama" value="<%out.write(nama);%>">
            </div>
            <div class="form-group">
                <label>Alamat</label>
                <input type="textarea" class="form-control" placeholder="Password" name="alamat" value="<%out.write(alamat);%>">
            </div>
            <div class="form-group">
                <label>Telepon</label>
                <input type="text" class="form-control" placeholder="telepon" name="telepon" value="<%out.write(telepon);%>">
            </div>
            <div class="form-group">
                <label>Foto</label>
                <input type="file" name="foto">
            </div>
            <input type="submit" class="btn btn-default" value="Submit" name="submit">
        </form>  
        <hr>
        Select a file to upload: <br />
        <form action="UploadServlet" method="post" enctype="multipart/form-data">
            <input type="file" name="image" size="50" />
            <br />
            <input type="submit" value="foto" name="cobafoto"/>
        </form>
    </div>
</div>

<jsp:include page="layout/site/footer.jsp"></jsp:include>
