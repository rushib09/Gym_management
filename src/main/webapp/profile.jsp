<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbConnection.DBConnection" %>

<%
    // ✅ Require login
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("../user_login.jsp");
        return;
    }

    String name = "", email = "", mobile = "", city = "", plan = "N/A", startDate = "", endDate = "", status = "Expired", profilePic = "default-avatar.png";

    try (Connection con = DBConnection.getConnection()) {
        String sql = "SELECT * FROM memberships WHERE username=? ORDER BY date DESC LIMIT 1";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            mobile = rs.getString("mobile");
            city = rs.getString("city");
            plan = rs.getString("plan");
            startDate = rs.getString("date");
            endDate = rs.getString("end_date");
            profilePic = rs.getString("profile_pic") != null ? rs.getString("profile_pic") : "default-avatar.png";

            // ✅ Calculate membership status
            try {
                String endDateOnly = endDate.split(" ")[0];
                java.time.LocalDate expiryDate = java.time.LocalDate.parse(endDateOnly);
                java.time.LocalDate today = java.time.LocalDate.now();
                status = expiryDate.isBefore(today) ? "Expired" : "Active";
            } catch (Exception e) {
                status = "Unknown";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Profile - Golden Fitness</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-b from-gray-900 to-gray-800 text-gray-100 min-h-screen">

  <!-- 🟩 Header -->
  <header class="py-6 bg-gray-800 shadow-md">
    <div class="max-w-6xl mx-auto px-6">
      <h1 class="text-3xl font-bold text-green-400">My Profile</h1>
      <p class="text-gray-400">Welcome back, <%= name %> 👋</p>
    </div>
  </header>

  <main class="max-w-6xl mx-auto px-6 py-10">

    <!-- PROFILE CARD -->
    <div class="bg-gray-800 rounded-2xl shadow-xl border border-green-500/20 p-8 flex flex-col lg:flex-row gap-10">

      <!-- LEFT: Profile Picture & Basic Info -->
      <div class="flex flex-col items-center lg:items-start w-full lg:w-1/3">

        <!-- Profile Image -->
        <img id="profilePreview"
             src="<%=request.getContextPath()%>/uploads/<%= profilePic %>"
             alt="Profile Image"
             class="w-36 h-36 rounded-full border-4 border-green-500 shadow-lg object-cover mb-4" />

        <!-- Image Upload Form -->
        <form action="<%=request.getContextPath()%>/UploadProfilePic1" method="post" enctype="multipart/form-data" class="mt-3 w-full">
          <input type="hidden" name="username" value="<%= username %>">
          
          <input type="file" id="profilePicInput" name="profilePic" accept="image/*" required
                 class="mb-3 w-full px-3 py-2 bg-gray-700 border border-gray-500 rounded-lg text-sm
                        hover:border-green-400 focus:outline-none focus:ring focus:ring-green-500"
                 onchange="previewProfilePic(event)">
          
          <button type="submit"
                  class="w-full py-2 bg-green-600 hover:bg-green-700 rounded-lg text-white font-semibold">
            📸 Upload New Photo
          </button>
        </form>

        <!-- Basic Info -->
        <h2 class="mt-6 text-2xl font-bold text-green-400"><%= name %></h2>
        <p class="text-gray-400 text-sm">@<%= username %></p>

        <div class="mt-6 space-y-2 text-sm w-full">
          <p><span class="font-semibold">📧 Email:</span> <%= email %></p>
          <p><span class="font-semibold">📞 Mobile:</span> <%= mobile %></p>
          <p><span class="font-semibold">📍 City:</span> <%= city %></p>
        </div>
      </div>

      <!-- RIGHT: Membership Details -->
      <div class="flex-1">
        <h3 class="text-xl font-bold text-green-400 mb-6">Membership Details</h3>

        <div class="space-y-4 text-base">
          <p><span class="font-semibold text-gray-400">🏷 Plan:</span> <span class="text-white"><%= plan %></span></p>
          <p><span class="font-semibold text-gray-400">📅 Start Date:</span> <span class="text-white"><%= startDate %></span></p>
          <p><span class="font-semibold text-gray-400">⏳ Valid Until:</span> <span class="text-white"><%= endDate %></span></p>
          <p><span class="font-semibold text-gray-400">🔖 Status:</span>
            <span class="px-3 py-1 rounded-full text-sm font-semibold
                  <%= status.equals("Active") ? "bg-green-600" : "bg-red-600" %> text-white">
              <%= status %>
            </span>
          </p>
        </div>

        <!-- Buttons -->
        <div class="mt-10 flex flex-col sm:flex-row gap-4">
          <a href="<%=request.getContextPath()%>/index.jsp"
             class="w-full sm:w-auto px-5 py-3 bg-yellow-500 hover:bg-yellow-600 rounded-lg text-white font-semibold text-center">
             🏠 Home
          </a>
          <a href="<%=request.getContextPath()%>/profile/EditProfile.jsp"
             class="w-full sm:w-auto px-5 py-3 bg-blue-600 hover:bg-blue-700 rounded-lg text-white font-semibold text-center">
             ✏️ Edit Profile
          </a>
          <a href="<%=request.getContextPath()%>/index.jsp"
             class="w-full sm:w-auto px-5 py-3 bg-red-600 hover:bg-red-700 rounded-lg text-white font-semibold text-center">
             🚪 Logout
          </a>
        </div>
      </div>
    </div>
  </main>

  <!-- ✅ Success Modal -->
  <div id="successModal" class="fixed inset-0 bg-black/60 flex justify-center items-center hidden z-50">
    <div class="bg-white rounded-xl text-center p-6 shadow-lg max-w-sm w-full">
      <h3 class="text-xl font-bold text-green-600 mb-2">✅ Upload Successful</h3>
      <p class="text-gray-700">Your profile picture has been updated successfully!</p>
      <button onclick="closeModal()" class="mt-4 px-4 py-2 bg-green-600 hover:bg-green-700 text-white rounded-lg">OK</button>
    </div>
  </div>

  <!-- ✅ Scripts -->
  <script>
    function previewProfilePic(event) {
      const reader = new FileReader();
      reader.onload = e => document.getElementById('profilePreview').src = e.target.result;
      reader.readAsDataURL(event.target.files[0]);
    }

    <% if ("success".equals(request.getParameter("update"))) { %>
      document.getElementById("successModal").classList.remove("hidden");
    <% } %>

    function closeModal() {
      document.getElementById("successModal").classList.add("hidden");
    }
  </script>
</body>
</html>
