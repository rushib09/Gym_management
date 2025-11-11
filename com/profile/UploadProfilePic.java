package com.profile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.dbConnection.DBConnection;

@WebServlet("/UploadProfilePic1")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
public class UploadProfilePic extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        Part filePart = request.getPart("profilePic");

        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect(request.getContextPath() + "/profile.jsp?error=nofile");
            return;
        }

        String submittedFileName = filePart.getSubmittedFileName();
        if (!submittedFileName.matches(".*\\.(jpg|jpeg|png|gif)$")) {
            response.sendRedirect(request.getContextPath() + "/profile.jsp?error=invalidtype");
            return;
        }

        String fileName = username + "_" + submittedFileName.replaceAll(" ", "_");
        String uploadPath = request.getServletContext().getRealPath("") + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        filePart.write(uploadPath + File.separator + fileName);

        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE memberships SET profile_pic = ? WHERE username=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, fileName);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/profile.jsp?error=dbupdatefail");
            return;
        }

        response.sendRedirect(request.getContextPath() + "/profile.jsp?update=success");
    }
}
