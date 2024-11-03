/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.cart;

import dal.AccountDAO;
import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Cart;

/**
 *
 * @author hiule
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {

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
            out.println("<title>Servlet CheckoutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        if (acc != null) {
            Account user = adao.getAccountById(acc.getUserId());
            session.setAttribute("accCheckout", user);
        } else {
            // Handle the case where the account is null (e.g., redirect to login)
            response.sendRedirect("login.jsp");
            return;
        }

        CartDAO cartDAO = new CartDAO();
        List<Cart> carts = cartDAO.getSelectedCarts(acc.getUserId());
        if (carts == null || carts.isEmpty()) {
            session.setAttribute("messUpdateCart", "Bạn chưa chọn sản phẩm");
            response.sendRedirect("carts");
            return;
        }
        // For testing, forward to the test JSP
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        // Retrieve form data
        String pttt = request.getParameter("pttt");
        if (pttt != null && pttt.equals("ttpay")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            // Retrieve address components
            String tinh = request.getParameter("tinh");
            String quan = request.getParameter("quan");
            String phuong = request.getParameter("phuong");
            String address2 = request.getParameter("address2");

            // Combine into a full address
            String shippingAddress = String.join(", ", address2, phuong, quan, tinh);

            // Determine which address to use

            boolean flag = true;
            if (mobile == null || !isPhoneNum(mobile)) {
                session.setAttribute("msg_phoneCart", "Số điện thoại không hợp lệ");
                flag = false;
            }
            if (email == null || !isGmail(email)) {
                session.setAttribute("msg_gmailCart", "Gmail không hợp lệ");
                flag = false;
            }

            if (flag) {
                session.setAttribute("name", (lastName + firstName));
                session.setAttribute("phone", mobile);
                session.setAttribute("email", email);
                session.setAttribute("address", shippingAddress);
                request.getRequestDispatcher("vnpay_pay.jsp").forward(request, response);
            } else {
                // Set form field values and error messages in the request scope

                // Forward back to the checkout page
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }
        }
    }

    public static boolean isGmail(String input) {
        return input != null && input.matches("^[a-zA-Z][a-zA-Z0-9._%+-]*[a-zA-Z0-9]@[a-zA-Z0-9]{2,}(\\.[a-zA-Z0-9]{2,})+$");
    }

    public static boolean isPhoneNum(String input) {
        return input != null && input.matches("\\d{10,11}");
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
