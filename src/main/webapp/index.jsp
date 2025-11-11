<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Golden Fitness Gym - Home</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
      crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body class="bg-gray-900 text-gray-100 font-sans">

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

      <%-- User greeting (if logged in) --%>
      <%
        String username = (String) session.getAttribute("username");
        if (username != null) {
      %>
        <div class="relative mt-2 md:mt-0">
          <!-- Profile Circle -->
          <button id="profileBtn" class="flex items-center space-x-2 focus:outline-none">
            <div class="w-10 h-10 rounded-full bg-green-600 flex items-center justify-center font-bold text-white uppercase">
              <%= username.substring(0,1) %>
            </div>
            <span class="font-semibold"><%= username %></span>
            <i class="fa-solid fa-chevron-down text-green-400"></i>
          </button>

          <!-- Dropdown -->
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

<!-- ================= HERO SECTION ================= -->
<section class="relative bg-[url('<%=request.getContextPath()%>/images/carousel-1.jpg')] bg-cover bg-center h-[100vh] text-white mt-[70px]">
  <div class="absolute inset-0 bg-black/70"></div>
  <div class="relative z-10 flex flex-col justify-center items-center text-center h-full px-4">
    <h1 class="text-5xl md:text-6xl font-extrabold mb-4 drop-shadow-lg text-green-400">Transform Your Body & Mind</h1>
    <p class="text-lg mb-8 max-w-xl mx-auto text-gray-300">
      Join <span class="text-green-400 font-semibold">Golden Fitness Gym</span> — your path to strength, endurance, and a healthier life!
    </p>
    <div class="flex flex-wrap justify-center gap-4">
      <button onclick="openModal('signupModal')" 
              class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-lg font-semibold shadow-md transition">
        Join Now
      </button>
      <a href="https://wa.me/919404808657?text=Hi%20I%20want%20to%20know%20more%20about%20Golden%20Fitness%20Gym"
         class="border border-green-500 text-green-500 hover:bg-green-500 hover:text-white px-6 py-3 rounded-lg font-semibold transition shadow-md">
        Try Free Trial
      </a>
    </div>

    <a href="https://wa.me/919404808657?text=Hi%20I%20want%20to%20know%20more%20about%20Golden%20Fitness%20Gym" 
       target="_blank" 
       class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-lg font-semibold shadow-md transition transform hover:scale-110 flex items-center space-x-2 mt-10 duration-300">
      <i class="fa-brands fa-whatsapp text-xl"></i>
      <span>I Want to Know More on WhatsApp</span>
    </a>
  </div>
</section>

<!-- ================= ABOUT SECTION ================= -->
<section class="bg-gradient-to-br from-gray-900 via-gray-800 to-black py-20 px-6 md:px-16 lg:px-24">
  <div class="grid md:grid-cols-2 gap-12 items-center max-w-7xl mx-auto">
    <!-- Left Image Section -->
    <div class="relative group">
      <img src="<%=request.getContextPath()%>/images/about.jpg" 
           alt="About Our Gym" 
           class="rounded-2xl shadow-2xl w-full object-cover transform transition duration-500 group-hover:scale-105 opacity-90 hover:opacity-100">
      <div class="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent rounded-2xl"></div>
      <div class="absolute bottom-6 left-6 bg-green-600 text-white px-5 py-2 rounded-lg text-sm font-semibold shadow-lg">
        Trusted by 5000+ Members
      </div>
    </div>

    <!-- Right Text Section -->
    <div class="text-gray-300 space-y-6">
      <h2 class="text-4xl font-extrabold text-green-400 drop-shadow-lg">
        10+ Years of Fitness Excellence
      </h2>
      <p class="text-lg leading-relaxed text-gray-300">
        Our state-of-the-art gym offers <span class="text-green-400 font-semibold">certified trainers</span>, 
        <span class="text-green-400 font-semibold">modern equipment</span>, and customized programs designed 
        to help you achieve your personal fitness goals.  
      </p>
      <p class="text-gray-400">
        From strength training to yoga, our mission is to guide you towards a healthier, more confident version of yourself — 
        one workout at a time.
      </p>
      <a href="UserMembership.jsp" 
         class="inline-block bg-green-600 hover:bg-green-500 text-white px-8 py-3 rounded-xl font-semibold shadow-lg shadow-green-500/20 transition-all duration-300 transform hover:-translate-y-1">
        Explore Membership Plans
      </a>
    </div>
  </div>
</section>

<!-- ================= MEMBERSHIP INCLUDE ================= -->
<jsp:include page="UserMembership.jsp" />

<!-- ================= IMAGE SLIDER ================= -->
<jsp:include page="Slider.jsp" />

<!-- ================= FEATURES SECTION ================= -->
<section class="bg-gray-800 py-16">
  <div class="text-center mb-10">
    <p class="uppercase text-green-500 font-semibold">Why Choose Us</p>
    <h2 class="text-4xl font-bold text-white">Achieve Your Fitness Goals</h2>
  </div>
  <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-8 px-6 md:px-20">
    <div class="bg-gray-900 p-6 rounded-xl shadow-md text-center hover:scale-105 transition">
      <i class="fa-solid fa-dumbbell text-green-500 text-3xl mb-4"></i>
      <h3 class="font-bold mb-2">Modern Equipment</h3>
      <p class="text-gray-400 text-sm">State-of-the-art machines for all your strength and cardio needs.</p>
    </div>
    <div class="bg-gray-900 p-6 rounded-xl shadow-md text-center hover:scale-105 transition">
      <i class="fa-solid fa-user-tie text-green-500 text-3xl mb-4"></i>
      <h3 class="font-bold mb-2">Certified Trainers</h3>
      <p class="text-gray-400 text-sm">Professional trainers focused on your individual progress.</p>
    </div>
    <div class="bg-gray-900 p-6 rounded-xl shadow-md text-center hover:scale-105 transition">
      <i class="fa-solid fa-heartbeat text-green-500 text-3xl mb-4"></i>
      <h3 class="font-bold mb-2">Healthy Lifestyle</h3>
      <p class="text-gray-400 text-sm">Transform your body while maintaining a healthy lifestyle.</p>
    </div>
    <div class="bg-gray-900 p-6 rounded-xl shadow-md text-center hover:scale-105 transition">
      <i class="fa-solid fa-users text-green-500 text-3xl mb-4"></i>
      <h3 class="font-bold mb-2">Supportive Community</h3>
      <p class="text-gray-400 text-sm">A motivating fitness family that grows stronger together.</p>
    </div>
  </div>
</section>

<!-- ================= FOOTER ================= -->
<footer class="bg-black text-gray-400 py-10 px-6 md:px-20">
  <div class="grid sm:grid-cols-2 lg:grid-cols-4 gap-10 mb-8">
    <div>
      <h3 class="text-white font-semibold mb-4">Contact Us</h3>
      <p><i class="fa-solid fa-location-dot mr-2 text-green-500"></i> Sinhagad College, Vadgaon, Pune 411041</p>
      <p><i class="fa-solid fa-phone mr-2 text-green-500"></i> +91 9404808657</p>
      <p><i class="fa-solid fa-envelope mr-2 text-green-500"></i> contact@goldengym.in</p>
    </div>
    <div>
      <h3 class="text-white font-semibold mb-4">Quick Links</h3>
      <ul class="space-y-2">
        <li><a href="index.jsp" class="hover:text-green-400">Home</a></li>
        <li><a href="UserMembership.jsp" class="hover:text-green-400">Membership</a></li>
        <li><a href="FetchUserTrainer" class="hover:text-green-400">Trainers</a></li>
        <li><a href="Privecy_Policy.jsp" class="hover:text-green-400">Privecy&Policy</a></li>
      </ul>
    </div>
    <div>
      <h3 class="text-white font-semibold mb-4">Opening Hours</h3>
      <p>Mon - Fri: 6AM - 10PM</p>
      <p>Sat - Sun: 8AM - 8PM</p>
    </div>
    <div>
      <h3 class="text-white font-semibold mb-4">Follow Us</h3>
      <div class="flex space-x-4">
        <a href="https://www.instagram.com/rishhikeshh__" class="text-green-500 hover:text-white"><i class="fab fa-facebook"></i></a>
        <a href="https://x.com/rushikeshb208" class="text-green-500 hover:text-white"><i class="fab fa-x"></i></a>
        <a href="https://www.instagram.com/rishhikeshh__" class="text-green-500 hover:text-white"><i class="fab fa-instagram"></i></a>
        <a href="#" class="text-green-500 hover:text-white"><i class="fab fa-youtube"></i></a>
      </div>
    </div>
  </div>
  <p class="text-center text-sm text-gray-500">&copy; 2025 Golden Fitness Gym. All Rights Reserved.</p>
</footer>

<!-- ================= MODALS ================= -->
<div id="signupModal" class="modal hidden fixed inset-0 bg-black/70 z-50 flex items-center justify-center transition-opacity">
  <div class="bg-white rounded-2xl w-full max-w-lg shadow-2xl p-6 relative animate-fadeIn">
    <button onclick="closeModal('signupModal')" class="absolute top-3 right-4 text-gray-500 hover:text-red-600 text-2xl">&times;</button>
    <iframe src="signup.jsp" class="w-full h-[70vh] rounded-lg"></iframe>
  </div>
</div>

<div id="loginModal" class="modal hidden fixed inset-0 bg-black/70 z-50 flex items-center justify-center transition-opacity">
  <div class="bg-white rounded-2xl w-full max-w-lg shadow-2xl p-6 relative animate-fadeIn">
    <button onclick="closeModal('loginModal')" class="absolute top-3 right-4 text-gray-500 hover:text-red-600 text-2xl">&times;</button>
    <iframe src="user_login.jsp" class="w-full h-[70vh] rounded-lg"></iframe>
  </div>
</div>

<div id="adminModal" class="modal hidden fixed inset-0 bg-black/70 z-50 flex items-center justify-center transition-opacity">
  <div class="bg-white rounded-2xl w-full max-w-lg shadow-2xl p-6 relative animate-fadeIn">
    <button onclick="closeModal('adminModal')" class="absolute top-3 right-4 text-gray-500 hover:text-red-600 text-2xl">&times;</button>
    <iframe src="admin_login.jsp" class="w-full h-[70vh] rounded-lg"></iframe>
  </div>
</div>

<!-- ================= JS ================= -->
<script>
document.addEventListener('DOMContentLoaded', () => {

  const menuBtn = document.getElementById('menuBtn');
  const menu = document.getElementById('menu');
  if (menuBtn) {
    menuBtn.addEventListener('click', () => {
      menu.classList.toggle('hidden');
    });
  }

 
  const profileBtn = document.querySelector('#profileBtn');
  const profileDropdown = document.querySelector('#profileDropdown');
  if (profileBtn && profileDropdown) {
    profileBtn.addEventListener('click', () => {
      profileDropdown.classList.toggle('hidden');
    });

   
    document.addEventListener('click', (e) => {
      if (!profileBtn.contains(e.target) && !profileDropdown.contains(e.target)) {
        profileDropdown.classList.add('hidden');
      }
    });
  }
});


function openModal(id) {
  const modal = document.getElementById(id);
  modal.classList.remove('hidden');
  document.body.classList.add('overflow-hidden');
}
function closeModal(id) {
  document.getElementById(id).classList.add('hidden');
  document.body.classList.remove('overflow-hidden');
}
</script>

<style>
@keyframes fadeIn {
  from { opacity: 0; transform: scale(0.9); }
  to { opacity: 1; transform: scale(1); }
}
.animate-fadeIn { animation: fadeIn 0.3s ease-out; }
</style>

</body>
</html>
