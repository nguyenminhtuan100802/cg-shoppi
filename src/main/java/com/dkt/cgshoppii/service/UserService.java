package com.dkt.cgshoppii.service;

import com.dkt.cgshoppii.dao.IUserDAO;
import com.dkt.cgshoppii.dao.UserDAO;
import com.dkt.cgshoppii.model.entity.User;

import java.util.List;
import java.util.Optional;

public class UserService implements IUserService {
    private final IUserDAO userDAO = new UserDAO(); // Use final for better readability

    @Override
    public List<User> findAllUsers() {
        return userDAO.findAllUsers();
    }

    @Override
    public Optional<User> findUserByUsername(String username) {
        return userDAO.findUserByUsername(username); // Call DAO to find user
    }

    @Override
    public void registerUser(User user) {
        // Check if the username already exists
        Optional<User> existingUser = findUserByUsername(user.getUsername());
        if (existingUser.isPresent()) {
            throw new RuntimeException("Username already exists!"); // Handle as needed
        }
        userDAO.saveUser(user); // Save the new user to the database
    }
}
