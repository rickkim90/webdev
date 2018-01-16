package unit01;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IamServlet
 */
@WebServlet("/IamServlet")
public class IamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	private void doProcess(HttpServletRequest request,
			HttpServletResponse response,
			String url) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "/WEB-INF/views/05_form.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iam = "그래,<br/> 난<br/>"+ request.getParameter("name");
		request.setAttribute("iam", iam);
		doProcess(request, response,  "/WEB-INF/views/05_process.jsp");
		
	}

}
