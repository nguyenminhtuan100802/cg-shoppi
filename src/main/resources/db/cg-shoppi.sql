CREATE
DATABASE cg_shoppi;
USE
cg_shoppi;

CREATE TABLE users
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    username   VARCHAR(50)  NOT NULL UNIQUE,
    password   VARCHAR(255) NOT NULL,
    role       ENUM('CUSTOMER', 'ADMIN') NOT NULL,
    full_name  VARCHAR(100) NOT NULL,
    phone      VARCHAR(15),
    email      VARCHAR(100) NOT NULL UNIQUE,
    address    VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products
(
    id                 INT AUTO_INCREMENT PRIMARY KEY,
    name               VARCHAR(100)   NOT NULL,
    description        TEXT,
    price              DECIMAL(10, 2) NOT NULL,
    inventory_quantity INT            NOT NULL,
    status             ENUM('AVAILABLE', 'OUT_OF_STOCK') NOT NULL,
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE carts
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id    INT UNIQUE, -- Ràng buộc UNIQUE để đảm bảo mối quan hệ 1-1
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE cart_items
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    price      DECIMAL(10, 2) NOT NULL,
    quantity   INT            NOT NULL,
    cart_id    INT,
    product_id INT,
    FOREIGN KEY (cart_id) REFERENCES carts (id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE
);

CREATE TABLE orders
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    user_id      INT,
    created_at   DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE order_items
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    price      DECIMAL(10, 2) NOT NULL,
    quantity   INT            NOT NULL,
    product_id INT,
    order_id   INT,
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE
);

USE cg_shoppi;

INSERT INTO users (username, password, role, full_name, phone, email, address)
VALUES ('user1', 'password1', 'CUSTOMER', 'John Doe', '1234567890', 'user1@example.com', '123 Main St'),
       ('user2', 'password2', 'CUSTOMER', 'Jane Smith', '2345678901', 'user2@example.com', '456 Elm St'),
       ('user3', 'password3', 'CUSTOMER', 'Emily Brown', '3456789012', 'user3@example.com', '789 Maple Ave'),
       ('user4', 'password4', 'CUSTOMER', 'Michael Johnson', '4567890123', 'user4@example.com', '101 Pine St'),
       ('user5', 'password5', 'CUSTOMER', 'Sarah Wilson', '5678901234', 'user5@example.com', '202 Oak St'),
       ('user6', 'password6', 'CUSTOMER', 'David Martinez', '6789012345', 'user6@example.com', '303 Cedar St'),
       ('user7', 'password7', 'CUSTOMER', 'Laura Thompson', '7890123456', 'user7@example.com', '404 Birch St'),
       ('user8', 'password8', 'CUSTOMER', 'James Anderson', '8901234567', 'user8@example.com', '505 Willow Ave'),
       ('user9', 'password9', 'CUSTOMER', 'Linda Robinson', '9012345678', 'user9@example.com', '606 Poplar St'),
       ('user10', 'password10', 'CUSTOMER', 'Christopher White', '1234567890', 'user10@example.com', '707 Maple Ave'),
       ('admin1', 'adminpass1', 'ADMIN', 'Alice Green', '2345678901', 'admin1@example.com', '123 Cherry Ln'),
       ('admin2', 'adminpass2', 'ADMIN', 'Brian Hall', '3456789012', 'admin2@example.com', '456 Walnut St'),
       ('user11', 'password11', 'CUSTOMER', 'Karen Young', '4567890123', 'user11@example.com', '303 Cedar St'),
       ('user12', 'password12', 'CUSTOMER', 'Jason King', '5678901234', 'user12@example.com', '404 Birch St'),
       ('user13', 'password13', 'CUSTOMER', 'Helen Scott', '6789012345', 'user13@example.com', '202 Oak St'),
       ('user14', 'password14', 'CUSTOMER', 'Sandra Lewis', '7890123456', 'user14@example.com', '101 Pine St'),
       ('user15', 'password15', 'CUSTOMER', 'Gregory Harris', '8901234567', 'user15@example.com', '789 Maple Ave'),
       ('user16', 'password16', 'CUSTOMER', 'Angela Clark', '9012345678', 'user16@example.com', '456 Elm St'),
       ('user17', 'password17', 'CUSTOMER', 'Donald Robinson', '1234567890', 'user17@example.com', '303 Cedar St'),
       ('user18', 'password18', 'CUSTOMER', 'Rebecca Martinez', '2345678901', 'user18@example.com', '123 Main St');


