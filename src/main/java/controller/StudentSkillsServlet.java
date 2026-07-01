package controller;

import java.io.IOException;
import java.util.List;

import dao.StudentSkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.StudentSkill;

@WebServlet("/studentSkills")
public class StudentSkillsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
		
		int userId = Integer.parseInt(request.getParameter("userId"));
		
		StudentSkillDAO dao = new StudentSkillDAO();
		List<StudentSkill> studentSkills = dao.getSkillsByStudentId(userId);
		
		request.setAttribute("studentSkills", studentSkills);
		
		request.getRequestDispatcher("/pages/studentSkills.jsp")
		       .forward(request, response);
	}

}
