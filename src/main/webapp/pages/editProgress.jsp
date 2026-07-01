<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../templates/head.jsp">
    <jsp:param name="title" value="Update Progress"/>
    <jsp:param name="cssFile" value="editProgress"/>
</jsp:include>

<body>

<div class="dashboard-layout">

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
    <div class="dashboard-content">

        <div class="progress-card">

            <h1>Update Progress</h1>
            <p>Update skill progress percentage.</p>

            <form action="${pageContext.request.contextPath}/updateProgress" method="post">

                <input type="hidden"
                       name="id"
                       value="${studentSkill.id}">

                <label for="progress">Progress (%)</label>

                <input type="number"
                       id="progress"
                       name="progress"
                       min="0"
                       max="100"
                       value="${studentSkill.progress}"
                       required>

                <button type="submit">
                    Update Progress
                </button>

            </form>

        </div>

    </div>

</div>

</body>
</html>