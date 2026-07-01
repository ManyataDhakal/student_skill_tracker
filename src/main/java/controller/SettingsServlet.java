package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Settings;

@WebServlet("/settings")
public class SettingsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	         throws  ServletException, IOException {
		
		Settings settings = new Settings();
		
		settings.setSystemName("Student Skill Tracker");
		settings.setVersion("1.0");
		settings.setDeveloper("Manyata Dhakal");
		
		request.setAttribute("settings", settings);
		
		request.getRequestDispatcher("/pages/settings.jsp")
		       .forward(request, response);
	}
}
