package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.CartDAO;
import model.Cart;
import model.User;

public class checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;

    public void init() {
        cartDAO = new CartDAO();
    }

    public checkout() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve user from session
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            // Retrieve cart data for the user
            List<Cart> cartList = cartDAO.findCartsByUsername(user);

            // Set cartList attribute in request
            request.setAttribute("cartList", cartList);

            // Forward to checkout.jsp
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        } else {
            // Redirect to login page if user is not logged in
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
