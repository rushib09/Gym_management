package com.trainers;

import java.io.*;
import java.sql.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.dbConnection.DBConnection;

@WebServlet("/FetchTrainer")
public class FetchTrainerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<String[]> trainerList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM trainer";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] trainer = {
                    String.valueOf(rs.getInt("id")),
                    rs.getString("trainer_name"),
                    rs.getString("specialization"),
                    String.valueOf(rs.getInt("experience")),
                    rs.getString("contact"),
                    rs.getString("image")  // Add this for image
                };
                trainerList.add(trainer);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("trainerList", trainerList);
        RequestDispatcher rd = request.getRequestDispatcher("Trainers.jsp");
        rd.forward(request, response);
    }
}
