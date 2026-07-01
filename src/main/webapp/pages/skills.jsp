<%@ page import="java.util.List" %>
<%@ page import="model.Skill" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>

<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="Skills"/>
    <jsp:param name="cssFile" value="skills"/>
</jsp:include>

<body>
<div class="skills-layout">
<!-- Left Sidebar -->
     <div class="sidebar">
          <h2><i class="fa fa-graduation-cap"></i> Student Skill Tracker</h2>
          
          <a href="${pageContext.request.contextPath}/dashboard">
             <i class="fa fa-home"></i> Dashboard
             </a>
             
          <a class="active" href="${pageContext.request.contextPath}/skills">
             <i class="fa fa-list"></i> Skills
             </a>
             
          <a href="${pageContext.request.contextPath}/categories">
             <i class="fa fa-folder"></i> Categories
             </a>
             
          <a href="${pageContext.request.contextPath}/students">
             <i class="fa fa-users"></i> Students
             </a>
             
          <a href="#">
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
     <div class="skills-content">
          
          <!-- Page Header -->
          <div class="page-header">
               <div>
                  <h1>Skills List</h1>
                  <p>View and manage all skills in the system.</p>
                 </div>
                 
                 <a href="${pageContext.request.contextPath}/pages/addSkill.jsp" class="add-btn">
                    <i class="fa fa-plus"></i> Add Skill
                 </a>
               </div>
               
               <!-- Success Message -->
               <%
               String success = (String) session.getAttribute("success");
               if (success != null) {
               %>
               
               <p class="success-message"><%= success %></p>
               
               <%
                 session.removeAttribute("success");
                 }
                 %>
               
               <!-- Skills Table Card -->
               <div class="skills-card">
                    <table  class="skills-table">
                    
                      <tr>
                        <th>ID</th>
                        <th>Skill Name</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Action</th>
                      </tr>
                      
                      <!-- Skills Data  -->
                      <%
                        List<Skill> skills = (List<Skill>) request.getAttribute("skills");
                        
                        if (skills != null && !skills.isEmpty()) {
                            for (Skill skill: skills) {
                        %>
                        
                        <tr>
                          <td><%= skill.getId() %></td>
                          <td><%= skill.getSkillName() %></td>
                          <td><%= skill.getCategory() %></td>
                          <td><%= skill.getDescription() %></td>
                          
                          <td>
                            <a class="edit-btn"
                               href="${pageContext.request.contextPath}/editSkill?id=<%= skill.getId() %>">
                               <i class="fa fa-pencil"></i> Edit
                               </a>
                               
                            <a class="delete-btn"
                               href="${pageContext.request.contextPath}/deleteSkill?id=<%= skill.getId() %>"
                               onclick="return confirm('Are you sure you want to delete this skill?')">
                               <i class="fa fa-trash"></i> Delete
                               </a>
                          </td>
                        </tr>
                        
                        <% 
                           }
                        }  else {
                        	%>
                        	
                        	<tr>
                        	  <td colspan="5" class="empty-message">
                        	     No skills found.
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