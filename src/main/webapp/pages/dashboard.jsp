<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
<jsp:param name="title" value="Dashboard"/>
<jsp:param name="cssFile" value="dashboard"/>
</jsp:include>

<body>

<div class="dashboard-layout">
<!-- Left Sidebar -->
<div class="sidebar">
<h2><i class="fa fa-graduation-cap"></i> Student Skill Tracker</h2>
<a class="active" href="${pageContext.request.contextPath}/dashboard">
   <i class="fa fa-home"></i> Dashboard
</a>

<a href="${pageContext.request.contextPath}/skills">
   <i class="fa fa-list"></i> Skills
</a>

<a href="${pageContext.request.contextPath}/categories">
<i class="fa fa-folder"></i> Categories
</a>

<a href="${pageContext.request.contextPath}/students">
<i class="fa fa-users"></i> Students
</a>

<a href="${pageContext.request.contextPath}/assignedSkills">
<i class="fa fa-check-square-o"></i> Assigned Skills
</a>

<a href="${pageContext.request.contextPath}/reports">
<i class="fa fa-bar-chart"></i> Reports
</a>

<a href="${pageContext.request.contextPath}/settings">
<i class="fa fa-cog"></i> Settings
</a>

<a href="${pageContext.request.contextPath}/logout">
   <i class="fa fa-sign-out"></i> Logout
</a>
</div>

<!-- Main Content -->
<div class="dashboard-content">

<h1>Welcome, ${sessionScope.user.fullName}</h1>
<p>Manage skills and track student progress.</p>

<!--Top Action Button -->
<div class="top-actions">
   <a href="${pageContext.request.contextPath}/pages/addSkill.jsp">
      <i class="fa fa-plus"></i> Add Skill
   </a>
   
</div>

<h2 class="section-title"> Dashboard Overview</h2>

<!-- DashBoard Cards -->
<div class="cards">
   <div class="card">
   <i class="fa fa-book"></i>
   <h2>${totalSkills}</h2>
   <p>Total Skills</p>
</div>

<!-- Categories -->
<div class="card">
  <i class="fa fa-folder"></i>
  <h2>${totalCategories}</h2>
  <p>Categories</p>
</div>

<!-- Students -->
<div class="card">
  <i class="fa fa-users"></i>
  <h2>${totalStudents}</h2>
  <p>Students</p>
</div>

<!-- Assigned Skills -->
<div class="card">
   <i class="fa fa-check-square-o"></i>
   <h2>${totalAssignedSkills}</h2>
   <p>Assigned Skills</p>
</div>

</div>

<!-- Quick Actions -->
<div class="quick-actions">
    <a href="${pageContext.request.contextPath}/skills">
       <i class="fa fa-list"></i> Manage Skills
    </a>
    
    <a href="${pageContext.request.contextPath}/pages/addSkill.jsp">
       <i class="fa fa-plus"></i> Add Skill
    </a>
    
</div>
 <!-- Recently Added Skills -->
<h3>Recent Skills</h3>

<p class="small-text">
Recently added skills in the system.
</p>

<div class="card recent-card">
   <ul>
      <li><i class="fa fa-book"></i> Java Programming</li>
      <li><i class="fa fa-html5"></i> HTML Fundamentals</li>
      <li><i class="fa fa-database"></i> MySQL Database</li>
      <li><i class="fa fa-coffee"></i> Java Servlet</li>
      <li><i class="fa fa-css3"></i> CSS Basics</li>
   </ul>
</div>

</div>
</div>
</body>
</html>