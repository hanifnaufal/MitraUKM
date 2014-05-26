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

<jsp:include page="layout/site/header.jsp"></jsp:include>
<%
    HttpSession sess = request.getSession();
    Object user = sess.getAttribute("username");
%>
<div class="content">
    <div class="container">
        <div class="col-md-12 clearfix"><h3 class="text-center">Penawaran Spesial dari Kami untuk Anda</h3><hr>
                <div class="text-center">
                    <div class="col-md-4"><img src="assets/images/kolom1.png"><br><br><br></div>
                    <div class="col-md-4"><img src="assets/images/kolom2.png"><br><br><br></div>
                    <div class="col-md-4"><img src="assets/images/kolom3.png"><br><br><br></div>
                </div>
            </div>
        <%
           // if (user == null) {
        %>
        <h4 class="producttitle">Produk Pilihan</h4>
            <hr>
        <%//}%>
        <div class="row">                

            <%
                DatabaseInfo db = new DatabaseInfo();
                ArrayList<Product> featured = db.getFeaturedProduct(4);
                //mangambil featured product dari web service yang telah dibuat
//                List<ws.Product> featured = new ArrayList<ws.Product>();
//                try {
//                    ws.TokoWS_Service service = new ws.TokoWS_Service();
//                    ws.TokoWS port = service.getTokoWSPort();                    
//                    featured = port.getProductList();
//                    
//                } catch (Exception ex) {                    
//                }
//                    //menampilkan 4 hasil dari pengambilan produk
//                if (user != null) {<jsp:include page="admin/adminProduct.jsp"></jsp:include>
            %>
         

            <%
            //} else {
                for (int i = 0; i < 4; i++) {
                    Product x = featured.get(i);

            %>
            <div class="col-md-3">                
                <table class="table table-bordered">
                    <tr>
                        <td colspan="2">
                <img width="100%" src="<%=x.getFile_picture()%>" alt="<%=x.getName()%>">
                <div class="text-left"><h6>
                    <%
                        out.write("<a href='detailProduct.jsp?id="+x.getId()+"'>" + x.getName() + "</a>");
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