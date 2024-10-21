/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import dal.SegmentDAO;
import dal.StyleDAO;
import dal.SupplyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Brand;
import model.Product;
import model.ProductImage;
import model.Segment;
import model.Style;
import model.Supply;

/**
 *
 * @author Sonvu
 */
public class EditByMarketingServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditByMarketingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditByMarketingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String id = request.getParameter("id");

        ProductDAO productDao = new ProductDAO();
        BrandDAO brandDao = new BrandDAO();
        SegmentDAO segmentDao = new SegmentDAO();
        StyleDAO styleDao = new StyleDAO();
        SupplyDAO supplyDao = new SupplyDAO();

        // Lấy thông tin sản phẩm
        Product product = productDao.getProductById(id);
        request.setAttribute("car", product);

        // Lấy danh sách hình ảnh của sản phẩm
        List<ProductImage> imageList = productDao.getImagesByProductId(id);
        request.setAttribute("imageList", imageList);

        // Lấy danh sách thương hiệu, phân khúc, kiểu dáng và nhà cung cấp
        request.setAttribute("brandList", brandDao.getAllBrand());
        request.setAttribute("segmentList", segmentDao.getAllSegment());
        request.setAttribute("styleList", styleDao.getAllStyleCar());
        request.setAttribute("supplyList", supplyDao.getAllSupplyCar());

        // Chuyển tiếp đến JSP để hiển thị thông tin
        request.getRequestDispatcher("editproductbymarketing.jsp").forward(request, response);
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

        ProductDAO pDao = new ProductDAO();

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String brandIdParam = request.getParameter("brand");
        String segmentIdParam = request.getParameter("segment");
        String supplyIdParam = request.getParameter("supply");
        String styleIdParam = request.getParameter("style");
        int brandId = 0;
        int segmentId = 0;
        int supplyId = 0;
        int styleId = 0;
        int seat = Integer.parseInt(request.getParameter("seatNumber"));
        double price = Double.parseDouble(request.getParameter("price"));
        String fuel = request.getParameter("fuel");
        int stock = Integer.parseInt(request.getParameter("stock"));
        String des = request.getParameter("des");

        // Retrieve supplyId, brandId, segmentId, and styleId from the request
        try {
            supplyId = Integer.parseInt(supplyIdParam);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        try {
            brandId = Integer.parseInt(brandIdParam);
        } catch (Exception e) {
            System.out.println(e);
        }
         try {
            segmentId = Integer.parseInt(segmentIdParam);
        } catch (Exception e) {
            System.out.println(e);
        }
          try {
            styleId = Integer.parseInt(styleIdParam);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        // Update product
        pDao.updateProduct(id, name, seat, price, fuel, stock, des, 10, supplyId, brandId, segmentId, styleId);

        // Handle image updates if necessary
        String[] imageUrls = request.getParameterValues("imageUrls");
        if (imageUrls != null) {
            for (String imageUrl : imageUrls) {
                // Add logic to save images to the database
            }
        }

        response.sendRedirect("proformarketing");
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
