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
import java.util.List;

public class ProductDAO implements IProductDAO {
    @Override
    public List<Product> findAllProducts() {
        List<Product> products = null;
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("select * from products");
                ResultSet resultSet = preparedStatement.executeQuery();
                products = new ArrayList<>();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String productName = resultSet.getString("name");
                    String description = resultSet.getString("description");
                    double price = resultSet.getDouble("price");
                    int inventory_quantity = resultSet.getInt("inventory_quantity");
                    products.add(new Product(id, productName, description, price, inventory_quantity));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return products;
    }

    @Override
    public Product findProductById(int productId) {
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

    @Override
    public List<Product> findProductByName(String name) {
        List<Product> products = new ArrayList<>();
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products WHERE name LIKE ?");
                preparedStatement.setString(1, "%" + name + "%");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String productName = resultSet.getString("name");
                    String description = resultSet.getString("description");
                    double price = resultSet.getDouble("price");
                    int inventory_quantity = resultSet.getInt("inventory_quantity");
                    products.add(new Product(id, productName, description, price, inventory_quantity));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return products;
    }
}