INSERT INTO products (name, description, price, inventory_quantity, status)
VALUES ('Smartphone A1', 'A basic smartphone with essential features', 199.99, 150, 'AVAILABLE'),
       ('Smartphone B2', 'An upgraded smartphone with a great camera', 299.99, 80, 'AVAILABLE'),
       ('Smartphone C3', 'High-end smartphone with advanced features', 499.99, 50, 'AVAILABLE'),
       ('Laptop X1', 'Lightweight laptop with 8GB RAM and 256GB SSD', 699.99, 100, 'AVAILABLE'),
       ('Laptop X2', 'Powerful laptop with 16GB RAM and 512GB SSD', 899.99, 70, 'AVAILABLE'),
       ('Laptop X3', 'Gaming laptop with 32GB RAM and 1TB SSD', 1299.99, 20, 'AVAILABLE'),
       ('Tablet T1', 'Basic tablet with 7-inch display', 149.99, 200, 'AVAILABLE'),
       ('Tablet T2', 'High-resolution tablet with 10-inch display', 249.99, 120, 'AVAILABLE'),
       ('Tablet T3', 'Premium tablet with 12-inch display and stylus', 349.99, 90, 'AVAILABLE'),
       ('Smartwatch S1', 'Smartwatch with heart rate monitor', 99.99, 300, 'AVAILABLE'),
       ('Smartwatch S2', 'Advanced smartwatch with GPS and NFC', 199.99, 150, 'AVAILABLE'),
       ('Headphones H1', 'Wired headphones with noise cancellation', 49.99, 200, 'AVAILABLE'),
       ('Headphones H2', 'Wireless headphones with long battery life', 99.99, 100, 'AVAILABLE'),
       ('Headphones H3', 'Over-ear headphones with high fidelity sound', 149.99, 50, 'AVAILABLE'),
       ('Camera C1', 'Compact digital camera with 20MP', 299.99, 80, 'AVAILABLE'),
       ('Camera C2', 'Mirrorless camera with 24MP and 4K video', 599.99, 40, 'AVAILABLE'),
       ('Camera C3', 'DSLR camera with 30MP and 5-axis stabilization', 899.99, 30, 'AVAILABLE'),
       ('Printer P1', 'Inkjet printer with Wi-Fi connectivity', 99.99, 150, 'AVAILABLE'),
       ('Printer P2', 'Laser printer with fast printing speed', 199.99, 100, 'AVAILABLE'),
       ('Printer P3', 'All-in-one printer with scan and copy functions', 249.99, 75, 'AVAILABLE'),
       ('Keyboard K1', 'Mechanical keyboard with RGB lighting', 69.99, 250, 'AVAILABLE'),
       ('Keyboard K2', 'Wireless keyboard with ergonomic design', 89.99, 150, 'AVAILABLE'),
       ('Mouse M1', 'Wireless mouse with high DPI sensor', 29.99, 300, 'AVAILABLE'),
       ('Mouse M2', 'Gaming mouse with customizable buttons', 49.99, 150, 'AVAILABLE'),
       ('Speaker SP1', 'Bluetooth speaker with 10-hour battery', 79.99, 200, 'AVAILABLE'),
       ('Speaker SP2', 'Home speaker with voice assistant', 129.99, 100, 'AVAILABLE'),
       ('Router R1', 'Wi-Fi router with dual-band support', 59.99, 150, 'AVAILABLE'),
       ('Router R2', 'High-speed router with 4 antennas', 89.99, 80, 'AVAILABLE'),
       ('TV T1', '32-inch LED TV with HD resolution', 199.99, 60, 'AVAILABLE'),
       ('TV T2', '42-inch Smart TV with Full HD', 299.99, 50, 'AVAILABLE'),
       ('TV T3', '55-inch 4K UHD Smart TV', 499.99, 40, 'AVAILABLE'),
       ('Fridge F1', 'Compact fridge with 100L capacity', 149.99, 90, 'AVAILABLE'),
       ('Fridge F2', 'Double-door fridge with 300L capacity', 299.99, 50, 'AVAILABLE'),
       ('Fridge F3', 'Side-by-side fridge with 600L capacity', 499.99, 30, 'AVAILABLE'),
       ('Washing Machine W1', 'Top load washing machine with 7kg capacity', 199.99, 100, 'AVAILABLE'),
       ('Washing Machine W2', 'Front load washing machine with 10kg capacity', 299.99, 70, 'AVAILABLE'),
       ('Vacuum Cleaner V1', 'Cordless vacuum cleaner with powerful suction', 149.99, 120, 'AVAILABLE'),
       ('Vacuum Cleaner V2', 'Robot vacuum with automatic charging', 249.99, 60, 'AVAILABLE'),
       ('Air Conditioner AC1', '1.5 ton split AC with energy saver mode', 299.99, 50, 'AVAILABLE'),
       ('Air Conditioner AC2', '2 ton split AC with fast cooling', 399.99, 30, 'AVAILABLE'),
       ('Microwave MW1', '20L microwave with auto-cook settings', 99.99, 150, 'AVAILABLE'),
       ('Microwave MW2', '30L convection microwave with grill', 149.99, 100, 'AVAILABLE'),
       ('Cooktop CKT1', 'Two-burner gas cooktop', 69.99, 200, 'AVAILABLE'),
       ('Cooktop CKT2', 'Four-burner gas cooktop with auto-ignition', 99.99, 150, 'AVAILABLE'),
       ('Oven OV1', 'Electric oven with 60L capacity', 199.99, 80, 'AVAILABLE'),
       ('Dishwasher DW1', 'Portable dishwasher with 8 place settings', 249.99, 40, 'AVAILABLE'),
       ('Dishwasher DW2', 'Built-in dishwasher with 12 place settings', 299.99, 30, 'AVAILABLE'),
       ('Fan F1', 'Pedestal fan with adjustable speed', 49.99, 150, 'AVAILABLE'),
       ('Fan F2', 'Ceiling fan with remote control', 89.99, 100, 'AVAILABLE'),
       ('Iron IR1', 'Steam iron with non-stick soleplate', 29.99, 200, 'AVAILABLE'),
       ('Iron IR2', 'Cordless steam iron with fast heating', 49.99, 150, 'AVAILABLE');


