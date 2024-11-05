<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Global and body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header and Navbar */
        .header {
            background-color: #ee4d2d;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        /* Search and Cart */
        .search-cart-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }

        .search-cart-container input[type="text"] {
            width: 300px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
            outline: none;
        }

        .search-cart-container input[type="submit"] {
            padding: 8px 20px;
            border: none;
            background-color: #ee4d2d;
            color: white;
            cursor: pointer;
            border-radius: 0 5px 5px 0;
        }

        .cart-link {
            margin-left: 15px;
            padding: 8px 15px;
            background-color: #ee4d2d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .cart-link:hover {
            background-color: #d8341b;
        }

        /* Product Table */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f53d2d;
            color: white;
        }

        td a {
            color: #ee4d2d;
            text-decoration: none;
            font-weight: bold;
        }

        td a:hover {
            color: #d8341b;
        }

        /* Page Title */
        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        /* Add to Cart Button */
        .add-to-cart-btn {
            background-color: #ee4d2d;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .add-to-cart-btn:hover {
            background-color: #d8341b;
        }

        /* Footer */
        .footer {
            background-color: #f5f5f5;
            color: #333;
            padding: 20px;
            text-align: center;
            font-size: 14px;
            margin-top: auto;
        }

        .footer-content {
            max-width: 800px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .footer-links {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .footer-links a {
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<!-- Header -->
<div class="header">
    <h1>CG-Shoppii</h1>
    <div class="navbar">
        <a href="/product?username=${username}">Trang chủ</a>
        <a href="/about">Giới thiệu</a>
        <a href="/contact">Liên hệ</a>
        <a href="/user/login">${username}</a>
    </div>
</div>

<!-- Search and Cart Section -->
<div class="search-cart-container">
    <form action="/product" method="get">
        <input type="hidden" name="action" value="search">
        <label>
            <input type="text" name="searchByName" placeholder="Nhập tên sản phẩm">
        </label>
        <input type="submit" value="Tìm Kiếm">
    </form>
    <a class="cart-link" href="/cart?username=${username}">🛒 Giỏ hàng</a>
</div>

<!-- Product List -->
<h2>Danh Sách Sản Phẩm</h2>
<table>
    <tr>
        <th>Tên Sản Phẩm</th>
        <th>Mô Tả</th>
        <th>Giá</th>
        <th>Số Lượng</th>
        <th>Hành Động</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price} VND</td>
            <td>${product.inventoryQuantity}</td>
            <td>
                <a class="add-to-cart-btn" href="${pageContext.request.contextPath}/product?action=add-cart&username=${username}&product-id=${product.id}">
                    Thêm vào giỏ
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Footer -->
<div class="footer">
    <p>© 2024 CG-Shoppii. Tất cả các quyền được bảo lưu.</p>
    <div class="footer-content">
        <div class="footer-links">
            <a href="#">Quốc gia & Khu vực:</a>
            <a href="#">Singapore</a>
            <a href="#">Indonesia</a>
            <a href="#">Thái Lan</a>
            <a href="#">Malaysia</a>
            <a href="#">Việt Nam</a>
            <a href="#">Philippines</a>
            <a href="#">Brazil</a>
            <a href="#">México</a>
            <a href="#">Colombia</a>
            <a href="#">Chile</a>
            <a href="#">Đài Loan</a>
        </div>
        <div class="footer-links">
            <a href="#">Chính sách bảo mật</a>
            <a href="#">Quy chế hoạt động</a>
            <a href="#">Chính sách vận chuyển</a>
            <a href="#">CHÍNH SÁCH TRẢ HÀNG VÀ HOÀN TIỀN</a>
        </div>
    </div>
</div>

</body>
</html>
