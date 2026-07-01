<%@ page import="java.util.List" %>
<%@ page import="model.StudentSkill" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="Student Skills"/>
    <jsp:param name="cssFile" value="studentSkills"/>
</jsp:include>

<body>

<div class="studentSkills-layout">
     
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
     <div class="studentSkills-content">
     
        <!-- Header -->
        <div class="page-header">
            
            <div>
              <h1>Student Skills</h1>
              <p>View assigned skills and progress.</p>
            </div>
            
            <div class="header-buttons">
              <a href="${pageContext.request.contextPath}/assignSkill?userId=${param.userId}" class="back-btn">
                 <i class="fa fa-plus"></i> Assign Skill 
              </a>
              
              <a href="${pageContext.request.contextPath}/students" class="back-btn">
               <i class="fa fa-arrow-left"></i> Back to Students
            </a>
            </div>
        </div>
        
        <!-- Table Card -->
        <div class="studentSkills-card">
             
             <table class="studentSkills-table">
                
                <tr>
                  <th>Skill Name</th>
                  <th>Category</th>
                  <th>Proficiency</th>
                  <th>Progress</th>
                  <th>Action</th>
                </tr>
                
                <%
                List<StudentSkill> studentSkills=
                   (List<StudentSkill>) request.getAttribute("studentSkills");
                
                if(studentSkills != null && !studentSkills.isEmpty()){
                
                   for(StudentSkill skill : studentSkills) {
                   %>
                   
                   <tr>
                   
                     <td><%= skill.getSkillName() %></td>
                     <td><%= skill.getCategory() %></td>
                     <td><%= skill.getProficiencyLevel() %></td>
                     <td><%= skill.getProgress() %>%</td>
                     
                     <td>
                       <a class="track-btn" 
                          href="${pageContext.request.contextPath}/editProgress?id=<%= skill.getId() %>"> 
                          Update Progress
                        </a>
                     </td>
                   </tr>
                   
                   <% 
                   
                      }
                      
                      }else{
                      %>
                      
                      <tr>
                        <td colspan="5" class="empty-message">
                           No skills assigned to this student.
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