/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import dal.StyleDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;
import model.Product;
import model.Style;

/**
 *
 * @author nguye
 */
public class BrandControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BrandControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BrandControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
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
        List<Product> proByBrand = productDao.getAllProductByBrandId(brandId);
        int totalPro = proByBrand.size();
        // Tính toán chỉ số sản phẩm bắt đầu và kết thúc cho trang hiện tại
        int start = (page - 1) * 12;
        int end = Math.min(start + 12, totalPro);
        // Lấy danh sách sản phẩm cho trang hiện tại
        
        int totalPages = productDao.getTotalProductWithBrandId(brandId);
        List<Product> proByBrandPerPage = proByBrand.subList(start, end);
        List<Style> styList = styleDao.getAllStyleCar();
        List<Brand> braList = brandDao.getAllBrand();
        
        request.setAttribute("brandList", braList);
        request.setAttribute("styleList", styList);
        request.setAttribute("totalPages", totalPages); 
        request.setAttribute("currentPage", page);
        request.setAttribute("productList", proByBrandPerPage);
        RequestDispatcher dispatcher = request.getRequestDispatcher("productList.jsp");
        dispatcher.forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
