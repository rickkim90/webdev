package user.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String user_id = (String)session.getAttribute("user_id");
		String user_name = (String)session.getAttribute("user_name");
		session.invalidate();
		
		request.setAttribute("msg", user_name+"("+user_id+")님이 로그아웃하였습니다.");
		request.setAttribute("url","Login");
		
		RequestDispatcher dispatcher= request.getRequestDispatcher("result.jsp");
		dispatcher.forward(request, response);
	}

}
