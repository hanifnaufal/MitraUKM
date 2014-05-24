<%-- 
    Document   : pembayaran
    Created on : May 24, 2014, 11:20:56 AM
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
    Cart cart = new Cart(request.getCookies());
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
            
                <td><%=ce.getCount()%></td>
                <td>
                    <%="Rp." + ce.total()%>
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
                
                
            <%
                String prosedur = request.getParameter("prosedur");
                if(prosedur.equals("cod")){
            %>
                    
            <%
                }else if(prosedur.equals("kartu")){
            %>
                    
            <%        
                }                                
            %>
            <h3><a href="#Potongan" data-toggle="modal">Potongan harga bank sampah!</a></h3>
            <div class="modal fade bs-example-modal-sm" id="Potongan" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">Potongan Harga Bank Sampah</h4>
                        </div>
                        <div class="modal-body">
                            <form role="form" method="post">                                
                                <div class="form-group">
                                    <label>Username</label>
                                    <input type="username" name="username" class="form-control" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                                </div>					  			 					  
                                <div class="form-group">
                                    <label>Potongan harga</label>
                                    <input type="number" name="password" class="form-control" placeholder="Potongan" required>
                                </div>					  			 	
                                <p>isi dengan akun bank sampah</p>
                                <input type="submit" name="action" value="login" class="btn btn-default">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>			        	
                            </form>
                        </div>			      
                    </div>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="layout/site/footer.jsp"></jsp:include>