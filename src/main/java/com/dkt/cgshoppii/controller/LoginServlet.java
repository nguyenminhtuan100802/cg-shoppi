package com.dkt.cgshoppii.controller;

import com.dkt.cgshoppii.service.IUserService;
import com.dkt.cgshoppii.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        String message;

        // Validate login credentials (simple example)
        if ("user".equals(username) && "pass".equals(password)) {
            message = "Login successful!";
        } else {
            message = "Invalid credentials!";
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("WEB-INF/view/user/Login.jsp").forward(request, response);
    }
}
