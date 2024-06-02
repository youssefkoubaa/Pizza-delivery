package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import dao.UserDao;
import model.User;

public class registre extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private UserDao userDao;

    public registre() {
        super();
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String tel = request.getParameter("contact");
        String psw = request.getParameter("pass");
        String confPsw = request.getParameter("re_pass");

        if (psw.equals(confPsw)) {
            // Now we can instantiate User directly
            User user = new User(name, email, psw, tel,1);
            try {
                userDao.createUser(user);
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Registration failed. Please try again later.</p>");
            }
        } else {
            out.println("<p>Passwords do not match. Please try again.</p>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
