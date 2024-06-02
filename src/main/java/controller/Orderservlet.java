package controller;

import dao.OrderDao;
import dao.CartDAO;
import model.Order;
import model.User;
import model.Cart;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/orderservlet")
public class Orderservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDao orderDao;
    private CartDAO cartDao;

    public void init() {
        orderDao = new OrderDao();
        cartDao = new CartDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve all cart items associated with the user
        List<Cart> cartItems = cartDao.findCartsByUsername(user);

        // Delete all retrieved cart items
        for (Cart cartItem : cartItems) {
            cartDao.delete(cartItem);
        }

        // Proceed to create the new order
        Order order = new Order();
        order.setUser(user);

        // Populate order details from the form
        order.setFirstName(request.getParameter("firstName"));
        order.setLastName(request.getParameter("lastName"));
        order.setEmail(request.getParameter("email"));
        order.setPhoneNo(request.getParameter("phoneNo"));
        order.setAddress(request.getParameter("address"));
        order.setOrderNotes(request.getParameter("orderNotes"));
        order.setStatus("en attente");

        String totalAmountParam = request.getParameter("prix");
        System.out.println("Received totalAmountParam: " + totalAmountParam); // Debugging line
        if (totalAmountParam != null) {
            try {
                double totalAmount = Double.parseDouble(totalAmountParam.trim());
                order.setTotalAmount(totalAmount);
            } catch (NumberFormatException e) {
                // Handle invalid number format
                System.err.println("Invalid number format for totalAmountParam: " + totalAmountParam);
                order.setTotalAmount(0.0);
            }
        } else {
            order.setTotalAmount(0.0);
        }

        order.setPaymentMethod(request.getParameter("payment"));
        orderDao.createOrder(order);

        // Forward the request to order.jsp with the updated order list
        List<Order> orderList = orderDao.getAllOrdersByUserId(user.getId());
        request.setAttribute("orderList", orderList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve the order list and set it as a request attribute
        List<Order> orderList = orderDao.getAllOrdersByUserId(user.getId());
        request.setAttribute("orderList", orderList);

        // Forward to order.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
        dispatcher.forward(request, response);
    }
}
