package controller;

import java.io.IOException;

import dao.StudentSkillDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateProgress")
public class UpdateProgressServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	               throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		int progress = Integer.parseInt(request.getParameter("progress"));
		
		StudentSkillDAO dao = new StudentSkillDAO();
		
		if (dao.updateProgress(id, progress)) {
			response.sendRedirect(request.getContextPath() + "/students");
		} else {
			response.getWriter().println("Failed to update progress.");
		}
	}
	
	

}
