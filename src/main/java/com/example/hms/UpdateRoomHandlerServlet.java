package com.example.hms;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateRoomHandlerServlet", value = "/UpdateRoomHandlerServlet")
public class UpdateRoomHandlerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        int roomId = Integer.parseInt(request.getParameter("room_id"));
        String roomType = request.getParameter("room_type");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String description = request.getParameter("description");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBHandler.getConnection();

            // Update the room details
            String sql = "UPDATE room SET room_type = ?, price = ?, description = ? WHERE room_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, roomType);
            stmt.setBigDecimal(2, price);
            stmt.setString(3, description);
            stmt.setInt(4, roomId);

            int updatedRows = stmt.executeUpdate();

            if(updatedRows > 0) {
                // Successfully updated
                response.sendRedirect("showrooms.jsp"); 
            } else {
                // No rows were updated, perhaps display an error message.
                request.setAttribute("errorMessage", "Failed to update the room.");
                request.getRequestDispatcher("updateroom.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("updateroom.jsp").forward(request, response);
        } finally {
            try {
                if(stmt != null) stmt.close();
            } catch(Exception ex) { /* ignored */ }

            DBHandler.closeConnection(conn);
        }
    }
}