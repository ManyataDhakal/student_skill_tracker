package controller;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import dao.StudentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	           throws ServletException, IOException {
		request.getRequestDispatcher("/pages/addStudent.jsp")
		       .forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
		
		// Get form data
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String password = BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt());
		
		// Create User Object
		User user = new User();
		user.setFullName(fullName);
		user.setEmail(email);
		user.setPassword(password);
		
		// Save student
		StudentDAO dao = new StudentDAO();
		
		if (dao.addStudent(user)) {
			response.sendRedirect(request.getContextPath() + "/students");
		} else {
			request.setAttribute("error", "Failed to add student.");
			request.getRequestDispatcher("/pages/addStudent.jsp")
			       .forward(request, response);
		}
	}
	
	
	

}
