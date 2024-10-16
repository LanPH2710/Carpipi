/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.*;
import jakarta.servlet.RequestDispatcher;
import java.util.List;
import model.*;

/**
 *
 * @author nguye
 */
public class ProductListServlet extends HttpServlet {

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
        BrandDAO brandDao = new BrandDAO();
        ProductDAO productDao = new ProductDAO();
        StyleDAO styleDao = new StyleDAO();

        // Lấy số trang từ yêu cầu (mặc định là 1)
        int page = 1;
        String pageParam = request.getParameter("page");
        String brandId = request.getParameter("brandId");
        if (pageParam != null) {
            page = Integer.parseInt(pageParam);
        }

        List<Product> allPro = productDao.getAllProducts();
        int totalPro = allPro.size();
        // Tính toán chỉ số sản phẩm bắt đầu và kết thúc cho trang hiện tại
        int start = (page - 1) * 12;
        int end = Math.min(start + 12, totalPro);
        // Lấy danh sách sản phẩm cho trang hiện tại
        List<Product> productsForCurrentPage = allPro.subList(start, end);
        int totalPages = (int) Math.ceil((double) totalPro / 12);

        List<Style> styList = styleDao.getAllStyleCar();
        List<Brand> braList = brandDao.getAllBrand();

        request.setAttribute("productList", productsForCurrentPage);
        request.setAttribute("brandList", braList);
        request.setAttribute("styleList", styList);
        request.setAttribute("totalPages", totalPages); // Tổng số trang
        request.setAttribute("currentPage", page);
        RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
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

    public static void main(String[] args) {
              ProductDAO productDao = new ProductDAO();
int totalPage = productDao.getNumberOfPages(12);
        System.out.println(totalPage);
    }
}
