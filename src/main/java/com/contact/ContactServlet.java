package com.contact;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/contactForm")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO contact_messages (name, email, subject, message) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);
            ps.executeUpdate();
            
            // ✅ Redirect back with success flag
            response.sendRedirect("contact.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?error=1");
        }
    }
}
