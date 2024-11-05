package com.dkt.cgshoppii.controller;

import com.dkt.cgshoppii.model.entity.User;
import com.dkt.cgshoppii.service.IUserService;
import com.dkt.cgshoppii.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final String LOGIN_PAGE = "/login";
    private static final String USERNAME_PARAM = "username";
    private static final String PASSWORD_PARAM = "password";

    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to login page for GET requests
        request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter(USERNAME_PARAM);
        String password = request.getParameter(PASSWORD_PARAM);

        String message;

        // Check for null or empty parameters
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            message = "Username and password are required!";
        } else {
            // Find the user by username
            Optional<User> userOptional = userService.findUserByUsername(username);

            if (userOptional.isPresent()) {
                User user = userOptional.get();
                // Hash comparison using BCrypt
                if (BCrypt.checkpw(password, user.getPassword())) {
                    message = "Login successful!";
                    // Optionally, set user session attributes here
                    request.getSession().setAttribute("user", user);
                } else {
                    message = "Invalid credentials!";
                }
            } else {
                message = "User not found!";
            }
        }

        // Set message attribute and forward to the login page
        request.setAttribute("message", message);
        request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
    }
}
