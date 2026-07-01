package controller;

import java.io.IOException;
import java.util.List;

import dao.AssignedSkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.AssignedSkill;

@WebServlet("/assignedSkills")
public class AssignedSkillsServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
		
		AssignedSkillDAO dao = new AssignedSkillDAO();
		
		List<AssignedSkill> assignedSkills = dao.getAllAssignedSkills();
		
		request.setAttribute("assignedSkills", assignedSkills);
		
		request.getRequestDispatcher("/pages/assignedSkills.jsp")
		       .forward(request, response);
	}
}
