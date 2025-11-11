<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-emerald-50 via-white to-sky-50 min-h-screen flex flex-col">


<!-- Main Signup Form -->
<div class="flex-grow flex items-center justify-center px-4 mt-12">  <!-- ✅ Added mt-12 for top margin -->
  <div class="bg-white shadow-xl rounded-2xl p-10 w-full max-w-md border border-gray-100">
    <h2 class="text-3xl font-bold text-center text-emerald-600 mb-6">Create Account</h2>

    <form action="signup" method="post" class="space-y-6" onsubmit="return validatePassword()">

      <!-- Name -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Full Name</label>
        <input type="text" name="name" placeholder="Enter your full name"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>
      </div>

      <!-- Username -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Username</label>
        <input type="text" name="username" placeholder="Choose a username"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>
      </div>

      <!-- Email -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Email</label>
        <input type="email" name="email" placeholder="Enter your email"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>
      </div>

      <!-- Password -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Password</label>
        <input type="password" name="password" id="password" placeholder="Enter your password"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>
      </div>

      <!-- Confirm Password -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Confirm Password</label>
        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Re-enter password"
          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-400 focus:outline-none" required>
      </div>

      <!-- Signup Button -->
      <button type="submit"
        class="w-full bg-emerald-500 text-white font-semibold py-2 rounded-lg hover:bg-emerald-600 transition">
        Sign Up
      </button>
    </form>

    <div class="text-center mt-6">
      <p class="text-gray-600">Already have an account?</p>
      <a href="user_login.jsp" class="text-emerald-600 font-semibold hover:underline">Login</a>
    </div>
  </div>
</div>

<!-- Password Match Validation -->
<script>
function validatePassword() {
  const pass = document.getElementById("password").value;
  const confirm = document.getElementById("confirmPassword").value;
  if (pass !== confirm) {
    alert("Passwords do not match!");
    return false;
  }
  return true;
}
</script>

</body>
</html>
