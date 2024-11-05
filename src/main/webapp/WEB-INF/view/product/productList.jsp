<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 11/4/2024
  Time: 8:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
<form action="/product" method="get">
    <input type="hidden" name="action" value="search">
    <label>
        <input type="text" name="searchByName" placeholder="Nhập tên sản phẩm">
    </label>
    <input type="submit" value="Tìm Kiếm">
</form>
<h2>Product List</h2>
<table border="1">
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td>${product.inventoryQuantity}</td>
            <td><a href="${pageContext.request.contextPath}/product?action=add-cart&username=${username}&product-id=${product.id}">Them
                vao gio</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
