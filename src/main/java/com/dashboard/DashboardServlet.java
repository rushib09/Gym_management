package com.dashboard;

import java.io.IOException;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;

import com.dbConnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection con = DBConnection.getConnection()) {

      
            PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM memberships");
            ResultSet rs1 = ps1.executeQuery();
            rs1.next();
            int totalMembers = rs1.getInt(1);

        
            PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM trainer");
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            int totalTrainers = rs2.getInt(1);

          
            PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM equipment");
            ResultSet rs3 = ps3.executeQuery();
            rs3.next();
            int totalEquipment = rs3.getInt(1);

            PreparedStatement ps4 = con.prepareStatement(
                "SELECT COALESCE(SUM(price), 0) FROM memberships " +
                "WHERE MONTH(date) = MONTH(CURDATE()) AND YEAR(date) = YEAR(CURDATE())");
            ResultSet rs4 = ps4.executeQuery();
            rs4.next();
            double monthlyRevenue = rs4.getDouble(1);

           
            PreparedStatement ps5 = con.prepareStatement(
                "SELECT plan, SUM(price) AS revenue FROM memberships GROUP BY plan");
            ResultSet rs5 = ps5.executeQuery();

            Map<String, Double> revenueByPlan = new HashMap<>();
            while (rs5.next()) {
                revenueByPlan.put(rs5.getString("plan"), rs5.getDouble("revenue"));
            }

         
            request.setAttribute("totalMembers", totalMembers);
            request.setAttribute("totalTrainers", totalTrainers);
            request.setAttribute("totalEquipment", totalEquipment);
            request.setAttribute("monthlyRevenue", monthlyRevenue);
            request.setAttribute("revenueByPlan", revenueByPlan);

        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("admin_dashboard.jsp");
        rd.forward(request, response);
    }
}
