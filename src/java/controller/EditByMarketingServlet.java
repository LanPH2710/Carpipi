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
        ProductDAO pDao = new ProductDAO();
        BrandDAO bDao = new BrandDAO();
        SegmentDAO sDao = new SegmentDAO();
        StyleDAO styleDao = new StyleDAO();
        SupplyDAO supplyDao = new SupplyDAO();

        Product car = new Product();

        List<Product> productList = pDao.getAllProducts();

        car = pDao.getProductById(id);
        request.setAttribute("car", car);

        List<ProductImage> imageList = pDao.getImagesByProductId(id);
        request.setAttribute("imageList", imageList);

        List<Brand> brandList = bDao.getAllBrand();
        request.setAttribute("brandList", brandList);

        List<Segment> segmentList = sDao.getAllSegment();
        request.setAttribute("segmentList", segmentList);

        List<Style> styleList = styleDao.getAllStyleCar();
        request.setAttribute("styleList", styleList);

        List<Supply> supplyList = supplyDao.getAllSupplyCar();
        request.setAttribute("supplyList", supplyList);

       

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

        Product product = new Product();
        ProductDAO pDao = new ProductDAO();

        String id = request.getParameter("id");
        String name = request.getParameter("name");

        String seatNumber = request.getParameter("seatNumber");
        int seat = Integer.parseInt(seatNumber);

        String priceCar = request.getParameter("price");
        double price = Double.parseDouble(priceCar);
        
        String brandCar = request.getParameter("brand");
        int brandId = Integer.parseInt(brandCar);

        String styleCar = request.getParameter("style");
        int styleId = Integer.parseInt(styleCar);

        String segmentCar = request.getParameter("segment");
        int segmentId = Integer.parseInt(segmentCar);

        String suppliCar = request.getParameter("supply");
        int supplyId = Integer.parseInt(suppliCar);
        
        String fuel = request.getParameter("fuel");

        String des = request.getParameter("des");

        String stockCar = request.getParameter("stock");
        int stock = Integer.parseInt(stockCar);
        
        pDao.updateProduct(id, name, seat, price,
                fuel, stock, des, 10, supplyId, 
                brandId, segmentId, styleId);
        
        System.out.println(id);
        System.out.println(name);
        System.out.println(seat);
        System.out.println(price);
        System.out.println(brandCar);
        System.out.println(styleCar);
        System.out.println(segmentCar);
        System.out.println(suppliCar);
        System.out.println(fuel);
        System.out.println(des);
        System.out.println(stockCar);
        
        
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
