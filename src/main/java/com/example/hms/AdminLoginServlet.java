package com.example.hms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminLoginServlet", value = "/AdminLoginServlet")

public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminLoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        if ("admin".equals(username) && "admin".equals(password)) {
            // If correct, redirect to add.jsp
            response.sendRedirect("add.jsp");
        } else {

            request.setAttribute("errorMessage", "Invalid login credentials.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
