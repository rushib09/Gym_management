package com.membership;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Properties;

import com.dbConnection.DBConnection;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/ConfirmPaymentt")
public class ConfirmPayment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String city = request.getParameter("city");
        String plan = request.getParameter("plan");
        double price = Double.parseDouble(request.getParameter("price"));

        try {
            Connection con = DBConnection.getConnection();

            LocalDate startDate = LocalDate.now();
            LocalDate endDate;

            switch (plan) {
                case "Basic":
                    endDate = startDate.plusMonths(1);
                    break;
                case "Standard":
                    endDate = startDate.plusMonths(3);
                    break;
                case "Premium":
                default:
                    endDate = startDate.plusYears(1);
                    break;
            }

           
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            String formattedEndDate = endDate.format(formatter);

       
            String sql = "INSERT INTO memberships (username, name, email, mobile, city, plan, price, date, end_date) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, city);
            ps.setString(6, plan);
            ps.setDouble(7, price);
            ps.setDate(8, Date.valueOf(endDate));
            ps.executeUpdate();
            con.close();

            
            sendEmailReceipt(email, name, plan, price, formattedEndDate);

            response.sendRedirect(request.getContextPath() + "/membership/membership_success.jsp?plan=" + plan);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/membership/payment.jsp?error=1");
        }
    }

    private void sendEmailReceipt(String to, String name, String plan, double price, String endDate) {
        final String from = "rushibhalerao02@gmail.com";  
        final String password = "ahvrsyuzhoborxal";    

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from, "Golden Fitness Gym"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Membership Receipt - " + plan + " Plan");

            String htmlContent = "<div style='font-family: Arial, sans-serif; color: #333; padding: 20px; border-radius: 10px; background: #f9f9f9;'>"
                    + "<h2 style='text-align: center; color: #28a745;'>Golden Fitness Gym</h2>"
                    + "<p>Hello <strong>" + name + "</strong>,</p>"
                    + "<p>Thank you for joining our <strong>" + plan + "</strong> plan.</p>"
                    + "<table style='width: 100%; margin-top: 20px; border-collapse: collapse;'>"
                    + "<tr><td style='padding: 8px; border: 1px solid #ddd;'>Plan Name:</td><td style='padding: 8px; border: 1px solid #ddd;'>" + plan + "</td></tr>"
                    + "<tr><td style='padding: 8px; border: 1px solid #ddd;'>Amount Paid:</td><td style='padding: 8px; border: 1px solid #ddd;'>₹" + price + "</td></tr>"
                    + "<tr><td style='padding: 8px; border: 1px solid #ddd;'>Valid Until:</td><td style='padding: 8px; border: 1px solid #ddd;'>" + endDate + "</td></tr>"
                    + "</table>"
                    + "<p style='margin-top: 20px;'>We look forward to helping you reach your fitness goals!</p>"
                    + "<p style='margin-top: 20px;'>Warm regards,<br><strong>Golden Fitness Gym Team</strong></p>"
                    + "</div>";

            message.setContent(htmlContent, "text/html; charset=utf-8");
            Transport.send(message);

            System.out.println("✅ Email sent successfully to " + to);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
