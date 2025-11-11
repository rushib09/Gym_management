<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sidebar</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

<!-- ✅ Sidebar -->
<aside class="w-64 bg-emerald-700 text-white flex flex-col">
  <div class="flex items-center justify-center h-20 border-b border-emerald-600">
    <i class="fa-solid fa-dumbbell text-3xl mr-2"></i>
    <h1 class="text-2xl font-bold">Golden Gym</h1>
  </div>

  <nav class="flex-1 p-4 space-y-3">
    <a href="<%=request.getContextPath()%>/DashboardServlet" class="flex items-center p-3 rounded-lg hover:bg-emerald-600 transition">
      <i class="fa-solid fa-gauge mr-3"></i> Dashboard
    </a>
    <a href="<%=request.getContextPath()%>/ViewMemberships" class="flex items-center p-3 rounded-lg hover:bg-emerald-600 transition">
      <i class="fa-solid fa-users mr-3"></i> Members
    </a>
    <a href="<%=request.getContextPath()%>/FetchTrainerServlet" class="flex items-center p-3 rounded-lg hover:bg-emerald-600 transition">
      <i class="fa-solid fa-user-tie mr-3"></i> Trainers
    </a>
    <a href="<%=request.getContextPath()%>/FetchEquipment" class="flex items-center p-3 rounded-lg hover:bg-emerald-600 transition">
      <i class="fa-solid fa-dumbbell mr-3"></i> Equipment
    </a>
    <a href="<%=request.getContextPath()%>/RevenueDashboard" class="flex items-center p-3 rounded-lg hover:bg-emerald-600 transition">
      <i class="fa-solid fa-sack-dollar mr-3"></i> Revenue
    </a>
     <a href="<%= request.getContextPath() %>/contactMessages" class="flex items-center p-3 rounded-lg hover:bg-emerald-600 transition">
      <i class="fa-solid fa-phone mr-3"></i> contact 
    </a>
    <a href="<%=request.getContextPath()%>/settings.jsp" class="flex items-center p-3 rounded-lg hover:bg-emerald-600 transition">
      <i class="fa-solid fa-gear mr-3"></i> Settings
    </a>
  </nav>

  <div class="p-4 border-t border-emerald-600">
    <a href="<%=request.getContextPath()%>/index.jsp" class="flex items-center p-3 bg-emerald-600 hover:bg-emerald-500 rounded-lg transition">
      <i class="fa-solid fa-right-from-bracket mr-2"></i> Logout
    </a>
  </div>
</aside>

</body>
</html>
