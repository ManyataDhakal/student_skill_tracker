package controller;

import java.io.IOException;

import dao.SkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Skill;

@WebServlet("/editSkill")
public class EditSkillServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		SkillDAO dao = new SkillDAO();
		Skill skill = dao.getSkillById(id);
		
		request.setAttribute("skill", skill);
		request.getRequestDispatcher("/pages/editSkill.jsp").forward(request, response);
	}
}
