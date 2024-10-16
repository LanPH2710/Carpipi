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
import java.util.List;
import model.Account;

/**
 *
 * @author tuana
 */
public class CustomerListServlet extends HttpServlet {

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
            out.println("<title>Servlet CustomerListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerListServlet at " + request.getContextPath() + "</h1>");
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
        AccountDAO adao = new AccountDAO();
        // Sắp xếp theo yêu cầu hoặc mặc định theo tên
        String sort = request.getParameter("sort");
        String order = request.getParameter("order");
        List<Account> p = null;
        if (order == null || order.isEmpty()) {
            order = "asc"; // Mặc định là tăng dần
        }
        if (sort != null && !sort.isEmpty()) {
            switch (sort) {
                case "name":
                    p = adao.sortCustomerByName(order);
                    break;
                case "email":
                    p = adao.sortCustommerByEmail(order);
                    break;
                case "phone":
                    p = adao.sortCustommerByPhone(order);
                    break;
                default:
                    p = adao.getAllCustommer(); // Nếu giá trị sort không hợp lệ
                    break;
            }
        } else {
            p = adao.getAllCustommer(); // Mặc định lấy danh sách nếu không có sort
        }

        // Phân trang
        int page, numperpage = 1;
        int size = p.size();
        int num = (int) Math.ceil((double) size / numperpage); // Số trang, làm tròn lên
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start = (page - 1) * numperpage;
        int end = Math.min(page * numperpage, size);
        List<Account> listAcc = adao.getCustomerListByPage(p, start, end);

        // Truyền giá trị lại cho view
        request.setAttribute("size", size);
        request.setAttribute("numperpage", numperpage);
        request.setAttribute("customerList", listAcc);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        request.setAttribute("sort", sort);
        request.setAttribute("order",order );
        request.getRequestDispatcher("customerList.jsp").forward(request, response);
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
