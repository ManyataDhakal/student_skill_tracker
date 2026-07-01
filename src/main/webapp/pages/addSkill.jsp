<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="Add Skill"/>
    <jsp:param name="cssFile" value="addSkill"/>
 </jsp:include>

<body>

<div class="add-layout">
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
    
    <div class="add-content">
         <!-- Page Header -->
         <div class="page-header">
             <div>
                <h1>Add New Skill</h1>
                <p>Fill in the details below to add a new skill.</p>
                </div>
                
               <a href="${pageContext.request.contextPath}/skills" class="back-btn">
                  <i class="fa fa-arrow-left"></i> Skills List
                  </a>
         </div>  
         
         <!-- Form Card -->
         <div class="form-card">
             <!-- Message -->
             <p class="error-message">${error}</p>
             <p class="success-message">${success}</p>
             
             <form action="${pageContext.request.contextPath}/addSkill" method="post">
                <!-- Skill Name -->
                <div class="form-group">
                     <label for="skillName">Skill Name</label>
                     <input type="text"
                            id="skillName"
                            name="skillName"
                            placeholder="Enter skill name"
                            required>
                   </div>
                   
                   <!-- Category -->
                   <div class="form-group">
                        <label for="category">Category</label>
                        <input type="text"
                               id="category"
                               name="category"
                               placeholder="Enter category"
                               required>
                   </div>
                   
                   <!-- Description -->
                   <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description"
                                  name="description"
                                  rows="4"
                                  placeholder="Enter skill description"
                                  required></textarea>
                   </div>
                   
                   <!-- Buttons -->
                   <div class="form-buttons">
                   
                       <button type="submit" class="save-btn">
                          <i class="fa fa-save"></i> Save Skill
                       </button>
                       
                       <button type="reset" class="reset-btn">
                          <i class="fa fa-refresh"></i> Reset
                       </button>
                       
                   </div>
                   
             </form>
             
          </div>
          
      </div>
      
</div>

</body>
</html>