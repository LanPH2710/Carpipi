/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.BrandDAO;
import dal.SegmentDAO;
import dal.StyleDAO;
import dal.SupplyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Brand;
import model.Segment;
import model.Style;
import model.Supply;

/**
 *
 * @author ADMIN
 */
public class SettingDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet SettingDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingDetailServlet at " + request.getContextPath() + "</h1>");
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
        String brandIdStr = request.getParameter("brandId");
        String styleIdStr = request.getParameter("styleId");
        String supplyIdStr = request.getParameter("supplyId");
        String segmentIdStr = request.getParameter("segmentId");

        // Xử lý cho brandId
        if (brandIdStr != null) {
            try {
                int brandId = Integer.parseInt(brandIdStr);
                BrandDAO brandDAO = new BrandDAO();
                Brand brand = brandDAO.getBrandById1(brandId);

                if (brand != null) {
                    request.setAttribute("brand", brand);
                    request.setAttribute("style", null); // Đặt style thành null để không hiển thị
                    request.setAttribute("supply", null); // Đặt style thành null để không hiển thị
                    request.setAttribute("supply", null);
                    request.getRequestDispatcher("settingdetail.jsp").forward(request, response);
                } else {
                    response.getWriter().println("<h1>Brand not found</h1>");
                }
            } catch (NumberFormatException e) {
                response.getWriter().println("<h1>Invalid brand ID</h1>");
            }
        } // Xử lý cho styleId
        else if (styleIdStr != null) {
            StyleDAO styleDAO = new StyleDAO();
            Style style = styleDAO.getStyleById(styleIdStr); // Gọi với styleId kiểu String

            if (style != null) {
                request.setAttribute("style", style);
                request.setAttribute("brand", null); // Đặt brand thành null để không hiển thị
                request.setAttribute("supply", null);
                request.setAttribute("segment", null);
                request.getRequestDispatcher("settingdetail.jsp").forward(request, response);
            } else {
                response.getWriter().println("<h1>Style not found</h1>");
            }
        } else if (supplyIdStr != null) {
            SupplyDAO supplyDAO = new SupplyDAO();
            Supply supply = supplyDAO.getSupplyById(supplyIdStr); // Gọi với styleId kiểu String

            if (supply != null) {
                request.setAttribute("supply", supply);
                request.setAttribute("brand", null); // Đặt brand thành null để không hiển thị
                request.setAttribute("style", null);
                request.setAttribute("segment", null);
                request.getRequestDispatcher("settingdetail.jsp").forward(request, response);
            } else {
                response.getWriter().println("<h1>Style not found</h1>");
            }

        } else if (segmentIdStr != null) {
            try {
                int segmentId = Integer.parseInt(segmentIdStr);
                SegmentDAO segmentDAO = new SegmentDAO();
                Segment segment = segmentDAO.getSegmentById(segmentId);

                if (segment != null) {
                    request.setAttribute("segment", segment);
                    request.setAttribute("brand", null);
                    request.setAttribute("style", null); // Đặt style thành null để không hiển thị
                    request.setAttribute("supply", null); // Đặt style thành null để không hiển thị
                    request.getRequestDispatcher("settingdetail.jsp").forward(request, response);
                } else {
                    response.getWriter().println("<h1>Brand not found</h1>");
                }
            } catch (NumberFormatException e) {
                response.getWriter().println("<h1>Invalid brand ID</h1>");
            }
        } else {
            response.getWriter().println("<h1>No brand or style ID provided</h1>");
        }

    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String brandIdParam = request.getParameter("brandId");
    String statusParam = request.getParameter("status");
    String brandName = request.getParameter("brandName");

    String styleIdStr = request.getParameter("styleId"); // styleId remains as String
    String styleName = request.getParameter("styleName");
    String styleStatusStr = request.getParameter("styleStatus");

    // Check input parameters for brand update
    if (brandIdParam != null && statusParam != null && brandName != null) {
        try {
            int brandId = Integer.parseInt(brandIdParam);
            int brandStatus = statusParam.equals("active") ? 1 : 0;

            BrandDAO brandDAO = new BrandDAO();
            brandDAO.updateBrand(brandId, brandName, brandStatus);

            response.sendRedirect("settingdetail?brandId=" + brandId);
            return;
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid brand ID or status.");
            request.getRequestDispatcher("home").forward(request, response);
            return;
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("home").forward(request, response);
            return;
        }
    }

    // Check input parameters for style update
    if (styleIdStr != null && styleName != null && styleStatusStr != null) {
        try {
            // No need to parse styleIdStr as an integer; it remains as a String
            int styleStatus = styleStatusStr.equals("active") ? 1 : 0;

            StyleDAO styleDAO = new StyleDAO();
            styleDAO.updateStyle(styleIdStr, styleName, styleStatus);  // Pass styleIdStr as String

            response.sendRedirect("settingdetail?styleId=" + styleIdStr);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("home").forward(request, response);
        }
    } else {
        // If neither brand nor style parameters are provided, show an error
        request.setAttribute("errorMessage", "Brand or style details are required.");
        request.getRequestDispatcher("home").forward(request, response);
    }
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
