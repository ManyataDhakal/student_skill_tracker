package controller;

import java.io.IOException;
import java.util.List;

import dao.SkillDAO;
import dao.StudentSkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Skill;

@WebServlet("/assignSkill")
public class AssignSkillServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
		
		SkillDAO dao = new SkillDAO();
		List<Skill> skills = dao.getAllSkills();
		
		request.setAttribute("skills", skills);
		
		request.getRequestDispatcher("/pages/assignSkill.jsp")
		       .forward(request, response);
	}
	
	// Assign skill to student
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    // Get form data
	    int userId = Integer.parseInt(request.getParameter("userId"));
	    int skillId = Integer.parseInt(request.getParameter("skillId"));
	    String proficiency = request.getParameter("proficiency");

	    StudentSkillDAO dao = new StudentSkillDAO();

	    if (dao.assignSkill(userId, skillId, proficiency)) {

	        response.sendRedirect(request.getContextPath()
	                + "/studentSkills?userId=" + userId);

	    } else {

	        response.getWriter().println("Failed to assign skill.");
	    }
	}
}
