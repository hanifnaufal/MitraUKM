<%-- 
    Document   : searchResult
    Created on : Apr 19, 2014, 12:16:56 PM
    Author     : hanifnaufal
--%>

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
                if(result.size() == 0){
                    out.write("Tidak ada hasil untuk pencarian dengan kata kunci " + keyword);
                }else
                for(Product x: result){
                    out.write(x.getName() + "<br>");
                }
            %>
        </div>
    </div>
    
<jsp:include page="layout/site/footer.jsp"></jsp:include>
