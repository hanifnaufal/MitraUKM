<%-- 
    Document   : index
    Created on : Feb 21, 2014, 11:46:27 AM
    Author     : hanifnaufal
--%>

<%@page import="com.model.Cart"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   


<%
    boolean isAddToCart = false;
    String idParam = "";
    //jika terdapat request add cart
    if (request.getMethod() == "POST") {
        String action = request.getParameter("action");
        idParam = request.getParameter("id");
        if (action.equals("add to cart")) {
            isAddToCart = true;
        }
    }
    
    if (isAddToCart) {
        //tambahkan produk ke dalam cookies
        Cart cart = new Cart(request.getCookies());        
        cart.addProduct(idParam, response);      
        response.sendRedirect("cart.jsp");
    }
    
%>

<jsp:include page="layout/site/header.jsp"></jsp:include>
    <div class="content">
        <div class="container">
            <h3 class="producttitle">Produk Pilihan</h3>
            <hr>
            <div class="row">                

            <%
                //mangambil featured product dari web service yang telah dibuat
                List<ws.Product> featured = new ArrayList<ws.Product>();
                try {
                    ws.TokoWS_Service service = new ws.TokoWS_Service();
                    ws.TokoWS port = service.getTokoWSPort();                    
                    featured = port.getProductList();
                    
                } catch (Exception ex) {                    
                }
                    //menampilkan 4 hasil dari pengambilan produk
                    for(int i = 0; i < 4;i++){ 
                        ws.Product x = featured.get(i);

            %>
            <div class="col-md-3">                
                <img width="246px" src="<%=x.getFilePictured()%>" alt="<%=x.getName()%>">
                <p class="text-center">
                    <%=x.getName()%>
                    <br>
                    <!--form yang berfungsi untuk menambahkan barang ke dalam cart-->
                <form method="post" class="text-center">
                    <input type="hidden" name="id" value="<%=x.getId()%>"/>
                    <button type="submit" name="action" value="add to cart" class="btn btn-default btn-lg" style="font-size: 14px" value="">
                        <span class="glyphicon glyphicon-shopping-cart"></span> Add to Cart
                    </button>
                </form>

                </p>
                <span class="price"> 
                    <%
                        out.write("Rp." + new DecimalFormat("##.##").format(x.getPrice()).replace(",", "."));
                    %>
                </span>                
            </div>							
            <%}%>

        </div>
    </div>
</div>
<jsp:include page="layout/site/footer.jsp"></jsp:include>