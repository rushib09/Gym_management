package com.userfetch;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.dbConnection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FetchUserTrainer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        List<Map<String, String>> trainers = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM trainer";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> t = new HashMap<>();
                t.put("id", String.valueOf(rs.getInt("id")));
                t.put("name", rs.getString("trainer_name"));
                t.put("specialization", rs.getString("specialization"));
                t.put("experience", String.valueOf(rs.getInt("experience")));
                t.put("contact", rs.getString("contact"));
                t.put("image", rs.getString("image"));  
                trainers.add(t);
            }

            System.out.println("✅ Trainer count: " + trainers.size());  

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("trainers", trainers);
        request.getRequestDispatcher("user_trainers.jsp").forward(request, response);
    }
}
