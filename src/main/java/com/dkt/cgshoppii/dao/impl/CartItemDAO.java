package com.dkt.cgshoppii.dao.impl;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.dao.ICartItemDAO;
import com.dkt.cgshoppii.model.entity.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartItemDAO implements ICartItemDAO {

    @Override
    public List<CartItem> getAllCartItemByCartId(int cartId) {
        List<CartItem> cartItems = null;
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select * from cart_items");
                ResultSet resultSet = preparedStatement.executeQuery();
                cartItems = new ArrayList<>();
                while (resultSet.next()) {
                    int cartItemId = resultSet.getInt("cart_id");
                    if (cartItemId == cartId) {
                        int id = resultSet.getInt("id");
                        int productId = resultSet.getInt("product_id");
                        int quantity = resultSet.getInt("quantity");
                        cartItems.add(new CartItem(id , quantity, productId));
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return cartItems;
    }

    @Override
    public void deleteCartItemById(int cartItemId) {
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM cart_items WHERE id = ?;");
                preparedStatement.setInt(1, cartItemId);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
