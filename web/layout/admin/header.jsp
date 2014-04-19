<%-- 
    Document   : header
    Created on : Apr 18, 2014, 4:14:36 PM
    Author     : hanifnaufal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="UTF-8">
	<title>Toko Online | Admin</title>
		
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/admin.css">

	<!--[if lt IE 9]>
		<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<script src="js/HTML5Shiv.js"></script>
	<![endif]-->
</head>
<body>	
	<header class="main-header">
		<div class="container">			
		    <div class="navbar">
			    <div class="navbar-inner">
			    <a class="brand" href="#">Magnus Adira CMS</a>
			    <ul class="nav pull-right">
				    <li>Product List</li>
				    <li>Content Management</li>
				    <li><a href="#">Register</a></li>
				    <li  class="dropdown">				    				    	    
						    <a class="dropdown-toggle" id="dLabel" role="button" data-toggle="dropdown" data-target="#" href="#">
						    Hello, Admin
						    <b class="caret"></b>
						    </a>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
								<li role="presentation">									
									<a href="#" tabindex="-1" role="menuitem">
							      		<i class="icon-user"></i>Profile
							  		</a>								  		
							  	</li>						    	
							  	<li role="presentation">
									<a href="#" tabindex="-1" role="menuitem">
							      		<i class="icon-cog"></i>Change Password
							  		</a>
							  	</li>
							  	<li class="divider" role="presentation"></li>
							  	<li role="presentation">
									<a href="" tabindex="-1" role="menuitem">
							      		<i class="icon-lock"></i>Log Out
							  		</a>
							  	</li>
						    </ul>					    
				    </li>
			    </ul>
			    </div>
		    </div>
		</div>
    </header>	     
            
   
	<footer>
		<div class="container">			
			<hr>
			<p class="text-center">&copy;2014 - TokoOnline<p>
		</div>
	</footer>

<!-- 
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	 -->	 
	<script>window.jQuery || document.write('<script src="assets/js/jquery-1.11.0.min.js"><\/script>')</script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/admin.js"></script>
</body>
</html>