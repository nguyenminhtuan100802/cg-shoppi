<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
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

    /* Login Box */
    #loginContainer {
      width: 400px;
      padding: 30px;
      background-color: white;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    #loginContainer h2 {
      font-size: 24px;
      margin-bottom: 20px;
      color: #333;
    }

    /* Form Elements */
    #loginForm label, #loginForm input {
      width: 100%;
      margin-top: 10px;
      font-size: 14px;
    }

    #loginForm input[type="text"],
    #loginForm input[type="password"] {
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }

    #loginForm button {
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

    #loginForm button:hover {
      background-color: #d94425;
    }

    /* Footer Links */
    #footerLinks {
      margin-top: 20px;
      font-size: 12px;
      color: #999;
    }

    #footerLinks a {
      color: #ee4d2d;
      text-decoration: none;
    }

    #footerLinks a:hover {
      text-decoration: underline;
    }
  </style>

  <script>
    // Function to display alert for error messages
    function showAlert(message) {
      alert(message);
    }
  </script>
</head>
<body>
<div id="loginContainer">
  <h2>Login to Shopee</h2>

  <%-- Check for the message attribute and display alert if it exists --%>
  <% String message = (String) request.getAttribute("message"); %>
  <% if (message != null) { %>
  <script>showAlert("<%= message %>");</script>
  <% } %>

  <form id="loginForm" action="login" method="post">
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">Login</button>
  </form>

<%--  <div id="footerLinks">--%>
<%--    <p>Don’t have an account? <a href="register">Sign Up</a></p>--%>
<%--    <p><a href="#">Forgot Password?</a></p>--%>
<%--  </div>--%>
</div>
</body>
</html>
