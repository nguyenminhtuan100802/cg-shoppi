//package com.dkt.cgshoppii.controller;
//
//import com.dkt.cgshoppii.model.entity.User;
//import com.dkt.cgshoppii.service.IUserService;
//import com.dkt.cgshoppii.service.impl.UserService;
//import org.mindrot.jbcrypt.BCrypt;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.Optional;
//
//@WebServlet(name = "registerServlet", value = "/register")
//public class RegisterServlet extends HttpServlet {
//    private final IUserService userService = new UserService();
//    private static final String REGISTER_PAGE = "WEB-INF/view/user/Register.jsp";
//    private static final String LOGIN_PAGE = "WEB-INF/view/user/Login.jsp";
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Forward to registration page for GET requests
//        request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String role = request.getParameter("role"); // Get the selected role
//
//        String message;
//
//        // Validate input
//        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
//            message = "Username and password are required!";
//        } else {
//            // Check if the username already exists
//            Optional<User> existingUser = userService.findUserByUsername(username);
//            if (existingUser.isPresent()) {
//                message = "Username already exists! Please choose another.";
//            } else {
//                // Create a new user with hashed password and role
//                User newUser = new User();
//                newUser.setUsername(username);
//                newUser.setPassword(BCrypt.hashpw(password, BCrypt.gensalt())); // Hash the password
//                newUser.setRole(role); // Set the role (User, Admin, or None)
//
//                // Register the user
//                userService.registerUser(newUser); // Ensure this method is implemented
//                message = "Registration successful! You can now log in.";
//                request.setAttribute("loginLink", LOGIN_PAGE); // Set the link for successful registration
//            }
//        }
//
//        request.setAttribute("message", message);
//        request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
//    }
//}
