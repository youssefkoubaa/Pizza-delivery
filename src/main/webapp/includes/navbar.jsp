
    <%@ page import="model.Pizza"%>
<%@ page import="model.User"%>
<%@ page import="dao.PizzaDao"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.ArrayList"%>
<header>
		<div class="header-vacter">
			<img src="images/header-img.png" alt="Vacter Image">
		</div>
		<div class="container-big">
			<div class="header-inner">
				<div class="row align-items-center">
					<div class="col-xl-3 col-lg-3 col-md-3 col-5">
						<div class="header-logo">
							<a href="./index.jsp"><img src="./images/logo.png"
								alt="Brand Logo"></a>
						</div>
					</div>
					<div class="col-xl-9 col-lg-9 col-md-9 col-7">
						<div class="main-menu">
							<div class="menu-toggle">
								<span></span>
							</div>
							<div class="menu">
								<div class="sidemenu-header">
									<div class="sidemenu-logo">
										<img src="./images/logo.png" alt="Brand Logo">
									</div>
									<div class="sidemenu-close">
										<span></span>
									</div>
								</div>
								<ul>
									<li class="active"><a href="./index.jsp">Home</a></li>
									<li><span class="opener"></span> <a
										href="javascript:void(0)">Shop</a>
										<ul class="dropdown-content">
											<li><a href="shop-list.html">Shop List</a></li>
											<li><a href="shop-detail.html">Shop Detail</a></li>
											<li><a href="AddToCart">Cart</a></li>
											<li><a href="checkout">Checkout</a></li>
										</ul></li>
									<li><span class="opener"></span> <a
										href="javascript:void(0)">Pages</a>
										<ul class="dropdown-content">
											<li><a href="about.html">About Us</a></li>
											<li><a href="our-menu.html">Our Menu</a></li>
											<li><a href="our-team.html">Our Team</a></li>
											<li><a href="book-now.html">Book Now</a></li>
											<li><a href="404.html">404 Page</a></li>
										</ul></li>
									<li><span class="opener"></span> <a
										href="javascript:void(0)">Blog</a>
										<ul class="dropdown-content">
											<li><a href="blog-right.html">Blog Right</a></li>
											<li><a href="blog-left.html">Blog Left</a></li>
											<li><a href="blog-detail.html">Blog Detail</a></li>
										</ul></li>
									<li><a href="contact-us.html">Contact</a> <%
 User user = (User) session.getAttribute("user");
 if (user != null) {
 %>
									<li><span>Welcome, <%=user.getName()%></span></li>
									<!-- Display user's name if logged in -->
									<li><form action="logout" method="post">
											<button type="submit">Logout</button>
											<!-- Use a button instead of an anchor -->
										</form></li>
									<%
									} else {
									%>
									<li><a href="registration.jsp">Register</a>
									<li><a href="login.jsp">Login</a></li>
									<%
									}
									%>

								</ul>
							</div>
							<div class="icon-menu">
								<ul>
									<li class="search"><a href="javascript:void(0)"> <img
											src="./images/search-icon.png" class="normal-icon"
											alt="Search Icon"> <img src="images/search-icon-2.png"
											class="hover-icon" alt="Search Icon">
									</a></li>
									<li class="cart-slide position-r"><a
										href="javascript:void(0)"> <img src="images/cart-icon.png"
											class="normal-icon" alt="Cart Icon"> <img
											src="./images/cart-icon-2.png" class="hover-icon"
											alt="Cart Icon"> <span class="cart-count">0</span>
									</a></li>
								</ul>



							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>