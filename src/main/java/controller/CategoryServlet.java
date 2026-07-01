package controller;

import java.io.IOException;
import java.util.List;

import dao.CategoryDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;

@WebServlet("/categories")
public class CategoryServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	          throws ServletException, IOException {
		
		CategoryDAO dao = new CategoryDAO();
		
		List<Category> categories = dao.getAllCategories();
		
		request.setAttribute("categories", categories);
		
		request.getRequestDispatcher("/pages/categories.jsp")
		       .forward(request, response);
	}

}
