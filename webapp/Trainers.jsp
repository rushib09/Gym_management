<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Management</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script>
  function openUpdateModal(id, name, specialization, experience, contact, imageUrl) {
    document.getElementById('updateId').value = id;
    document.getElementById('updateName').value = name;
    document.getElementById('updateSpecialization').value = specialization;
    document.getElementById('updateExperience').value = experience;
    document.getElementById('updateContact').value = contact;
    document.getElementById('currentImage').src = imageUrl;
    document.getElementById('updateModal').classList.remove('hidden');
  }

  function closeModal() {
    document.getElementById('updateModal').classList.add('hidden');
  }
</script>
</head>
<body class="bg-gray-50 min-h-screen flex">

  <!-- ✅ Sidebar -->
  <jsp:include page="Sidebar.jsp" />

  <!-- 🌿 Main Content Area -->
  <div class="flex-1 flex flex-col min-h-screen">

    <!-- Navbar -->
    <header class="bg-white shadow-md h-16 flex items-center justify-between px-8">
      <h2 class="text-xl font-semibold text-emerald-700">
        <i class="fa-solid fa-gauge mr-2"></i> Trainers Dashboard
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
    </header>

    <!-- ✅ Page Content -->
    <main class="flex-1 p-8">

      <!-- 🏋️ Trainer Management Section -->
      <div class="bg-white shadow-lg rounded-2xl p-6 border border-gray-100 max-w-6xl mx-auto">

        <h2 class="text-2xl font-bold text-emerald-600 mb-6 text-center">
          <i class="fa-solid fa-user-tie mr-2"></i> Trainer Management
        </h2>

        <!-- ✅ Add Trainer Form -->
        <form action="AddTrainer" method="post" enctype="multipart/form-data" class="bg-emerald-50 p-4 rounded-xl mb-8 border border-emerald-200">
          <div class="grid grid-cols-6 gap-4">

            <input type="number" name="id" placeholder="Trainer ID"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <input type="text" name="name" placeholder="Trainer Name"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <input type="text" name="specialization" placeholder="Specialization"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <input type="number" name="experience" placeholder="Experience (yrs)"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <input type="text" name="contact" placeholder="Contact"
                   class="px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>

            <!-- ✅ Image Upload -->
            <input type="file" name="image" accept="image/*"
                   class="px-4 py-2 border border-gray-300 rounded-lg col-span-6" required>

            <button class="bg-emerald-600 text-white px-4 py-2 rounded-lg hover:bg-emerald-700 transition col-span-6">
              <i class="fa-solid fa-plus-circle mr-1"></i> Add Trainer
            </button>
          </div>
        </form>

        <!-- ✅ Trainer Table -->
        <div class="overflow-x-auto">
          <table class="w-full border border-gray-200 text-center rounded-lg overflow-hidden">
            <thead class="bg-emerald-600 text-white">
              <tr>
                <th class="py-3 px-4">Photo</th>
                <th class="py-3 px-4">ID</th>
                <th class="py-3 px-4">Name</th>
                <th class="py-3 px-4">Specialization</th>
                <th class="py-3 px-4">Experience</th>
                <th class="py-3 px-4">Contact</th>
                <th class="py-3 px-4">Actions</th>
              </tr>
            </thead>
            <tbody class="bg-white divide-y divide-gray-100">
              <%
                List<String[]> trainerList = (List<String[]>) request.getAttribute("trainerList");
                if (trainerList != null && !trainerList.isEmpty()) {
                  for (String[] t : trainerList) {
              %>
              <tr class="hover:bg-emerald-50 transition">
                <td class="py-2">
                  <img src="<%= request.getContextPath() + "/" + t[5] %>" 
                       alt="Trainer Photo" class="w-12 h-12 rounded-full object-cover mx-auto border">
                </td>
                <td class="py-3 font-semibold text-gray-700"><%= t[0] %></td>
                <td><%= t[1] %></td>
                <td><%= t[2] %></td>
                <td><%= t[3] %> yrs</td>
                <td><%= t[4] %></td>
                <td class="space-x-3">
                  <button type="button"
                    onclick="openUpdateModal('<%=t[0]%>','<%=t[1]%>','<%=t[2]%>','<%=t[3]%>','<%=t[4]%>','<%= request.getContextPath() + "/" + t[5] %>')"
                    class="text-blue-600 hover:text-blue-800 transition">
                    <i class="fa-solid fa-pen-to-square"></i>
                  </button>
                  <a href="DeleteTrainer?id=<%= t[0] %>"
                     class="text-red-600 hover:text-red-800 transition"
                     onclick="return confirm('Delete this trainer?')">
                    <i class="fa-solid fa-trash"></i>
                  </a>
                </td>
              </tr>
              <% } } else { %>
              <tr>
                <td colspan="7" class="py-4 text-gray-500">No trainers found.</td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
      </div>
    </main>
  </div>

  <!-- ✅ Update Trainer Modal -->
  <div id="updateModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
    <div class="bg-white rounded-xl p-6 w-96 shadow-lg">
      <h3 class="text-xl font-bold mb-4 text-emerald-700"><i class="fa-solid fa-pen-to-square mr-2"></i> Update Trainer</h3>
      <form action="UpdateTrainer" method="post" enctype="multipart/form-data" class="space-y-3">
        <input type="hidden" id="updateId" name="id">
        <input type="text" id="updateName" name="name" placeholder="Trainer Name" class="w-full px-3 py-2 border rounded-lg" required>
        <input type="text" id="updateSpecialization" name="specialization" placeholder="Specialization" class="w-full px-3 py-2 border rounded-lg" required>
        <input type="number" id="updateExperience" name="experience" placeholder="Experience (yrs)" class="w-full px-3 py-2 border rounded-lg" required>
        <input type="text" id="updateContact" name="contact" placeholder="Contact" class="w-full px-3 py-2 border rounded-lg" required>

        <img id="currentImage" src="" alt="Trainer Photo" class="w-20 h-20 rounded-full mx-auto border">

        <input type="file" name="image" accept="image/*" class="w-full bg-gray-50 px-4 py-2 rounded-lg">

        <div class="flex justify-end space-x-3 mt-4">
          <button type="button" onclick="closeModal()" class="px-4 py-2 bg-gray-300 rounded-lg">Cancel</button>
          <button type="submit" class="px-4 py-2 bg-emerald-600 text-white rounded-lg">Update</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
