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

@WebServlet("/updateSkill")
public class UpdateSkillServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		
		// Get form data from editSkill.jsp
		int id = Integer.parseInt(request.getParameter("id"));
		String skillName = request.getParameter("skillName");
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		
		
		// Validate user input before updating
		if (!ValidationUtil.isValidSkillName(skillName)) {
			request.setAttribute("error", "Skill name is required and must be less than 100 characters.");
			request.getRequestDispatcher("/pages/editSkill.jsp").forward(request, response);
			return;
		}
		
		if (!ValidationUtil.isValidCategory(category)) {
			request.setAttribute("error", "Category  is required and must be less than 50 characters.");
			request.getRequestDispatcher("/pages/editSkill.jsp").forward(request, response);
			return;
		}
		
		
		if (!ValidationUtil.isValidDescription(description)) {
			request.setAttribute("error", "Description is required and must be less than 500 characters.");
			request.getRequestDispatcher("/pages/editSkill.jsp").forward(request, response);
			return;
		}
		
		// Create Skill object
		Skill skill = new Skill();
		
		// Store updated data  in Skill object
		skill.setId(id);
		skill.setSkillName(skillName);
		skill.setCategory(category);
		skill.setDescription(description);
		
		
		// Update skill in database
		SkillDAO dao = new SkillDAO();
		boolean result = dao.updateSkill(skill);
		
		if(result) {
			
			// Save success message in session
			HttpSession session = request.getSession();
			session.setAttribute("success","Skill updated successfully.");
			
			// Redirect to skills page
			response.sendRedirect(request.getContextPath() + "/skills");
			
		} else {
			
			// Return to edit page with error message
			request.setAttribute("skill", skill);
			request.setAttribute("error", "Failed to update skill");
		    request.getRequestDispatcher("/pages/editSkill.jsp").forward(request, response);
		}
	}
}
