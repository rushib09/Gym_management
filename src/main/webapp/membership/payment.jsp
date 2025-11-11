<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String username = (String) session.getAttribute("username");
  if (username == null) response.sendRedirect("../user_login.jsp");

  String plan = request.getParameter("plan");
  String price = request.getParameter("price");
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  String mobile = request.getParameter("mobile");
  String city = request.getParameter("city");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment - <%=plan%></title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-900 text-gray-100 font-sans py-12">
<div class="max-w-xl mx-auto bg-gray-800 p-8 rounded-xl shadow-lg">

<h1 class="text-3xl text-green-400 font-bold text-center mb-4">Complete Payment</h1>

<p class="text-center">Hello, <span class="text-green-400"><%=username%></span></p>
<p class="text-center mb-4">You selected <b><%=plan%></b> plan for:</p>

<h2 class="text-center text-4xl font-bold text-green-400 mb-6">₹<%=price%></h2>

<h3 class="text-lg font-semibold mb-4 text-center">Scan to Pay</h3>
<div class="text-center mb-8">
  <img src="../images/QR.jpg" alt="UPI QR Code" class="w-48 mx-auto rounded-lg shadow-md">
  <p class="mt-3 text-gray-300">Scan this QR using any UPI app to make the payment.</p>
  <p class="text-sm text-gray-400 mt-1">UPI ID: <span class="text-green-400">goldengym@upi</span></p>
</div>

<!-- ✅ Toast -->
<div id="toast" class="hidden fixed top-5 right-5 bg-green-600 text-white px-6 py-3 rounded-lg shadow-lg">
  Processing your payment...
</div>

<!-- ✅ Back Button -->
<div class="mb-4">
  <a href="javascript:history.back()" 
     class="inline-flex items-center text-gray-300 border border-gray-500 px-4 py-2 rounded-lg hover:bg-gray-700 transition">
    <span class="mr-2">←</span> Back
  </a>
</div>

<form id="paymentForm" action="<%=request.getContextPath()%>/ConfirmPaymentt" method="post" onsubmit="return handleSubmit()">
  <input type="hidden" name="username" value="<%=username%>">
  <input type="hidden" name="name" value="<%=name%>">
  <input type="hidden" name="mobile" value="<%=mobile%>">
  <input type="hidden" name="city" value="<%=city%>">
  <input type="hidden" name="plan" value="<%=plan%>">
  <input type="hidden" name="price" value="<%=price%>">

  <!-- ✅ Email Input Field -->
  <label for="email" class="block text-sm text-gray-300 font-semibold mb-2">Confirm Email Address</label>
  <input type="email" id="email" name="email"
         value="<%=email%>"
         class="w-full p-3 mb-6 bg-gray-900 border border-green-600 rounded-lg text-gray-100 focus:outline-none"
         oninput="validateEmail()" required>

  <p id="emailError" class="text-red-500 text-sm hidden">Invalid email address!</p>

  <!-- ✅ Confirmation Checkbox -->
  <div class="flex items-center mb-6">
    <input type="checkbox" id="confirmCheck" class="w-4 h-4 text-green-600 border-gray-300 rounded" onchange="toggleSubmitButton()">
    <label for="confirmCheck" class="ml-2 text-sm text-gray-300">I confirm that I have paid the amount using the QR code</label>
  </div>

  <button id="submitButton" type="submit" disabled
          class="w-full bg-gray-500 cursor-not-allowed py-3 rounded-lg font-bold text-white transition">
    ✅ I Have Paid — Confirm Membership
  </button>
</form>

<script>
  function toggleSubmitButton() {
    const checkbox = document.getElementById('confirmCheck');
    const button = document.getElementById('submitButton');

    if (checkbox.checked) {
      button.disabled = false;
      button.classList.remove('bg-gray-500', 'cursor-not-allowed');
      button.classList.add('bg-green-600', 'hover:bg-green-700');
    } else {
      button.disabled = true;
      button.classList.remove('bg-green-600', 'hover:bg-green-700');
      button.classList.add('bg-gray-500', 'cursor-not-allowed');
    }
  }

  function validateEmail() {
    const emailInput = document.getElementById("email");
    const emailError = document.getElementById("emailError");
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailPattern.test(emailInput.value)) {
      emailError.classList.remove("hidden");
      emailInput.classList.add("border-red-500");
    } else {
      emailError.classList.add("hidden");
      emailInput.classList.remove("border-red-500");
    }
  }

  function handleSubmit() {
    const button = document.getElementById('submitButton');
    button.disabled = true;
    button.innerHTML = "⏳ Processing...";

    const toast = document.getElementById("toast");
    toast.classList.remove("hidden");

    return confirm("Have you completed the payment?\n\nClick OK to confirm and activate membership.");
  }
</script>

</div>
</body>
</html>
