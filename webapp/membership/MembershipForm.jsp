<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Details</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-900 text-gray-100 font-sans">

<%
  String plan = request.getParameter("plan");
  String price = request.getParameter("price");
%>

<div class="mt-12 max-w-xl mx-auto bg-gray-800 p-8 rounded-2xl shadow-xl">

  <!-- ✅ Back Button -->
  <div class="mb-4">
    <a href="javascript:history.back()" 
       class="inline-flex items-center text-gray-300 border border-gray-500 px-4 py-2 rounded-lg hover:bg-gray-700 transition">
      <span class="mr-2">←</span> Back
    </a>
  </div>

  <h2 class="text-3xl text-green-400 font-bold text-center mb-6">Step 2: Enter Your Details</h2>

  <form id="memberForm" onsubmit="return validateAndConfirm()" class="space-y-5">
    <input type="hidden" id="planInput" value="<%=plan%>">
    <input type="hidden" id="priceInput" value="<%=price%>">

    <input type="text" id="name" placeholder="Full Name" required class="input">
    <input type="email" id="email" placeholder="Email" required class="input">
    <input type="text" id="mobile" placeholder="Phone Number" required class="input">
    <input type="text" id="city" placeholder="City" required class="input">

    <button type="submit" class="w-full bg-green-600 hover:bg-green-700 text-white font-bold py-3 rounded-lg">
      Proceed to Payment
    </button>
  </form>
</div>

<script>
function validateAndConfirm() {
  const plan = document.getElementById("planInput").value;
  const price = document.getElementById("priceInput").value;
  const name = document.getElementById("name").value.trim();
  const email = document.getElementById("email").value.trim();
  const mobile = document.getElementById("mobile").value.trim();
  const city = document.getElementById("city").value.trim();

  if (!name || !email || !mobile || !city) {
    alert("All fields are required!");
    return false;
  }

  const validity = plan === "Basic" ? "1 Month" :
                   plan === "Standard" ? "3 Months" : "1 Year";

  if (confirm(`Please confirm your details:\n\nName: ${name}\nEmail: ${email}\nMobile: ${mobile}\nCity: ${city}\n\nMembership Plan: ${plan}\nPrice: ₹${price}\nValidity: ${validity}`)) {
    window.location.href = `payment.jsp?plan=${plan}&price=${price}&name=${name}&email=${email}&mobile=${mobile}&city=${city}`;
    return false;
  }
  return false;
}
</script>

<style>
  .input { 
    width: 100%; 
    padding: 0.75rem; 
    background-color: #1f2937; 
    border: 1px solid #10b981; 
    border-radius: 0.5rem; 
    color: white; 
  }
</style>

</body>
</html>
