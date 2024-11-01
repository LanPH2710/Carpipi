/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.AccountDAO;
import dal.FeedbackDAO;
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
import model.Feedback;
import model.Product;

/**
 *
 * @author Sonvu
 */
public class FeedbackListMarketingServlet extends HttpServlet {

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
        FeedbackDAO feDao = new FeedbackDAO();
        AccountDAO accountDao = new AccountDAO();
        ProductDAO productDao = new ProductDAO();

        List<Feedback> listFeedback = feDao.getAllFeedback();

        List<Account> listAccount = new ArrayList<>();

        List<Product> listProduct = new ArrayList<>();

        for (Feedback f : listFeedback) {
            Product productOut = productDao.getProductById(f.getProductId());
            boolean check = false;

            if (listProduct.isEmpty()) {
                listProduct.add(productOut);
            }

            for (Product product : listProduct) {
                if (productOut.getProductId().equalsIgnoreCase(product.getProductId())) {
                    check = true;
                }
            }

            if (!check) {
                listProduct.add(productOut);
            }

        }
        
        for (Feedback f : listFeedback) {
            Account accountOunt = accountDao.getAccountById(f.getUserId());
            boolean check = false;

            if (listAccount.isEmpty()) {
                listAccount.add(accountOunt);
            }

            for (Account acc : listAccount) {
                if (acc.getUserId() == accountOunt.getUserId()) {
                    check = true;
                }
            }

            if (!check) {
                listAccount.add(accountOunt);
            }

        }

        for (Account a : listAccount) {
            System.out.println(a.getFirstName());
        }

        for (Product product : listProduct) {
            System.out.println(product.getName());

        }

        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listAccount", listAccount);
        request.setAttribute("listFeedback", listFeedback);
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
        

        request.getRequestDispatcher("feedbacklistmarketing.jsp").forward(request, response);
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
