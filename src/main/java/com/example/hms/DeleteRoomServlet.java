package com.example.hms;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "deleteroom", value = "/deleteroom")
public class DeleteRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int roomId = Integer.parseInt(request.getParameter("room_id"));

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBHandler.getConnection();


            String sql = "DELETE FROM room WHERE room_id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, roomId);

            int deletedRows = stmt.executeUpdate();

            if(deletedRows > 0) {

                response.sendRedirect("showrooms.jsp");
            } else {

                request.setAttribute("errorMessage", "Failed to delete the room.");
                request.getRequestDispatcher("showrooms.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("showrooms.jsp").forward(request, response);
        } finally {
            try {
                if(stmt != null) stmt.close();
            } catch(Exception ex) { }

            DBHandler.closeConnection(conn);
        }
    }
}