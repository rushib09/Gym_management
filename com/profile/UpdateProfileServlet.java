package com.profile;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String name     = request.getParameter("name");
        String email    = request.getParameter("email");
        String mobile   = request.getParameter("mobile");
        String city     = request.getParameter("city");

        if (username == null || name == null || email == null || mobile == null || city == null) {
            response.sendRedirect(request.getContextPath() + "/profile/EditProfile.jsp?error=1");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE memberships SET name=?, email=?, mobile=?, city=? WHERE username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, city);
            ps.setString(5, username);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/profile/EditProfile.jsp?updated=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/profile/EditProfile.jsp?error=1");
        }
    }
}
