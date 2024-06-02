<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Order"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
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
                        <h1 class="sub-banner-title">Order Details</h1>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12">
                    <div class="bread-crumb wow fadeInRight">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li>Order Details</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Of Sub Banner -->

    <!-- Start Of Order Details -->
    <section class="order-details ptb-150">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Order Id</th>
                                    <th>Address</th>
                                    <th>Phone No</th>
                                    <th>Amount</th>
                                    <th>Payment Mode</th>
                                    <th>Status</th>
                                    <th>Items</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${orderList}" var="order">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.address}</td>
                                        <td>${order.phoneNo}</td>
                                        <td>${order.totalAmount}</td>
                                        <td>${order.paymentMethod}</td>
                                        <td>${order.status}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- End Of Order Details -->
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
