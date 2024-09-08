package com.example.hms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


@WebServlet(name = "BookRoomHandlerServlet", value = "/BookRoomHandlerServlet")

public class BookRoomHandlerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName = request.getParameter("guest_name");
        int roomId = Integer.parseInt(request.getParameter("room_id"));
        String checkInDate = request.getParameter("check_in");
        String checkOutDate = request.getParameter("check_out");


        int userId = getLoggedInUserId(request);

        String insertBookingQuery = "INSERT INTO booking (user_id, room_id, check_in, check_out, status) VALUES (?, ?, ?, ?, 'pending')";

        try (Connection conn = DBHandler.getConnection();
             PreparedStatement ps = conn.prepareStatement(insertBookingQuery)) {

            ps.setInt(1, userId);
            ps.setInt(2, roomId);
            ps.setString(3, checkInDate);
            ps.setString(4, checkOutDate);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {




                String updateRoomAvailabilityQuery = "UPDATE room SET is_available = 0 WHERE room_id  = ?";

                try (PreparedStatement psRoom = conn.prepareStatement(updateRoomAvailabilityQuery)) {
                    psRoom.setInt(1, roomId);
                    psRoom.executeUpdate();
                } catch(Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("bookingError.jsp");
                    return;
                }









                response.sendRedirect("bookingSuccess.jsp");
            } else {

                response.sendRedirect("bookingError.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookingError.jsp");
        }
    }


    private int getLoggedInUserId(HttpServletRequest request) {
        return 1;
    }
}
