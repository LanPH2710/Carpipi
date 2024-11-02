/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
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
public class ProductListMarketingServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductListMarketingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductListMarketingServlet at " + request.getContextPath() + "</h1>");
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

        ProductDAO pDao = new ProductDAO();
        BrandDAO bDao = new BrandDAO();
        SegmentDAO sDao = new SegmentDAO();
        StyleDAO styleDao = new StyleDAO();
        SupplyDAO supplyDao = new SupplyDAO();

        ProductImage pImage = new ProductImage();

        String brandId = request.getParameter("brandId");

        String indexPage = request.getParameter("index");
        String search = request.getParameter("searchse");
        String[] styleIds = request.getParameterValues("styleId");
        // Xử lý submit từ Form 1
        HttpSession session = request.getSession();

        if (styleIds != null) {
            for (String styleId : styleIds) {
                System.out.println(styleId); // In ra từng giá trị của styleId
            }
        } else {
            System.out.println("Không có kiểu dáng nào được chọn.");
        }
        session.setAttribute("styleIdList", styleIds);

        String[] segmentIds = request.getParameterValues("segmentId");
        session.setAttribute("segmentIdList", segmentIds);

        String[] supplyIds = request.getParameterValues("supplyId");
        session.setAttribute("supplyIdList", supplyIds);

        String orderId = request.getParameter("orderId");
        String orderName = request.getParameter("orderName");
        String orderPrice = request.getParameter("orderPrice");

        if (indexPage == null || indexPage.isEmpty()) {
            indexPage = "1";
        }

        int index = Integer.parseInt(indexPage);

        List<Style> styleList = styleDao.getAllStyleCar();
        request.setAttribute("styleList", styleList);

        List<Product> productList = pDao.getAllProducts();

        List<Brand> brandList = bDao.getAllBrand();
        request.setAttribute("brandList", brandList);

        List<Segment> segmentList = sDao.getAllSegment();
        request.setAttribute("segmentList", segmentList);

        List<Supply> supplyList = supplyDao.getAllSupplyCar();
        request.setAttribute("supplyList", supplyList);

        List<Product> productListGetBrand = new ArrayList<>();
        List<Product> listProduct = pDao.pagingProduct(index);

        List<Product> listProductByName = new ArrayList<>();

        List<ProductImage> pImageList = new ArrayList<>();
        for (Product p : productList) {
            String pId = p.getProductId();

            pImage = pDao.getOneImagesByProductId(pId);
            if (pImage != null) {
                pImageList.add(pImage);
            }
        }

        int count = pDao.getTotalAccount();

        if (brandId != null && !brandId.isEmpty()) {
            productList = pDao.getProductByBrandId(brandId);
            request.setAttribute("productListGetBrand", productListGetBrand);
            count = pDao.getTotalProductWithBrandId(brandId);
            request.setAttribute("chooseBrand", brandId);

        }
        
        if (search != null && !search.isEmpty()) {
            listProduct = pDao.getPagingProductBySearch(search, index);
            if (listProduct != null && !listProduct.isEmpty()) {

                request.setAttribute("listProduct", listProduct);
                count = pDao.getToTalPagingProductBySearch(search);
            }
        }

        productList = styleDao.getListFilter(brandId, styleIds, segmentIds, supplyIds, index);

        int endPage = count / 16;
        if (count % 16 != 0) {
            endPage++;
        }

        styleList = styleDao.getStyleFilter(styleIds);
        System.out.println(styleList);

        request.setAttribute("styleIds", styleIds);

        request.setAttribute("brandId", brandId);
        request.setAttribute("productList", productList);

        request.setAttribute("imageList", pImageList);
        request.setAttribute("searchch", search);
        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("product_list_maketing.jsp").forward(request, response);

        System.out.println("---------------------------");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderName = request.getParameter("orderName");
        System.out.println(orderName);

        String[] styleIds = request.getParameterValues("styleId");

        if (styleIds != null) {
            for (String styleId : styleIds) {
                System.out.println(styleId); // In ra từng giá trị của styleId
            }
        } else {
            System.out.println("Không có kiểu dáng nào được chọn.");
        }
        System.out.println("---------------------------");
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