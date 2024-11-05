package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.model.entity.Cart;
import com.dkt.cgshoppii.model.entity.Order;
import com.dkt.cgshoppii.model.entity.User;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class UserDAO implements IUserDAO {
    @Override
    public List<User> findAllUsers() {
        List<User> users = new ArrayList<>();

        // Using try-with-resources to manage resources
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement("SELECT * FROM users");
             ResultSet resultSet = ps.executeQuery()) {

            if (connection != null) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String username = resultSet.getString("username");
                    String password = resultSet.getString("password");
                    String role = resultSet.getString("role");
                    String fullName = resultSet.getString("full_name");
                    String phone = resultSet.getString("phone");
                    String email = resultSet.getString("email");
                    String address = resultSet.getString("address");
                    LocalDateTime createdAt = resultSet.getTimestamp("created_at").toLocalDateTime();

                    // Assuming Cart and Order are initialized appropriately or set to null for now
                    Cart cart = null; // Replace with actual Cart fetching logic if needed
                    List<Order> orders = null; // Replace with actual Order fetching logic if needed

                    users.add(new User(id, username, password, role, fullName, phone, email, address, createdAt, cart, orders));
                }
            } else {
                System.err.println("Failed to establish database connection.");
            }
        } catch (SQLException e) {
            System.err.println("Error fetching users: " + e.getMessage());
        }

        return users;
    }

    @Override
    public Optional<User> findUserByUsername(String username) {
        return Optional.empty();
    }

    @Override
    public void saveUser(User user) {

    }
}
