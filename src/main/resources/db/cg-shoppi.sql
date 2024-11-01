CREATE DATABASE cg_shoppi;
USE cg_shoppi;

CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) NOT NULL UNIQUE,
                       password VARCHAR(255) NOT NULL,
                       role ENUM('CUSTOMER', 'ADMIN') NOT NULL,
                       full_name VARCHAR(100) NOT NULL,
                       phone VARCHAR(15),
                       email VARCHAR(100) NOT NULL UNIQUE,
                       address VARCHAR(255),
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          description TEXT,
                          price DECIMAL(10, 2) NOT NULL,
                          inventory_quantity INT NOT NULL,
                          status ENUM('AVAILABLE', 'OUT_OF_STOCK') NOT NULL,
                          created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE carts (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                       user_id INT UNIQUE, -- Ràng buộc UNIQUE để đảm bảo mối quan hệ 1-1
                       FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE cart_items (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            price DECIMAL(10, 2) NOT NULL,
                            quantity INT NOT NULL,
                            cart_id INT,
                            product_id INT,
                            FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
                            FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

CREATE TABLE orders (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT,
                        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                        total_amount DECIMAL(10, 2) NOT NULL,
                        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE order_items (
                             id INT AUTO_INCREMENT PRIMARY KEY,
                             price DECIMAL(10, 2) NOT NULL,
                             quantity INT NOT NULL,
                             product_id INT,
                             order_id INT,
                             FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
                             FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

