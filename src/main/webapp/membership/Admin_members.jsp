<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All Memberships - Golden Fitness</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        crossorigin="anonymous" referrerpolicy="no-referrer" />

  <script>
    function filterTable() {
      const input = document.getElementById("searchInput").value.toLowerCase();
      const rows = document.querySelectorAll("#membershipTable tbody tr");
      rows.forEach(row => {
        const cells = row.getElementsByTagName("td");
        const text = (cells[1].textContent + cells[2].textContent + cells[5].textContent).toLowerCase();
        row.style.display = text.includes(input) ? "" : "none";
      });
    }

    function openEditModal(rowData) {
      const [id, username, name, email, mobile, city, plan, price] = rowData.split("|");
      document.getElementById("editId").value = id;
      document.getElementById("editUsername").value = username;
      document.getElementById("editName").value = name;
      document.getElementById("editEmail").value = email;
      document.getElementById("editMobile").value = mobile;
      document.getElementById("editCity").value = city;
      document.getElementById("editPlan").value = plan;
      document.getElementById("editPrice").value = price;
      document.getElementById("editModal").classList.remove("hidden");
    }

    function closeModal() {
      document.getElementById("editModal").classList.add("hidden");
    }
  </script>
</head>

<body class="bg-gray-50 font-sans">

<!-- Navbar -->
<header class="bg-white shadow-md h-16 flex items-center justify-between px-8">
  <h2 class="text-xl font-semibold text-emerald-700">
    <i class="fa-solid fa-gauge mr-2"></i> Members Dashboard
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

<!-- 📋 Main Content -->
<div class="pt-24 px-10 pb-10">

  <div class="bg-white p-8 rounded-2xl shadow-xl max-w-7xl mx-auto border border-green-500/20">
    <h1 class="text-3xl text-green-600 font-extrabold text-center mb-6 flex items-center justify-center gap-2">
      <i class="fa-solid fa-users"></i> All Memberships
    </h1>

    <!-- 🔙 Go to Dashboard Button -->
    <div class="mb-6 text-right">
      <a href="<%= request.getContextPath() %>/DashboardServlet"
         class="inline-flex items-center px-4 py-2 bg-emerald-600 text-white font-semibold rounded-lg shadow hover:bg-emerald-700 transition">
        <i class="fa-solid fa-arrow-left mr-2"></i> Go to Dashboard
      </a>
    </div>

    <!-- 🔍 Search Box -->
    <div class="mb-4 text-right">
      <input id="searchInput" type="text" onkeyup="filterTable()" placeholder="Search memberships..."
             class="px-4 py-2 border border-gray-300 rounded-lg w-64 focus:ring-2 focus:ring-emerald-400 focus:outline-none">
    </div>

    <!-- ✅ Membership Table -->
    <div class="overflow-x-auto">
      <table id="membershipTable" class="min-w-full border border-green-300 rounded-lg text-sm">
        <thead class="bg-green-600 text-white">
          <tr>
            <th class="p-3">#</th>
            <th class="p-3">Username</th>
            <th class="p-3">Name</th>
            <th class="p-3">Email</th>
            <th class="p-3">Mobile</th>
            <th class="p-3">City</th>
            <th class="p-3">Plan</th>
            <th class="p-3">Price</th>
            <th class="p-3">Start Date</th>
            <th class="p-3">End Date</th>
            <th class="p-3">Profile</th>
            <th class="p-3">Actions</th>
          </tr>
        </thead>

        <tbody class="bg-white text-gray-800">
        <%
          List<Object[]> data = (List<Object[]>) request.getAttribute("data");
          if (data != null && !data.isEmpty()) {
            int i = 1;
            for (Object[] row : data) {
        %>
          <tr class="hover:bg-green-50 transition border-b">
            <td class="p-3 text-center"><%= i++ %></td>
            <td class="p-3"><%= row[1] %></td>
            <td class="p-3"><%= row[2] %></td>
            <td class="p-3"><%= row[3] %></td>
            <td class="p-3"><%= row[4] %></td>
            <td class="p-3"><%= row[5] %></td>
            <td class="p-3 font-semibold text-green-700"><%= row[6] %></td>
            <td class="p-3 font-bold text-green-600">₹<%= row[7] %></td>
            <td class="p-3"><%= row[8] %></td>
            <td class="p-3"><%= row[9] %></td>

            <!-- Profile Picture -->
            <td class="p-3 text-center">
              <img src="<%= request.getContextPath() %>/uploads/<%= row[10] != null ? row[10] : "default-avatar.png" %>"
                   alt="Profile" class="w-10 h-10 rounded-full object-cover border">
            </td>

            <!-- Actions -->
            <td class="p-3 space-x-2">
              <button onclick="openEditModal('<%= row[0] %>|<%= row[1] %>|<%= row[2] %>|<%= row[3] %>|<%= row[4] %>|<%= row[5] %>|<%= row[6] %>|<%= row[7] %>')"
                      class="text-blue-600 hover:text-blue-800"><i class="fa-solid fa-pen-to-square"></i></button>

              <a href="<%= request.getContextPath() %>/DeleteMembership1?id=<%= row[0] %>"
                 onclick="return confirm('Are you sure you want to delete this membership?')"
                 class="text-red-600 hover:text-red-800"><i class="fa-solid fa-trash"></i></a>
            </td>
          </tr>
        <% } } else { %>
          <tr>
            <td colspan="12" class="text-center p-4 text-gray-500">No membership records found.</td>
          </tr>
        <% } %>
        </tbody>
      </table>
    </div>
  </div>
</div>

<!-- ✅ Edit Membership Modal -->
<div id="editModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white w-96 rounded-2xl shadow-lg p-6">
    <h3 class="text-xl font-bold text-emerald-600 mb-4"><i class="fa-solid fa-pen"></i> Edit Membership</h3>
    <form action="<%= request.getContextPath() %>/UpdateMembershipServlet" method="post" class="space-y-4">
      <input type="hidden" id="editId" name="id">

      <input type="text" id="editUsername" name="username" class="w-full p-2 border rounded-lg" placeholder="Username" required>
      <input type="text" id="editName" name="name" class="w-full p-2 border rounded-lg" placeholder="Name" required>
      <input type="email" id="editEmail" name="email" class="w-full p-2 border rounded-lg" placeholder="Email" required>
      <input type="text" id="editMobile" name="mobile" class="w-full p-2 border rounded-lg" placeholder="Mobile" required>
      <input type="text" id="editCity" name="city" class="w-full p-2 border rounded-lg" placeholder="City" required>
      <input type="text" id="editPlan" name="plan" class="w-full p-2 border rounded-lg" placeholder="Plan" required>
      <input type="text" id="editPrice" name="price" class="w-full p-2 border rounded-lg" placeholder="Price" required>

      <div class="flex justify-end gap-3">
        <button type="button" onclick="closeModal()" class="px-4 py-2 bg-gray-300 rounded-lg">Cancel</button>
        <button type="submit" class="px-4 py-2 bg-emerald-600 text-white rounded-lg">Update</button>
      </div>
    </form>
  </div>
</div>

</body>
</html>
