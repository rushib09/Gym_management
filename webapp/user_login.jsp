<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-br from-emerald-50 via-white to-sky-50 min-h-screen flex flex-col">

<div class="flex-grow flex items-center justify-center">
  <div class="bg-white shadow-xl rounded-2xl p-10 w-full max-w-md border border-gray-100">
    <h2 class="text-3xl font-bold text-center text-emerald-600 mb-6">User Login</h2>

    <form action="userLogin" method="post" class="space-y-6">
      <div>
        <label class="block text-gray-700 font-medium mb-1">Username</label>
        <input type="text" name="username" placeholder="Enter your username"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Password</label>
        <input type="password" name="password" placeholder="Enter your password"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>
      </div>

      <button type="submit"
        class="w-full bg-emerald-500 text-white font-semibold py-2 rounded-lg hover:bg-emerald-600 transition">Login</button>
    </form>

    <div class="text-center mt-6">
      <p class="text-gray-600">Don't have an account?</p>
      <a href="signup.jsp" class="text-emerald-600 font-semibold hover:underline">Sign Up</a>
    </div>
  </div>
</div>

</body>
</html>
