<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Membership Plans - Golden Fitness</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-gray-900 text-gray-100 font-sans">

<%@ include file="../navbar.jsp" %>

<%
    // ✅ Get logged-in username from session
    String loggedInUser = (String) session.getAttribute("username");
%>

<main class="max-w-6xl mx-auto px-6 py-20">

    <header class="text-center mb-16">
        <h1 class="text-4xl md:text-5xl font-extrabold text-green-400">Membership Plans</h1>
        <p class="text-gray-400 mt-3 max-w-2xl mx-auto">Choose a plan that fits your goals. Upgrade or cancel anytime.</p>
    </header>

    <section class="grid grid-cols-1 md:grid-cols-3 gap-8">

        <!-- ✅ Basic Plan -->
        <div class="bg-gray-800 rounded-2xl p-6 border border-green-600/10 shadow-lg">
            <h3 class="text-2xl font-bold text-white">Basic</h3>
            <p class="mt-4 text-gray-300 text-sm">Perfect for beginners</p>
            <p class="mt-4 text-4xl font-extrabold text-green-400">₹599</p>
            <p class="text-sm text-gray-400">/ Month</p>

            <ul class="mt-6 space-y-2 text-gray-300 text-sm">
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>Gym Floor Access</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>Locker Room Usage</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>Wi-Fi Access</li>
            </ul>

            <% if (loggedInUser != null) { %>
                <form action="<%=request.getContextPath()%>/PurchaseMembership" method="post" class="mt-6">
                    <input type="hidden" name="plan" value="Basic">
                    <input type="hidden" name="price" value="599">
                    <button type="submit" class="w-full bg-green-600 hover:bg-green-700 py-3 rounded-lg font-semibold">
                        Buy Basic
                    </button>
                </form>
            <% } else { %>
                <a href="<%=request.getContextPath()%>/index.jsp"
                   class="block w-full bg-gray-600 hover:bg-gray-700 py-3 rounded-lg text-center font-semibold mt-6">
                    Login to Buy
                </a>
            <% } %>
        </div>

        <!-- ✅ Standard Plan -->
        <div class="bg-gray-800 rounded-2xl p-6 border-2 border-green-500 shadow-2xl transform scale-102">
            <h3 class="text-2xl font-bold text-white">Standard</h3>
            <p class="mt-4 text-gray-300 text-sm">Most popular!</p>
            <p class="mt-4 text-4xl font-extrabold text-green-400">₹1499</p>
            <p class="text-sm text-gray-400">/ 3 Months</p>

            <ul class="mt-6 space-y-2 text-gray-300 text-sm">
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>All Basic Features</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>2 Free Personal Training Sessions</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>Group Fitness Classes</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>Priority Support</li>
            </ul>

            <% if (loggedInUser != null) { %>
                <form action="<%=request.getContextPath()%>/PurchaseMembership" method="post" class="mt-6">
                    <input type="hidden" name="plan" value="Standard">
                    <input type="hidden" name="price" value="1499">
                    <button type="submit" class="w-full bg-green-600 hover:bg-green-700 py-3 rounded-lg font-semibold">
                        Buy Standard
                    </button>
                </form>
            <% } else { %>
                <a href="<%=request.getContextPath()%>/index.jsp"
                   class="block w-full bg-gray-600 hover:bg-gray-700 py-3 rounded-lg text-center font-semibold mt-6">
                    Login to Buy
                </a>
            <% } %>
        </div>

        <!-- ✅ Premium Plan -->
        <div class="bg-gray-800 rounded-2xl p-6 border border-green-600/10 shadow-lg">
            <h3 class="text-2xl font-bold text-white">Premium</h3>
            <p class="mt-4 text-gray-300 text-sm">For serious fitness lovers</p>
            <p class="mt-4 text-4xl font-extrabold text-green-400">₹8999</p>
            <p class="text-sm text-gray-400">/ Year</p>

            <ul class="mt-6 space-y-2 text-gray-300 text-sm">
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>All Standard Features</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>Unlimited Personal Training</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>Personalized Diet Plan</li>
                <li><i class="fa-solid fa-check text-green-400 mr-2"></i>VIP Lounge Access</li>
            </ul>

            <% if (loggedInUser != null) { %>
                <form action="<%=request.getContextPath()%>/PurchaseMembership" method="post" class="mt-6">
                    <input type="hidden" name="plan" value="Premium">
                    <input type="hidden" name="price" value="8999">
                    <button type="submit" class="w-full bg-green-600 hover:bg-green-700 py-3 rounded-lg font-semibold">
                        Buy Premium
                    </button>
                </form>
            <% } else { %>
                <a href="<%=request.getContextPath()%>/index.jsp"
                   class="block w-full bg-gray-600 hover:bg-gray-700 py-3 rounded-lg text-center font-semibold mt-6">
                    Login to Buy
                </a>
            <% } %>
        </div>

    </section>
</main>

</body>
</html>
