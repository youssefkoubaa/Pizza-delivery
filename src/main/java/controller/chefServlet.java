package controller;

import dao.OrderDao;
import model.Order;
import model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/newchefServlet")  // Updated servlet mapping
public class chefServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDao orderDao;

    public void init() {
        orderDao = new OrderDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Check if the user's role is equal to 2
        if (user.getRole() == 2) {
            // Retrieve all orders
            List<Order>orderList = orderDao.getOrdersByStatus("Order Confirmed");
            orderList.addAll(orderDao.getOrdersByStatus("Preparing your Order"));
            orderList.addAll(orderDao.getOrdersByStatus("en attente"));
            request.setAttribute("orderList", orderList);
        } else {
            // Retrieve orders by user ID
            List<Order> orderList = orderDao.getAllOrdersByUserId(user.getId());
            request.setAttribute("orderList", orderList);
        }

        // Forward to work.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("work.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        String status = request.getParameter("status");

        System.out.println("Received orderId: " + orderIdStr);
        System.out.println("Received status: " + status);

        if (orderIdStr != null && status != null) {
            int orderId = Integer.parseInt(orderIdStr);
            Order order = orderDao.getOrderById(orderId);

            if (order != null) {
                order.setStatus(status);
                orderDao.updateOrder(order);
                response.sendRedirect(request.getContextPath() + "/newchefServlet");
                return;
            }
        }

        response.sendRedirect(request.getContextPath() + "/newchefServlet");
    }

}
