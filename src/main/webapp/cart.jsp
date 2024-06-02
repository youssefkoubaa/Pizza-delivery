<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Cart"%>
<%!double calculateSubtotal(List<Cart> cartList) {
		double subtotal = 0.0;
		for (Cart cart : cartList) {
			subtotal += cart.getPizza().getPrix() * cart.getQuantity();
		}
		return subtotal;
	}%>
<%
// Simulate getting the cartList from the request for testing purposes
List<Cart> cartList = (List<Cart>) request.getAttribute("cartList");
double subtotal = calculateSubtotal(cartList);
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
							<h1 class="sub-banner-title">Cart</h1>
							<p>Lorem Ipsum is simply dummy text of the printing and
								typesetting industry.</p>
						</div>
					</div>

					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="bread-crumb wow fadeInRight">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li>Cart</li>
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

		<!-- Start Of Cart -->
		<section class="cart ptb-150">
			<div class="container">
				<div class="row">
					<div class="col-xl-8 col-lg-12 col-md-12">
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th class="product-name">Product</th>
										<th class="price">Price</th>
										<th class="qty">Quantity</th>
										<th class="total-price">Total</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<!-- Iterate over cartList -->
									<c:forEach items="${cartList}" var="cart">
										<tr>
											<td class="product-name">
												<div class="product-box">
													<div class="product-img">
														<a href="shop-detail.html"><img
															src="images/${cart.pizza.image}" alt="Item Image"></a>
													</div>
													<div class="product-detail">
														<a href="shop-detail.html" class="pro-title">${cart.pizza.name}</a>
													</div>
												</div>
											</td>
											<td class="price">${cart.pizza.prix}</td>
											<td class="qty">
												<div class="number">
													<span class="minus"><i class="fa fa-angle-left"
														aria-hidden="true"></i></span> <input type="text"
														value="${cart.quantity}"> <span class="plus"><i
														class="fa fa-angle-right" aria-hidden="true"></i></span>
												</div>
											</td>
											<td class="price">${cart.price}</td>
											<td class="remove"><a class="item-remove"
												href="AddToCart?action=delete&cartId=${cart.id}"> <img
													src="images/delete.png" alt="delete">
											</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="row align-items-center">
							<div class="col-xl-5 col-lg-5 col-md-5">
								<div class="update-cart">
									<button class="btn-ct btn-small" onclick="updateCart()">Update
										Cart</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-4 col-lg-12 col-md-12">
						<div class="cart-totals">
							<h4 class="cart-title">Cart Total</h4>
							<table class="table">
								<tbody>
									<tr>
										<td class="totals">Order Total</td>
										<td class="right-price totals" id="orderTotal"></td>
										<span class="grand-total">Total</span>
										<span class="total-amount">$<%=subtotal%></span>
									</tr>
								</tbody>
							</table>
							<form action="checkout" method="post">
								<div class="checkout-btn text-center">
									<a href="checkout" class="btn-ct btn-small">Proceed To
										Checkout</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Of Cart -->

	</main>
	<!-- End Of Main Div -->

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
						<!-- Iterate over cartList -->
						<c:forEach items="${cartList}" var="cart">
							<div class="cart-item">
								<div class="item-image">
									<a href="shop-detail.html"><img
										src="images/${cart.pizza.image}" alt="Item Image"></a>
								</div>
								<div class="item-detl">
									<div class="item-name">
										<a href="shop-detail.html">${cart.pizza.name}</a> <a
											class="item-remove" href="deleteFromCart?cartId=${cart.id}"><img
											src="images/delete.png" alt="delete"></a>
									</div>
									<div class="item-price">
										<span>${cart.pizza.prix}</span>
									</div>
									<div class="quantity-editer">
										<div class="quantity">
											<button type="button" class="sub minus">-</button>
											<input class="count" name="quantity" type="number"
												value="${cart.quantity}" min="1" max="10">
											<button type="button" class="add plus">+</button>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="cart-footer">
				<div class="sub-total">
					<strong>Subtotal:</strong> <span class="sprice" id="orderTotal"></span>
				</div>
				<div class="cart-footer-des">
					<p>Taxes and shipping calculated at checkout</p>
				</div>
				<div class="cart-button">
					<ul>
						<li><a href="cart.jsp" class="btn-ct btn-small">View Cart</a></li>
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
