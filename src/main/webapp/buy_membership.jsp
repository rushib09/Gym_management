<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) {
      response.sendRedirect("user_login.jsp");
      return;
  }
  String plan = request.getParameter("plan");
  String price = request.getParameter("price");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy Membership</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex items-center justify-center">

  <div class="bg-gray-800 p-10 rounded-2xl shadow-lg w-full max-w-lg border border-green-500/30">
    <h2 class="text-3xl font-bold text-center text-green-400 mb-6">Confirm Purchase</h2>

    <form action="BuyMembership" method="post" class="space-y-5">
      <input type="hidden" name="username" value="<%= username %>">
      <input type="hidden" name="plan_name" value="<%= plan %>">
      <input type="hidden" name="price" value="<%= price %>">

      <div>
        <label class="block mb-1">Plan Name</label>
        <input type="text" value="<%= plan %>" disabled class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg">
      </div>

      <div>
        <label class="block mb-1">Price (₹)</label>
        <input type="text" value="<%= price %>" disabled class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg">
      </div>

      <button type="submit" 
              class="w-full bg-green-600 hover:bg-green-500 text-white py-3 rounded-lg font-semibold">
        Confirm and Pay
      </button>
    </form>
  </div>

</body>
</html>
