<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 11/4/2024
  Time: 8:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="java.util.List, model.Product, service.ProductService" %>--%>
<%--<%--%>
<%--    ProductService productService = new ProductService();--%>
<%--    List<Product> productList = productService.getAllProducts();--%>
<%--%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/product?action=search" method="get">
    <label>
        <input type="text" name="searchByName" placeholder="Nhập ten sản phẩm">
        <input type="submit" value="timKiem">
    </label>

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
            <td><a href="${pageContext.request.contextPath}/product?action=add-cart&cart-id=1&product-id=${product.id}">Them vao gio</a></td>

        </tr>
    </c:forEach>

<%--    <%--%>
<%--        for (Product product : productList) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= product.getId() %></td>--%>
<%--        <td><%= product.getName() %></td>--%>
<%--        <td><%= product.getDescription() %></td>--%>
<%--        <td><%= product.getPrice() %></td>--%>
<%--        <td>--%>
<%--            <form action="AdminController" method="POST">--%>
<%--                <input type="hidden" name="action" value="deleteProduct"/>--%>
<%--                <input type="hidden" name="productId" value="<%= product.getId() %>"/>--%>
<%--                <button type="submit">Delete</button>--%>
<%--            </form>--%>
<%--            <form action="AdminController" method="GET" action="editProduct.jsp">--%>
<%--                <input type="hidden" name="productId" value="<%= product.getId() %>"/>--%>
<%--                <button type="submit">Edit</button>--%>
<%--            </form>--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
</table>
</body>
</html>
