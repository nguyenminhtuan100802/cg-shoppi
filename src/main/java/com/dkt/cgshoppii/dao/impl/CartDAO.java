package com.dkt.cgshoppii.dao.impl;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.dao.ICartDAO;
import com.dkt.cgshoppii.model.entity.CartItem;
import com.dkt.cgshoppii.model.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO implements ICartDAO {

    @Override
    public int findCartIdByUsername(String username) {
        try (Connection connection = JDBCConnection.getConnection()) {
            PreparedStatement ps = connection.prepareStatement("SELECT users.username, carts.id AS cart_id FROM users JOIN carts ON users.id = carts.user_id;");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("username");
                if (username.equals(name)) {
                    return resultSet.getInt("cart_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
