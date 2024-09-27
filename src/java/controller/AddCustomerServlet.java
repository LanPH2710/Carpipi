/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author tuana
 */
public class AddCustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCustomerServlet at " + request.getContextPath() + "</h1>");
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
        String userName = request.getParameter("userName").trim();
        String password = request.getParameter("password").trim();
        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String gender = request.getParameter("gender").trim();
        String email = request.getParameter("email").trim();
        String mobile = request.getParameter("mobile").trim();
        String address = request.getParameter("address").trim();

        // Kiểm tra các trường thông tin có chứa khoảng trắng không
        if (userName.isEmpty() || password.isEmpty() || firstName.isEmpty() || lastName.isEmpty()
                || gender.isEmpty() || email.isEmpty() || mobile.isEmpty() || address.isEmpty()) {
            // Nếu có, hiển thị thông báo lỗi
            String errorMessage = "You need input text , input again!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("customerlist").forward(request, response);
            return;
        }
        //check xem co ton tai account ko
        AccountDAO adao = new AccountDAO();
        if (adao.checkAccountExits(email) != null) {
            String errorMessage = "Email already exists, please use a different email!";
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("customerlist").forward(request, response);
            return;
        }
        Account acc = new Account(userName, password, firstName, lastName, gender, email, mobile, address, 4,"avatar-trang-4.jpg");
        // Thực hiện thêm sản phẩm vào cơ sở dữ liệu
        adao.insertAccount(acc);
        // Chuyển hướng đến trang quản lý sản phẩm sau khi thêm thành công
        response.sendRedirect("customerlist");
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

}
