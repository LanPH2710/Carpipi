/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import dal.CartDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Cart;
import model.Product;

/**
 *
 * @author hiule
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/addtocart"})
public class AddToCart extends HttpServlet {

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
        CartDAO cartDAO = new CartDAO();

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            // Nếu chưa đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = account.getUserId(); // Lấy userId từ session
        String productId = request.getParameter("productId");
        String quantityStr = request.getParameter("quantity");

        // Kiểm tra quantity
        if (quantityStr == null || quantityStr.isEmpty()) {
            response.getWriter().write("Quantity is required.");
            return;
        }

        int quantity;
        try {
            quantity = Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid quantity format.");
            return;
        }

        try {
            int cartId = cartDAO.getCartIdByUserIdAndProductId(userId, productId);

            if (cartId == -1) {
                // Nếu sản phẩm chưa tồn tại trong giỏ hàng -> Thêm sản phẩm mới
                if (cartDAO.addToCart(userId, productId, quantity)) {
                    // Thêm sản phẩm mới thành công
                    String urlHistory = (String) session.getAttribute("urlHistory");
                    if (urlHistory == null) {
                        urlHistory = "home";
                    }
                    response.sendRedirect(urlHistory);
                } else {
                    // Lỗi khi thêm sản phẩm mới
                    response.getWriter().write("Failed to add product to cart.");
                }
            } else {
                // Nếu sản phẩm đã tồn tại -> Cập nhật số lượng
                if (cartDAO.updateQuantityByCartId(cartId, quantity)) {
                    // Cập nhật số lượng thành công
                    String urlHistory = (String) session.getAttribute("urlHistory");
                    if (urlHistory == null) {
                        urlHistory = "home";
                    }
                    response.sendRedirect(urlHistory);
                } else {
                    // Lỗi khi cập nhật số lượng
                    response.getWriter().write("Failed to update cart quantity.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error adding product to cart: " + e.getMessage());
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
