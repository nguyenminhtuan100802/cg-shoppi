package com.dkt.cgshoppii.service;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.dao.CartItemDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CartItemService {
    CartItemDAO cartItemDAO = new CartItemDAO();
    void addCartItem(int cartId, int productId) {
        cartItemDAO.addCartItem(cartId, productId);
    }
}
