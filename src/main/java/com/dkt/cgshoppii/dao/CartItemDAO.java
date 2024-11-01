package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.model.entity.CartItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartItemDAO {
    public void addCartItem(int cartId, int productId) {
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement checkStatement = connection.prepareStatement(
                        "INSERT INTO cart_items(price, quantity, cart_id, product_id) VALUES(?, ?, ?, ?);"
                );
                checkStatement.setInt(1, 100);     // Gán giá trị cho tham số đầu tiên
                checkStatement.setInt(2, 2);  // Gán giá trị cho tham số thứ hai
                checkStatement.setInt(3, cartId);     // Gán giá trị cho tham số đầu tiên
                checkStatement.setInt(4, productId);  // Gán giá trị cho tham số thứ hai
                checkStatement.executeUpdate();


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
