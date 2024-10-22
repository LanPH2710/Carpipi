///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller.admin;
//
//
//import dal.AccountDAO;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.Base64;
//import model.Account;
//
//
///**
// *
// * @author 84777
// */
//@WebServlet(name = "AddUser", urlPatterns = {"/addUser"})
//public class AddUser extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet AddUser</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.getRequestDispatcher("/admin/AddUser.jsp").forward(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        AccountDAO accountDAO = new AccountDAO();
//        String avatar = request.getParameter("avatar").trim();
//        String firstname = request.getParameter("firstname").trim();
//        String lastname = request.getParameter("lastname").trim();
//        String password = request.getParameter("password");
//        String re_password = request.getParameter("re_password");
//        String bio = request.getParameter("bio").trim();
//        String DOB = request.getParameter("DOB");
//        String role_raw = request.getParameter("role");
//        String gender_raw = request.getParameter("gender");
//        String active_status_raw = request.getParameter("active_status");
//        String username = request.getParameter("username").trim();
//        String gmail = request.getParameter("email").trim();
//        String phone = request.getParameter("phone").trim();
//
//        int role = Integer.parseInt(role_raw);
//        int gender = Integer.parseInt(gender_raw);
//        int active_status = Integer.parseInt(active_status_raw);
//        boolean flag = true;
//
//        if (avatar == null || avatar.isBlank() || avatar.isEmpty()) {
//            avatar = "avatar_default.jpg";
//            request.setAttribute("avatar", "avatar_default.jpg");
//        }
//
//        if (password.isEmpty()) {
//            request.setAttribute("msg_password", "Nhập mật khẩu");
//            flag = false;
//        }
//
//        if (StringUtil.isValidPassword(password) == false) {
//            request.setAttribute("msg_password_ex", "The password must be at least 8-30 characters long, including at least 1 uppercase letter, 1 lowercase letter, 1 special character, and 1 number");
//            flag = false;
//        }
//
//        if (!password.equals(re_password)) {
//            request.setAttribute("msg_re_password", "mật khẩu không trùng khớp");
//            flag = false;
//        }
//
//        if (role == -1) {
//            request.setAttribute("msg_role", "chọn vai trò");
//            flag = false;
//        }
//
//        if (active_status == -1) {
//            request.setAttribute("msg_active_status", "chọn trạng thái hoạt động");
//            flag = false;
//        }
//
//        if (isValidUsername(username) == false || username == null) {
//            request.setAttribute("msg_username", "Username phải từ 3-30 ký tự");
//            flag = false;
//        }
//
//        if (isGmail(gmail) == false) {
//            request.setAttribute("msg_gmail", "Gmail không hợp lệ");
//            flag = false;
//        }
//
//        if (isPhoneNum(phone) == false) {
//            request.setAttribute("msg_phone", "Số điện thoại không hợp lệ");
//            flag = false;
//        }
//
//        if (userdao.getUserByGmail(gmail) != null) {
//            request.setAttribute("msg_gmail_ex", "gmail đã tồn tại");
//            flag = false;
//        }
//
//        if (userdao.getUserByUsername(username) != null) {
//            request.setAttribute("msg_username_ex", "tài khoản đã tồn tại");
//            flag = false;
//        }
//
//        if (userdao.getUserByPhone(phone) != null) {
//            request.setAttribute("msg_phone_ex", "Số điện thoại đã tồn tại");
//            flag = false;
//        }
//
//        if (firstname.isBlank()) {
//            request.setAttribute("msg_firstname", "tên đầu không được để trắng");
//            flag = false;
//        }
//
//        if (lastname.isBlank()) {
//            request.setAttribute("msg_lastname", "Tên sau không được để trắng");
//            flag = false;
//        }
//
//        if (StringUtil.validateDOB(DOB) != null) {
//            request.setAttribute("msg_bod", "Birth date is invalid");
//            flag = false;
//        }
//
//        if (flag == true) {
//            String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes());
//
//            request.setAttribute("msg_suc", "Thêm người dùng thành công");
//            request.setAttribute("userUpdate", DOB);
//            Account account = new Account(us);
//            accountDAO.insertPendingAccount(account);
//            request.getRequestDispatcher("/admin/AddUser.jsp").forward(request, response);
//            return;
//        }
//        request.setAttribute("msg_err", "Thêm người dùng thất bại");
//        request.getRequestDispatcher("/admin/AddUser.jsp").forward(request, response);
//    }
//
//    private static boolean isValidUsername(String input) {
//        String regex = "^(?=.*[a-zA-Z])[a-zA-Z0-9]{3,30}$";
//        return input.matches(regex);
//    }
//
//    public static boolean isGmail(String input) {
//        return input.matches("^[a-zA-Z][a-zA-Z0-9._%+-]*[a-zA-Z0-9]@[a-zA-Z0-9]{2,}(\\.[a-zA-Z0-9]{2,})+$");
//    }
//
//    public static boolean isPhoneNum(String input) {
//        return input.matches("\\d{10,11}");
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
