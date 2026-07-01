<%@ page import="model.Report" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!--  Page Head -->
<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="Reports"/>
    <jsp:param name="cssFile" value="reports"/>
</jsp:include>
<body>

<%
Report report = (Report) request.getAttribute("report");
%>

<div class="reports-layout">
     
     <!-- Sidebar -->
     <div class="sidebar">
      
         <h2><i class="fa fa-graduation-cap"></i> Student Skill Tracker</h2>
         
         <a href="${pageContext.request.contextPath}/dashboard">
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
         
         <a class="active" href="${pageContext.request.contextPath}/reports">
            <i class="fa fa-bar-chart"></i> Reports   
         </a>
         
         <a href="${pageContext.request.contextPath}/settings">
            <i class="fa fa-cog"></i> Settings
         </a>
         
         <a href="${pageContext.request.contextPath}/logout">
            <i class="fa fa-sign-out"></i> Logout
         </a>
     </div>
     
     <!--  Main Content -->
     <div class="reports-content">
       
       <div class="page-header">
            <div>
            <h1>Reports</h1>
            <p>System summary and statistics.</p>
            </div>
       </div>
       
       <div class="cards">
          
          <div class="card">
             <i class="fa fa-users"></i>
             <h2><%= report.getTotalStudents() %></h2>
             <p>Total Students</p>
          </div>
          
          <div class="card">
             <i class="fa fa-list"></i>
             <h2><%= report.getTotalSkills() %></h2>
             <p>Total Skills</p>
          </div>
          
          <div class="card">
              <i class="fa fa-check-square-o"></i>
              <h2><%= report.getTotalAssignedSkills() %></h2>
              <p>Assigned Skills</p>
          </div>
          
          <div class="card">
             <i class="fa fa-folder"></i>
             <h2><%= report.getTotalCategories() %></h2>
             <p>Categories</p>
          </div>
          
          <div class="card">
             <i class="fa fa-line-chart"></i>
             <h2><%= String.format("%.1f", report.getAverageProgress()) %>%</h2>
             <p>Average Progress</p>
          </div>
       </div>
     </div>
</div>
</body>
</html>