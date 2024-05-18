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
String pizzaIdStr = request.getParameter("id");
int pizzaId = Integer.parseInt(pizzaIdStr);

// Retrieve the selected pizza from the PizzaDao using the id
Pizza selectedPizza = pizzaDao.getPizza(pizzaId);
%>
<!DOCTYPE html>
<html lang="zxx">
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
<link rel="stylesheet" type="text/css" href="css/glass-case.css">
<link rel="stylesheet" type="text/css" href="css/magnific-popup.css">
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

	<!-- Header Start -->
			<%@include file="/includes/navbar.jsp"%>
	
	<!-- Header End -->


	<!-- Start Of Main Div -->
	<main>

		<!-- Start Of Sub Banner -->
		<section class="sub-banner bg-yellow overflow-h position-r">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="sub-banner-content wow fadeInLeft">
							<h1 class="sub-banner-title">Shop Detail</h1>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry.</p>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="bread-crumb wow fadeInRight">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li>Shop Detail</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="black-jamun wow fadeInLeft animation-delay-5">
				<img src="images/black-jamun.png" alt="black-jamun">
			</div>

			<div class="onion-img wow fadeInUp animation-delay-6">
				<img src="images/onion.png" alt="onion">
			</div>

			<div class="tamato-img wow fadeInUp animation-delay-7">
				<img src="images/tamato.png" alt="tamato">
			</div>

			<div class="leaf-img wow fadeInRight animation-delay-8">
				<img src="images/banner-leaf.png" alt="banner-leaf">
			</div>
		</section>
		<!-- End Of Sub Banner -->


		<!-- Start Of Shop Detail -->

		<section class="shop-detail ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-xl-6 col-lg-6 col-md-12 md-mb-40">
						<div class="glasscase-main">
							<ul id="glasscase" class="gc-start">
								<%
								for (Pizza pizza : pizzas) {
								%>
								<li><a href="shop-detail.jsp?id=<%=pizza.getId()%>"><img
										src="images/<%=pizza.getImage()%>" alt="<%=pizza.getName()%>"></a></li>
								<%
								}
								%>
							</ul>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="product-detail">
							<%-- Your product details will be dynamically loaded here based on the selected pizza --%>
							<h2 class="product-title"><%=selectedPizza.getName()%></h2>
							<div class="product-price">
								<div class="price">
									<span><%=selectedPizza.getPrix()%></span>
								</div>
								<div class="rating-summary-block">
									<%-- Rating summary HTML here --%>
								</div>
							</div>

							<div class="product-description">
								<p><%=selectedPizza.getDescription()%></p>
								<%-- Additional product description can be added here --%>
							</div>


							<div class="add-cart-box">
								<%-- Add to cart button and other actions can be included here --%>
							</div>
							<div class="add-cart-box">
								<div class="add-cart-box">
								<form action="AddToCart" method="post">
									<input type="hidden" name="pizzaId"
										value="<%=selectedPizza.getId()%>" />
									<div class="number">
										<input type="number" name="quantity" value="1" min="1">
										<span class="minus"><i class="fa fa-angle-down"
											aria-hidden="true"></i></span> <span class="plus"><i
											class="fa fa-angle-up" aria-hidden="true"></i></span>
									</div>
									<div class="cart-button">
										<button type="submit" class="btn-ct">Add To Cart</button>
									</div>
								</form>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Of Shop Detail -->
		<section class="shop-detail ptb-100">
			<div class="container">
				<div class="row">
					<div class="col-xl-6 col-lg-6 col-md-12 md-mb-40">
						<div class="glasscase-main">
							<ul id="glasscase" class="gc-start">
								<%
								for (Pizza pizza : pizzas) {
								%>
								<li><a href="shop-detail.jsp?id=<%=pizza.getId()%>"><img
										src="images/<%=pizza.getImage()%>" alt="<%=pizza.getName()%>"></a></li>
								<%
								}
								%>
							</ul>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="product-detail">
							<!-- Your product details will be dynamically loaded here based on the selected pizza -->
							<h2 class="product-title"><%=selectedPizza.getName()%></h2>
							<div class="product-price">
								<div class="price">
									<span><%=selectedPizza.getPrix()%></span>
								</div>
								<div class="rating-summary-block">
									<!-- Rating summary HTML here -->
								</div>
							</div>

							<div class="product-description">
								<p><%=selectedPizza.getDescription()%></p>
								<!-- Additional product description can be added here -->
							</div>

							<div class="add-cart-box">
								<form action="add-to-cart" method="post">
									<input type="hidden" name="pizzaId"
										value="<%=selectedPizza.getId()%>" />
									<div class="number">
										<input type="number" name="quantity" value="1" min="1">
										<span class="minus"><i class="fa fa-angle-down"
											aria-hidden="true"></i></span> <span class="plus"><i
											class="fa fa-angle-up" aria-hidden="true"></i></span>
									</div>
									<div class="cart-button">
										<button type="submit" class="btn-ct">Add To Cart</button>
									</div>
								</form>
							</div>
							<div class="wish-list">
								<a href="#" class="wish-btn"><i class="fa fa-heart-o"
									aria-hidden="true"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>


		<!-- Start Of Product Description -->
		<section class="product-desc-inf ptb-100 bg-yellow"
			id="product-review">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="product-tabing">
							<ul class="tab-link">
								<li><a href="javascript:void(0)" class="btn-ct active"
									data-tab="tab-1">Description</a></li>
								<li><a href="javascript:void(0)" class="btn-ct"
									data-tab="tab-2">Reviews</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="tab-content product-tab-content">
					<div class="tab-panel active" id="tab-1">
						<div class="product-desc">
							<p><%=selectedPizza.getDescription()%></p>

						</div>
					</div>

					<div class="tab-panel" id="tab-2">
						<div class="product-review">
							<h4 class="mb-15">Review</h4>
							<p>There are no reviews yet.</p>
							<h2 class="product-title"><%=selectedPizza.getName()%></h2>
							<p>Your email address will not be published. Required fields
								are marked *</p>
							<span>Your Rating *</span>
							<div class="star-rating">
								<input id="star-10" type="radio" name="rating" value="star-10">
								<label for="star-10" title="10 stars"> <i
									class="active fa fa-star" aria-hidden="true"></i>
								</label> <input id="star-9" type="radio" name="rating" value="star-9">
								<label for="star-9" title="9 stars"> <i
									class="active fa fa-star" aria-hidden="true"></i>
								</label> <input id="star-8" type="radio" name="rating" value="star-8">
								<label for="star-8" title="8 stars"> <i
									class="active fa fa-star" aria-hidden="true"></i>
								</label> <input id="star-7" type="radio" name="rating" value="star-7">
								<label for="star-7" title="7 stars"> <i
									class="active fa fa-star" aria-hidden="true"></i>
								</label> <input id="star-6" type="radio" name="rating" value="star-6">
								<label for="star-6" title="6 star"> <i
									class="active fa fa-star" aria-hidden="true"></i>
								</label>
							</div>
							<form method="post">
								<div class="row">
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" class="form-control"
												placeholder="Your Name*" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" class="form-control"
												placeholder="Your Email*" required="">
										</div>
									</div>
									<div class="col-xl-12 col-lg-12 col-md-12">
										<div class="form-group">
											<textarea class="form-control" placeholder="Your Message"></textarea>
										</div>
									</div>
									<div class="form-button">
										<button class="btn-ct">Post Comment</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Of Product Description -->


		<!-- Start Of Related Product -->
		<section class="related-product ptb-100">
			<div class="container">
				<div class="heading-part">
					<h2 class="related-pro-title">Related Products</h2>
				</div>
				<div class="tab-panel active">
					<div class="row">
						<%
						for (Pizza pizza : pizzas) {
						%>
						<div class="col-xl-4 col-lg-4 col-md-6">
							<div class="menu-item-box rotate-img">
								<div class="menu-item-img">
									<a href="shop-detail.jsp?id=<%=pizza.getId()%>"><img
										src="images/<%=pizza.getImage()%>" alt="<%=pizza.getName()%>"></a>
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
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</section>


		<!-- End Of Related Product -->

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
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/modernizr.js"></script>
	<script src="js/pizzon.js"></script>
	<script>
		$(document).ready(function() {
			//If your <ul> has the id "glasscase"
			$('#glasscase').glassCase({
				'thumbsPosition' : 'bottom',
				'widthDisplayPerc' : 100,
				isDownloadEnabled : false,
			});
		});
	</script>
</body>
</html>