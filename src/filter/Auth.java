package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Auth implements Filter {

	@Override
	public void destroy() {
		System.out.println("Auth Filter destroy() 수행중........");
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("Auth Filter doFilter() 수행중........");
		
	
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		HttpSession session = request.getSession();
		String contextPath = request.getContextPath();
		String action = request.getRequestURI().substring(contextPath.length());
		
		
		if (!(action.equals("/session2/01_session_form.jsp")||action.equals("/session2/01_session_add.jsp"))){
			
			if(session.getAttribute("user_id")==null){ 
			request.setAttribute("msg","먼저 로그인을 하셔야 합니다.");
			request.setAttribute("url",contextPath+"/session2/01_session_form.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
			dispatcher.forward(request, response);
			return;
			}
		}
		chain.doFilter(request,response);
	}

	@Override
	public void init(FilterConfig fc) throws ServletException {
		System.out.println("Auth Filter init() 수행중........");
		
	}

}
