/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cart;

import java.sql.SQLException;
import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;
import model.Product;

@WebServlet(name = "UpdateCartQuantityController", urlPatterns = {"/update-quantity"})
public class UpdateCartQuantityController extends HttpServlet {

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

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
         if (account == null) {
            // Nếu chưa đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }
         int isSelect = request.getParameter("selectCart") != null ? 1 : 0;
        int userId = account.getUserId();
        String productId = request.getParameter("productId");
        String qua = request.getParameter("quantity");
        int quantity = Integer.parseInt(qua);
        
        // Create an instance of CartDAO
        CartDAO cartDAO = new CartDAO();
         ProductDAO productDAO = new ProductDAO();
         Product product = productDAO.getProductById(productId);
         if (quantity > product.getStock()) {
             session.setAttribute("messCart", "Mua quá số lượng");
             session.setAttribute("flashTime", System.currentTimeMillis());
             response.sendRedirect("carts");
              return;
         }else if (qua.isEmpty() || qua == null) {
             session.setAttribute("messCart", "Vui lòng nhập số nguyên");
             session.setAttribute("flashTime", System.currentTimeMillis());
             response.sendRedirect("carts");
              return;
         }
         
       
        List<Cart> carts = cartDAO.getCartsByUserId(userId);
        Cart cartToUpdate = null;
        // Check if the quantity exceeds the limit
        
        // Find the cart item that matches the productId
        for (Cart cartItem : carts) {
            if (cartItem.getProduct().getProductId().equals(productId)) {
                cartToUpdate = cartItem;
                
               break;
            }
        }
         
        
             
         
        if (cartToUpdate != null) {
            // Update the quantity in the database
            cartDAO.updateCart2(cartToUpdate.getCartId(), userId, productId, quantity,isSelect);
                cartToUpdate.setIsSelect(isSelect);
            // Update the cart quantity in the list
            cartToUpdate.setQuantity(quantity);
        }
        // Update total money after the change
        double totalMoney = 0;
        for (Cart cartItem : carts) {
            if (cartItem.getIsSelect()==1) {
                totalMoney += cartItem.getQuantity() * cartItem.getProduct().getPrice();
            }
            
        }
        session.setAttribute("messCart", "");
        // Save the updated carts and total money back to session
        session.setAttribute("carts", carts);
        session.setAttribute("totalMoney", totalMoney);
        String urlHistory = (String) session.getAttribute("urlHistory");
        if (urlHistory == null) {
            urlHistory = "carts";
        }
        // Redirect to the cart page or forward to the appropriate view
        response.sendRedirect("carts"); // Redirect to the CartController
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