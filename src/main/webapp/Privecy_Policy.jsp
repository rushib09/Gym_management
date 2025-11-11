<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Privacy Policy | Golden Fitness Gym</title>

  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #0F172A; /* Slate-900 */
      color: #E2E8F0; /* Slate-200 */
    }
  </style>
</head>

<body>

  <!-- Header -->
  <header class="py-6 shadow-xl">
    <div class="max-w-6xl mx-auto px-6">
      <h1 class="text-3xl font-extrabold text-white">Privacy Policy</h1>
      <p class="text-emerald-100">Your trust matters to us at Golden Fitness Gym.</p>
    </div>
  </header>

  <!-- Main Content -->
  <main class="max-w-6xl mx-auto px-6 py-12 space-y-8">

    <section class="bg-gray-800 rounded-xl shadow-lg p-8 leading-relaxed">
      <p>
        At <strong>Golden Fitness Gym</strong>, we are committed to protecting the privacy and security of our members, potential customers, and visitors.
        This Privacy Policy explains how we collect, use, share, and safeguard personal information when you interact with our services, visit our website, or use our facilities.
      </p>
    </section>

    <!-- Each Policy Section -->
    <section class="bg-gray-800 rounded-xl shadow-lg p-8">
      <h2 class="text-xl font-semibold text-emerald-400 mb-4">1. Information We Collect</h2>
      <p>We collect personal information that you provide to us directly, such as:</p>
      <ul class="list-disc ml-6 mt-2">
        <li>Name</li>
        <li>Email address</li>
        <li>Phone number</li>
        <li>Address</li>
        <li>Fitness goals and preferences</li>
      </ul>
    </section>

    <section class="bg-gray-800 rounded-xl shadow-lg p-8">
      <h2 class="text-xl font-semibold text-emerald-400 mb-4">2. How We Use Your Information</h2>
      <p>We use the information we collect to:</p>
      <ul class="list-disc ml-6 mt-2">
        <li>Provide and improve our gym services</li>
        <li>Process membership registrations and payments</li>
        <li>Send important updates and promotional offers</li>
        <li>Analyze usage trends and website performance</li>
        <li>Respond to customer inquiries and provide support</li>
      </ul>
    </section>

    <section class="bg-gray-800 rounded-xl shadow-lg p-8">
      <h2 class="text-xl font-semibold text-emerald-400 mb-4">3. How We Protect Your Information</h2>
      <p>We take your privacy seriously and use strong security measures including:</p>
      <ul class="list-disc ml-6 mt-2">
        <li>Monitoring systems for vulnerabilities</li>
        <li>Access limited to authorized personnel only</li>
        <li>Safeguards at our gym facilities</li>
      </ul>
    </section>

    <section class="bg-gray-800 rounded-xl shadow-lg p-8">
      <h2 class="text-xl font-semibold text-emerald-400 mb-4">4. Sharing Your Information</h2>
      <p>We do <strong>not</strong> sell or rent your personal information to third parties.</p>
    </section>

    <section class="bg-gray-800 rounded-xl shadow-lg p-8">
      <h2 class="text-xl font-semibold text-emerald-400 mb-4">5. Data Retention</h2>
      <p>We retain your information as long as necessary to fulfill the purposes outlined in this policy or as required by law.</p>
    </section>

    <section class="bg-gray-800 rounded-xl shadow-lg p-8">
      <h2 class="text-xl font-semibold text-emerald-400 mb-4">6. Updates to This Policy</h2>
      <p>We may update this Privacy Policy periodically. We will notify you via email or on our website if significant changes are made.</p>
    </section>

    <section class="bg-gray-800 rounded-xl shadow-lg p-8">
      <h2 class="text-xl font-semibold text-emerald-400 mb-4">7. Contact Us</h2>
      <p>If you have any questions or concerns about our Privacy Policy, please reach out to us:</p>

      <p class="mt-4"><strong>📞 Call:</strong> +91 9404808657</p>
      <p><strong>📍 Address:</strong> Sinhagad College, near Pollyhub, Vadgaon, Pune, Maharashtra - 411041</p>
    </section>

    <div class="text-center mt-10">
      <a href="<%= request.getContextPath() %>/index.jsp" class="px-6 py-3 bg-emerald-600 hover:bg-emerald-700 text-white rounded-lg">🏠 Back to Home</a>
    </div>

  </main>

  <!-- Footer -->
  <footer class="bg-gray-900 py-4 text-center text-gray-500 text-sm">
    © 2025 Golden Fitness Gym. All Rights Reserved.
  </footer>

</body>
</html>
