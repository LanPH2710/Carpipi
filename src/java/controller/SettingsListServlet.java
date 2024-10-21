/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.BrandDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import model.Brand;

/**
 *
 * @author ADMIN
 */
public class SettingsListServlet extends HttpServlet {
   
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
            out.println("<title>Servlet SettingsListServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SettingsListServlet at " + request.getContextPath () + "</h1>");
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
        BrandDAO bDAO = new BrandDAO();
        List<Brand> brandList = bDAO.getBrandListWithProductCount();
        ProductDAO pDAO = new ProductDAO();
        Map<String, Integer> fuelCounts = pDAO.getFuelCounts();

        request.setAttribute("brandList", brandList);
        request.setAttribute("fuelCounts", fuelCounts);
        request.getRequestDispatcher("settingsList.jsp").forward(request, response);
    
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
         // Xử lý cập nhật trạng thái của thương hiệu
//        int brandId = Integer.parseInt(request.getParameter("brandId"));
//        int newStatus = Integer.parseInt(request.getParameter("status"));
//
//        // Cập nhật trạng thái thương hiệu
//        brandDAO.updateBrandStatus(brandId, newStatus);
//
//        // Sau khi cập nhật, quay lại trang danh sách
//        response.sendRedirect("settingsList");
String action = request.getParameter("action");
    BrandDAO bDAO = new BrandDAO();
    ProductDAO pDAO = new ProductDAO();
    if ("updateFuelStatus".equals(action)) {
        String fuel = request.getParameter("fuel");
        int newStatus = Integer.parseInt(request.getParameter("status"));

        // Cập nhật trạng thái nhiên liệu
        boolean isUpdated = pDAO.updateFuelStatus(fuel, newStatus);

        // Sau khi cập nhật, quay lại trang danh sách
        response.sendRedirect("settingsList");
    } else {
        // Xử lý cập nhật trạng thái thương hiệu
        int brandId = Integer.parseInt(request.getParameter("brandId"));
        int newStatus = Integer.parseInt(request.getParameter("status"));

        bDAO.updateBrandStatus(brandId, newStatus);
        response.sendRedirect("settingsList");
    }
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
