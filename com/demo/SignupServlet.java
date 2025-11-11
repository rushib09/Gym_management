package com.demo;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
         
            Class.forName("com.mysql.cj.jdbc.Driver");

            
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/gym_management", "root", "root");

            PreparedStatement checkUser = con.prepareStatement("SELECT username FROM userinfo WHERE username=?");
            checkUser.setString(1, username);
            ResultSet rs = checkUser.executeQuery();

            if (rs.next()) {
                out.println("<script>alert('Username already exists! Try another one.'); window.location='index.jsp';</script>");
            } else {
               
                PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO userinfo (name, username, email, password) VALUES (?, ?, ?, ?)");

                ps.setString(1, name);
                ps.setString(2, username);
                ps.setString(3, email);
                ps.setString(4, password);

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("user_login.jsp");
                } else {
                    out.println("<script>alert('Signup failed. Try again.'); window.location='index.jsp';</script>");
                }

                ps.close();
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
