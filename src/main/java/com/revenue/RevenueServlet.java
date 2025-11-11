package com.revenue;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dbConnection.DBConnection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RevenueDashboard")
public class RevenueServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection con = DBConnection.getConnection()) {

            
            PreparedStatement psTotal = con.prepareStatement("SELECT COALESCE(SUM(price), 0) AS total FROM memberships");
            ResultSet rsTotal = psTotal.executeQuery();
            rsTotal.next();
            double totalRevenue = rsTotal.getDouble("total");

          
            PreparedStatement psMonthly = con.prepareStatement(
                    "SELECT COALESCE(SUM(price), 0) AS monthly FROM memberships " +
                            "WHERE MONTH(date) = MONTH(CURDATE()) AND YEAR(date) = YEAR(CURDATE())");
            ResultSet rsMonthly = psMonthly.executeQuery();
            rsMonthly.next();
            double monthlyRevenue = rsMonthly.getDouble("monthly");


            PreparedStatement psMembers = con.prepareStatement(
                    "SELECT COUNT(*) AS cnt FROM memberships WHERE end_date >= NOW()");
            ResultSet rsMembers = psMembers.executeQuery();
            rsMembers.next();
            int activeMembers = rsMembers.getInt("cnt");

           
            PreparedStatement psDetails = con.prepareStatement(
                    "SELECT id, name, plan, price, date, end_date, " +
                            "CASE WHEN end_date >= NOW() THEN 'Active' ELSE 'Expired' END AS status " +
                            "FROM memberships ORDER BY date ASC");
            ResultSet rsDetails = psDetails.executeQuery();

            List<String[]> revenueList = new ArrayList<>();
            while (rsDetails.next()) {
                revenueList.add(new String[]{
                        rsDetails.getString("id"),
                        (rsDetails.getString("name") != null && !rsDetails.getString("name").isBlank())
                                ? rsDetails.getString("name") : "N/A",
                        rsDetails.getString("plan"),
                        rsDetails.getString("price"),
                        rsDetails.getString("date"),
                        rsDetails.getString("end_date"),
                        rsDetails.getString("status") 
                });
            }

           
            System.out.println("Total Revenue: " + totalRevenue);
            System.out.println("Monthly Revenue: " + monthlyRevenue);
            System.out.println("Active Members: " + activeMembers);
            System.out.println("Revenue Records Found: " + revenueList.size());

        
            request.setAttribute("totalRevenue", totalRevenue);
            request.setAttribute("monthlyRevenue", monthlyRevenue);
            request.setAttribute("activeMembers", activeMembers);
            request.setAttribute("revenueList", revenueList);

        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("revenue.jsp");
        rd.forward(request, response);
    }
}
