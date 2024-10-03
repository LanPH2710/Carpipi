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

        for (Style style : styleList) {
            System.out.println(style.getStyleName());
        }

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
        String id = request.getParameter("id");
        String name = request.getParameter("name");           // Tên xe
        String imageUrl = request.getParameter("imageUrl");   // Link ảnh từ người dùng
        String brand = request.getParameter("brand");         // Thương hiệu
        String style = request.getParameter("style");         // Kiểu dáng
        String supply = request.getParameter("supply");   // Phân khúc
        String segment = request.getParameter("segment");
        String seatNumber = request.getParameter("seatNumber"); // Số chỗ ngồi
        int seat = Integer.parseInt(seatNumber);
        String priceProduct = request.getParameter("price");         // Giá
        double price = Double.parseDouble(priceProduct);
        String fuel = request.getParameter("price");          // Nhiên liệu (Cả tên và placeholder đều là 'price', cần đổi lại thành "fuel" nếu muốn rõ ràng)
        String stockProduct = request.getParameter("stock");         // Số lượng tồn kho
        int stock = Integer.parseInt(stockProduct);
        String description = request.getParameter("commentInfor"); // Mô tả

        SupplyDAO supplyDao = new SupplyDAO();
        BrandDAO bDao = new BrandDAO();
        SegmentDAO segmentDao = new SegmentDAO();
        StyleDAO styleDao = new StyleDAO();
        
        
        ProductDAO pDao = new ProductDAO();
        pDao.updateProduct(id, name, seat, price, fuel, stock, description, 10, 
                supplyDao.getSupplyIdByName(supply), bDao.getBrandIdByName(brand), segmentDao.getSegmentIdByName(segment), styleDao.getStyleIdByName(style));
        

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
