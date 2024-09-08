package com.example.hms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "UpdateReviewServlet", value = "/UpdateReviewServlet")

public class UpdateReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reviewId = Integer.parseInt(request.getParameter("review_id"));
        String name = request.getParameter("name");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String review = request.getParameter("review");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBHandler.getConnection();

            String updateQuery = "UPDATE review SET name = ?, rating = ?, review = ? WHERE id = ?";
            stmt = conn.prepareStatement(updateQuery);
            stmt.setString(1, name);
            stmt.setInt(2, rating);
            stmt.setString(3, review);
            stmt.setInt(4, reviewId);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("viewreviews.jsp");
            } else {
                response.sendRedirect("reviewUpdateError.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reviewUpdateError.jsp");
        } finally {
            try {
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            } catch(SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
