/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;


import dal.ProductDAO;
import model.Product;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nguye
 */
public class HomePageServlet extends HttpServlet {

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
        ProductDAO productDAO = new ProductDAO(); // Xử lý ngoại lệ SQL nếu có
        List<Product> featuredProducts = new ArrayList<>();
        // Lấy danh sách các sản phẩm đặc biệt (ví dụ lấy từ cơ sở dữ liệu với điều kiện đặc biệt)
        List<Integer> featuredProductIds = Arrays.asList(1, 2, 3, 4, 51, 78, 76, 5);
        for (Integer productId : featuredProductIds) {
            Product product = productDAO.getProductById(productId);
            if (product != null) {
                try {
                    product.setImages(productDAO.getImagesByProductId(productId)); // Thêm danh sách hình ảnh vào sản phẩm
                } catch (SQLException ex) {
                    Logger.getLogger(HomePageServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                featuredProducts.add(product);
            }
        }
        // Truyền danh sách sản phẩm đến JSP
        request.setAttribute("featuredProducts", featuredProducts); // Sử dụng tên đúng cho JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage.jsp");
        dispatcher.forward(request, response);
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