<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbConnection.DBConnection" %>

<%
    // Require login
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("../user_login.jsp");
        return;
    }

    String name = "", email = "", mobile = "", city = "";

    try (Connection con = DBConnection.getConnection()) {
        // Get the most recent profile info from memberships
        String sql = "SELECT name, email, mobile, city FROM memberships WHERE username=? ORDER BY date DESC LIMIT 1";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name   = rs.getString("name");
            email  = rs.getString("email");
            mobile = rs.getString("mobile");
            city   = rs.getString("city");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Profile - Golden Fitness</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 min-h-screen text-gray-100">

  <!-- Header -->
  <header class="bg-gray-800 shadow-lg p-4">
    <div class="max-w-4xl mx-auto flex justify-between items-center">
      <h1 class="text-2xl font-bold text-green-400">Edit Profile</h1>
     <a href="<%=request.getContextPath()%>/profile.jsp"    class="text-gray-300 hover:text-green-400 text-sm">← Back to Profile</a>
    </div>
  </header>

  <!-- Content -->
  <main class="max-w-4xl mx-auto mt-8 p-8 bg-gray-800 border border-green-600/20 rounded-2xl shadow-lg">
    <% if ("1".equals(request.getParameter("updated"))) { %>
      <div class="mb-6 rounded-md bg-green-100 text-green-800 px-4 py-3">✅ Profile updated successfully.</div>
    <% } else if ("1".equals(request.getParameter("error"))) { %>
      <div class="mb-6 rounded-md bg-red-100 text-red-800 px-4 py-3">❌ Update failed. Please try again.</div>
    <% } %>

    <form action="<%=request.getContextPath()%>/UpdateProfileServlet" method="post" class="space-y-6">
      <input type="hidden" name="username" value="<%= username %>">

      <div>
        <label class="block text-sm font-semibold mb-1">Full Name</label>
        <input type="text" name="name" value="<%= name %>" required
               class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring focus:ring-green-500">
      </div>

      <div>
        <label class="block text-sm font-semibold mb-1">Email</label>
        <input type="email" name="email" value="<%= email %>" required
               class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring focus:ring-green-500">
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-semibold mb-1">Mobile</label>
          <input type="text" name="mobile" value="<%= mobile %>" required
                 pattern="[6-9]\d{9}" 
                 title="Enter a valid 10-digit Indian mobile number starting with 6, 7, 8, or 9"
                 class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring focus:ring-green-500">
        </div>
        <div>
          <label class="block text-sm font-semibold mb-1">City</label>
          <input type="text" name="city" value="<%= city %>" required
                 class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg focus:outline-none focus:ring focus:ring-green-500">
        </div>
      </div>

      <button type="submit"
              class="w-full mt-2 py-3 bg-green-600 hover:bg-green-700 rounded-lg text-white font-semibold transition">
        💾 Save Changes
      </button>
    </form>
  </main>
</body>
</html>
