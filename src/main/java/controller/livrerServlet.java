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

@WebServlet("/livreurServlet")
public class livrerServlet extends HttpServlet {
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

        List<Order> orderList;
        if (user.getRole() == 3) { // Check if the user's role is for a delivery person (role = 3)
            orderList = orderDao.getOrdersByStatus("Preparing your Order");
            System.out.println("Orders with status 'Preparing your Order': " + orderList.size());
        } else {
            orderList = orderDao.getAllOrdersByUserId(user.getId());
            System.out.println("Orders for user with ID " + user.getId() + ": " + orderList.size());
        }

        request.setAttribute("orderList", orderList);

        // Forward to livreur.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("livreur.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This servlet might not need to handle POST requests for now
        response.sendRedirect(request.getContextPath() + "/livreurServlet");
    }
}
