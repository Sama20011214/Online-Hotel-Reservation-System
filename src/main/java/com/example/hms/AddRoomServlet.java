package com.example.hms;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet(name = "AddRoomServlet", value = "/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomType = request.getParameter("room_type");
        String priceString = request.getParameter("price");
        String description = request.getParameter("description");


        BigDecimal price = new BigDecimal(priceString);

        try {

            Connection conn = DBHandler.getConnection();



            String sql = "INSERT INTO room (room_type, price, description) VALUES (?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, roomType);
            preparedStatement.setBigDecimal(2, price);
            preparedStatement.setString(3, description);
            preparedStatement.executeUpdate();


            preparedStatement.close();
            conn.close();
            request.getRequestDispatcher("add.jsp").forward(request, response);



        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}
