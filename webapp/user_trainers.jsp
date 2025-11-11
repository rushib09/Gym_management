<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Trainers</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" 
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" 
      crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="bg-gray-900 text-gray-100 min-h-screen">

<!-- ================= NAVBAR ================= -->
<%@ include file="navbar.jsp" %>

<div class="min-h-screen bg-gradient-to-br from-gray-900 via-gray-800 to-black px-6 py-16">
  <h1 class="text-4xl font-extrabold text-center text-green-400 mt-10 drop-shadow-lg">
    Meet Our Expert Trainers
  </h1>

  <!-- ✅ Grid: 3 cards per row -->
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-10 mt-14 max-w-6xl mx-auto">
    <%
      List<Map<String, String>> trainers = (List<Map<String, String>>) request.getAttribute("trainers");
    %>

    <% if (trainers != null && !trainers.isEmpty()) { %>
      <% for (Map<String, String> t : trainers) { %>
        <div class="bg-gray-900 rounded-2xl shadow-xl overflow-hidden border border-green-500/30 hover:border-green-400/60 hover:shadow-green-500/30 hover:shadow-2xl transition-all duration-300 transform hover:-translate-y-2 flex flex-col items-center">
          
          <!-- ✅ Dynamic Image Section -->
          <div class="relative w-full h-80 flex justify-center bg-gray-800">
            <img src="<%= t.get("image") %>" 
                 alt="<%= t.get("name") %>" 
                 class="h-full object-cover transition-transform duration-300 hover:scale-105" />
            <div class="absolute inset-0 bg-gradient-to-t from-black/50 via-transparent to-transparent"></div>
          </div>

          <div class="p-6 text-center w-full">
            <h2 class="text-2xl font-bold text-green-400 mb-1"><%= t.get("name") %></h2>
            <p class="text-gray-400 italic"><%= t.get("specialization") %> Expert</p>

            <div class="mt-4 border-t border-gray-700 pt-4">
              <p class="text-sm text-gray-300">
                <i class="fa-solid fa-briefcase text-green-400 mr-2"></i>
                <span class="font-medium">Experience:</span> <%= t.get("experience") %> years
              </p>
              <p class="text-sm text-gray-300 mt-2">
                <i class="fa-solid fa-phone text-green-400 mr-2"></i>
                <%= t.get("contact") %>
              </p>
            </div>

            <div class="mt-6 flex justify-center gap-3">
              <button class="px-4 py-2 rounded-lg bg-green-600 hover:bg-green-500 text-white text-sm font-medium shadow-lg shadow-green-500/20 transition-all">
                View Profile
              </button>
              <button class="px-4 py-2 rounded-lg bg-transparent border border-green-400 text-green-400 hover:bg-green-500 hover:text-white text-sm font-medium transition-all">
                Book Trainer
              </button>
            </div>
          </div>
        </div>
      <% } %>
    <% } else { %>
      <p class="text-center text-gray-400 col-span-full text-lg">No trainers found!</p>
    <% } %>
  </div>
</div>

<!-- Include modals and JS below (same as original) -->

</body>
</html>
