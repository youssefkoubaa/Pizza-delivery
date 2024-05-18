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

    public AddToCart() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("user");
        if (user != null) {
    	List<Cart> cartList = cartDAO.findCartsByUsername(user);
        
        // Set cartList attribute in the request
        request.setAttribute("cartList", cartList);
        
        // Forward to cart.jsp to display the carts
        
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
        String username=user.getName();
        if (username == null || username.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        int pizzaId = Integer.parseInt(request.getParameter("pizzaId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        Pizza pizza = pizzaDAO.getPizza(pizzaId);
        
        if (pizza != null) {
            
                Cart cart = new Cart(pizza, user, quantity, pizza.getPrix() * quantity);
                cartDAO.create(cart);
            
        }
    	 else {
        // Handle case where user is not found
        // For example, redirect to login page or display an error message
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
        
        List<Cart> cartList = cartDAO.findCartsByUsername(user);
        
        // Set cartList attribute in the request
        request.setAttribute("cartList", cartList);
        
        // Forward to cart.jsp to display the carts
        RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
        dispatcher.forward(request, response);    }

// Method to retrieve user object based on username

}
