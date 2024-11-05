<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <style>
    /* General Reset and Styling */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: Arial, sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: #f5f5f5;
    }

    /* Register Box */
    #registerContainer {
      width: 400px;
      padding: 30px;
      background-color: white;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    #registerContainer h2 {
      font-size: 24px;
      margin-bottom: 20px;
      color: #333;
    }

    /* Form Elements */
    #registerForm label, #registerForm input, #registerForm select {
      width: 100%;
      margin-top: 10px;
      font-size: 14px;
    }

    #registerForm input[type="text"],
    #registerForm input[type="password"],
    #registerForm select {
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }

    #registerForm button {
      width: 100%;
      padding: 10px;
      margin-top: 20px;
      background-color: #ee4d2d;
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      cursor: pointer;
    }

    #registerForm button:hover {
      background-color: #d94425;
    }

    /* Message Styling */
    #messageBox {
      margin-top: 20px;
      font-size: 14px;
      color: #333;
    }
  </style>
</head>
<body>
<div id="registerContainer">
  <h2>Register</h2>
  <form id="registerForm" action="${pageContext.request.contextPath}/register" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <label for="role">Role:</label>
    <select id="role" name="role">
      <option value="User">User</option>
      <option value="Admin" style="display: none;">Admin</option> <!-- Hidden option -->
      <option value="None">None</option> <!-- New option -->
    </select>

    <button type="submit">Register</button>
  </form>

  <c:if test="${not empty message}">
    <div id="messageBox">${message}</div>
  </c:if>
</div>
</body>
</html>
