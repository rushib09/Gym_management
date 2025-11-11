<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Contact Messages</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <style>
        body {
            display: flex;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .content-wrap {
            flex: 1;
            min-height: 100vh;
            background-color: #f3f4f6; /* gray-100 */
        }
    </style>
</head>
<body class="overflow-x-hidden">

<!-- ✅ Sidebar -->
<jsp:include page="/Sidebar.jsp" />

<!-- ✅ Content Area -->
<div class="content-wrap">

  <!-- 🔻 Header -->
  <header class="bg-white text-emerald-700 px-8 h-16 shadow-md flex items-center justify-between border-b">
    <h2 class="text-xl font-semibold"><i class="fa-solid fa-envelope mr-2"></i> Contact Messages</h2>

    <%
      String adminName = (String) session.getAttribute("adminUsername");
      if (adminName == null) {
          response.sendRedirect("admin_login.jsp");
          return;
      }
    %>

    <div class="flex items-center space-x-4">
      <span>Welcome, <strong class="text-emerald-600"><%= adminName %></strong></span>
      <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
           alt="Admin" class="w-10 h-10 rounded-full border border-emerald-600">
    </div>
  </header>

  <!-- 🔻 Page Content -->
  <main class="p-8">
      <h1 class="text-3xl font-bold mb-6 text-center text-gray-800">Contact Form Submissions</h1>

      <!-- 🔍 Search Bar -->
      <form action="<%= request.getContextPath() %>/contactMessages" method="get"
            class="mb-6 flex justify-center">
        <input type="text" name="search" placeholder="Search by name, email, or subject"
               value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>"
               class="px-4 py-2 border rounded-l-lg w-1/3 focus:outline-none focus:ring-2 focus:ring-emerald-600"
               required>
        <button type="submit" class="bg-emerald-600 text-white px-4 py-2 rounded-r-lg hover:bg-emerald-700">
          Search
        </button>
      </form>

      <%
          List<Map<String, Object>> contacts = (List<Map<String, Object>>) request.getAttribute("contacts");
          if (contacts == null || contacts.isEmpty()) {
      %>
          <p class="text-center text-red-500 mt-10">No messages found!</p>
      <% } else { %>

      <div class="overflow-x-auto shadow-md bg-white rounded-lg">
          <table class="w-full text-sm text-left text-gray-700">
              <thead class="text-xs text-gray-100 uppercase bg-emerald-600">
                  <tr>
                      <th class="px-6 py-3">ID</th>
                      <th class="px-6 py-3">Name</th>
                      <th class="px-6 py-3">Email</th>
                      <th class="px-6 py-3">Subject</th>
                      <th class="px-6 py-3">Message</th>
                      <th class="px-6 py-3">Date Sent</th>
                      <th class="px-6 py-3">Action</th>
                  </tr>
              </thead>
              <tbody>
                  <% for (Map<String, Object> c : contacts) { %>
                  <tr class="bg-white border-b hover:bg-gray-50">
                      <td class="px-6 py-4"><%= c.get("id") %></td>
                      <td class="px-6 py-4"><%= c.get("name") %></td>
                      <td class="px-6 py-4"><%= c.get("email") %></td>
                      <td class="px-6 py-4"><%= c.get("subject") %></td>
                      <td class="px-6 py-4 max-w-xs truncate"><%= c.get("message") %></td>
                      <td class="px-6 py-4"><%= c.get("dateSent") %></td>
                      <td class="px-6 py-4">
                        <a href="<%= request.getContextPath() %>/deleteContact1?id=<%= c.get("id") %>"
                           onclick="return confirm('Are you sure you want to delete this message?')"
                           class="text-red-600 hover:text-red-800 font-semibold">Delete</a>
                      </td>
                  </tr>
                  <% } %>
              </tbody>
          </table>
      </div>
      <% } %>
  </main>

</div>

</body>
</html>
