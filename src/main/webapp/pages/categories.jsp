<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<!-- Page Head -->
<jsp:include page="../templates/head.jsp">
   <jsp:param name="title" value="Categories"/>
   <jsp:param name="cssFile" value="categories"/>
</jsp:include>

<body>

<div class="categories-layout">
  
  <!-- Sidebar -->
  <div class="sidebar">
      <h2><i class="fa fa-graduation-cap"></i> Student Skill Tracker</h2>
      
      <a href="${pageContext.request.contextPath}/dashboard">
         <i class="fa fa-home"></i> Dashboard
      </a>
      
      <a href="${pageContext.request.contextPath}/skills">
         <i class="fa fa-list"></i> Skills
      </a>
      
      <a class="active" href="${pageContext.request.contextPath}/categories">
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
  <div class="categories-content">
   
     <!-- Page Header -->
     <div class="page-header">
          <div>
             <h1>Categories</h1>
             <p>View all skill categories.</p>
          </div>
     </div>
     
     <!-- Categories Card -->
     <div class="categories-card">
         
         <table class="categories-table">
         
           <tr>
             <th>Category</th>
             <th>Total Skills</th>
           </tr>
           
           <%
           @SuppressWarnings("unchecked")
           List<Category> categories =
               (List<Category>) request.getAttribute("categories");
           
           if (categories != null && !categories.isEmpty()){
        	   
        	   for (Category category : categories) {
        		   
        	%>
        	
        	<tr>
        	  <td><%= category.getCategoryName() %></td>
        	  <td><%= category.getTotalSkills() %></td>
        	</tr>
        	<% 
        		   }
        	   } else {
           %>
           
           <tr>
             <td colspan="2" class="empty-message">
                 No categories found.
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