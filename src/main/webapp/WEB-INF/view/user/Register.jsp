<form action="${pageContext.request.contextPath}/register" method="post">
  <label for="username">Username:</label>
  <input type="text" id="username" name="username" required>

  <label for="password">Password:</label>
  <input type="password" id="password" name="password" required>

  <label for="role">Role:</label>
  <select id="role" name="role">
    <option value="User">User</option>
    <option value="Admin" style="display: none;">Admin</option> <!-- Hide this option -->
    <option value="None">None</option> <!-- Add this option -->
  </select>

  <button type="submit">Register</button>
</form>

<c:if test="${not empty message}">
  <div>${message}</div>
</c:if>