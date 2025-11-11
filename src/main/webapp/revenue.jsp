<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Revenue Management</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-50 min-h-screen flex">

  <!-- ✅ Sidebar -->
  <jsp:include page="Sidebar.jsp" />

  <!-- 🌿 Main Content Area -->
  <div class="flex-1 flex flex-col min-h-screen">

     <!-- Navbar -->
    <header class="bg-white shadow-md h-16 flex items-center justify-between px-8">
      <h2 class="text-xl font-semibold text-emerald-700">
        <i class="fa-solid fa-gauge mr-2"></i> Revenue Dashboard
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
   
    <!-- ✅ Page Content -->
    <main class="flex-1 p-8">

      <!-- 💰 Revenue Overview -->
      <div class="bg-white shadow-lg rounded-2xl p-6 border border-gray-100 max-w-6xl mx-auto">
        <h2 class="text-2xl font-bold text-emerald-600 mb-6 text-center">
          <i class="fa-solid fa-sack-dollar mr-2"></i> Revenue Overview
        </h2>

        <!-- ✅ Summary Cards -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
          <div class="bg-emerald-100 p-6 rounded-xl shadow-sm border border-emerald-200 text-center">
            <i class="fa-solid fa-wallet text-3xl text-emerald-600 mb-2"></i>
            <h3 class="text-lg font-semibold text-gray-700">Total Revenue</h3>
            <p class="text-2xl font-bold text-emerald-700 mt-1">
              ₹<%= request.getAttribute("totalRevenue") %>
            </p>
          </div>

          <div class="bg-emerald-100 p-6 rounded-xl shadow-sm border border-emerald-200 text-center">
            <i class="fa-solid fa-calendar text-3xl text-emerald-600 mb-2"></i>
            <h3 class="text-lg font-semibold text-gray-700">This Month</h3>
            <p class="text-2xl font-bold text-emerald-700 mt-1">
              ₹<%= request.getAttribute("monthlyRevenue") %>
            </p>
          </div>

          <div class="bg-emerald-100 p-6 rounded-xl shadow-sm border border-emerald-200 text-center">
            <i class="fa-solid fa-users text-3xl text-emerald-600 mb-2"></i>
            <h3 class="text-lg font-semibold text-gray-700">Active Members</h3>
            <p class="text-2xl font-bold text-emerald-700 mt-1">
              <%= request.getAttribute("activeMembers") %>
            </p>
          </div>
        </div>

        <!-- ✅ Revenue Table -->
        <div class="overflow-x-auto">
          <table class="w-full border border-gray-200 text-center rounded-lg overflow-hidden">
            <thead class="bg-emerald-600 text-white">
              <tr>
                <th class="py-3 px-4">Member ID</th>
                <th class="py-3 px-4">Member Name</th>
                <th class="py-3 px-4">Plan</th>
                <th class="py-3 px-4">Amount (₹)</th>
                <th class="py-3 px-4">Start Date</th>
                <th class="py-3 px-4">End Date</th>
                <th class="py-3 px-4">Status</th>
              </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-100">
              <%
                List<String[]> revenueList = (List<String[]>) request.getAttribute("revenueList");
                if (revenueList != null && !revenueList.isEmpty()) {
                  for (String[] r : revenueList) {
                    String status = r[6];
                    String badgeColor = status.equals("Active") ? "bg-green-200 text-green-700" : "bg-red-200 text-red-700";
                    String icon = status.equals("Active") ? "fa-check-circle" : "fa-xmark-circle";
              %>
              <tr class="hover:bg-emerald-50 transition">
                <td class="py-3 font-semibold text-gray-700"><%= r[0] %></td>
                <td><%= r[1] %></td>
                <td><%= r[2] %></td>
                <td class="text-emerald-700 font-semibold">₹<%= r[3] %></td>
                <td><%= r[4] %></td>
                <td><%= r[5] %></td>
                <td>
                  <span class="px-3 py-1 rounded-full text-sm font-medium <%= badgeColor %>">
                    <i class="fa-solid <%= icon %> mr-1"></i> <%= status %>
                  </span>
                </td>
              </tr>
              <% } } else { %>
              <tr>
                <td colspan="7" class="py-4 text-gray-500">No revenue records found.</td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>

      </div>

    </main>
  </div>

</body>
</html>
