package com.example.hms;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/loginHandlerServlet")
public class LoginHandlerServlet extends HttpServlet implements Serializable {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Remember to hash this before comparing with the stored value.

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBHandler.getConnection();

            String checkCredentialsQuery = "SELECT * FROM user WHERE username = ?";
            stmt = conn.prepareStatement(checkCredentialsQuery);
            stmt.setString(1, username);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                if (password.equals(storedPassword)) {
                    int userId = rs.getInt("user_id");
                    // Successful login.
                    String user= rs.getString("username");

                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", userId);
                    session.setAttribute("username", user);

                    System.out.println(((Integer) session.getAttribute("user_id")));
                    response.sendRedirect("guestBookings.jsp");

                    return;
                }
            }

            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } finally {
            try {
                if(stmt != null) stmt.close();
            } catch(Exception ex) { /* ignored */ }

            DBHandler.closeConnection(conn);
        }
    }
}