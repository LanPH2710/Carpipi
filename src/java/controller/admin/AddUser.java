/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;


import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Base64;
import model.Account;


/**
 *
 * @author 84777
 */
@WebServlet(name = "AddUser", urlPatterns = {"/addUser"})
public class AddUser extends HttpServlet {

    /**
     * Processes sessions for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param session servlet session
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addUserList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy session của người dùng hiện tại
        HttpSession session = request.getSession();

        AccountDAO accountDAO = new AccountDAO();

        // Lấy dữ liệu từ form
        String avatar = request.getParameter("avatar").trim();
        String firstname = request.getParameter("firstName").trim();
        String lastname = request.getParameter("lastName").trim();
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String role_raw = request.getParameter("role");
        String gender_raw = request.getParameter("gender");
        String userName = request.getParameter("userName").trim();
        String email = request.getParameter("email").trim();
        String mobile = request.getParameter("mobile").trim();

        // Chuyển đổi role và gender sang kiểu int
        int role = Integer.parseInt(role_raw);
        int gender = Integer.parseInt(gender_raw);

        // Biến cờ để kiểm tra hợp lệ
        boolean flag = true;

        // Kiểm tra các giá trị đầu vào
        if (avatar == null || avatar.isBlank() || avatar.isEmpty()) {
            avatar = "avatar-trang-4.jpg";
            session.setAttribute("avatar", "avatar-trang-4.jpg");
        }

        if (password.isEmpty()) {
            session.setAttribute("msg_password", "Nhập mật khẩu");
            flag = false;
        }

        if (!accountDAO.isValidPassword(password)) {
            session.setAttribute("msg_password_ex", "Mật khẩu phải từ 8-30 ký tự, gồm ít nhất 1 chữ hoa, 1 chữ thường, 1 ký tự đặc biệt và 1 số");
            flag = false;
        }

        if (role == -1) {
            session.setAttribute("msg_role", "Chọn vai trò");
            flag = false;
        }

        if (!isValidUsername(userName)) {
            session.setAttribute("msg_username", "Username phải từ 3-30 ký tự");
            flag = false;
        }

        if (!isGmail(email)) {
            session.setAttribute("msg_gmail", "Gmail không hợp lệ");
            flag = false;
        }

        if (!accountDAO.isValidMobile(mobile)) {
            session.setAttribute("msg_phone", "Số điện thoại không hợp lệ");
            flag = false;
        }

        if (accountDAO.getAccountByEmail(email) != null) {
            session.setAttribute("msg_gmail_ex", "Gmail đã tồn tại");
            flag = false;
        }

        if (accountDAO.getAccountByUserName(userName) != null) {
            session.setAttribute("msg_username_ex", "Tài khoản đã tồn tại");
            flag = false;
        }

        if (accountDAO.getAccountByPhone(mobile) != null) {
            session.setAttribute("msg_phone_ex", "Số điện thoại đã tồn tại");
            flag = false;
        }

        if (firstname.isBlank()) {
            session.setAttribute("msg_firstname", "Tên đầu không được để trống");
            flag = false;
        }

        if (lastname.isBlank()) {
            session.setAttribute("msg_lastname", "Tên sau không được để trống");
            flag = false;
        }

        // Nếu các thông tin hợp lệ
        if (flag) {
            session.setAttribute("msg_suc", "Thêm người dùng thành công");
           
            // Tạo đối tượng Account
            Account account = new Account(userName, password, firstname, lastname, gender, email, mobile, address, role, avatar);
            
            // Thêm người dùng vào cơ sở dữ liệu
            accountDAO.insertAccount(account);

            // Đặt thông tin người dùng mới trong session và điều hướng đến trang danh sách người dùng
            
            request.getRequestDispatcher("userlist").forward(request, response);
            return;
        }

        // Nếu có lỗi, quay lại trang thêm người dùng với thông báo lỗi
        session.setAttribute("msg_err", "Thêm người dùng thất bại");
        request.getRequestDispatcher("addUserList.jsp").forward(request, response);
    }


    private static boolean isValidUsername(String input) {
        String regex = "^(?=.*[a-zA-Z])[a-zA-Z0-9]{3,30}$";
        return input.matches(regex);
    }

    public static boolean isGmail(String input) {
        return input.matches("^[a-zA-Z][a-zA-Z0-9._%+-]*[a-zA-Z0-9]@[a-zA-Z0-9]{2,}(\\.[a-zA-Z0-9]{2,})+$");
    }

    public static boolean isPhoneNum(String input) {
        return input.matches("\\d{10,11}");
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
