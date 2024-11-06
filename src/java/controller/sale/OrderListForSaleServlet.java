/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import dal.AccountDAO;
import dal.ColorDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Order;
import model.OrderDetail;
import model.OrderStatus;
import model.Product;
import model.ProductImage;

/**
 *
 * @author Sonvu
 */
public class OrderListForSaleServlet extends HttpServlet {

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
        AccountDAO accountDao = new AccountDAO();
        Order order = new Order();
        OrderDAO orderDao = new OrderDAO();
        ColorDAO colorDao = new ColorDAO();
        ProductDAO p = new ProductDAO();
        Product product = new Product();
        ProductImage image = new ProductImage();

        List<OrderDetail> orderList = orderDao.getAllOrderList();

        List<OrderStatus> listStatusOrder = orderDao.getListOrderStatus();

        List<Account> allSaleName = accountDao.getAccountByRoleId("3");

        for (Account account : allSaleName) {
            System.out.println(account.getUserId());
            System.out.println(account.getLastName());

        }
        request.setAttribute("allSaleName", allSaleName);
        request.setAttribute("listStatusOrder", listStatusOrder);
        request.setAttribute("orderList", orderList);
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

        processRequest(request, response);

        System.out.println("===================================================");
        request.getRequestDispatcher("orderlistforsale.jsp").forward(request, response);

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

        String status = request.getParameter("status");
        String search = request.getParameter("search");

        System.out.println("status: " + status);
        System.out.println("search: " + search);

        OrderDAO orderDao = new OrderDAO();

        List<OrderDetail> orderList = new ArrayList<>();
        orderList = orderDao.getAllOrderList();

        if (status != null && status.equals("10")) {
            orderList = orderDao.getAllOrderList();
        } else if (status != null && !status.isEmpty()) {
            orderList = orderDao.getListOrderWithStatus(status);
        }

        if (search != null && !search.isEmpty()) {
            orderList = orderDao.getListOrderWithSearch(search);
        }

        request.setAttribute("search", search);
        request.setAttribute("statusSelect", status);
        request.setAttribute("orderList", orderList);
        System.out.println("---------------------------");

        request.getRequestDispatcher("orderlistforsale.jsp").forward(request, response);
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
