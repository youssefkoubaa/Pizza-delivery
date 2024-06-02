package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import dao.CartDAO;
import dao.PizzaDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Pizza;
import model.User;
public class AddToCart extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;
    private PizzaDao pizzaDAO;

    public void init() {
        cartDAO = new CartDAO();
        pizzaDAO = new PizzaDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            String cartIdStr = request.getParameter("cartId");
            System.out.println("Cart ID: " + cartIdStr); // Debug statement

            int cartId = Integer.parseInt(cartIdStr);
            Cart cartToDelete = cartDAO.findById(cartId);

            if (cartToDelete != null && cartToDelete.getUser().getId() == user.getId()) {
                System.out.println("Deleting cart: " + cartToDelete); // Debug statement
                cartDAO.delete(cartToDelete);
            } else {
                System.out.println("Cart not found or user mismatch."); // Debug statement
            }
        }

        if (user != null) {
            List<Cart> cartList = cartDAO.findCartsByUsername(user);
            request.setAttribute("cartList", cartList);
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        System.out.println("Action: " + action); // Debug statement

        if ("delete".equals(action)) {
            String cartIdStr = request.getParameter("cartId");
            System.out.println("Cart ID: " + cartIdStr); // Debug statement

            int cartId = Integer.parseInt(cartIdStr);
            Cart cartToDelete = cartDAO.findById(cartId);

            if (cartToDelete != null && cartToDelete.getUser().getId() == user.getId()) {
                System.out.println("Deleting cart: " + cartToDelete); // Debug statement
                cartDAO.delete(cartToDelete);
            } else {
                System.out.println("Cart not found or user mismatch."); // Debug statement
            }
        } else {
            // If the action is to add to the cart
            int pizzaId = Integer.parseInt(request.getParameter("pizzaId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            Pizza pizza = pizzaDAO.getPizza(pizzaId);
            
            if (pizza != null) {
                Cart cart = new Cart(pizza, user, quantity, pizza.getPrix() * quantity);
                cartDAO.create(cart);
            } else {
                response.sendRedirect(request.getContextPath() + "/error.jsp");
                return;
            }
        }
        
        List<Cart> cartList = cartDAO.findCartsByUsername(user);
        request.setAttribute("cartList", cartList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);
    }
}
