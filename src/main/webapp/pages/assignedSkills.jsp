<%@ page import="java.util.List" %>
<%@ page import="model.AssignedSkill" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
   <jsp:param name="title" value="Assigned Skills"/>
   <jsp:param name="cssFile" value="assignedSkills"/>
</jsp:include>

<body>

<div class="assignedSkills-layout">
  
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
      
      <a  class="active" href="${pageContext.request.contextPath}/assignedSkills">
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
  <div class="assignedSkills-content">
   
     <!-- Page Header -->
     <div class="page-header">
          <div>
             <h1>Assigned Skills</h1>
             <p>View all  assigned skills.</p>
          </div>
     </div>
     
     <!-- AssignedSkills Card -->
     <div class="assignedSkills-card">
         
         <table class="assignedSkills-table">
         
           <tr>
             <th>Student</th>
             <th>Skill</th>
             <th>Category</th>
             <th>Proficiency</th>
             <th>Progress</th>
             
           </tr>
           
           <%
           @SuppressWarnings("unchecked")
           List<AssignedSkill> assignedSkills =
               (List<AssignedSkill>) request.getAttribute("assignedSkills");
           
           if (assignedSkills != null && !assignedSkills.isEmpty()){
        	   
        	   for (AssignedSkill skill : assignedSkills) {
        		   
        	%>
        	
        	<tr>
        	  <td><%= skill.getStudentName() %></td>
        	  <td><%= skill.getSkillName() %></td>
        	  <td><%= skill.getCategory() %></td>
        	  <td><%= skill.getProficiencyLevel() %></td>
        	  <td><%= skill.getProgress() %>%</td>
        	  
        	  
        	</tr>
        	<% 
        		   }
        	   } else {
           %>
           
           <tr>
             <td colspan="2" class="empty-message">
                 No assigned skills found.
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