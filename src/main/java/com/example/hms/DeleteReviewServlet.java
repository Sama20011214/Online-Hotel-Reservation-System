package com.example.hms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "DeleteReview", value = "/DeleteReview")

public class DeleteReviewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int reviewId = Integer.parseInt(request.getParameter("review_id"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {

            conn = DBHandler.getConnection();


            String sql = "DELETE FROM review WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, reviewId);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {

                response.sendRedirect("viewreviews.jsp");
            } else {

                response.sendRedirect("deleteError.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("deleteError.jsp");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}