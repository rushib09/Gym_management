package com.contact;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dbConnection.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteContact1")
 public class DeleteContactServlet extends HttpServlet {
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));

	        try (Connection conn = DBConnection.getConnection()) {
	            PreparedStatement stmt = conn.prepareStatement("DELETE FROM contact_messages WHERE id = ?");
	            stmt.setInt(1, id);
	            int rows = stmt.executeUpdate();

	            if (rows > 0) {
	                response.sendRedirect("contactMessages?deleted=1");
	            } else {
	                response.sendRedirect("contactMessages?error=1");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}