<%@ page import="model.Settings" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Page Header -->
<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="Settings"/>
    <jsp:param name="cssFile" value="settings"/>
</jsp:include>

<body>

<%
Settings settings = (Settings) request.getAttribute("settings");
%>

<div class="settings-layout">
  
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
     
     <a href="${pageContext.request.contextPath}/reports">
        <i class="fa fa-bar-chart"></i> Reports
     </a>
     
     <a class="active" href="${pageContext.request.contextPath}/settings">
       <i class="fa fa-cog"></i> Settings
     </a>
     
     <a href="${pageContext.request.contextPath}/logout">
       <i class="fa fa-sign-out"></i> Logout
     </a>
  </div>
  
  <div class="settings-content">
    
    <div class="page-header">
        <div>
        <h1>Settings</h1>
        <p>View system information and application details.</p>
    </div> 
    </div>
    
    <div class="settings-card">
    
       <div class="info-row">
           <strong>System Name</strong>
           <span><%= settings.getSystemName() %></span>
       </div>
       
       <div class="info-row">
           <strong>Version</strong>
           <span><%= settings.getVersion() %></span>
       </div>
       
       <div class="info-row">
         <strong>Developer</strong>
         <span><%= settings.getDeveloper() %></span>
       </div>
       
       <div class="info-row">
         <strong>Database</strong>
         <span>MYSQL</span>
       </div>
       
        <div class="info-row">
         <strong>Framework</strong>
         <span>Jakarta Servlet &amp; JSP</span>
       </div>
       
        <div class="info-row">
         <strong>Java Version</strong>
         <span>Java 17</span>
       </div>
       
       <div class="info-row">
         <strong>Purpose</strong>
         <span>Track student skills and progress</span>
       </div>
    </div>
    </div>
  </div>
</body>
</html>