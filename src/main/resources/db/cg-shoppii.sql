CREATE DATABASE cg_shoppi;
USE cg_shoppi;

-- Users table
CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL, -- Store hashed passwords here
                       role ENUM('CUSTOMER', 'ADMIN') NOT NULL,
                       full_name VARCHAR(100) NOT NULL,
                       phone VARCHAR(15),
                       email VARCHAR(100) NOT NULL UNIQUE,
                       address VARCHAR(255),
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Products table
CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          description TEXT,
                          price DECIMAL(10, 2) NOT NULL,
                          inventory_quantity INT NOT NULL,
                          status ENUM('AVAILABLE', 'OUT_OF_STOCK') NOT NULL,
                          created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Carts table (1-1 relationship with users)
CREATE TABLE carts (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                       user_id INT UNIQUE, -- 1-1 relationship with users
                       FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Cart items table
CREATE TABLE cart_items (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            price DECIMAL(10, 2) NOT NULL,
                            quantity INT NOT NULL,
                            cart_id INT,
                            product_id INT,
                            FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
                            FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Orders table
CREATE TABLE orders (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT,
                        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                        total_amount DECIMAL(10, 2) NOT NULL,
                        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Order items table
CREATE TABLE order_items (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             price DECIMAL(10, 2) NOT NULL,
                             quantity INT NOT NULL,
                             product_id INT,
                             order_id INT,
                             FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
                             FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

-- Sample user data (hashed passwords)
INSERT INTO users (username, password, role, full_name, phone, email, address) VALUES
                                                                                   ('user1', SHA2('password1', 256), 'CUSTOMER', 'John Doe', '1234567890', 'user1@example.com', '123 Main St'),
                                                                                   ('user2', SHA2('password2', 256), 'CUSTOMER', 'Jane Smith', '2345678901', 'user2@example.com', '456 Elm St'),
                                                                                   ('user3', SHA2('password3', 256), 'CUSTOMER', 'Emily Brown', '3456789012', 'user3@example.com', '789 Maple Ave'),
                                                                                   ('admin1', SHA2('adminpass1', 256), 'ADMIN', 'Alice Green', '2345678901', 'admin1@example.com', '123 Cherry Ln');

-- Sample product data
INSERT INTO products (name, description, price, inventory_quantity, status) VALUES
                                                                                ('Smartphone A1', 'A basic smartphone with essential features', 199.99, 150, 'AVAILABLE'),
                                                                                ('Laptop X1', 'Lightweight laptop with 8GB RAM and 256GB SSD', 699.99, 100, 'AVAILABLE'),
                                                                                ('Tablet T1', 'Basic tablet with 7-inch display', 149.99, 200, 'AVAILABLE'),
                                                                                ('Smartwatch S1', 'Smartwatch with heart rate monitor', 99.99, 300, 'AVAILABLE');

-- Sample carts for users
INSERT INTO carts (created_at, user_id) VALUES
                                            (NOW(), 1),
                                            (NOW(), 2),
                                            (NOW(), 3),
                                            (NOW(), 4);

-- Sample cart items
INSERT INTO cart_items (price, quantity, cart_id, product_id) VALUES
                                                                  (199.99, 1, 1, 1),
                                                                  (699.99, 1, 2, 2),
                                                                  (149.99, 2, 3, 3),
                                                                  (99.99, 3, 4, 4);

-- Sample orders
INSERT INTO orders (user_id, created_at, total_amount) VALUES
                                                           (1, NOW(), 399.98),
                                                           (2, NOW(), 699.99),
                                                           (3, NOW(), 299.98);

-- Sample order items
INSERT INTO order_items (price, quantity, product_id, order_id) VALUES
                                                                    (199.99, 2, 1, 1),
                                                                    (699.99, 1, 2, 2),
                                                                    (149.99, 2, 3, 3);
