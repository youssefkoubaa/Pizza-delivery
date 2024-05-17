package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User; // Import User class from model package
import java.io.IOException;
import dao.UserDao;

public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public login() {
        super();
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");

        // Authenticate user
        User user = userDao.findByEmail(email);

        if (user != null && user.getPsw().equals(password.trim())) {
            // Successful authentication
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user); // Store user object in session
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            // Invalid credentials
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=invalid");
        }
    }
}
