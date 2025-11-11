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

@WebServlet ("/DeleteMembership1")
public class DeleteMembershipServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           
            int id = Integer.parseInt(request.getParameter("id"));

            Connection con = DBConnection.getConnection();
            String query = "DELETE FROM memberships WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            con.close();

            response.sendRedirect("ViewMemberships");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
