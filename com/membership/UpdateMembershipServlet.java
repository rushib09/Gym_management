package com.membership;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateMembershipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
        	
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String city = request.getParameter("city");
            String plan = request.getParameter("plan");
            String price = request.getParameter("price");

            // Update query
            Connection con = DBConnection.getConnection();
            String query = "UPDATE memberships SET username=?, name=?, email=?, mobile=?, city=?, plan=?, price=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, city);
            ps.setString(6, plan);
            ps.setString(7, price);
            ps.setInt(8, id);

            ps.executeUpdate();
            con.close();

          
            response.sendRedirect("ViewMemberships");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
