<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Success</title>
<script src="https://cdn.tailwindcss.com"></script>
<script>
  // Redirect after 5 seconds
  let countdown = 5;
  function startRedirect() {
    const timer = setInterval(() => {
      document.getElementById("countdown").innerText = countdown;
      countdown--;
      if (countdown < 0) {
        clearInterval(timer);
        window.location.href = "<%=request.getContextPath()%>/index.jsp";
      }
    }, 1000);
  }
</script>
</head>
<body onload="startRedirect()" class="bg-gray-900 flex items-center justify-center h-screen text-gray-100">

<div class="bg-gray-800 p-10 rounded-xl text-center shadow-lg">
  <h1 class="text-3xl text-green-400 font-bold mb-3">🎉 Payment Successful</h1>
  <p class="text-lg">You're now subscribed to the <b><%=request.getParameter("plan")%></b> plan!</p>

  <p class="mt-4 text-gray-300">Redirecting to dashboard in <span id="countdown" class="font-bold text-green-400">5</span> seconds...</p>

  <a href="<%=request.getContextPath()%>/index.jsp"
     class="mt-6 inline-block bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-lg">
     Go to Dashboard
  </a>
</div>

</body>
</html>
