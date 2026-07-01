<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="header">

<!--Project Logo -->
<div class="logo">
<a href="${pageContext.request.contextPath}/pages/dashboard.jsp" style="text-decoration:none">

<img src="${pageContext.request.contextPath}/resources/book.jpg"
     alt="Student Skill Tracker" />
</a>

<h3>Student Skill Tracker</h3>
</div>

<!-- User Session -->
<div class="usersession">
<h3>${sessionScope.user.fullName}</h3>

<a href="${pageContext.request.contextPath}/logout"
class="logout"
onclick="return confirm('Do you want to logout')">
Logout
</a>
</div>
</header>