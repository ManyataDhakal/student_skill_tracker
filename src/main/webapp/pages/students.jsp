<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../templates/head.jsp">
   <jsp:param name="title" value="Students"/>
   <jsp:param name="cssFile" value="students"/>
</jsp:include>

<body>

<div class="students-layout">
     
     <!-- Left Sidebar -->
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
      
      <a class="active" href="${pageContext.request.contextPath}/students">
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
     <div class="students-content">
     
        <!-- Page Header -->
        <div class="page-header">
          <div>
            <h1>Students List</h1>
            <p>View all registered students in the system.</p>
          </div>
          
          <a href="${pageContext.request.contextPath}/addStudent" class="add-btn">
             <i class="fa fa-plus"></i> Add Student
          </a>
        </div>
        
        <!-- Students Table Card -->
        <div class="students-card">
          <table class="students-table">
             
             <tr>
               <th>ID</th>
               <th>Full Name</th>
               <th>Email</th>
               <th>Status</th>
               <th>Action</th>
             </tr>
             
             <%
             List<User> students = (List<User>) request.getAttribute("students");
             
             if (students != null && !students.isEmpty()) {
            	 for (User user : students) {
            %>
            
            <tr>
              <td><%= user.getId() %></td>
              <td><%= user.getFullName() %></td>
              <td><%= user.getEmail() %></td>
              <td><%= user.getStatus() %></td>
              
              <td>
               <a class="view-btn" 
                  href="${pageContext.request.contextPath}/studentSkills?userId=<%= user.getId() %>">
                  <i class="fa fa-eye"></i> View Skills
               </a>
              </td>
            </tr>
            
            <% 
            	   }
            	 } else {
             
            %>
            
            <tr>
              <td colspan="5" class="empty-message">
                 No students found.
                 </td>
            </tr>
            
            <%
            	 }
            %>
          </table>
        </div>
     </div>
</div>
</body>
</html>