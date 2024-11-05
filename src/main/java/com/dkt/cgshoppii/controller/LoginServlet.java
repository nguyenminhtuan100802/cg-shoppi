package com.dkt.cgshoppii.controller;

import com.dkt.cgshoppii.model.entity.User;
import com.dkt.cgshoppii.service.IUserService;
import com.dkt.cgshoppii.service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the login page when accessed via GET
        request.getRequestDispatcher("WEB-INF/view/user/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        List<User> users = userService.findAllUsers();
        String message = "Invalid credentials!"; // Default message for invalid credentials

        // Validate login credentials
        for (User user : users) {
            if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
                message = "Login successful!";
                request.setAttribute("username", user.getUsername()); // Set the success message
                request.getRequestDispatcher("WEB-INF/view/product/productList.jsp").forward(request, response);
                return; // Exit after successful login
            }
        }

        // If no user matched, set the error message
        request.setAttribute("message", message);
        request.getRequestDispatcher("WEB-INF/view/user/Login.jsp").forward(request, response);
    }
}
