<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>

<!-- ================= NAVBAR ================= -->
<nav class="fixed top-0 left-0 w-full z-50 bg-gray-900/90 backdrop-blur-md border-b border-green-500/30 shadow-md">
  <div class="max-w-7xl mx-auto flex justify-between items-center px-6 py-3">
    <!-- Logo -->
    <a href="index.jsp" class="flex items-center space-x-2 text-green-400 text-2xl font-bold">
      <i class="fa-solid fa-dumbbell"></i>
      <span>Golden Fitness</span>
    </a>

    <!-- Hamburger Menu (Mobile) -->
    <button class="md:hidden text-green-400 text-2xl focus:outline-none" id="menuBtn">
      <i class="fa-solid fa-bars"></i>
    </button>

    <!-- Navigation Menu -->
    <div id="menu"
         class="hidden md:flex flex-col md:flex-row md:items-center absolute md:static top-14 left-0 w-full md:w-auto bg-gray-900 md:bg-transparent border-t md:border-0 border-green-600/30 md:space-x-6 space-y-4 md:space-y-0 p-4 md:p-0 text-lg transition-all">

      <a href="index.jsp" class="hover:text-green-400 block">Home</a>
      <a href="UserMembership.jsp" class="hover:text-green-400 block">Membership</a>
      <a href="FetchUserTrainer" class="hover:text-green-400 block">Trainers</a>
      <a href="contact.jsp" class="hover:text-green-400 block">Contact</a>

      <!-- User greeting (if logged in) -->
      <%
        String username = (String) session.getAttribute("username");
        if (username != null) {
      %>
        <div class="relative mt-2 md:mt-0">
          <button id="profileBtn" class="flex items-center space-x-2 focus:outline-none">
            <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center font-bold text-white uppercase">
              <%= username.substring(0,1) %>
            </div>
            <span class="font-semibold text-gray-200"><%= username %></span>
            <i class="fa-solid fa-chevron-down text-green-400"></i>
          </button>

          <div id="profileDropdown" class="hidden absolute right-0 mt-2 bg-gray-800 rounded-lg shadow-lg w-40 border border-green-600/40 z-50">
            <a href="profile.jsp" class="block px-4 py-2 hover:bg-green-600 hover:text-white">Profile</a>
            <a href="userLogout.jsp" class="block px-4 py-2 hover:bg-red-600 hover:text-white">Logout</a>
          </div>
        </div>
      <%
        } else {
      %>
      <!-- Buttons (if not logged in) -->
      <div class="flex flex-col md:flex-row md:space-x-3 space-y-3 md:space-y-0 mt-2 md:mt-0">
        <button onclick="openModal('signupModal')" 
                class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg font-semibold transition">
          Sign Up
        </button>
        <button onclick="openModal('loginModal')" 
                class="bg-transparent border border-green-400 hover:bg-green-500 hover:text-black px-4 py-2 rounded-lg font-semibold transition">
          Login
        </button>
        <button onclick="openModal('adminModal')" 
                class="bg-yellow-500 hover:bg-yellow-600 text-black px-4 py-2 rounded-lg font-semibold transition">
          Admin
        </button>
      </div>
      <%
        }
      %>
    </div>
  </div>
</nav>

<!-- ✅ Include this script directly here to ensure dropdown works -->
<script>
  // Mobile menu toggle
  const menuBtn = document.getElementById('menuBtn');
  const menu = document.getElementById('menu');
  if (menuBtn) {
    menuBtn.addEventListener('click', () => {
      menu.classList.toggle('hidden');
    });
  }

  // Profile dropdown toggle
  const profileBtn = document.getElementById('profileBtn');
  const profileDropdown = document.getElementById('profileDropdown');
  if (profileBtn) {
    profileBtn.addEventListener('click', () => {
      profileDropdown.classList.toggle('hidden');
    });

    // Hide dropdown on outside click
    document.addEventListener('click', (e) => {
      if (!profileBtn.contains(e.target) && !profileDropdown.contains(e.target)) {
        profileDropdown.classList.add('hidden');
      }
    });
  }

  // Modal open function
  function openModal(id) {
    const modal = document.getElementById(id);
    modal.classList.remove('hidden');
    document.body.classList.add('overflow-hidden');
  }

  // Modal close function
  function closeModal(id) {
    document.getElementById(id).classList.add('hidden');
    document.body.classList.remove('overflow-hidden');
  }
</script>
