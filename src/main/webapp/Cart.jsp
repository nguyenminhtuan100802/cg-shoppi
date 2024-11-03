<%--
  Created by IntelliJ IDEA.
  User: tuan
  Date: 11/1/2024
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cart</title>
    <style>
        body{
            font-family: Arial, serif;
            background: #f3f3f3;
            margin: unset;
        }
        #header{
            display: flex;
            flex-direction: column;
        }
        #header-above, #header-above-left, #header-above-right, #header-below, #header-below-left, #header-below-right{
            display: flex;
            flex-direction: row;
        }
        #header-above {
            background-color: #f95530;
            color: #ffffff;
            position: relative;
        }
        #header-below{
            background: #ffffff;
            color: #f95530;
            position: relative;
            height: 100px;
            align-items: center;
        }
        #header-above-right, #header-below-right{
            position: absolute;
            right: 0;
        }
        #header-above-left div, #header-above-right div, #header-above-left span, #header-below-left div,  #header-below-left span, #header-below-right div {
            padding: 5px;
        }
        #txt-shopee, #txt-cart{
            font-size: 20px;
        }
        #txt-shopee{
            font-weight: bold;
        }
        #table-cart-item{
            margin-top: 10px;
            background: #ffffff;
        }
        #table-cart-item tr, #table-cart-item th{
            width: 100vw;
            padding: 5px;
        }
        #quantity{
            display: flex;
            flex-direction: row;
        }
        #quantity div{
            flex-grow: 1;
        }
        .quantity-choice{
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="header">
        <div id="header-above" class="">
            <div id="header-above-left">
                <div>Kênh Người Bán</div>
                <span>|</span>
                <div>Tải ứng dụng</div>
                <span>|</span>
                <div>Kết nối</div>
            </div>
            <div id="header-above-right">
                <div>Thông Báo</div>
                <div>Hỗ Trợ</div>
                <div>Tiếng Việt</div>
                <div>Account</div>
            </div>
        </div>
        <div id="header-below">
            <div id="header-below-left">
                <div id="txt-shopee">Shopee</div>
                <span>|</span>
                <div id="txt-cart">Giỏ Hàng</div>
            </div>
            <div id="header-below-right">
                <div>
                    <label>
                        <input type="text" placeholder="Mua nhiều giảm sâu">
                    </label>
                    <span>Icon</span>
                </div>
            </div>
        </div>
    </div>
    <div id="body">
        <table id="table-cart-item">
            <tr>
                <th>Sản Phẩm</th>
                <th>Đơn Giá</th>
                <th>Số Lượng</th>
                <th>Số Tiền</th>
                <th>Thao Tác</th>
            </tr>
            <c:forEach var="product" items="${products}" varStatus="status">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td id="quantity">
                        <div class="quantity-choice"><a href="">-</a></div>
                        <div>${cartItems[status.index].quantity}</div>
                        <div class="quantity-choice"><a href="">+</a></div>
                    </td>
                    <td>${product.price * cartItems[status.index].quantity}</td>
                    <td>
                        <!-- Thêm các thao tác như xóa sản phẩm, chỉnh sửa số lượng, v.v. -->
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div id="footer">footer</div>
</div>
</body>
</html>
