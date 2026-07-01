package controller;

import java.io.IOException;

import dao.SkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Skill;
import util.ValidationUtil;

@WebServlet("/addSkill")
public class AddSkillServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		// Get form data from addSkill.jsp
		String skillName = request.getParameter("skillName");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		
		// Validate user input before saving
		if (!ValidationUtil.isValidSkillName(skillName)) {
			request.setAttribute("error", "Skill name is required and must be less than 100 characters.");
			request.getRequestDispatcher("/pages/addSkill.jsp").forward(request, response);
			return;
		}
		
		if (!ValidationUtil.isValidCategory(category)) {
			request.setAttribute("error", "Category is required and must be less than 50 characters.");
			request.getRequestDispatcher("/pages/addSkill.jsp").forward(request, response);
			return;
		}
		
		if (!ValidationUtil.isValidDescription(description)) {
			request.setAttribute("error", "Description is required and muct be less than 500 charaacters.");
			request.getRequestDispatcher("/pages.addSkil.jsp").forward(request, response);
			return;
		}
		
		// Create Skill object
		Skill skill = new Skill();
		
		// Store form data in Skill object
		skill.setSkillName(skillName);
		skill.setCategory(category);
		skill.setDescription(description);
		
		// Save skill to database
		SkillDAO dao = new SkillDAO();
		boolean result = dao.addSkill(skill);
		
		if(result) {
			
			// Save success message in session
			HttpSession session = request.getSession();
			session.setAttribute("success", "Skill added successfully.");
			
			// Redirects to skills page
			response.sendRedirect(request.getContextPath() + "/skills");
			
		} else {
			
			// Shows error message on add skill page
			request.setAttribute("error", "Failed to add skill");
			request.getRequestDispatcher("/pages/addSkill.jsp").forward(request, response);
		}
	}
}
