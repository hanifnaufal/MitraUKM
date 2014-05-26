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
        } else if (action.equals("edit") && id != null) {
            cart.addProduct(id, Integer.parseInt(request.getParameter("count")), response);
        } else if (action.equals("batal")) {
            cart.removeAllProduct(id, response);
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
            <br>
            <table class="table table-striped table-hover">
                <tr>
                    <td>No</td>
                    <td>Nama</td>
                    <td>Harga</td>
                    <td>Kuantitas</td>
                    <td>Subtotal</td>    
                    <td></td>
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
                <td class="text-right">                    
                    <input type="hidden" name="id" value="<%=ce.getId()%>" />
                    <input type="submit" name="action" value="edit" class="btn btn-primary"/>
            </form>    
                </td>
            <form method="POST">
                <td>
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
                <td></td>
            </tr>                                
            <tr>
                <br>
            </tr>
            <tr>
                <br>
            </tr>
            <tr>
                <!--<p class="text-center">-->
        
                <td>
                    <%
            if (request.getSession().getAttribute("username") != null) {
                %><div class="text-center">
        <a href="#ProsedurPembayaran" class="btn btn-primary" data-toggle="modal">Beli</a></div>
                <div class="modal fade bs-example-modal-sm" id="ProsedurPembayaran" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Prosedur pembayaran</h4>
                        </div>
                        <div class="modal-body">
                            <form method="POST" action="pembayaran.jsp">
                                    <label class="radio">
                                        <input type="radio" name="prosedur" class="form-control" value="cod" data-toggle="radio" color="black" required>                                    
                                        COD (Bayar ditempat)
                                    </label>
                                    <label class="radio">
                                        <input type="radio" name="prosedur" class="form-control" value="kartu" data-toggle="radio" required>
                                        Kartu Kredit
                                    </label>                       
                                <input type="hidden" name="potongan" value="0" class="btn btn-default">
                                <button type="submit" class="btn btn-default">Lanjut</button>					
                                <button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>			        	
                            </form>
                        </div>			      
                    </div>
                </div>
            </div>
<!--            <form method="POST" action="AddTransactionHandler">
                <input type="submit" class="btn btn-primary" value="Beli">
            </form>            -->
        <% } else { %>            
            <a href="#Login" class="btn btn-primary" data-toggle="modal">Beli</a>           
        <%}%></td>
                <td><form method="POST">
            <button class="btn btn-danger" name="action" value="batal">Batalkan</button>
        </form></td>
        <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        <!--</p>-->
        </table>
    </div>
</div>
<jsp:include page="layout/site/footer.jsp"></jsp:include>