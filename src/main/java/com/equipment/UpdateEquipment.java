package com.equipment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateEquipment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE equipment SET name=?, category=?, quantity=?, price=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, category);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setInt(5, id);
            ps.executeUpdate();

            response.sendRedirect("FetchEquipment?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("FetchEquipment?error=1");
        }
    }
}
