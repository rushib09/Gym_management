<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Settings</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body class="bg-gray-50 min-h-screen flex">

  <!-- ✅ Sidebar -->
  <jsp:include page="Sidebar.jsp" />

  <!-- 🌿 Main Content -->
  <div class="flex-1 flex flex-col min-h-screen">

   <!-- Navbar -->
    <header class="bg-white shadow-md h-16 flex items-center justify-between px-8">
      <h2 class="text-xl font-semibold text-emerald-700">
        <i class="fa-solid fa-gauge mr-2"></i> Setting Dashboard
      </h2>

      <div class="flex items-center space-x-4">
        <%
          String adminName = (String) session.getAttribute("adminUsername");
          if (adminName == null) {
              response.sendRedirect("admin_login.jsp");
              return;
          }
        %>
        <span class="text-gray-600">
          Welcome, <strong class="text-emerald-600"><%= adminName %></strong>
        </span>
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
             alt="Admin" class="w-10 h-10 rounded-full border border-emerald-500">
      </div>
    </header>

    <!-- ✅ Settings Form -->
    <main class="flex-1 p-8">
      <div class="bg-white shadow-lg rounded-2xl p-6 border border-gray-100 max-w-3xl mx-auto">
        <h2 class="text-2xl font-bold text-emerald-600 mb-6 text-center">
          ⚙️ Update Admin Credentials
        </h2>

        <!-- ✅ Feedback Messages -->
        <%
          String success = request.getParameter("success");
          String error = request.getParameter("error");

          if ("1".equals(success)) {
        %>
          <div class="bg-green-100 text-green-800 p-3 mb-4 rounded-md text-center">✅ Settings updated successfully!</div>
        <% } else if ("wrongOldUsername".equals(error)) { %>
          <div class="bg-red-100 text-red-800 p-3 mb-4 rounded-md text-center">❌ Incorrect old username!</div>
        <% } else if ("wrongOldPassword".equals(error)) { %>
          <div class="bg-red-100 text-red-800 p-3 mb-4 rounded-md text-center">❌ Incorrect old password!</div>
        <% } else if ("nomatchPassword".equals(error)) { %>
          <div class="bg-red-100 text-red-800 p-3 mb-4 rounded-md text-center">❌ New passwords do not match!</div>
        <% } else if ("1".equals(error)) { %>
          <div class="bg-red-100 text-red-800 p-3 mb-4 rounded-md text-center">❌ Update failed. Please try again.</div>
        <% } %>

        <form action="UpdateAdmin" method="post" class="space-y-5">

          <div>
            <label class="block text-gray-700 font-semibold mb-1">Old Username (Email)</label>
            <input type="email" name="oldUsername" placeholder="Enter old email"
                   class="w-full border px-4 py-2 rounded-lg focus:ring-2 focus:ring-emerald-400" required>
          </div>

          <div>
            <label class="block text-gray-700 font-semibold mb-1">New Username (Email)</label>
            <input type="email" name="newUsername" placeholder="Enter new email"
                   class="w-full border px-4 py-2 rounded-lg focus:ring-2 focus:ring-emerald-400" required>
          </div>

          <div>
            <label class="block text-gray-700 font-semibold mb-1">Old Password</label>
            <input type="password" name="oldPassword" placeholder="Enter old password"
                   class="w-full border px-4 py-2 rounded-lg focus:ring-2 focus:ring-emerald-400" required>
          </div>

          <div>
            <label class="block text-gray-700 font-semibold mb-1">New Password</label>
            <input type="password" name="newPassword" placeholder="Enter new password"
                   class="w-full border px-4 py-2 rounded-lg focus:ring-2 focus:ring-emerald-400" required>
          </div>

          <div>
            <label class="block text-gray-700 font-semibold mb-1">Confirm New Password</label>
            <input type="password" name="confirmPassword" placeholder="Re-enter new password"
                   class="w-full border px-4 py-2 rounded-lg focus:ring-2 focus:ring-emerald-400" required>
          </div>

          <button class="bg-emerald-600 text-white px-6 py-2 rounded-lg hover:bg-emerald-700 transition w-full">
            <i class="fa-solid fa-save mr-1"></i> Save Changes
          </button>
        </form>
      </div>
    </main>
  </div>

</body>
</html>
