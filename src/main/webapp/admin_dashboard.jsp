<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.Map, com.google.gson.Gson, java.util.LinkedHashMap" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard | Golden Fitness Gym</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body class="bg-gray-50 min-h-screen flex">
  <jsp:include page="Sidebar.jsp" />

  <div class="flex-1 flex flex-col">

    <!-- Navbar -->
    <header class="bg-white shadow-md h-16 flex items-center justify-between px-8">
      <h2 class="text-xl font-semibold text-emerald-700">
        <i class="fa-solid fa-gauge mr-2"></i> Admin Dashboard
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

    <!-- Main Content -->
    <main class="flex-grow p-8 bg-gray-50 overflow-y-auto">

      <!-- Summary Cards -->
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-10">
        <div class="bg-white rounded-xl shadow-md p-6 flex flex-col items-center border hover:shadow-lg transition">
          <i class="fa-solid fa-users text-emerald-500 text-4xl mb-3"></i>
          <h3 class="text-lg font-semibold text-gray-700">Total Members</h3>
          <p class="text-3xl font-bold text-emerald-600 mt-2"><%= request.getAttribute("totalMembers") %></p>
        </div>

        <a href="FetchTrainerServlet" class="block">
          <div class="bg-white rounded-xl shadow-md p-6 flex flex-col items-center border hover:bg-emerald-50 transition">
            <i class="fa-solid fa-user-tie text-emerald-500 text-4xl mb-3"></i>
            <h3 class="text-lg font-semibold text-gray-700">Trainers</h3>
            <p class="text-3xl font-bold text-emerald-600 mt-2"><%= request.getAttribute("totalTrainers") %></p>
          </div>
        </a>

        <div class="bg-white rounded-xl shadow-md p-6 flex flex-col items-center border hover:shadow-lg transition">
          <i class="fa-solid fa-coins text-emerald-500 text-4xl mb-3"></i>
          <h3 class="text-lg font-semibold text-gray-700">Monthly Revenue</h3>
          <p class="text-3xl font-bold text-emerald-600 mt-2">₹<%= request.getAttribute("monthlyRevenue") %></p>
        </div>

        <a href="FetchEquipment" class="block">
          <div class="bg-white rounded-xl shadow-md p-6 flex flex-col items-center border hover:bg-emerald-50 transition">
            <i class="fa-solid fa-dumbbell text-emerald-500 text-4xl mb-3"></i>
            <h3 class="text-lg font-semibold text-gray-700">Gym Equipment</h3>
            <p class="text-3xl font-bold text-emerald-600 mt-2"><%= request.getAttribute("totalEquipment") %></p>
          </div>
        </a>
      </div>

      <%
        Map<String, Double> revenueMap = (Map<String, Double>) request.getAttribute("revenueByPlan");
        if (revenueMap == null) revenueMap = new LinkedHashMap<>();
        String revenueJson = new Gson().toJson(revenueMap);
      %>

      <!-- Charts Section -->
      <div class="bg-white rounded-xl shadow-lg p-8 max-w-5xl mx-auto border">
        <h2 class="text-2xl font-bold text-emerald-600 mb-6 text-center">
          <i class="fa-solid fa-chart-simple mr-2"></i> Revenue Insights
        </h2>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">

          <!-- Pie Chart -->
          <div class="flex flex-col items-center">
            <h3 class="text-lg font-semibold mb-3 text-gray-700">Revenue by Plan</h3>
            <div class="w-[260px] h-[260px]">
              <canvas id="revenuePieChart"></canvas>
            </div>
          </div>

          <!-- Bar Chart -->
          <div class="flex flex-col items-center">
            <h3 class="text-lg font-semibold mb-3 text-gray-700">Revenue Comparison</h3>
            <div class="w-full h-80">
              <canvas id="revenueBarChart"></canvas>
            </div>
          </div>

        </div>
      </div>

      <script>
        const revenueData = <%= revenueJson %>;
        const labels = Object.keys(revenueData);
        const values = Object.values(revenueData);

        // Pie Chart (Doughnut)
        const ctxPie = document.getElementById('revenuePieChart').getContext('2d');
        new Chart(ctxPie, {
          type: 'doughnut',
          data: {
            labels: labels,
            datasets: [{
              data: values,
              backgroundColor: ['#34d399', '#60a5fa', '#fbbf24', '#f87171', '#a78bfa'],
              hoverOffset: 6
            }]
          },
          options: {
            plugins: {
              legend: { position: 'bottom' }
            },
            maintainAspectRatio: false
          }
        });

        // Bar Chart
        const ctxBar = document.getElementById('revenueBarChart').getContext('2d');
        new Chart(ctxBar, {
          type: 'bar',
          data: {
            labels: labels,
            datasets: [{
              label: 'Revenue (₹)',
              data: values,
              backgroundColor: '#34d399'
            }]
          },
          options: {
            scales: {
              y: { beginAtZero: true }
            },
            plugins: {
              legend: { display: false }
            },
            maintainAspectRatio: false
          }
        });
      </script>

    </main>
  </div>
</body>
</html>
