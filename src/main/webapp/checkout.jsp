<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Cart"%>
<%! 
    double calculateSubtotal(List<Cart> cartList) {
        double subtotal = 0.0;
        for (Cart cart : cartList) {
            subtotal += cart.getPizza().getPrix() * cart.getQuantity();
        }
        return subtotal;
    }
%>
<%
    // Simulate getting the cartList from the request for testing purposes
    List<Cart> cartList = (List<Cart>) request.getAttribute("cartList");
    double subtotal = calculateSubtotal(cartList);
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <title>Pizzon</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	    <link type="image/x-icon" href="images/favicon.png" rel="icon">
	    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
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
	                            <h1 class="sub-banner-title">Checkout</h1>
	                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
	                        </div>
	                    </div>
	                    <div class="col-xl-6 col-lg-6 col-md-12">
	                        <div class="bread-crumb wow fadeInRight">
	                            <ul>
	                                <li><a href="index.html">Home</a></li>
	                                <li>Checkout</li>
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
	
	        <!-- Start Of Checkout -->
	        <section class="checkout ptb-150">
	            <div class="container">
	                <form>
	                    <div class="row">
	                        <div class="col-xl-8 col-lg-8 col-md-12">
	                            <div class="billing-detail">
	                                <h4 class="mb-20">Billing Details</h4>
	                                <div class="row align-items-center">
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="name" placeholder="First Name" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="name" placeholder="Last Name" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="name" placeholder="Company Name" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="email" placeholder="Email Address" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" placeholder="Phone No" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" placeholder="Country" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" placeholder="House number and street name" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" placeholder="Apartment, suit, unit, etc." class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" placeholder="Postcode / Zip" class="form-control" required="">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-6">
										<div class="form-group">
											<input type="text" name="text" placeholder="Town / City" class="form-control" required="">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<div class="form-check">
											  	<input class="form-check-input" type="checkbox" value="" id="create_account" required="">
											  	<label class="form-check-label" for="create_account">Create an Account?</label>
											</div>
										</div>
									</div>
								</div>
	                            </div>
	
	                            <div class="add-info md-mb-40">
	                                <h4 class="mb-20">Additional Information</h4>
	                                <div class="form-group p-0">
	                                    <textarea class="form-control" placeholder="Order Notes"></textarea>
	                                </div>
	                            </div>
	                        </div>
	
	                        <div class="col-xl-4 col-lg-4 col-md-12">
	                            <div class="your-order">
	                                <h4 class="mb-20">Your Order</h4>
	                                <c:forEach items="${cartList}" var="cart">
	                                    <div class="product-box">
	                                        <div class="product-img">
	                                            <a href="shop-detail.html"><img src="images/${cart.pizza.image}" alt="Item Image"></a>
	                                        </div>
	                                        <div class="product-detail">
	                                            <a href="shop-detail.html" class="pro-title">${cart.pizza.name}</a>
	                                            <div class="qty-box">
	                                                <span class="price">$${cart.pizza.prix}</span> <span class="qty">× ${cart.quantity}</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </c:forEach>
	                            </div>
	                            <div class="checkout-total">
	                                <ul>
	                                    <li><span class="grand-total">Total</span> <span class="total-amount">$${subtotal}</span></li>
	                                </ul>
	                            </div>
	
	                            <div class="pay-method">
	                                <h4 class="mb-20">Payment Method</h4>
	                                <ul>
	                                    <li>
	                                        <div class="form-check">
	                                            <input class="form-check-input" type="radio" name="payment" id="bank_transfer" checked=""> 
	                                            <label class="form-check-label" for="bank_transfer">Direct bank transfer</label>
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="form-check">
	                                            <input class="form-check-input" type="radio" name="payment" id="check_payments"> 
	                                            <label class="form-check-label" for="check_payments">Check payments</label>
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <div class="form-check">
	                                            <input class="form-check-input" type="radio" name="payment" id="cash_delivery"> 
	                                            <label class="form-check-label" for="cash_delivery">Cash on delivery</label>
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <button class="btn-ct" action="checkout">Place Order</button>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	            </div>
	        </section>
	        <!-- End Of Checkout -->
	
	    </main>
	    <!-- End Of Main Div -->
	
	    <!-- Start Of Footer -->
	    <%@include file="/includes/Footer.jsp"%>
	    <!-- End Of Footer -->
	
	    <!-- Start Of Search Popup -->
	    <div class="search-popup">
	        <div class="search-overlay"></div>
	        <div class="search-form">
	            <button class="close"></button>
	            <form>
	                <input type="text" name="search" placeholder="What are you looking for?" class="search-input">
	                <button type="submit">
	                    <img src="images/search-icon-white.png" alt="Search Icon">
	                </button>
	            </form>
	        </div>
	    </div>
	    <!-- End Of Search Popup -->
	
	    <!-- Start Of Js -->
	    <script src="js/jquery-3.4.1.min.js"></script>
	    <script src="js/bootstrap.min.js"></script>
	    <script src="js/animation.js"></script>
	    <script src="js/pizzon.js"></script>
	</body>
	</html>
