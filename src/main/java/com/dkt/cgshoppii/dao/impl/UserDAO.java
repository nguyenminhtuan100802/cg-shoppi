package com.dkt.cgshoppii.dao.impl;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.dao.IUserDAO;
import com.dkt.cgshoppii.model.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    @Override
    public List<User> findAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = JDBCConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM users");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                User user = new User(username, password);
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving users: " + e.getMessage(), e);
        }
        return users;
    }
}
