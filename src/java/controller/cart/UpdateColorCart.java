/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import dal.CartDAO;
import dal.ColorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Color;

/**
 *
 * @author hiule
 */
@WebServlet(name = "UpdateColorCart", urlPatterns = {"/update-color"})
public class UpdateColorCart extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                response.sendRedirect("login.jsp");
                return;
            }
int color = Integer.parseInt(request.getParameter("color"));
           ColorDAO cdao = new ColorDAO();
        List<Color> colorList = cdao.getColorOfCar(productId);
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
            int userId = account.getUserId();
            String productId = request.getParameter("productId");
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int colorId = Integer.parseInt(request.getParameter("color"));

            CartDAO cartDAO = new CartDAO();

            try {
                // Check if the color change is valid and update it in the database
                cartDAO.updateCartColor(cartId, userId, productId, colorId);
            } catch (SQLException ex) {
                Logger.getLogger(UpdateColorCart.class.getName()).log(Level.SEVERE, null, ex);
            }
            session.setAttribute("messUpdateCart", "Cập nhật màu thành công!");

            // Redirect back to the cart page after the update
            response.sendRedirect("carts");
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
