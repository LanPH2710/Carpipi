/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.AccountDAO;
import dal.BlogDAO;
import dal.FeedbackDAO;
import dal.ProductDAO;
import dal.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;
import model.Feedback;
import model.Product;

/**
 *
 * @author tuana
 */
public class AdminDashBoardServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AdminDashBoardServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDashBoardServlet at " + request.getContextPath () + "</h1>");
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
        BlogDAO blogDAO = new BlogDAO();
        ProductDAO productDAO = new ProductDAO();
        AccountDAO accountDAO = new AccountDAO();
        SliderDAO sliderDAO = new SliderDAO();
        FeedbackDAO fdao = new FeedbackDAO();
        //OrderDAO orderDAO = new OrderDAO();
        // Lấy số lượng blog từ BlogDAO
        int blogCount = blogDAO.getBlogCount();
        int productCount = productDAO.getProductCount();
        int customerCount = accountDAO.getCustomerCount();
        int staffCount = accountDAO.getStaffCount();
        int feedbackCount = fdao.getFeedbackCount();
        List<Feedback> feedbackRate = fdao.getFeedbackRateByBrand();
        List<Account> staff = accountDAO.getStaff();
        List<Product> productSale = productDAO.getProductsWithTotalQuantitySold();
        int totalQuantitySold = productDAO.getTotalQuantitySold();
        int sliderCount = sliderDAO.getSliderCount();
        //int orderCount = orderDAO.getOrderCount();
        // Đưa số lượng blog vào request attribute
        request.setAttribute("blogCount", blogCount);
        request.setAttribute("productCount", productCount);
        request.setAttribute("customerCount", customerCount);
        request.setAttribute("productSale", productSale);
        request.setAttribute("totalQuantitySold", totalQuantitySold);
        request.setAttribute("sliderCount", sliderCount);
        request.setAttribute("feedbackBrand", feedbackRate);
        request.setAttribute("staffCount", staffCount);
        request.setAttribute("staff", staff);
        request.setAttribute("feedbackCount", feedbackCount);
        //request.setAttribute("orderCount", orderCount);
        // Chuyển tiếp tới trang JSP để hiển thị
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
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
