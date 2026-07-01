package controller;

import java.io.IOException;
import java.util.List;

import dao.SkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Skill;

@WebServlet("/skills")
public class SkillServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		SkillDAO dao = new SkillDAO();
		List<Skill> skills = dao.getAllSkills();
		
		request.setAttribute("skills", skills);
		request.getRequestDispatcher("/pages/skills.jsp").forward(request, response);
	}
}
