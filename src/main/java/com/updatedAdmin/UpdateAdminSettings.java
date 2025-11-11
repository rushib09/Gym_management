package com.updatedAdmin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateAdmin")
public class UpdateAdminSettings extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String oldUsername = request.getParameter("oldUsername");
        String newUsername = request.getParameter("newUsername");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        try (Connection con = DBConnection.getConnection()) {

         
            String fetchSql = "SELECT admin_username, admin_password FROM admininfo LIMIT 1";
            PreparedStatement fetchPs = con.prepareStatement(fetchSql);
            ResultSet rs = fetchPs.executeQuery();

            if (rs.next()) {
                String currentUsername = rs.getString("admin_username");
                String currentPassword = rs.getString("admin_password");

                if (!currentUsername.equals(oldUsername)) {
                    response.sendRedirect("settings.jsp?error=wrongOldUsername");
                    return;
                }

                if (!currentPassword.equals(oldPassword)) {
                    response.sendRedirect("settings.jsp?error=wrongOldPassword");
                    return;
                }
            }

            if (!newPassword.equals(confirmPassword)) {
                response.sendRedirect("settings.jsp?error=nomatchPassword");
                return;
            }

            String updateSql = "UPDATE admininfo SET admin_username=?, admin_password=?";
            PreparedStatement updatePs = con.prepareStatement(updateSql);
            updatePs.setString(1, newUsername);
            updatePs.setString(2, newPassword);

            int rows = updatePs.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("settings.jsp?success=1");
            } else {
                response.sendRedirect("settings.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("settings.jsp?error=1");
        }
    }
}
