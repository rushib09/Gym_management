package com.membership;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewMemberships")
public class ViewMembershipsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Object[]> data = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            String query = "SELECT id, username, name, email, mobile, city, plan, price, date, end_date, profile_pic FROM memberships ORDER BY date DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                data.add(new Object[]{
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("mobile"),
                    rs.getString("city"),
                    rs.getString("plan"),
                    rs.getString("price"),
                    rs.getString("date"),
                    rs.getString("end_date"),
                    rs.getString("profile_pic")
                });
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("data", data);
        request.getRequestDispatcher("membership/Admin_members.jsp").forward(request, response);
    }
}
