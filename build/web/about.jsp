<%-- 
    Document   : about
    Created on : Apr 18, 2014, 3:45:35 PM
    Author     : hanifnaufal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.javawebprogramming.DatabaseInfo"%>
<%@page import="com.model.User"%>

<jsp:include page="layout/site/header.jsp"></jsp:include>

    <div class="content">
        <div class="container">
            <h3>About Us</h3> <hr>
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <div class="col-md-6 column">
                        <br> <div id="map"></div>
                    </div>
                    <div class="col-md-6 column">
                        <table style="width:600px">
                            <tr>
                                <td  colspan="3"><h4>Kontak Kami:</h4></td>
                            </tr>
                            <tr></tr>
                            <tr>
                                <td>Nomer telepon</td>
                                <td class="text-right">: &nbsp;</td>
                                <td>08123456789</td> 
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td class="text-right">: &nbsp;</td>
                                <td>mitraukm@gmail.com</td> 
                            </tr>
                            <tr>
                                <td>Alamat</td>
                                <td class="text-right">: &nbsp;</td>
                                <td>Jalan Fasilkom UI, Universitas Indonesia</td> 
                            </tr>
                            <tr><br></tr>
                            <tr colspan="3">
                                <td><h4>Tentang Kami</h4></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="text-justify">Sebuah perusahaan khusus yang menyalurkan hasil karya
                                dari Usaha Kecil Menengah dengan sistematika kemudahan transaksi dan fasilitas yang modern.
                                Toko Online yang dirancang untuk menyebar manfaat dari penggunaan uang virtual dari Bank Sampah.
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="layout/site/footer.jsp"></jsp:include>
