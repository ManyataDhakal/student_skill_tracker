package controller;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import util.ValidationUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		// Get login form data
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		// Validate user input before login
		if (!ValidationUtil.isValidEmail(email)) {
			request.setAttribute("error", "Please enter a valid email address.");
			request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
			return;
		}
		
		if (ValidationUtil.isEmpty(password)) {
			request.setAttribute("error", "Password is required.");
			request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
			return;
		}
		
		// Check user credentials
		UserDAO dao = new UserDAO();
		User user = dao.login(email, password);
		
		if (user != null) {
			
			// Create session after successful login
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			// Redirect to dashboard
			response.sendRedirect(request.getContextPath() + "/dashboard");
		}else {
			
			// Show login error message
			request.setAttribute("error", "Invalid email or password");
			request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
		}
	}
}
