<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Giỏ Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        #header {
            background-color: #ee4d2d;
            color: white;
            padding: 10px 20px;
            display: flex;
            flex-direction: column;
        }

        #header-above {
            display: flex;
            justify-content: space-between; /* Đặt các mục ở hai bên của header */
            align-items: center; /* Căn giữa theo chiều dọc */
            padding: 10px 20px; /* Thêm khoảng cách cho header */
            background-color: #ee4d2d; /* Màu nền cho header */
            border-bottom: 1px solid #ddd; /* Đường viền dưới cho header */
        }

        #header-above-left, #header-above-right {
            display: flex;
            align-items: center; /* Căn giữa theo chiều dọc */
        }

        #header-above-left div, #header-above-right div {
            margin-right: 15px; /* Khoảng cách giữa các mục */
        }

        #header-above-right div:last-child {
            margin-right: 0; /* Không có khoảng cách cho mục cuối cùng */
        }

        #header-below {
            display: flex;
            justify-content: space-between; /* Đặt các mục ở hai bên của header */
            align-items: center; /* Căn giữa theo chiều dọc */
            padding: 10px 20px; /* Thêm khoảng cách cho header */
        }

        #header-below-left, #header-below-right {
            display: flex;
            align-items: center; /* Căn giữa theo chiều dọc */
        }

        #header-below-left div, #header-below-right div {
            margin-right: 15px; /* Khoảng cách giữa các mục */
        }

        #header-below-right div:last-child {
            margin-right: 0; /* Không có khoảng cách cho mục cuối cùng */
        }

        #txt-cart {
            font-weight: bold;
            margin-left: 10px;
        }

        #body {
            margin-top: 20px;
        }

        .table-container {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #ee4d2d;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        .quantity-choice {
            display: inline-block;
            margin: 0 5px;
        }

        #total-price {
            font-size: 20px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
        }

        #footer {
            text-align: center;
            padding: 20px;
            background-color: #f1f1f1;
            margin-top: 20px;
            font-size: 14px;
        }

        #footer span {
            display: block;
            margin: 5px 0;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="header">
        <div id="header-above">
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
                <div>${username}</div>
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
                    </label> Chọn</th>
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
                        </label></td>
                        <td>${product.name}</td>
                        <td>${product.price} VND</td>
                        <td id="quantity">
                            <span class="quantity-choice"><a href="">-</a></span>
                            <span>${cartItems[status.index].quantity}</span>
                            <span class="quantity-choice"><a href="">+</a></span>
                        </td>
                        <td>${product.price * cartItems[status.index].quantity} VND</td>
                        <td><a href="javascript:void(0);" onclick="confirmDelete(${cartItems[status.index].id});">Xóa</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id="total-price">Tổng giá: <span id="totalAmount">0</span> VND</div>

        <div class="table-container">
            <table id="table-recommend">
                <tr>
                    <td colspan="2">Có thể bạn cũng thích</td>
                </tr>
                <c:forEach var="product" items="${allProducts}" varStatus="status">
                    <c:if test="${status.index < 12}"> <!-- Only show the first 12 products -->
                        <c:if test="${status.index % 6 == 0}"> <!-- New row for every 6 products -->
                            <tr>
                        </c:if>
                        <td>
                                ${product.name} <br>
                                ${product.price} VND
                        </td>
                        <c:if test="${(status.index + 1) % 6 == 0 || status.last}"> <!-- End row after 6 products or at the last product -->
                            </tr>
                        </c:if>
                    </c:if>
                </c:forEach>
            </table>
        </div>
    </div>
    <div id="footer">
        <span>© 2024 Shopee. Tất cả các quyền được bảo lưu.</span>
        <span>Quốc gia & Khu vực:</span>
        <span>Singapore, Indonesia, Thái Lan, Malaysia, Việt Nam, Philippines, Brazil, México, Colombia, Chile, Đài Loan</span>
        <span>Chính sách bảo mật | Quy chế hoạt động | Chính sách vận chuyển | Chính sách trả hàng và hoàn tiền</span>
    </div>
</div>

<script type="text/javascript">
    function confirmDelete(cartItemId) {
        if (confirm("Bạn có chắc chắn muốn xóa sản phẩm này không?")) {
            window.location.href = `${pageContext.request.contextPath}/cart?action=delete-cart-item&id=` + cartItemId;
        }
    }
    function updateTotal() {
        const checkboxes = document.querySelectorAll(".product-checkbox");
        let total = 0;

        checkboxes.forEach((checkbox, index) => {
            if (checkbox.checked) {
                const price = parseFloat(document.querySelectorAll("#table-cart-item tr")[index + 1].cells[4].textContent);
                total += price;
            }
        });
        document.getElementById("totalAmount").textContent = total.toLocaleString("vi-VN");
    }
    function toggleSelectAll(checkbox) {
        const checkboxes = document.querySelectorAll(".product-checkbox");
        checkboxes.forEach((cb) => cb.checked = checkbox.checked);
        updateTotal();
    }
</script>
</body>
</html>
