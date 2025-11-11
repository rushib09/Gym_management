package com.membership;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PurchaseMembership1")
public class PurchaseMembership extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String plan = request.getParameter("plan");
        String price = request.getParameter("price");

        response.sendRedirect(request.getContextPath() + "/membership/MembershipForm.jsp?plan=" + plan + "&price=" + price);
    }
}
