package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.model.entity.User;

import java.util.List;
import java.util.Optional;

public interface IUserDAO {
    List<User> findAllUsers();
    Optional<User> findUserByUsername(String username); // Method for finding a user by username
    void saveUser(User user); // Method for saving a new user
}
