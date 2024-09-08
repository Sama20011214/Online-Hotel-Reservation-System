package com.example.hms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "ReviewHandlerServlet", value = "/ReviewHandlerServlet")
public class ReviewHandlerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get review details from the form
        String name = request.getParameter("name");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String reviewText = request.getParameter("review");
        HttpSession session = request.getSession();

        int userId = 1;
        userId = ((Integer) session.getAttribute("user_id"));

        try (Connection conn = DBHandler.getConnection()) {
            String sql = "INSERT INTO review (name, rating, review, userid) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setInt(2, rating);
            ps.setString(3, reviewText);
            ps.setString(4, String.valueOf(userId));
            ps.executeUpdate();

            response.sendRedirect("viewreviews.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}