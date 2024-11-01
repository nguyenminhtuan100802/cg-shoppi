package com.dkt.cgshoppii.dao;

import com.dkt.cgshoppii.connection.JDBCConnection;
import com.dkt.cgshoppii.model.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection connection;


    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String description = resultSet.getString("description");
                    double price = resultSet.getDouble("price");
                    int inventory_quantity = resultSet.getInt("inventory_quantity");
                    products.add(new Product(id, name, description, price, inventory_quantity));
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return products;
    }


    public List<Product> findByName(String name) {
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

    public void addToCart(int productId, int quantity) {
        Connection connection = JDBCConnection.getConnection();
        if (connection != null) {
            try {
                // Kiểm tra nếu sản phẩm đã tồn tại trong giỏ hàng
                PreparedStatement checkStatement = connection.prepareStatement(
                        "SELECT quantity FROM cart WHERE product_id = ?"
                );
                checkStatement.setInt(1, productId);
                ResultSet resultSet = checkStatement.executeQuery();

                if (resultSet.next()) {
                    // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                    int currentQuantity = resultSet.getInt("quantity");
                    PreparedStatement updateStatement = connection.prepareStatement(
                            "UPDATE cart SET quantity = ? WHERE product_id = ?"
                    );
                    updateStatement.setInt(1, currentQuantity + quantity);
                    updateStatement.setInt(2, productId);
                    updateStatement.executeUpdate();
                } else {
                    // Nếu sản phẩm chưa có, thêm sản phẩm mới vào giỏ hàng
                    PreparedStatement insertStatement = connection.prepareStatement(
                            "INSERT INTO cart (product_id, quantity) VALUES (?, ?)"
                    );
                    insertStatement.setInt(1, productId);
                    insertStatement.setInt(2, quantity);
                    insertStatement.executeUpdate();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }



//    public Product findById(int id) {
//        try {
//            String query = "SELECT * FROM products WHERE id = ?";
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setInt(1, id);
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                return extractProduct(rs);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

//    public boolean save(Product product) {
//        try {
//            String query = "INSERT INTO products (name, description, price, inventory_quantity, status) VALUES (?, ?, ?, ?, ?)";
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setString(1, product.getName());
//            stmt.setString(2, product.getDescription());
//            stmt.setDouble(3, product.getPrice());
//            stmt.setInt(4, product.getInventoryQuantity());
//            stmt.setString(5, product.getStatus());
//            return stmt.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public boolean update(Product product) {
//        try {
//            String query = "UPDATE products SET name = ?, description = ?, price = ?, inventory_quantity = ?, status = ? WHERE id = ?";
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setString(1, product.getName());
//            stmt.setString(2, product.getDescription());
//            stmt.setDouble(3, product.getPrice());
//            stmt.setInt(4, product.getInventoryQuantity());
//            stmt.setString(5, product.getStatus());
//            stmt.setInt(6, product.getId());
//            return stmt.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }
//
//    public boolean delete(int id) {
//        try {
//            String query = "DELETE FROM products WHERE id = ?";
//            PreparedStatement stmt = connection.prepareStatement(query);
//            stmt.setInt(1, id);
//            return stmt.executeUpdate() > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return false;
//    }

//    private Product extractProduct(ResultSet rs) throws SQLException {
//        Product product = new Product(id, name, price, description);
//        product.setId(rs.getInt("id"));
//        product.setName(rs.getString("name"));
//        product.setDescription(rs.getString("description"));
//        product.setPrice(rs.getDouble("price"));
//        product.setInventoryQuantity(rs.getInt("inventory_quantity"));
//        product.setStatus(rs.getString("status"));
//        product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
//        return product;
//    }
}
