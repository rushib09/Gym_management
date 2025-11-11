package com.trainers;

import java.io.*;
import java.nio.file.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import com.dbConnection.DBConnection;

@WebServlet("/UpdateTrainer")
@MultipartConfig
public class UpdateTrainerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        int experience = Integer.parseInt(request.getParameter("experience"));
        String contact = request.getParameter("contact");

        Part imagePart = request.getPart("image");
        String fileName = imagePart != null ? Paths.get(imagePart.getSubmittedFileName()).getFileName().toString() : null;

        try (Connection con = DBConnection.getConnection()) {
            
          
            if (fileName != null && !fileName.isEmpty()) {
              
                String uploadDir = getServletContext().getRealPath("") + "trainer_images";
                File uploadPath = new File(uploadDir);
                if (!uploadPath.exists()) uploadPath.mkdir();

                String filePath = uploadDir + File.separator + fileName;
                imagePart.write(filePath);

                
                String sql = "UPDATE trainer SET trainer_name=?, specialization=?, experience=?, contact=?, image=? WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, specialization);
                ps.setInt(3, experience);
                ps.setString(4, contact);
                ps.setString(5, "trainer_images/" + fileName);
                ps.setInt(6, id);
                ps.executeUpdate();

            } else {
                // No new image uploaded, update without changing the image column
                String sql = "UPDATE trainer SET trainer_name=?, specialization=?, experience=?, contact=? WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, specialization);
                ps.setInt(3, experience);
                ps.setString(4, contact);
                ps.setInt(5, id);
                ps.executeUpdate();
            }

            response.sendRedirect("FetchTrainer");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error updating trainer: " + e.getMessage());
        }
    }
}
