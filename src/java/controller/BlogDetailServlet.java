/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BlogDAO;
import dal.BrandDAO;
import dal.CommentBlogDAO;
import dal.PostDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Blog;
import model.Brand;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.CommentBlog;

/**
 *
 * @author tuana
 */
public class BlogDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet BlogDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BlogDetailServlet at " + request.getContextPath() + "</h1>");
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
        BlogDAO bdao = new BlogDAO();
        BrandDAO brdao = new BrandDAO();
        PostDAO postdao = new PostDAO();
        CommentBlogDAO cbdao = new CommentBlogDAO();
        int blogId = Integer.parseInt(request.getParameter("blogId"));
        Blog blog = bdao.getBlogById(blogId);
        String brand = brdao.getBrandById(blog.getBrandId());
        int userId = bdao.getUserIdByPostId(blog.getPostId());
        String author = postdao.getUserFullNameById(userId);
        List<Brand> brands = brdao.getAllBrand();
        cbdao.getCommentBlogByBlogId(blogId);
        List<CommentBlog> comment = cbdao.getCommentBlogByBlogId(blogId);
        List<Account> acc = cbdao.getUserNameByBlogId(blogId);
        request.setAttribute("listacc", acc);
        request.setAttribute("comment", comment);
        request.setAttribute("author", author);
        request.setAttribute("brands", brands);
        request.setAttribute("brand", brand);
        session.setAttribute("blog", blog);
        request.getRequestDispatcher("BlogDetail.jsp").forward(request, response);
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
        Blog blog = (Blog) session.getAttribute("blog");
        int blogId = blog.getBlogId();
        CommentBlogDAO cbdao = new CommentBlogDAO();
        String commentInfor = request.getParameter("commentInfor");
        int commentRating = Integer.parseInt(request.getParameter("rating"));
        Timestamp commentDate = Timestamp.valueOf(LocalDateTime.now());
        Account user = (Account) session.getAttribute("account");
        int userId = user.getUserId();
        cbdao.creatComment(userId, blogId, commentInfor, commentDate, commentRating);
        response.sendRedirect("blogdetail?blogId=" + blogId);
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
