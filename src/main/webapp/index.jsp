<%@ page import="model.Pizza"%>
<%@ page import="model.User"%>
<%@ page import="dao.PizzaDao"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.ArrayList"%>

<%
// Create an instance of PizzaDao
PizzaDao pizzaDao = new PizzaDao();

// Retrieve the list of pizzas
List<Pizza> pizzas = pizzaDao.getAllPizzas();
%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- Basic Page Needs -->
<title>Pizzon</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS -->
<link type="image/x-icon" href="images/favicon.png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>


	<!-- Preloader Start -->
	<div id="preloader" class="preloader">
		<div class="preloader-box">
			<img src="images/preloader.svg" alt="preloader">
		</div>
	</div>
	<!-- Preloader End -->


		<%@include file="/includes/navbar.jsp"%>
	
	<!-- Header End -->


	<!-- Start Of Main Div -->
	<main class="main">

		<!-- Start Of Home Banner -->
		<section class="home-banner left-padding overflow-h">
			<div class="black-jamun wow fadeInLeft animation-delay-5">
				<img src="images/black-jamun.png" alt="Vacter Image">
			</div>
			<div class="home-onion wow fadeInUp animation-delay-5">
				<img src="images/onion.png" alt="Vacter Image">
			</div>
			<div class="row align-items-center">
				<div
					class="col-xl-5 col-lg-6 col-md-6 home-left-content wow fadeInLeft">
					<div class="home-banner-content">
						<h1 class="home-banner-title">
							Handmade, With an Extra Pinch of <span>Love</span>
						</h1>
						<div class="home-banner-desc">
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry.</p>
						</div>
						<a href="shop-list.html" class="btn-ct btn-large"><img
							src="images/cart-icon-white.png" alt="Cart Icon"> Order Now</a>
					</div>
				</div>
				<div class="col-xl-7 col-lg-6 col-md-6 home-right-img">
					<div class="home-banner-img">
						<div class="home-img wow fadeInRight animation-delay-5">
							<div class="home-img-1">
								<img src="images/banner-img.png" alt="banner-img">
							</div>
							<div class="home-leaf">
								<img src="images/home-leaf.png" alt="home-leaf">
							</div>
						</div>
						<div class="home-img-bottom wow fadeInUp animation-delay-5">
							<img src="images/banner-img-bottom.png" alt="banner-img-bottom">
						</div>
						<div class="slider-round-box wow fadeInRight">
							<div class="slider-round">
								<span class="slider-round-line"></span>
								<div class="buy-one-get">
									<img src="images/buy-one-get.png" alt="Vacter Image">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Of Home Banner -->


		<!-- Start Of Daily Fresh -->
		<section class="daily-fresh mb-150 overflow-h">
			<div class="daily-fresh-inner">
				<div class="fresh-img wow fadeInLeft">
					<img src="images/daily-fresh.png" alt="Daily Fresh">
				</div>
				<div class="fresh-content wow fadeInUp">
					<h3 class="title">Daily fresh and always tasty</h3>
					<div class="fresh-des">
						<p>There are many variations of passages of Lorem Ipsum
							available, but the majority haved</p>
					</div>
				</div>
			</div>
			<div class="daily-fresh-vacter wow fadeInUp animation-delay-5">
				<img src="images/daily-fresh-vacter.png" alt="Vacter icon">
			</div>
		</section>
		<!-- End Of Daily Fresh -->


		<!-- Start Of Our Menu -->
		<section class="our-menu position-r mb-150">
			<div class="our-menu-vacter wow fadeInRight">
				<img src="images/tamato.png" alt="Vacter Image">
			</div>
			<div class="container">
				<div class="section-heading wow fadeInLeft">
					<h5 class="sub-title">Popular Dishes</h5>
					<h2>Browse Our Menu</h2>
				</div>
			</div>
			<div class="wow fadeInLeft">
				<div class="our-menu-content right-padding">
					<div class="menu-slider owl-carousel">
						<%
						for (Pizza pizza : pizzas) {
						%>
						<div class="menu-item-box rotate-img">
							<div class="menu-item-img">
								<a href="shop-detail.jsp?id=<%=pizza.getId()%>"><img
									src="images/<%=pizza.getImage()%>" alt="Menu Image"></a>
							</div>
							<div class="menu-item-info">
								<div class="menu-item-head">
									<div class="menu-item-title">
										<h5>
											<a href="shop-detail.jsp?id=<%=pizza.getId()%>"><%=pizza.getName()%></a>
										</h5>
									</div>
									<div class="menu-item-price">
										<span><%=pizza.getPrix()%></span>
									</div>

								</div>
								<div class="item-rating">
									<!-- Your rating HTML here -->
								</div>
								<div class="menu-item-des">
									<p><%=pizza.getDescription()%></p>
								</div>
								<div class="menu-item-order">
									<a href="shop-detail.jsp?id=<%=pizza.getId()%>"
										class="btn-ct btn-small"><img
										src="images/cart-icon-white.png" alt="Cart Icon"> Order
										Now</a>
								</div>
							</div>
						</div>
						<%
						}
						%>

					</div>



				</div>
			</div>
		</section>
		<!-- End Of Our Menu -->


		<!-- Start Of Our Story -->
		<section class="our-story right-padding position-r mb-150 overflow-h">
			<div class="black-jamun wow fadeInLeft animation-delay-5">
				<img src="images/black-jamun.png" alt="Vacter Image">
			</div>
			<div class="story-onion wow fadeInUp">
				<img src="images/onion.png" alt="Vacter Image">
			</div>
			<div class="our-story-inner">
				<div class="row align-items-center">
					<div class="col-xl-7 col-lg-7 col-md-12 wow fadeInLeft order-md_2">
						<div class="story-img text-center">
							<img src="images/our-story.png" alt="Our Story">
						</div>
					</div>
					<div class="col-xl-5 col-lg-5 col-md-12 wow fadeInRight order-md_1">
						<div class="section-heading section-heading-right">
							<h5 class="sub-title">Our Story</h5>
							<h2>The Pizzon Has Excellent Of Quality Foods</h2>
						</div>
						<div class="story-content md-mb-40">
							<div class="our-story-desc">
								<p>Lorem Ipsum is simply dummy text of the printing and
									typesetting industry. Lorem Ipsum has been the industry's
									standard dummy text ever since the 1500s, when an unknown
									printer took a galley of type and scrambled it to make a type
									specimen book. It has survived not only five centuries, but
									also the leap into electronic typesetting, remaining
									essentially unchanged.</p>
							</div>
							<a href="about.html" class="btn-ct right-arrow">Read More <img
								src="images/right.png" alt="right icon"></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Of Our Story -->


		<!-- Start Of Our Strength -->
		<section
			class="our-strength position-r pt-150 pb-120 mb-150 bg-yellow overflow-h">
			<div class="strength-vacter wow fadeInRight animation-delay-5">
				<img src="images/strength-vacter.png" alt="Vacter Image">
			</div>
			<div class="container">
				<div class="section-heading wow fadeInUp">
					<h5 class="sub-title">Our Strength</h5>
					<h2>Why We Are The Best?</h2>
				</div>
				<div class="row">
					<div class="col-xl-3 col-lg-6 col-md-6 strength-box wow fadeInUp">
						<div class="strength-icon">
							<img src="images/all-kinds-of-foods.png" alt="All kinds of Foods">
						</div>
						<div class="strength-content">
							<h4 class="strength-title">All kinds of Foods</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and type
								setting industry.</p>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 strength-box wow fadeInUp">
						<div class="strength-icon">
							<img src="images/fresh-foods.png" alt="Fresh Foods">
						</div>
						<div class="strength-content">
							<h4 class="strength-title">Fresh Foods</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and type
								setting industry.</p>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 strength-box wow fadeInUp">
						<div class="strength-icon">
							<img src="images/best-taste.png" alt="Best Taste">
						</div>
						<div class="strength-content">
							<h4 class="strength-title">Best Taste</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and type
								setting industry.</p>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 strength-box wow fadeInUp">
						<div class="strength-icon">
							<img src="images/on-time-delivery.png" alt="On Time Delivery">
						</div>
						<div class="strength-content">
							<h4 class="strength-title">On Time Delivery</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and type
								setting industry.</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Of Our Strength -->


		<!-- Start Of Feedback Part -->
		<section class="feeddback-part position-r mb-150 overflow-h">
			<div class="feeddback-vacter wow fadeInLeft animation-delay-5">
				<img src="images/leaf.png" alt="Vacter Image">
			</div>
			<div class="container">
				<div class="section-heading wow fadeInUp">
					<h5 class="sub-title">Customer Feedback</h5>
					<h2>Client Testimonials</h2>
				</div>

				<div class="testimonials-slider owl-carousel wow fadeInUp">
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-1.jpg" alt="Johan Doe">
						</div>
						<div class="client-info">
							<div class="client-name">Johan Doe</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-2.jpg" alt="Alex Saanu">
						</div>
						<div class="client-info">
							<div class="client-name">Alex Saanu</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-3.jpg" alt="Jona Leoner">
						</div>
						<div class="client-info">
							<div class="client-name">Jona Leoner</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-4.jpg" alt="Takar Bowa">
						</div>
						<div class="client-info">
							<div class="client-name">Takar Bowa</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-1.jpg" alt="Johan Doe">
						</div>
						<div class="client-info">
							<div class="client-name">Johan Doe</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-2.jpg" alt="Alex Saanu">
						</div>
						<div class="client-info">
							<div class="client-name">Alex Saanu</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-3.jpg" alt="Jona Leoner">
						</div>
						<div class="client-info">
							<div class="client-name">Jona Leoner</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="testimonial-box">
						<div class="client-image">
							<img src="images/client-4.jpg" alt="Takar Bowa">
						</div>
						<div class="client-info">
							<div class="client-name">Takar Bowa</div>
							<div class="client-desc">
								<p>“Lorem Ipsum is simply dummy text of the print book. It
									has survived not only five centuries, but also the leap”</p>
							</div>
							<div class="testimonial-rating">
								<ul>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
									<li><i class="fa fa-star" aria-hidden="true"></i></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Of Feedback Part -->


		<!-- Start Of Reservation Part -->
		<section
			class="reservation-part left-padding mb-150 position-r overflow-h">
			<div class="row align-items-center">
				<div class="col-xl-5 col-lg-6 col-md-12">
					<div class="section-heading section-heading-left wow fadeInLeft">
						<h5 class="sub-title">Reservation</h5>
						<h2>Book A Table Now!</h2>
					</div>
					<form class="book-form md-mb-40 wow fadeInLeft">
						<div class="row">
							<div class="col-xl-6 col-lg-6 col-md-6">
								<div class="form-group">
									<input type="text" name="text" class="form-control"
										placeholder="Name*" required>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6">
								<div class="form-group">
									<input type="text" name="text" class="form-control"
										placeholder="Email*" required>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6">
								<div class="form-group">
									<input type="text" name="text" class="form-control"
										placeholder="Phone*" required>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6">
								<div class="form-group">
									<input type="text" name="text" class="form-control"
										placeholder="Time*" required>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6">
								<div class="form-group">
									<input type="text" name="text" class="form-control"
										placeholder="Date*" required>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6">
								<div class="form-group">
									<input type="text" name="text" class="form-control"
										placeholder="Guest*" required>
								</div>
							</div>
							<div class="form-button">
								<button class="btn-ct">Book Now</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-xl-7 col-lg-6 col-md-12 text-center">
					<div class="reservation-pizza position-r wow fadeInRight">
						<div class="book-leaf book-leaf-1">
							<img src="images/leaf-1.png" alt="Leaf">
						</div>
						<div class="book-leaf book-leaf-2">
							<img src="images/leaf-2.png" alt="Leaf">
						</div>
						<div class="book-leaf book-leaf-3">
							<img src="images/leaf-3.png" alt="Leaf">
						</div>
						<img src="images/reservation-pizza.png" class="position-r"
							alt="Pizza">
					</div>
				</div>
			</div>
			<div class="book-jamun wow fadeInRight animation-delay-5">
				<img src="images/book-jamun.png" alt="Jamun">
			</div>
			<div class="book-leaf-big wow fadeInRight animation-delay-5">
				<img src="images/book-leaf.png" alt="Leaf">
			</div>
		</section>
		<!-- End Of Reservation Part -->


		<!-- Start Of Our Blog -->
		<section class="our-blog mb-150 overflow-h">
			<div class="container">
				<div class="section-heading wow fadeInUp">
					<h5 class="sub-title">From Our Blog</h5>
					<h2>Our Latest News</h2>
				</div>
				<div class="row">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="blog-singel-list wow fadeInLeft">
							<div class="blog-img">
								<a href="blog-detail.html"><img src="images/blog-1.jpg"
									alt="Blog Image"></a>
							</div>
							<div class="blog-list-content">
								<div class="blog-date">
									<span>07 Mar 2022 </span>
								</div>
								<h5 class="blog-title">
									<a href="blog-detail.html">How to keep fear from ruining
										your art business with confident</a>
								</h5>
								<div class="blog-author">
									<div class="author">
										<div class="author-detail">
											<div class="author-img">
												<img src="images/blog-author.png" alt="David Milar">
											</div>
											<div class="author-name">
												<h6>David Milar</h6>
												<span class="author-location">London, United Kindom</span>
											</div>
										</div>
									</div>
									<div class="read-link">
										<a href="blog-detail.html" class="read-more">Read More <img
											src="images/right-arrow-red.png" alt="Right Arrow"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="blog-list-box wow fadeInRight">
							<div class="blog-list-row">
								<div class="row align-items-center">
									<div class="col-xl-6 col-lg-7 col-md-12">
										<div class="blog-img">
											<a href="blog-detail.html"><img src="images/blog-2.jpg"
												alt="Blog Image"></a>
										</div>
									</div>
									<div class="col-xl-6 col-lg-5 col-md-12">
										<div class="blog-date">
											<span>07 Mar 2022 </span>
										</div>
										<h6 class="blog-title">
											<a href="blog-detail.html">How to keep fear from ruining
												your art business with confident</a>
										</h6>
										<a href="blog-detail.html" class="read-more">Read More <img
											src="images/right-arrow-red.png" alt="Right Arrow"></a>
									</div>
								</div>
							</div>
							<div class="blog-list-row">
								<div class="row align-items-center">
									<div class="col-xl-6 col-lg-7 col-md-12">
										<div class="blog-img">
											<a href="blog-detail.html"><img src="images/blog-3.jpg"
												alt="Blog Image"></a>
										</div>
									</div>
									<div class="col-xl-6 col-lg-5 col-md-12">
										<div class="blog-date">
											<span>07 Mar 2022 </span>
										</div>
										<h6 class="blog-title">
											<a href="blog-detail.html">How to keep fear from ruining
												your art business with confident</a>
										</h6>
										<a href="blog-detail.html" class="read-more">Read More <img
											src="images/right-arrow-red.png" alt="Right Arrow"></a>
									</div>
								</div>
							</div>
							<div class="blog-list-row">
								<div class="row align-items-center">
									<div class="col-xl-6 col-lg-7 col-md-12">
										<div class="blog-img">
											<a href="blog-detail.html"><img src="images/blog-4.jpg"
												alt="Blog Image"></a>
										</div>
									</div>
									<div class="col-xl-6 col-lg-5 col-md-12">
										<div class="blog-date">
											<span>07 Mar 2022 </span>
										</div>
										<h6 class="blog-title">
											<a href="blog-detail.html">How to keep fear from ruining
												your art business with confident</a>
										</h6>
										<a href="blog-detail.html" class="read-more">Read More <img
											src="images/right-arrow-red.png" alt="Right Arrow"></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Of Our Blog -->

	</main>
	<!-- End Of Main Div -->


	<!-- Start Of Footer -->
	<footer>
		<div class="footer ptb-100 bg-yellow position-r overflow-h">
			<div class="footer-pattern-1 wow fadeInLeft animation-delay-5">
				<img src="images/logo.png" alt="logo">
			</div>
			<div class="footer-pattern-2 wow fadeInRight animation-delay-5">
				<img src="images/footer-pattern.png" alt="footer-pattern">
			</div>
			<div class="container">
				<div class="row">
					<div class="col-xl-3 col-lg-6 col-md-6 footer-box wow fadeInUp">
						<h6 class="footer-title text-uppercase">Information</h6>
						<ul class="footer-menu">
							<li><a href="index.html">Home</a></li>
							<li><a href="blog-left.html">Blog</a></li>
							<li><a href="about.html">About Us</a></li>
							<li><a href="our-menu.html">Menu</a></li>
							<li><a href="contact-us.html">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 footer-box wow fadeInUp">
						<h6 class="footer-title text-uppercase">Top Items</h6>
						<ul class="footer-menu">
							<li><a href="#">Pepperoni</a></li>
							<li><a href="#">Swiss Mushroom</a></li>
							<li><a href="#">Barbeque Chicken</a></li>
							<li><a href="#">Vegetarian</a></li>
							<li><a href="#">Ham & Cheese</a></li>
						</ul>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 footer-box wow fadeInUp">
						<h6 class="footer-title text-uppercase">Others</h6>
						<ul class="footer-menu">
							<li><a href="checkout.html">Checkout</a></li>
							<li><a href="cart.html">Cart</a></li>
							<li><a href="#">Product</a></li>
							<li><a href="#">Locations</a></li>
							<li><a href="#">Legal</a></li>
						</ul>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 footer-box wow fadeInUp">
						<h6 class="footer-title text-uppercase">Social Media</h6>
						<ul class="footer-social">
							<li><a href="#" class="facebook"><i
									class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#" class="pinterest"><i
									class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"
									aria-hidden="true"></i></a></li>
							<li><a href="#" class="instagram"><i
									class="fa fa-instagram" aria-hidden="true"></i></a></li>
						</ul>
						<div class="footer-offers-text">
							<p>Signup and get exclusive offers and coupon codes</p>
						</div>
						<div class="footer-sign-up">
							<a href="#" class="btn-ct btn-small">Sign Up</a>
						</div>
					</div>
					<div class="col-xl-12 col-lg-12 col-md-12 terms-menu">
						<div class="row align-items-center">
							<div class="col-xl-8 col-lg-9 col-md-12 wow fadeInLeft">
								<ul class="policy-menu">
									<li><a href="#">Privacy Policy</a></li>
									<li><a href="#">Refund Policy</a></li>
									<li><a href="#">Cookie Policy</a></li>
									<li><a href="#">Terms & Conditions</a></li>
								</ul>
							</div>
							<div class="col-xl-4 col-lg-3 col-md-12 wow fadeInRight">
								<ul class="app-list">
									<li><a href="#"><img src="images/google-play.png"
											alt="Google Play"></a></li>
									<li><a href="#"><img src="images/app-stor.png"
											alt="App Stor"></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="text-center">
					<p>
						&#169; 2023 Pizzon. All Rights Reserved by <a href="#">Templatescoder</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Of Footer -->


	<!-- Start Of Search Popup -->
	<div class="search-popup">
		<div class="search-overlay"></div>
		<div class="search-form">
			<button class="close"></button>
			<form>
				<input type="text" name="search"
					placeholder="What are you looking for?" class="search-input">
				<button type="submit">
					<img src="images/search-icon-white.png" alt="Search Icon">
				</button>
			</form>
		</div>
	</div>
	<!-- End Of Search Popup -->


	<!-- Start Of Cart Drawer -->
	<div class="cart-drawer">
		<div class="bg-overlay"></div>
		<div class="drawer-content">
			<div class="w-100">
				<div class="cart-header">
					<h6 class="title text-uppercase">SHOPPING CART</h6>
					<button class="close"></button>
				</div>
				<div class="cart-list">
					<div class="cart-list-inner">
						<div class="cart-item">
							<div class="item-image">
								<a href="shop-detail.html"><img src="images/pizza-1.png"
									alt="Item Image"></a>
							</div>
							<div class="item-detl">
								<div class="item-name">
									<a href="shop-detail.html">Shrimp pizza</a> <a
										class="item-remove" href="#"><img src="images/delete.png"
										alt="delete"></a>
								</div>
								<div class="item-price">
									<span>$35.00</span>
								</div>
								<div class="quantity-editer">
									<div class="quantity">
										<button type="button" class="sub minus">-</button>
										<input class="count" name="quantity" type="number" value="1"
											min="1" max="10">
										<button type="button" class="add plus">+</button>
									</div>
								</div>
							</div>
						</div>
						<div class="cart-item">
							<div class="item-image">
								<a href="shop-detail.html"><img src="images/pizza-2.png"
									alt="Item Image"></a>
							</div>
							<div class="item-detl">
								<div class="item-name">
									<a href="shop-detail.html">Seafood pizza</a> <a
										class="item-remove" href="#"><img src="images/delete.png"
										alt="delete"></a>
								</div>
								<div class="item-price">
									<span>$65.00</span>
								</div>
								<div class="quantity-editer">
									<div class="quantity">
										<button type="button" class="sub minus">-</button>
										<input class="count" name="quantity" type="number" value="1"
											min="1" max="10">
										<button type="button" class="add plus">+</button>
									</div>
								</div>
							</div>
						</div>
						<div class="cart-item">
							<div class="item-image">
								<a href="shop-detail.html"><img src="images/pizza-3.png"
									alt="Item Image"></a>
							</div>
							<div class="item-detl">
								<div class="item-name">
									<a class="item-title" href="shop-detail.html">Cheese pizza</a>
									<a class="item-remove" href="#"><img
										src="images/delete.png" alt="delete"></a>
								</div>
								<div class="item-price">
									<span>$45.00</span>
								</div>
								<div class="quantity-editer">
									<div class="quantity">
										<button type="button" class="sub minus">-</button>
										<input class="count" name="quantity" type="number" value="1"
											min="1" max="10">
										<button type="button" class="add plus">+</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cart-footer">
				<div class="sub-total">
					<strong>Subtotal:</strong> <span class="sprice">$66.70</span>
				</div>
				<div class="cart-footer-des">
					<p>Taxes and shipping calculated at checkout</p>
				</div>
				<div class="cart-button">
					<ul>
						<li><a href="cart.html" class="btn-ct btn-small">View
								Cart</a></li>
						<li><a href="checkout.html" class="btn-ct btn-small subtotal">Checkout</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- End Of Cart Drawer -->


	<!-- Start Of Js -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/animation.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/pizzon.js"></script>
</body>
</html>