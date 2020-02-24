package net.javaguides.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import net.javaguides.usermanagement.dao.UserDAO;
import net.javaguides.usermanagement.model.User;


@WebFilter({ "/LoginFilter", "/LoginServlet" })
public class LoginFilter implements Filter {

    public LoginFilter() {
        
    }

	public void destroy() {
		
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		UserDAO userDAO = new UserDAO();
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String vertify_input = request.getParameter("vertify_input");
		String vertify = request.getParameter("vertify");
		
		User user = userDAO.selectUser(name);
		RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
		
		if(user!=null && password.equals(user.getPassword()) && vertify_input.equals(vertify)) {
			chain.doFilter(request, response);
		}
		else if(name.equals("")){   
			pw.println("<script>alert('Username can not be empty')</script>");            
            rs.include(request, response);          
        }
		else if(password.equals("")){
			pw.println("<script>alert('Password  can not be empty')</script>");
            rs.include(request, response);   
        }
		else if(vertify.equals("")){    
			pw.println("<script>alert('Vertify can not be empty')</script>");
            rs.include(request, response);            
        }
		else if(!vertify_input.equals(vertify)) {
			pw.println("<script>alert('Vertify incorrect')</script>");
            rs.include(request, response); 
		}
		else{    
			pw.println("<script>alert('Input Error')</script>");
            rs.include(request, response);
        }
		
		pw.close();
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
