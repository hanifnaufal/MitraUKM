<%-- 
    Document   : index
    Created on : Feb 21, 2014, 11:46:27 AM
    Author     : hanifnaufal
--%>

<%@page import="com.model.Cart"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.Product"%>
<%@page import="com.model.CartEntry"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    //inisialisasi dari cart
    Cart cart = new Cart(request.getCookies());
    
    //menangani delete cart entry
    if (request.getMethod() == "POST") {
        String action = request.getParameter("action");
        String id = request.getParameter("id");
        if (action.equals("hapus") && id != null) {
            cart.removeProduct(id, response);
        }else if(action.equals("edit") && id != null){            
            cart.addProduct(id, Integer.parseInt(request.getParameter("count")), response);
        }
    }

    //Map yang berfungsi untuk menyimpan kuantitas dari setiap produk
    HashMap<String, Integer> counter = new HashMap<String, Integer>();
    
    //Menambahkan produk yang tersimpan dalam cookies ke dalam cart
    for (String id : cart.getList()) {
        if (id != null && !id.equals("")) {
            //jika id sudah ada tambahkan kuantitas
            if (counter.containsKey(id)) {
                counter.put(id, counter.get(id) + 1);
                
            //jika id belum ada tambahkan baru
            } else {
                counter.put(id, 1);
            }
        }        
    }
    //List untuk menyimpan isi dari cart
    ArrayList<CartEntry> cartEntries = new ArrayList<CartEntry>();
    //harga total dari cart
    double total = 0;
    
    //jika cart tidak kosong
    if (!counter.isEmpty()) {
        //query mengambil info barang dengan id yang terdapat pada cookies
        String query = "SELECT id, name, price FROM product WHERE ";
        for (String id : counter.keySet()) {
            query += " id=" + id + " OR";
        }
        query = query.substring(0, query.length() - 3);
                
        DatabaseInfo db = new DatabaseInfo();        
        //isi dari cart
        ArrayList<Product> result = db.getProductCart(query);
        //memindahkan hasil query ke dalam keranjang
        for (Product p : result) {
            CartEntry entry = new CartEntry();
            entry.setId(p.getId());
            entry.setName(p.getName());
            entry.setPrice(p.getPrice());
            entry.setCount(counter.get(p.getId() + ""));
            total += entry.total();

            cartEntries.add(entry);
        }

    }

%>
<jsp:include page="layout/site/header.jsp"></jsp:include>
    <div class="content">
        <div class="container">                           
            <table class="table table-striped table-hover">
                <tr>
                    <td>No</td>
                    <td>Nama</td>
                    <td>Harga</td>
                    <td>Kuantitas</td>
                    <td>Subtotal</td>    
                    <td></td>
                </tr>
            <%                    int num = 1;
                for (CartEntry ce : cartEntries) {
            %>
            <tr>
                <td><%=num++%></td>
                <td><%=ce.getName()%></td>
                <td><%=ce.getPrice()%></td>
                    <form method="POST">
                <td><input type="text" name="count" value="<%=ce.getCount()%>"></td>
                <td>
                    <%="Rp." + ce.total()%>
                </td>
                <td>                    
                        <input type="hidden" name="id" value="<%=ce.getId()%>" />
                        <input type="submit" name="action" value="edit" class="btn btn-primary"/>
                    </form>    
            
                    <form method="POST">
                        <input type="hidden" name="id" value="<%=ce.getId()%>" />
                        <input type="submit" name="action" value="hapus" class="btn btn-danger"/>
                    </form>                    
                </td>
            </tr>
            <%}%>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>Total</td>
                <td><%="Rp." + total%></td>
                <td></td>
            </tr>                                
        </table>
        <p class="text-center">
            <button class="btn btn-primary">Beli</button>
            <button class="btn btn-danger">Batalkan</button>
        </p>

    </div>
</div>
<jsp:include page="layout/site/footer.jsp"></jsp:include>