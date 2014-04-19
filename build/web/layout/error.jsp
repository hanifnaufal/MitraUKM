<%-- 
    Document   : error
    Created on : Mar 5, 2014, 5:25:25 PM
    Author     : hanifnaufal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="user-nav">
    <div class="container">
        <%
            StringBuilder sb  = new StringBuilder();
            int error = Integer.parseInt(request.getParameter("error"));            
            if(error == 0){
                sb.append("Username dan/atau password tidak tepat");
            }else if(error == 1){
                sb.append("Password dan konfirmasi password tidak sesuai");
            }else if(error == 2){
                sb.append("Email dan/atau password sudah terdaftar");
            }
            out.println(sb);
        %>
        
    </div>
</nav>