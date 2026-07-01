package controller;

import java.io.IOException;

import dao.SkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteSkill")
public class DeleteSkillServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		SkillDAO dao = new SkillDAO();
		dao.deleteSkill(id);
		
		//Success message
		HttpSession session = request.getSession();
		session.setAttribute("success", "Skill deleted successfully.");
		
		//Redirect to Skills page
		response.sendRedirect(request.getContextPath() + "/skills");
	}
}
