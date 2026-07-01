package controller;

import java.io.IOException;

import dao.ReportDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Report;

@WebServlet("/reports")
public class ReportsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
		
		ReportDAO dao = new ReportDAO();
		
		Report report = dao.getReportData();
		
		request.setAttribute("report", report);
		
		request.getRequestDispatcher("/pages/reports.jsp")
		      .forward(request,response);
	}

}
