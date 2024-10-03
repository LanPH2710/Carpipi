/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author hiule
 */
@WebServlet(name = "Matkerting", urlPatterns = {"/marketing"})
public class Matkerting extends HttpServlet {
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This method is not being called in your current logic; consider removing it.
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward the request to admin.jsp when a GET request is made
        request.getRequestDispatcher("marketing.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // If you want to handle POST requests, you can call processRequest here
        // If the intention is to always redirect to admin.jsp, you can just call doGet
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "marketing servlet for managing marketing functions.";
    }

}
