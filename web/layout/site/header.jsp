<%-- 
    Document   : header
    Created on : Feb 22, 2014, 12:19:31 PM
    Author     : hanifnaufal
--%>

<%@page import="com.model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Mitra UKM</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
<!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.css">-->
        <link rel="stylesheet" href="assets/css/main.css">
        <link href="assets/css/flat-ui.css" rel="stylesheet">
        
        <link rel="shortcut icon" href="assets/images/favicon.bmp">
    </head>
    <body>	
        <%
            
            HttpSession sess = request.getSession();
            //jika ada request logout, hapus session username
            if (request.getParameter("logout") != null) {
                sess.setAttribute("username", null);
            }
            //mengambil isi session username
            Object user = sess.getAttribute("username");
            
            //menampilkan error
            String error = request.getParameter("error");
            if (error != null) {
        %>
        <jsp:include page="../error.jsp"></jsp:include>
        <%}%>

       
        <header>
            <div class="header-nav">
                <div class="container">
                    <div class="navbar-header">
                        <a href="index.jsp" class="navbar-brand"><img src="assets/images/mitraukm.png" height="50px"/></a>
                    </div>
                        <form class="navbar-form" role="search" method="post" action="searchResult.jsp" width="100px" >
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search" name="keyword" id="srch-term">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                                </div>
                            </div>
                        </form>
                </div>
            </div>
            <div class="header-nav">
                <div class="container">
                    <nav role="navigation">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="index.jsp">HOME</a>
                            </li>
                            <li>
                                <a href="about.jsp">ABOUT</a>
                            </li>
                            	
                        </ul> 

                        <ul class="nav navbar-nav navbar-right">                            
                            <%
                                //Jika belum login
                                if (user == null) {
                            %>
                            <li>
                                <a href="#Login" data-toggle="modal">LOGIN</a>
                            </li>      
                            <li>
                                <a href="#SignUp" data-toggle="modal">REGISTER</a>
                            </li>        	
                            <%
                                //jika sudah login
                                } else {
                            %>
                            <li>
                                <a href="profil.jsp">PROFILE</a>
                            </li>      
                            <li>
                                <a href="index.jsp?logout=true">LOGOUT</a>
                            </li>        	
                            <%}%>
                            <li>
                                <a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>  CART</a>
                            </li>
                        </ul> 
                    </nav>


                    <div class="modal fade bs-example-modal-sm" id="Login" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Login</h4>
                                </div>
                                <div class="modal-body">
                                    <form role="form" method="post" action="LoginHandler">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="username" name="username" class="form-control" placeholder="Username" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                                        </div>					  			 					  
                                        <button type="submit" class="btn btn-default">Login</button>					
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>			        	
                                    </form>
                                </div>			      
                            </div>
                        </div>
                    </div>

                    <div class="modal fade bs-example-modal-sm" id="SignUp" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel">Register</h4>
                                </div>
                                <div class="modal-body">
                                    <form role="form" method="post" action="RegisterHandler">			          
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="username" name="username" class="form-control" placeholder="username" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Email address</label>
                                            <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Password</label>
                                            <input type="password" name="password" class="form-control" placeholder="Password" required>
                                        </div>				
                                        <div class="form-group">
                                            <label>Confirm Password</label>
                                            <input type="password" name="confirmpassword" class="form-control" placeholder="Confirm Password" required>
                                        </div>					  			 	  			 					  
                                        <button type="submit" class="btn btn-default">Register</button>					
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>			        	
                                    </form>
                                </div>			      
                            </div>
                        </div>
                    </div>			
                </div>
            </div>
        </header>
                        
        <div class="col-xs-5 col-sm-2 pull-right">
            
        </div>