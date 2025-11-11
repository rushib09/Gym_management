<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Gym Gallery Slider</title>

<!-- TailwindCSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Swiper CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

<style>
  .swiper {
    width: 100%;
    padding-top: 50px;
    padding-bottom: 70px;
  }
  .swiper-slide {
    background: #111;
    width: 350px;
    height: 480px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 18px;
    overflow: hidden;
    transition: 0.4s ease-in-out;
  }
  .swiper-slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0.85;
    transition: 0.4s ease-in-out;
  }
  .swiper-slide-active img {
    opacity: 1;
    transform: scale(1.07);
  }
  .swiper-button-next,
  .swiper-button-prev {
    color: #22c55e;
    scale: 1.3;
    font-weight: bold;
  }
  .swiper-pagination-bullet-active {
    background: #22c55e !important;
  }
</style>

</head>
<body class="bg-gray-900 text-gray-100">

<section class="py-14">
  <h2 class="text-center text-4xl font-bold text-green-400 mb-8">Gym Gallery</h2>

  <div class="swiper mySwiper max-w-7xl mx-auto">
    <div class="swiper-wrapper">

      <!-- Gym Images -->
      <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider1.jpg" />
      </div>
      <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider2.jpg" />
      </div>
      <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider3.jpg" />
      </div>
      <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider4.jpg" />
      </div>
      <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider5.jpg" />
      </div>
       <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider6.jpg" />
      </div>
       <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider7.jpg" />
      </div>
       <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider6.jpg" />
      </div>
       <div class="swiper-slide">
        <img src="<%=request.getContextPath()%>/images/slider3.jpg" />
      </div>

    </div>

    <!-- Navigation + Pagination -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>

  </div>
</section>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<script>
var swiper = new Swiper(".mySwiper", {
	  effect: "coverflow",
	  grabCursor: true,
	  centeredSlides: true,
	  slidesPerView: "auto",
	  loop: true,
	  speed: 700, // Increased speed for smoother transition
	  coverflowEffect: {
	    rotate: 0,
	    stretch: 0,
	    depth: 200,  // Reduced depth for less jumpiness
	    modifier: 1.5,
	    slideShadows: false,
	  },
	  autoplay: {
	    delay: 2200,  // Slightly slower autoplay
	    disableOnInteraction: false,
	  },
	  pagination: {
	    el: ".swiper-pagination",
	    clickable: true,
	    dynamicBullets: true,
	  },
	  navigation: {
	    nextEl: ".swiper-button-next",
	    prevEl: ".swiper-button-prev",
	  },
	});

</script>

</body>
</html>
