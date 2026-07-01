<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="Add Student"/>
    <jsp:param name="cssFile" value="addStudent"/>
 </jsp:include>

<body>

<div class="add-layout">
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
       
    <a  class="active" href="${pageContext.request.contextPath}/students">
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
                <h1>Add New Student</h1>
                <p>Fill in the details below to add a new student.</p>
                </div>
                
               <a href="${pageContext.request.contextPath}/students" class="back-btn">
                  <i class="fa fa-arrow-left"></i> Students List
                  </a>
         </div>  
         
         <!-- Form Card -->
         <div class="form-card">
             <!-- Message -->
             <p class="error-message">${error}</p>
             <p class="success-message">${success}</p>
             
             <form action="${pageContext.request.contextPath}/addStudent" method="post">
                <!-- Student Name -->
                <div class="form-group">
                     <label for="fullName">Full Name</label>
                     <input type="text"
                            id="fullName"
                            name="fullName"
                            placeholder="Enter full name"
                            required>
                   </div>
                   
                   <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email"
                               id="email"
                               name="email"
                               placeholder="Enter email"
                               required>
                   </div>
                   
                   <div class="form-group">
                        <label for="password">Password</label>
                        <input   type="password"
                                 id="password"
                                  name="password"
                                  placeholder="Enter password"
                                  required></input>
                   </div>
                   
                   <!-- Buttons -->
                   <div class="form-buttons">
                   
                       <button type="submit" class="save-btn">
                          <i class="fa fa-save"></i> Save Student
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