INSERT INTO carts (id, created_at, user_id)
VALUES (1, NOW(), 1),
       (2, NOW(), 2),
       (3, NOW(), 3),
       (4, NOW(), 4),
       (5, NOW(), 5),
       (6, NOW(), 6),
       (7, NOW(), 7),
       (8, NOW(), 8),
       (9, NOW(), 9),
       (10, NOW(), 10);

INSERT INTO cart_items (id, price, quantity, cart_id, product_id)
VALUES (1, 299.99, 1, 1, 1),
       (2, 499.99, 2, 1, 2),
       (3, 129.99, 1, 2, 3),
       (4, 99.99, 3, 3, 4),
       (5, 159.99, 1, 4, 5),
       (6, 49.99, 2, 5, 6),
       (7, 249.99, 1, 6, 7),
       (8, 79.99, 3, 7, 8),
       (9, 199.99, 2, 8, 9),
       (10, 149.99, 1, 9, 10);

INSERT INTO orders (id, user_id, created_at, total_amount)
VALUES (1, 1, NOW(), 799.98),
       (2, 2, NOW(), 129.99),
       (3, 3, NOW(), 299.97),
       (4, 4, NOW(), 249.99),
       (5, 5, NOW(), 199.98),
       (6, 6, NOW(), 129.98),
       (7, 7, NOW(), 599.97),
       (8, 8, NOW(), 249.98),
       (9, 9, NOW(), 149.99),
       (10, 10, NOW(), 299.99);

INSERT INTO order_items (id, price, quantity, product_id, order_id)
VALUES (1, 299.99, 2, 1, 1),
       (2, 129.99, 1, 3, 2),
       (3, 99.99, 3, 4, 3),
       (4, 159.99, 1, 5, 4),
       (5, 49.99, 2, 6, 5),
       (6, 249.99, 1, 7, 6),
       (7, 79.99, 3, 8, 7),
       (8, 199.99, 2, 9, 8),
       (9, 149.99, 1, 10, 9),
       (10, 499.99, 1, 2, 10);
