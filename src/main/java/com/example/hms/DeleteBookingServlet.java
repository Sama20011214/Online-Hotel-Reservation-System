package com.example.hms;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "Deletebooking", value = "/Deletebooking")

public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int bookingId = Integer.parseInt(request.getParameter("booking_id"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBHandler.getConnection();  // Replace this with your DB connection method


            String deleteQuery = "DELETE FROM booking WHERE booking_id = ?";
            stmt = conn.prepareStatement(deleteQuery);
            stmt.setInt(1, bookingId);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {

                response.sendRedirect("managebooking.jsp");
            } else {

                request.setAttribute("errorMessage", "Error deleting booking.");
                request.getRequestDispatcher("bookingList.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("bookingList.jsp").forward(request, response);
        } finally {
            try {
                if(stmt != null) stmt.close();
            } catch(Exception ex) {  }


            DBHandler.closeConnection(conn);
        }
    }
}