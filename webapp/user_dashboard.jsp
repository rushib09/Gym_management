<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("user_login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>

<body class="bg-gray-900 text-gray-100 min-h-screen flex flex-col">

<!-- ✅ Navbar -->
<nav class="bg-green-700 shadow-lg">
  <div class="container mx-auto flex justify-between items-center py-4 px-6">
    <h1 class="text-white text-2xl font-extrabold tracking-wide flex items-center">
      <i class="fa-solid fa-dumbbell text-green-300 mr-2"></i> Golden Fitness Gym
    </h1>

    <div class="flex items-center space-x-4">
      <span class="text-gray-200">👋 Welcome, <span class="font-semibold text-white"><%= username %></span></span>
      <a href="index.jsp" class="bg-green-500 hover:bg-green-600 text-white font-semibold px-3 py-1 rounded-md transition">Logout</a>
    </div>
  </div>
</nav>

<!-- ✅ Dashboard -->
<div class="flex-grow container mx-auto mt-10 px-6">
  <h2 class="text-center text-3xl font-bold text-green-400 mb-10">User Dashboard</h2>

  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">

    <!-- Card 1 -->
    <div class="bg-gray-800 p-6 rounded-2xl shadow-md text-center hover:scale-105 hover:shadow-green-700 transition transform">
      <i class="fa-solid fa-user fa-3x text-green-400 mb-4"></i>
      <h3 class="text-lg font-bold mb-2 text-white">My Profile</h3>
      <p class="text-gray-400 mb-4">View and update your personal details.</p>
      <a href="#" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">View</a>
    </div>

    <!-- Card 2 -->
    <div class="bg-gray-800 p-6 rounded-2xl shadow-md text-center hover:scale-105 hover:shadow-green-700 transition transform">
      <i class="fa-solid fa-calendar-check fa-3x text-green-400 mb-4"></i>
      <h3 class="text-lg font-bold mb-2 text-white">Book Training Slot</h3>
      <p class="text-gray-400 mb-4">Reserve your preferred workout time.</p>
      <a href="#" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">Book Now</a>
    </div>

    <!-- Card 3 -->
    <div class="bg-gray-800 p-6 rounded-2xl shadow-md text-center hover:scale-105 hover:shadow-green-700 transition transform">
      <i class="fa-solid fa-dumbbell fa-3x text-green-400 mb-4"></i>
      <h3 class="text-lg font-bold mb-2 text-white">Gym Equipment</h3>
      <p class="text-gray-400 mb-4">Explore the available fitness equipment.</p>
      <a href="AddEquipment.jsp" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">View</a>
    </div>

    <!-- Card 4 -->
    <div class="bg-gray-800 p-6 rounded-2xl shadow-md text-center hover:scale-105 hover:shadow-green-700 transition transform">
      <i class="fa-solid fa-user-tie fa-3x text-green-400 mb-4"></i>
      <h3 class="text-lg font-bold mb-2 text-white">Trainers</h3>
      <p class="text-gray-400 mb-4">Meet our professional trainers.</p>
      <a href="#" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">Explore</a>
    </div>

    <!-- Card 5 -->
    <div class="bg-gray-800 p-6 rounded-2xl shadow-md text-center hover:scale-105 hover:shadow-green-700 transition transform">
      <i class="fa-solid fa-comments fa-3x text-green-400 mb-4"></i>
      <h3 class="text-lg font-bold mb-2 text-white">Feedback</h3>
      <p class="text-gray-400 mb-4">Share your experience with us.</p>
      <a href="#" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">Give Feedback</a>
    </div>

    <!-- Card 6 -->
    <div class="bg-gray-800 p-6 rounded-2xl shadow-md text-center hover:scale-105 hover:shadow-green-700 transition transform">
      <i class="fa-solid fa-id-card fa-3x text-green-400 mb-4"></i>
      <h3 class="text-lg font-bold mb-2 text-white">Membership</h3>
      <p class="text-gray-400 mb-4">Check your plan and renewal date.</p>
      <a href="#" class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition">View Details</a>
    </div>

  </div>
</div>

<!-- ✅ Footer -->
<footer class="bg-gray-950 text-gray-400 text-center py-4 mt-12 border-t border-green-700">
  <p>&copy; 2025 Golden Fitness Gym. All Rights Reserved.</p>
</footer>

</body>
</html>
