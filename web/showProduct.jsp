<%-- 
    Document   : index
    Created on : Feb 21, 2014, 11:46:27 AM
    Author     : hanifnaufal
--%>

<%@page import="com.model.Cart"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Product"%>
<%@page import="com.model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="layout/site/header.jsp"></jsp:include>
<%
    HttpSession sess = request.getSession();
    Object user = sess.getAttribute("username");
%>

<%
    DatabaseInfo db = new DatabaseInfo();
    ArrayList<Product> products = db.getAllProduct();
    ArrayList<Category> categories = db.getAllCategory();

    int idCategory = 0;
    if (request.getParameter("idCategory") != null) {
        idCategory = Integer.parseInt(request.getParameter("idCategory"));
        products = db.getAllProdux(idCategory);
    }


%>
<div class="content">
    <div class="container">
        <div class="col-md-12 clearfix"><h3 class="text-center">DAFTAR PRODUK</h3><hr>
            <div class="text-center">
                <ul class="nav navbar-nav text-center">
                    <%                        for (Category c : categories) {
                    %>
                    <li>
                        <a href="showProduct.jsp?idCategory=<%=c.getId()%>"><h4> <%= c.getName()%> </h4><hr></a>
                    </li>
                    <%
                        }
                    %>

                </ul> 
            </div>
                   
        </div>
        
        
        <%
           // if (user == null) {
        
        //}%>
        <div class="row">                
          <%
                //} else {
                for (int i = 0; i < products.size(); i++) {
                    Product x = products.get(i);

            %>
            <div class="col-md-3">                
                <table class="table table-bordered">
                    <tr>
                        <td colspan="2">
                            <img width="100%" src="<%=x.getFile_picture()%>" alt="<%=x.getName()%>">
                            <div class="text-left"><h6>
                                    <%
                                        out.write("<a href='detailProduct.jsp?id=" + x.getId() + "'>" + x.getName() + "</a>");
                                    %></h6>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--form yang berfungsi untuk menambahkan barang ke dalam cart-->
                    <h7> <%
                        out.write("Rp." + new DecimalFormat("##.##").format(x.getPrice()).replace(",", "."));
                        %></h7>
                    </td>
                    <td class="text-right">
                        <form method="post" action="AddCartHandler">
                            <input type="hidden" name="id" value="<%=x.getId()%>"/>
                            <button type="submit" name="action" value="add to cart" class="btn btn-block btn-lg btn-info" style="font-size: 14px" value="">
                                <span class="glyphicon glyphicon-shopping-cart"></span> Tambahkan
                            </button>
                        </form>                                
                    </td>
                    </tr>
                </table>


            </div>
            <%}
                //}%>

        </div>
    </div>
</div>
<jsp:include page="layout/site/footer.jsp"></jsp:include>