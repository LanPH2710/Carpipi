/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.cart;

import java.sql.SQLException;
import dal.CartDAO;
import dal.ColorDAO;
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
import model.Color;
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
            response.sendRedirect("login.jsp");
            return;
        }

        int isSelect = request.getParameter("selectCart") != null ? 1 : 0;
        int userId = account.getUserId();
        String productId = request.getParameter("productId");
        String qua = request.getParameter("quantity");
        int quantity = Integer.parseInt(qua);
        int color = Integer.parseInt(request.getParameter("color"));

        ColorDAO cdao = new ColorDAO();
        List<Color> colorList = cdao.getColorOfCar(productId);

        // Validate quantity and input
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductById(productId);
        if (quantity > product.getStock()) {
            session.setAttribute("messCart", "Mua quá số lượng");
            session.setAttribute("flashTime", System.currentTimeMillis());
            response.sendRedirect("carts");
            return;
        } else if (qua.isEmpty()) {
            session.setAttribute("messCart", "Vui lòng nhập số nguyên");
            session.setAttribute("flashTime", System.currentTimeMillis());
            response.sendRedirect("carts");
            return;
        }

        // Check if the selected color is available for the product
        boolean colorExists = false;
        for (Color colorOption : colorList) {
            if (colorOption.getColorId() == color) {
                colorExists = true;
                break;
            }
        }

        if (!colorExists) {
            StringBuilder availableColors = new StringBuilder("Chỉ còn màu: ");
            for (Color colorOption : colorList) {
                availableColors.append(colorOption.getColorName()).append(", ");
            }

            // Remove the trailing comma and space
            if (availableColors.length() > 0) {
                availableColors.setLength(availableColors.length() - 2);
            }

            // Set the message with available colors in the session attribute
            session.setAttribute("messUpdateCart", availableColors.toString());
            response.sendRedirect("carts");
            return;
        }

        // Proceed to update the cart
        CartDAO cartDAO = new CartDAO();
        List<Cart> carts = cartDAO.getCartsByUserId(userId);
        Cart cartToUpdate = null;

        // Find the cart item that matches the productId
        for (Cart cartItem : carts) {
            if (cartItem.getProduct().getProductId().equals(productId) && cartItem.getColorId() == color) {
                cartToUpdate = cartItem;
                break;
            }
        }

        if (cartToUpdate != null) {
            cartDAO.updateCart2(cartToUpdate.getCartId(), userId, productId, quantity, isSelect, color);
            cartToUpdate.setColorId(color);
            cartToUpdate.setIsSelect(isSelect);
            cartToUpdate.setQuantity(quantity);
        } else {
            // Handle the case where the cart item doesn't exist
            session.setAttribute("messUpdateCart", "Không tìm thấy sản phẩm trong giỏ hàng");
            response.sendRedirect("carts");
            return;
        }

        // Update total money after the change
        double totalMoney = 0;
        for (Cart cartItem : carts) {
            if (cartItem.getIsSelect() == 1) {
                totalMoney += cartItem.getQuantity() * cartItem.getProduct().getPrice();
            }
        }
        session.setAttribute("messCart", "");
        session.setAttribute("carts", carts);
        session.setAttribute("totalMoney", totalMoney);
        response.sendRedirect("carts");
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
