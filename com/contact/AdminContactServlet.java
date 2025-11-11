package com.contact;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/contactMessages")
public class AdminContactServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        List<Map<String, Object>> contacts = new ArrayList<>();
        String search = request.getParameter("search");

        System.out.println("Search query received: " + search); 

        try (Connection conn = DBConnection.getConnection()) {
            String query;
            PreparedStatement pstmt;

            if (search != null && !search.trim().isEmpty()) {
                query = "SELECT * FROM contact_messages WHERE name LIKE ? OR email LIKE ? OR subject LIKE ? ORDER BY date_sent DESC";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, "%" + search + "%");
                pstmt.setString(2, "%" + search + "%");
                pstmt.setString(3, "%" + search + "%");
            } else {
                query = "SELECT * FROM contact_messages ORDER BY date_sent DESC";
                pstmt = conn.prepareStatement(query);
            }

            ResultSet rs = pstmt.executeQuery();
            processResultSet(rs, contacts);

            request.setAttribute("contacts", contacts);
            request.getRequestDispatcher("/admin/admin_contact_list.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private void processResultSet(ResultSet rs, List<Map<String, Object>> contacts) throws SQLException {
        while (rs.next()) {
            Map<String, Object> contact = new HashMap<>();
            contact.put("id", rs.getInt("id"));
            contact.put("name", rs.getString("name"));
            contact.put("email", rs.getString("email"));
            contact.put("subject", rs.getString("subject"));
            contact.put("message", rs.getString("message"));
            contact.put("dateSent", rs.getTimestamp("date_sent"));
            contacts.add(contact);
        }
    }
}
