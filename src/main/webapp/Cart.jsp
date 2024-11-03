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
        body {
            font-family: Arial, serif;
            background: #f3f3f3;
            margin: unset;
        }

        #header {
            display: flex;
            flex-direction: column;
        }

        #header-above, #header-above-left, #header-above-right, #header-below, #header-below-left, #header-below-right {
            display: flex;
            flex-direction: row;
        }

        #header-above {
            background-color: #f95530;
            color: #ffffff;
            position: relative;
        }

        #header-below {
            background: #ffffff;
            color: #f95530;
            position: relative;
            height: 100px;
            align-items: center;
        }

        #header-above-right, #header-below-right {
            position: absolute;
            right: 0;
        }

        #header-above-left div, #header-above-right div, #header-above-left span, #header-below-left div, #header-below-left span, #header-below-right div {
            padding: 5px;
        }

        #txt-shopee, #txt-cart {
            font-size: 20px;
        }

        #txt-shopee {
            font-weight: bold;
        }

        .table-container, #total-price {
            width: 100%; /* Đặt vùng chứa của bảng thành 100% chiều rộng */
            max-width: 1200px; /* Tùy chỉnh chiều rộng tối đa cho bảng nếu muốn */
            margin: 0 auto; /* Căn giữa bảng */
        }

        #table-cart-item, #table-recommend {
            width: 100%; /* Đặt chiều rộng của bảng thành 100% để lấp đầy vùng chứa */
            margin-top: 10px;
            background: #ffffff;
            border-collapse: collapse; /* Làm các đường viền bảng sát nhau nếu có */
        }

        #table-cart-item tr, #table-cart-item th, #table-recommend tr {
            width: 100vw;
            padding: 5px;
        }

        #table-recommend td {
            border: 4px solid #f3f3f3; /* Đường viền xung quanh các ô */
        }

        #quantity {
            display: flex;
            flex-direction: row;
        }

        #quantity div {
            flex-grow: 1;
        }

        .quantity-choice {
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
        <div class="table-container">
            <table id="table-cart-item">
                <tr>
                    <th><label>
                        <input type="checkbox" onclick="toggleSelectAll(this)">
                    </label> Chọn</th> <!-- Nút tick chọn tất cả -->
                    <th>Sản Phẩm</th>
                    <th>Đơn Giá</th>
                    <th>Số Lượng</th>
                    <th>Số Tiền</th>
                    <th>Thao Tác</th>
                </tr>
                <c:forEach var="product" items="${products}" varStatus="status">
                    <tr>
                        <td><label>
                            <input type="checkbox" class="product-checkbox" onchange="updateTotal()">
                        </label>
                            <!-- Checkbox từng sản phẩm -->
                        </td>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td id="quantity">
                            <div class="quantity-choice"><a href="">-</a></div>
                            <div>${cartItems[status.index].quantity}</div>
                            <div class="quantity-choice"><a href="">+</a></div>
                        </td>
                        <td>${product.price * cartItems[status.index].quantity}</td>
                        <td><a href="javascript:void(0);"
                               onclick="confirmDelete(${cartItems[status.index].id});">Xóa</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id="total-price">Tổng giá: <span id="totalAmount">0</span> VND</div> <!-- Hiển thị tổng giá tiền -->


        <div class="table-container">
            <table id="table-recommend">
                <tr>
                    <td colspan="2">Có thể bạn cũng thích</td>
                </tr>
                <c:forEach var="product" items="${allProducts}" varStatus="status">
                    <c:if test="${status.index < 18}"> <!-- Chỉ hiển thị 12 sản phẩm đầu tiên -->
                        <c:if test="${status.index % 6 == 0}"> <!-- Bắt đầu hàng mới mỗi 6 sản phẩm -->
                            <tr>
                        </c:if>

                        <td>
                                ${product.name} <br>
                                ${product.price}
                        </td>

                        <c:if test="${(status.index + 1) % 6 == 0 || status.last}"> <!-- Kết thúc hàng sau 6 sản phẩm hoặc là sản phẩm cuối cùng -->
                            </tr>
                        </c:if>
                    </c:if>
                </c:forEach>

            </table>
        </div>
    </div>
    <div id="footer">footer</div>
</div>

<script type="text/javascript">
    function confirmDelete(cartItemId) {
        if (confirm("Bạn có chắc chắn muốn xóa người dùng này không?")) {
            // Chuyển hướng đến URL xóa người dùng nếu được xác nhận
            window.location.href = `${pageContext.request.contextPath}/cart?action=delete-cart-item&id=` + cartItemId;
        }
    }
    function updateTotal() {
        // Lấy tất cả các checkbox của sản phẩm
        const checkboxes = document.querySelectorAll(".product-checkbox");
        let total = 0;

        checkboxes.forEach((checkbox, index) => {
            if (checkbox.checked) {
                const price = parseFloat(document.querySelectorAll("#table-cart-item tr")[index + 1].cells[4].textContent);
                // Tính tổng giá cho sản phẩm được chọn
                total += price;
            }
        });
        // Hiển thị tổng giá cập nhật
        document.getElementById("totalAmount").textContent = total.toLocaleString("vi-VN");
    }
    function toggleSelectAll(checkbox) {
        // Tick hoặc bỏ tick tất cả các sản phẩm
        const checkboxes = document.querySelectorAll(".product-checkbox");
        checkboxes.forEach((cb) => cb.checked = checkbox.checked);
        updateTotal();
    }
</script>
</body>
</html>
