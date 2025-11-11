<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gym Equipment Management</title>
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
        <i class="fa-solid fa-gauge mr-2"></i> Equipment Dashboard
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

      <div class="bg-white shadow-lg rounded-2xl p-6 border border-gray-100 max-w-6xl mx-auto">

        <h2 class="text-2xl font-bold text-emerald-600 mb-6 text-center">
          <i class="fa-solid fa-dumbbell mr-2"></i> Equipment Management
        </h2>

        <!-- ✅ Success / Error Messages -->
        <%
          String success = request.getParameter("success");
          String error = request.getParameter("error");
          if ("1".equals(success)) {
        %>
          <div class="bg-green-100 text-green-800 p-3 mb-4 rounded-md text-center">
            ✅ Equipment added successfully!
          </div>
        <%
          } else if ("1".equals(error)) {
        %>
          <div class="bg-red-100 text-red-800 p-3 mb-4 rounded-md text-center">
            ❌ Operation failed. Try again.
          </div>
        <%
          }
        %>

        <!-- ✅ Add Equipment Form -->
        <form action="AddingEquipment" method="post"
              class="bg-emerald-50 p-4 rounded-xl mb-8 border border-emerald-200">
          <div class="grid grid-cols-5 gap-4">
            <input type="text" name="name" placeholder="Equipment Name"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <input type="text" name="category" placeholder="Category (e.g., Cardio, Strength)"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <input type="number" name="quantity" placeholder="Quantity"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <input type="number" name="price" placeholder="Price (₹)" step="0.01"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <button class="bg-emerald-600 text-white px-4 py-2 rounded-lg hover:bg-emerald-700 transition">
              <i class="fa-solid fa-plus-circle mr-1"></i> Add
            </button>
          </div>
        </form>

        <!-- ✅ Equipment Table -->
        <div class="overflow-x-auto">
          <table class="w-full border border-gray-200 text-center rounded-lg overflow-hidden">
            <thead class="bg-emerald-600 text-white">
              <tr>
                <th class="py-3 px-4">ID</th>
                <th class="py-3 px-4">Name</th>
                <th class="py-3 px-4">Category</th>
                <th class="py-3 px-4">Quantity</th>
                <th class="py-3 px-4">Price (₹)</th>
                <th class="py-3 px-4">Actions</th>
              </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-100">
              <%
                List<String[]> equipmentList = (List<String[]>) request.getAttribute("equipmentList");
                if (equipmentList != null && !equipmentList.isEmpty()) {
                  for (String[] e : equipmentList) {
              %>
              <tr class="hover:bg-emerald-50 transition">
                <td class="py-3"><%= e[0] %></td>
                <td><%= e[1] %></td>
                <td><%= e[2] %></td>
                <td><%= e[3] %></td>
                <td>₹<%= e[4] %></td>
                <td class="space-x-3 py-3">
                  <!-- Update Button -->
                  <button onclick="openUpdateModal('<%= e[0] %>', '<%= e[1] %>', '<%= e[2] %>', '<%= e[3] %>', '<%= e[4] %>')"
                          class="text-blue-600 hover:text-blue-800"><i class="fa-solid fa-pen-to-square"></i></button>
                  
                  <!-- Delete Button -->
                  <a href="DeleteEquipment?id=<%= e[0] %>"
                     onclick="return confirm('Are you sure you want to delete this equipment?')"
                     class="text-red-600 hover:text-red-800"><i class="fa-solid fa-trash"></i></a>
                </td>
              </tr>
              <% } } else { %>
              <tr>
                <td colspan="6" class="py-4 text-gray-500">No equipment found.</td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </main>
  </div>

  <!-- ✅ Update Modal -->
  <div id="updateModal" class="fixed inset-0 bg-black bg-opacity-40 hidden justify-center items-center">
    <div class="bg-white rounded-xl p-6 w-96 shadow-lg">
      <h2 class="text-xl font-semibold mb-4 text-emerald-600">Update Equipment</h2>
      <form action="UpdateEquipment" method="post" class="space-y-3">
        <input type="hidden" id="updateId" name="id">
        <input type="text" id="updateName" name="name" class="w-full border px-3 py-2 rounded-md" required>
        <input type="text" id="updateCategory" name="category" class="w-full border px-3 py-2 rounded-md" required>
        <input type="number" id="updateQuantity" name="quantity" class="w-full border px-3 py-2 rounded-md" required>
        <input type="number" id="updatePrice" name="price" step="0.01" class="w-full border px-3 py-2 rounded-md" required>
        <div class="flex justify-end space-x-3 mt-4">
          <button type="button" onclick="closeUpdateModal()" class="px-4 py-2 bg-gray-200 rounded-md">Cancel</button>
          <button type="submit" class="px-4 py-2 bg-emerald-600 text-white rounded-md hover:bg-emerald-700">Update</button>
        </div>
      </form>
    </div>
  </div>

  <script>
    function openUpdateModal(id, name, category, quantity, price) {
      document.getElementById('updateModal').style.display = 'flex';
      document.getElementById('updateId').value = id;
      document.getElementById('updateName').value = name;
      document.getElementById('updateCategory').value = category;
      document.getElementById('updateQuantity').value = quantity;
      document.getElementById('updatePrice').value = price;
    }
    function closeUpdateModal() {
      document.getElementById('updateModal').style.display = 'none';
    }
  </script>
</body>
</html>
