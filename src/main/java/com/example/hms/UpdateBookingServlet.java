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

@WebServlet(name = "updatebook", value = "/updatebook")
public class UpdateBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        String status = request.getParameter("status");
        java.sql.Date checkIn = java.sql.Date.valueOf(request.getParameter("check_in"));
        java.sql.Date checkOut = java.sql.Date.valueOf(request.getParameter("check_out"));

        try (Connection conn = DBHandler.getConnection()) {
            String query = "UPDATE booking SET status = ?, check_in = ?, check_out = ? WHERE booking_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, status);
            ps.setDate(2, checkIn);
            ps.setDate(3, checkOut);
            ps.setInt(4, bookingId);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("managebooking.jsp");
            } else {
                response.sendRedirect("errorPage.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }
}
