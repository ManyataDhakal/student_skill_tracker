package filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doFilter(HttpServletRequest request, 
			                HttpServletResponse response,
			                FilterChain chain)
	
	         throws IOException, ServletException {
		
		// Check whether a user is logged in
		HttpSession session = request.getSession(false);
		boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
		
		// Get the requested page
		String requestPath = request.getRequestURI();
		
		boolean isLoginRequest = requestPath.endsWith("login.jsp")
				               || requestPath.endsWith("/login");
		
		boolean isStaticResource = requestPath.contains("/css/")
				                 || requestPath.contains("/resources/")
				                 || requestPath.endsWith(".css")
				                 || requestPath.endsWith(".jpg");
		
		// Allow or block request
		if (isLoggedIn || isLoginRequest || isStaticResource) {
			chain.doFilter(request, response);
		} else {
			response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
		}
	}
}
