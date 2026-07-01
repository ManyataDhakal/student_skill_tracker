package controller;

import java.io.IOException;

import dao.StudentSkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.StudentSkill;

@WebServlet("/editProgress")
public class EditProgressServlet  extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
		
		// Get student skill id
		int id = Integer.parseInt(request.getParameter("id"));
		
		// Get student skill from database
		StudentSkillDAO dao = new StudentSkillDAO();
		StudentSkill studentSkill = dao.getStudentSkillById(id);
		
		// Send data to JSP 
		request.setAttribute("studentSkill", studentSkill);
		
		// Open edit progress page
		request.getRequestDispatcher("/pages/editProgress.jsp")
		       .forward(request, response);
	}

}
