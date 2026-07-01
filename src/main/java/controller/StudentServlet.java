package controller;

import java.io.IOException;
import java.util.List;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/students")
public class StudentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {
		
		UserDAO dao = new UserDAO();
		
		List<User> students = dao.getAllStudents();
		
		request.setAttribute("students", students);
		
		request.getRequestDispatcher("/pages/students.jsp")
		      .forward(request, response);
	}
}
