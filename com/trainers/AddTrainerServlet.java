package com.trainers;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import com.dbConnection.DBConnection;

@WebServlet("/AddTrainer")
@MultipartConfig
public class AddTrainerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String specialization = request.getParameter("specialization");
            int experience = Integer.parseInt(request.getParameter("experience"));
            String contact = request.getParameter("contact");

           
            Part imagePart = request.getPart("image");
            String fileName = imagePart.getSubmittedFileName();
            String uploadPath = request.getServletContext().getRealPath("") + "images" + File.separator + fileName;

            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = imagePart.getInputStream();
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
            
           
            String imagePath = "images/" + fileName;

           
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO trainer (id, trainer_name, specialization, experience, contact, image) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, specialization);
            ps.setInt(4, experience);
            ps.setString(5, contact);
            ps.setString(6, imagePath);
            ps.executeUpdate();

            response.sendRedirect("FetchTrainer");

        } catch (SQLIntegrityConstraintViolationException e) {
            response.getWriter().println("❌ Duplicate ID or Contact not allowed!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
