package com.example.hms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegisterHandlerServlet", value = "/RegisterHandlerServlet")
public class RegisterHandlerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // Consider hashing this before storing.

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBHandler.getConnection();

            // Check if username or email already exists
            String checkQuery = "SELECT * FROM user WHERE username = ? OR email = ?";
            stmt = conn.prepareStatement(checkQuery);
            stmt.setString(1, username);
            stmt.setString(2, email);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("errorMessage", "Username or email already exists.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }


            String insertQuery = "INSERT INTO user (username, password, email) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, email);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("errorMessage", "Registration failed.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            try {
                if(stmt != null) stmt.close();
            } catch(Exception ex) { /* ignored */ }

            DBHandler.closeConnection(conn);
        }
    }
}

