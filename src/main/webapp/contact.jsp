<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Contact Us | Golden Fitness Gym</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

  <style>
    body {
      font-family: "Poppins", sans-serif;
      background: linear-gradient(135deg, #0f172a, #1e293b);
      color: #e2e8f0;
    }

    .card {
      background: rgba(30, 41, 59, 0.9);
      backdrop-filter: blur(6px);
      border: 1px solid rgba(255, 255, 255, 0.1);
      box-shadow: 0 8px 30px rgba(0,0,0,0.3);
      border-radius: 18px;
      transition: transform 0.3s ease;
    }
    .card:hover { transform: translateY(-4px); }

    .input-field {
      background-color: rgba(15, 23, 42, 0.9);
      border: 1px solid #334155;
      border-radius: 8px;
      color: #e2e8f0;
    }
    .input-field:focus {
      border-color: #10b981;
      box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.35);
      outline: none;
    }

    #toast {
      position: fixed;
      top: 20px;
      right: 20px;
      background: #10b981;
      color: white;
      padding: 12px 20px;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.3);
      opacity: 0;
      display: none;
      z-index: 100;
      transition: opacity 0.5s ease;
    }
  </style>
</head>

<body>

<!-- ✅ Toast Message -->
<div id="toast">✅ Message sent successfully!</div>

<!-- ✅ Header with Home Button -->
<header class="w-full bg-gray-800/90 backdrop-blur-md shadow-md py-4 sticky top-0 z-50">
  <div class="max-w-7xl mx-auto flex justify-between items-center px-6">
    <h2 class="text-lg font-semibold text-emerald-400">Golden Fitness Gym</h2>
    <a href="<%= request.getContextPath() %>/index.jsp"
       class="px-4 py-2 bg-emerald-500 hover:bg-emerald-600 text-white rounded-lg shadow-md font-medium transition">
      <i class="fa-solid fa-house mr-2"></i> Home
    </a>
  </div>
</header>

<!-- ✅ Main Section -->
<section class="max-w-7xl mx-auto px-6 py-20 grid lg:grid-cols-2 gap-12">

  <!-- ✅ Contact Form -->
  <div class="card p-10">
    <h2 class="text-3xl font-bold text-emerald-400 mb-6 flex items-center gap-3">
      <i class="fa-solid fa-paper-plane"></i> Send Us a Message
    </h2>

    <form action="<%= request.getContextPath() %>/contactForm" method="post" class="space-y-6" id="contactForm">
      <div>
        <label class="block mb-1 font-semibold">Full Name</label>
        <input type="text" name="name" class="input-field w-full px-4 py-2" placeholder="Rushikesh halerao" required>
      </div>

      <div>
        <label class="block mb-1 font-semibold">Email Address</label>
        <input type="email" name="email" class="input-field w-full px-4 py-2" placeholder="rushikesh@mail.com" required>
      </div>

      <div>
        <label class="block mb-1 font-semibold">Subject</label>
        <input type="text" name="subject" class="input-field w-full px-4 py-2" placeholder="Inquiry about membership" required>
      </div>

      <div>
        <label class="block mb-1 font-semibold">Message</label>
        <textarea name="message" class="input-field w-full px-4 py-2" rows="5" placeholder="Write your message..." required></textarea>
      </div>

      <button type="submit" class="w-full py-3 bg-emerald-500 hover:bg-emerald-600 rounded-lg font-semibold shadow-lg transition">
        Send Message <i class="fa-solid fa-arrow-right ml-2"></i>
      </button>
    </form>
  </div>

  <!-- ✅ Details, Map, Social etc. -->
  <div class="space-y-8">

    <!-- Map -->
    <div class="card overflow-hidden shadow-lg">
      <iframe class="w-full h-64 md:h-72" 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3783.721660712799!2d73.8331075!3d18.4651144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc295ec2e5402eb%3A0x6af4d1bbb943fb9d!2sPolyHub!5e0!3m2!1sen!2sin!4v1730972631909!5m2!1sen!2sin"
        style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
      </iframe>
    </div>

    <!-- Info -->
    <div class="card p-8 space-y-5">
      <h3 class="text-2xl font-bold text-emerald-400"><i class="fa-solid fa-location-dot"></i> Visit Us</h3>
      <ul class="space-y-3 text-lg">
        <li><i class="fa-solid fa-map-pin text-emerald-400 mr-2"></i> Sinhagad College, Vadgaon, Pune 411041</li>
        <li><i class="fa-solid fa-phone text-emerald-400 mr-2"></i> +91 9404808657</li>
        <li><i class="fa-solid fa-envelope text-emerald-400 mr-2"></i> support@goldenfitness.in</li>
        <li><i class="fa-solid fa-clock text-emerald-400 mr-2"></i> Mon - Sun: 5:30 AM - 11:00 PM</li>
      </ul>
    </div>

    <!-- Social -->
    <div class="flex gap-5 justify-start">
      <a href="https://www.instagram.com/rishhikeshh__" class="p-4 bg-gray-800 rounded-xl hover:scale-110 transition">
        <i class="fa-brands fa-instagram text-pink-500 text-3xl"></i>
      </a>
      <a href="https://www.instagram.com/rishhikeshh__" class="p-4 bg-gray-800 rounded-xl hover:scale-110 transition">
        <i class="fa-brands fa-facebook text-blue-500 text-3xl"></i>
      </a>
      <a href="https://wa.me/9404808657" class="p-4 bg-gray-800 rounded-xl hover:scale-110 transition">
        <i class="fa-brands fa-whatsapp text-green-500 text-3xl"></i>
      </a>
    </div>

  </div>
</section>

<!-- Footer -->
<footer class="bg-gray-900 py-6 text-center text-gray-400">
  © 2025 Golden Fitness Gym. All rights reserved.
</footer>

<!-- ✅ Toast Trigger After Success -->
<script>
  <% if ("1".equals(request.getParameter("success"))) { %>
  const toast = document.getElementById("toast");
  toast.style.display = "block";
  toast.style.opacity = "1";
  setTimeout(() => {
    toast.style.opacity = "0";
    setTimeout(() => { toast.style.display = "none"; }, 500);
  }, 3000);
  <% } %>
</script>

</body>
</html>
