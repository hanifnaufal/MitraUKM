<%-- 
    Document   : searchResult
    Created on : Apr 19, 2014, 12:16:56 PM
    Author     : hanifnaufal
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%
    String keyword = request.getParameter("keyword");
    DatabaseInfo db = new DatabaseInfo();
    ArrayList<Product> result = db.searchProduct(keyword);
%>
<jsp:include page="layout/site/header.jsp"></jsp:include>

    <div class="content">
        <div class="container">
            <h3>Search Result</h3>                               
        <%
            if (result.size() == 0) {
                out.write("Tidak ada hasil untuk pencarian dengan kata kunci " + keyword);
            } else
                for (Product product : result) {

        %>
        <div class="col-md-3">                
                <table class="table table-bordered">
                    <tr>
                        <td colspan="2">
                            <img width="100%" src="<%= product.getFile_picture()%>" alt="<%= product.getName()%>">
                            <div class="text-left"><h6>
                                <%= product.getName()%></h6>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%= product.getDetail()%>
                        </td>
                    </tr>
                        <tr>
                            <td>
                    <!--form yang berfungsi untuk menambahkan barang ke dalam cart-->
                        <h7> <% out.write("Rp." + new DecimalFormat("##.##").format(product.getPrice()).replace(",", ".")); %></h7>
                            </td>
                            <td class="text-right">
                                <form method="post" action="AddCartHandler">
                                    <input type="hidden" name="id" value="<%=product.getId()%>"/>
                                    <button type="submit" name="action" value="add to cart" class="btn btn-block btn-lg btn-info" style="font-size: 14px" value="">
                                        <span class="glyphicon glyphicon-shopping-cart"></span> Tambahkan
                                    </button>
                                </form>                                
                            </td>
                        </tr>
                    </table>
                </div>
        
        <%
            }
        %>
    </div>
</div>

<jsp:include page="layout/site/footer.jsp"></jsp:include>
