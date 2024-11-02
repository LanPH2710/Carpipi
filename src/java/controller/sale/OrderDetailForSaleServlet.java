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
import jakarta.servlet.http.HttpSession;
import java.awt.Image;
import java.util.List;
import model.Account;
import model.Color;
import model.OrderDetail;
import model.OrderStatus;
import model.Product;
import model.ProductImage;

/**
 *
 * @author Sonvu
 */
public class OrderDetailForSaleServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderDetailForSaleServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailForSaleServlet at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();

        String orderId = request.getParameter("orderId");

        AccountDAO accountDao = new AccountDAO();
        OrderDAO orderDao = new OrderDAO();
        ColorDAO colorDao = new ColorDAO();
        ProductDAO p = new ProductDAO();
        Product product = new Product();
        ProductImage image = new ProductImage();

        List<OrderDetail> orderList = orderDao.getListOrderdetailById(orderId);

        for (OrderDetail o : orderList) {

        }

        List<Color> colorList = colorDao.getListColor();

        Account accountOrder = accountDao.getAccountById(6);

        List<Account> allSaleName = accountDao.getAccountByRole();

        List<OrderStatus> listStatusOrder = orderDao.getListOrderStatus();

        //  Account saleInfo = accountDao.getAccountById(orderDetail.getSaleId());
        System.out.println(image.getImageUrl());
        System.out.println(orderId);

        request.setAttribute("image", image);

        //    request.setAttribute("saleInfo", saleInfo);
        request.setAttribute("listStatusOrder", listStatusOrder);
        request.setAttribute("allSaleName", allSaleName);
        request.setAttribute("colorList", colorList);
        request.setAttribute("product", product);
        request.setAttribute("orderList", orderList);
        request.setAttribute("accountOrder", accountOrder);
        request.getRequestDispatcher("orderdetailforsale.jsp").forward(request, response);
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