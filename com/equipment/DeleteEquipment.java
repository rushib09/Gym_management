package com.equipment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dbConnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DeleteEquipment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM equipment WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("FetchEquipment?deleted=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("FetchEquipment?error=1");
        }
    }
}
