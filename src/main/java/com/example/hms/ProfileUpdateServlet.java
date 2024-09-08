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

@WebServlet(name = "ProfileUpdate", value = "/ProfileUpdate")

public class ProfileUpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String currentUsername = (String) request.getSession().getAttribute("username");
        String newUsername = request.getParameter("username");
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");


        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "Passwords do not match");
            request.getRequestDispatcher("/path_to_your_update_profile_page.jsp").forward(request, response);
            return;
        }

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {

            connection = DBHandler.getConnection();


            String updateProfileSQL = "UPDATE user SET username = ?, password = ? WHERE username = ?";
            preparedStatement = connection.prepareStatement(updateProfileSQL);
            preparedStatement.setString(1, newUsername);
            preparedStatement.setString(2, newPassword); // In real scenarios, consider hashing the password
            preparedStatement.setString(3, currentUsername);


            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {

                request.getSession().setAttribute("username", newUsername);
                response.sendRedirect("/update_success.jsp");
            } else {

                request.setAttribute("errorMessage", "An error occurred while updating your profile. Please try again.");
                request.getRequestDispatcher("/update_success.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error occurred. Please try again.");
            request.getRequestDispatcher("/update_success.jsp").forward(request, response);
        } finally {
            // Close resources
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            DBHandler.closeConnection(connection);
        }
    }
}
