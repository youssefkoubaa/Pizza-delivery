<%@ page import="java.util.List" %>
<%@ page import="model.Cart" %>
o<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Items</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>Order Items</h2>
        <table class="table table-striped table-hover text-center">
            <thead>
                <tr>
                    <th>Item Id</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="orderItem" items="${orderItems}">
                    <tr>
                        <td>${orderItem.itemId}</td>
                        <td>${orderItem.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="OrderServlet" class="btn btn-primary">Back to Orders</a>
    </div>
</body>
</html>
