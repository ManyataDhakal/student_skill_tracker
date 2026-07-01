<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
<jsp:param name="title" value="Login"/>
<jsp:param name="cssFile" value="login"/>
</jsp:include>

<body>

<div class="login-card">
<div class="login-header">
   <h1>Student Skill Tracker</h1>
   <p>Track and manage student skills</p>
</div>

<!-- Login Form -->
<form action="${pageContext.request.contextPath}/login" method="post">
<h2>Login</h2>

<!-- Error Message -->
<p class="error" style="display:${not empty error ? 'block' : 'none'}">
${error}
</p>

<!-- Email Input -->
<div class="input-group">
<i class="fa fa-envelope"></i>
<input 
    type="email"
    placeholder="Email"
    name="email"
    required
/>
</div>

<!-- Password Input -->
<div class="input-group">
<i class="fa fa-lock"></i>
<input 
    type="password"
    placeholder="Password"
    name="password"
    required
/>
</div>

<!-- Login Forgot -->
<a href="#" class="forgot">Forgot password?</a>

<!-- Login Button -->
<button type="submit">
Login
</button>   
 
<p class="signup">
Not a member? <a href="#">Signup now</a>   
</p>    
</form>
</div>

</body>
</html>