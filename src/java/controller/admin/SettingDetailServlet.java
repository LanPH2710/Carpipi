/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.BrandDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Brand;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the brandId from the request parameter
        String brandIdStr = request.getParameter("brandId");

        try {
            int brandId = Integer.parseInt(brandIdStr);

            // Fetch the brand details from the database using the BrandDAO
            BrandDAO brandDAO = new BrandDAO();
            Brand brand = brandDAO.getBrandById1(brandId);

            // Check if the brand exists
            if (brand != null) {
                // Set the brand object in request scope
                request.setAttribute("brand", brand);
                // Forward the request to the JSP page to display details
                request.getRequestDispatcher("settingdetail.jsp").forward(request, response);
            } else {
                response.getWriter().println("<h1>Brand not found</h1>");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("<h1>Invalid brand ID</h1>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String brandIdParam = request.getParameter("brandId");
        String statusParam = request.getParameter("status"); // Lấy giá trị từ "status" thay vì "brandStatus"
        String brandName = request.getParameter("brandName");

        // Kiểm tra tham số đầu vào
        if (brandIdParam == null || statusParam == null || brandName == null) {
            request.setAttribute("errorMessage", "Brand ID, status, and name are required.");
            request.getRequestDispatcher("home").forward(request, response);
            return;
        }

        try {
            int brandId = Integer.parseInt(brandIdParam);

            // Chuyển đổi status từ chuỗi "active"/"inactive" thành 1 hoặc 0
            int brandStatus = statusParam.equals("active") ? 1 : 0;

            // Tạo đối tượng BrandDAO
            BrandDAO brandDAO = new BrandDAO();
            // Cập nhật tên và trạng thái
            brandDAO.updateBrand(brandId, brandName, brandStatus);

            // Chuyển hướng lại trang chi tiết sau khi cập nhật
            response.sendRedirect("settingdetail?brandId=" + brandId);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid brand ID or status.");
            request.getRequestDispatcher("home").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
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
