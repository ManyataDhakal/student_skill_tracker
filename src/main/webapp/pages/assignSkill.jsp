<%@ page import="java.util.List" %>
<%@ page import="model.Skill" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../templates/head.jsp">
   <jsp:param name="title" value="Assign Skill"/>
   <jsp:param name="cssFile" value="assignSkill"/>
</jsp:include>
<body>

<div class="add-layout">
   
   <!-- Sidebar -->
   <div class="sidebar">
       <h2><i class="fa fa-graduation-cap"></i> Student Skill Tracker</h2>
       
       <a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-home"></i> Dashboard</a>
       <a href="${pageContext.request.contextPath}/skills"><i class="fa fa-list"></i> Skills</a>
       <a href="${pageContext.request.contextPath}/categories"><i class="fa fa-folder"></i> Categories</a>
       <a href="${pageContext.request.contextPath}/students"><i class="fa fa-users"></i> Students</a>
       <a href="${pageContext.request.contextPath}/assignedSkills"><i class="fa fa-check-square-o"></i> Assigned Skills</a>
       <a href="${pageContext.request.contextPath}/reports"><i class="fa fa-bar-chart"></i> Reports</a>
       <a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i> Logout</a>       
   </div>
   
   <!-- Main Content -->
   <div class="add-content">
      
      <div class="page-header">
        <div>
          <h1>Assign Skill</h1>
          <p>Select a skill for this student.</p>
        </div>
        
        <a href="${pageContext.request.contextPath}/students" class="back-btn">
          <i class="fa fa-arrow-left"></i> Back
        </a>
      </div>
      
      <div class="form-card">
        
        <form action="${pageContext.request.contextPath}/assignSkill" method="post">
        
           <!-- Student ID -->
           <input type="hidden"
                  name="userId"
                  value="${param.userId}">
                  
            <!-- Skill -->
            <div class="form-group">
              <label>Skill</label>
              
              <select name="skillId" required>
                
                
                <%
                List<Skill> skills = (List<Skill>) request.getAttribute("skills");
                
                if(skills != null) {
                	for(Skill skill : skills) {
                %>
                
                <option value="<%= skill.getId() %>">
                    <%= skill.getSkillName() %>
                    </option>
                    
                <%
                	}
                }
                %>
              </select>
            </div>   
            
            <!-- Proficiency --> 
            <div class="form-group">
                <label>Proficiency</label>
                
                <select name="proficiency">
                   
                   <option value="Beginner">Beginner</option>
                   <option value="Intermediate">Intermediate</option>
                   <option value="Advanced">Advanced</option>
                </select>
            </div>  
            
            <div class="form-buttons">
               <button type="submit" class="save-btn">
                 <i class="fa fa-save"></i> Assign Skill
               </button>
               
               <button type="reset" class="reset-btn">
                   Reset
               </button>
            </div>
                  
        </form>
      </div>
   </div>
</div>
</body>
</html>