/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.javawebprogramming;

import com.model.Cart;
import com.model.Order;
import com.model.Orderlist;
import com.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author hanifnaufal
 */
@WebServlet(name = "AddTransactionHandler", urlPatterns = {"/AddTransactionHandler"})
public class AddTransactionHandler extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            HttpSession sess = request.getSession();    
            //mengambil isi session username
            Object username = sess.getAttribute("username");
            
            /* TODO output your page here. You may use following sample code. */
            //Map yang berfungsi untuk menyimpan kuantitas dari setiap produk
            Cart cart = new Cart(request.getCookies());
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
            
            double total= 0;
            if (!counter.isEmpty()) {
                //query mengambil info barang dengan id yang terdapat pada cookies
                DatabaseInfo db = new DatabaseInfo();
                User user = db.getUser(username.toString());                                
                
                Order order = new Order();                
                order.setIdUser(user.getId());
                order.setTanggalOrder(new Date());
                
                ArrayList<Orderlist> ol = new ArrayList<Orderlist>();
                for (String id : counter.keySet()) {
                    Orderlist temp = new Orderlist();
                    temp.setIdProduct(Integer.parseInt(id));
                    temp.setKuantitas(counter.get(id));
                    ol.add(temp);
                }
                
                db = new DatabaseInfo();
                db.saveOrder(order, ol);
                response.sendRedirect("index.jsp");
                return;
            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
