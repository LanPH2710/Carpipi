package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import dal.AccountDAO;

@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");

        AccountDAO dao = new AccountDAO();

        // Validate inputs
        boolean isEmailValid = dao.isValidEmail(email);
        boolean isMobileValid = dao.isValidMobile(mobile);
        boolean isPasswordValid = dao.isValidPassword(password);
        Account existingUser = dao.checkUserNameExists(userName);
        Account existingEmail = dao.checkEmailExists(email);

        // Check for errors
        if (!isEmailValid) {
            request.setAttribute("errorMessage", "Email không hợp lệ.");
            forwardToRegisterPage(request, response);
            return;
        }

        else if (!isMobileValid) {
            request.setAttribute("errorMessage", "Số điện thoại phải có 10 số.");
            forwardToRegisterPage(request, response);
            return;
        }

        else if (existingUser != null) {
            request.setAttribute("errorMessage", "Tên đăng nhập đã tồn tại.");
            forwardToRegisterPage(request, response);
            return;
        }

        else if (!isPasswordValid) {
            request.setAttribute("errorMessage", "Mật khẩu phải có ít nhất 1 chữ cái viết hoa và 1 số.");
            forwardToRegisterPage(request, response);
            return;
        }

        else if (existingEmail != null) {
            request.setAttribute("errorMessage", "Email đã đăng ký.");
            forwardToRegisterPage(request, response);
            return;
        }

        // All validations passed, insert account
        dao.insertAccount(new Account(userName, password, firstName, lastName, gender, email, mobile, address));
        request.setAttribute("message", "Đăng ký thành công.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    private void forwardToRegisterPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Register Controller";
    }
}
