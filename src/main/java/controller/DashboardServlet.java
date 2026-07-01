package controller;

import java.io.IOException;

import dao.CategoryDAO;
import dao.SkillDAO;
import dao.StudentSkillDAO;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
		
		SkillDAO skillDAO = new SkillDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		UserDAO userDAO = new UserDAO();
		StudentSkillDAO studentSkillDAO = new StudentSkillDAO();
		
		request.setAttribute("totalSkills", skillDAO.getTotalSkills());
		request.setAttribute("totalCategories", categoryDAO.getTotalCategories());
		request.setAttribute("totalStudents", userDAO.getTotalStudents());
		request.setAttribute("totalAssignedSkills", studentSkillDAO.getTotalAssignedSkills());
		
		request.getRequestDispatcher("/pages/dashboard.jsp").forward(request, response);
	}
}
