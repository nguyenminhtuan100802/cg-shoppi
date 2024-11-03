package com.dkt.cgshoppii.dao.impl;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.dao.IProductDAO;
import com.dkt.cgshoppii.model.entity.CartItem;
import com.dkt.cgshoppii.model.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO implements IProductDAO {
    @Override
    public Product getProductById(int productId) {
        Product product = null;
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select * from products");
                ResultSet resultSet = preparedStatement.executeQuery();
                product = new Product();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    if (id == productId) {
                        String name = resultSet.getString("name");
                        double price = resultSet.getDouble("price");
                        product.setName(name);
                        product.setPrice(price);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return product;
    }
}
