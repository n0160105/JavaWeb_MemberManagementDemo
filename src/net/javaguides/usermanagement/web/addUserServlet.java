package net.javaguides.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.usermanagement.dao.UserDAO;
import net.javaguides.usermanagement.model.User;


@WebServlet("/addUserServlet")
public class addUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		UserDAO userDAO = new UserDAO();
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		User newUser = new User(name, password, email, country);
		RequestDispatcher rs = request.getRequestDispatcher("addUser.jsp");
		
		try {
			if(name.equals("")) {
				pw.println("<script>alert('Username can not be null')</script>");
	            rs.include(request, response); 
			}
			else if(password.equals("")) {
				pw.println("<script>alert('Passowrd can not be null')</script>");
	            rs.include(request, response);
			}
			else if(email.equals("")) {
				pw.println("<script>alert('Email can not be null')</script>");
	            rs.include(request, response);
			}
			else if(name!=null && email!=null &&password!=null) {
				User checkName = userDAO.selectUser(name);
				User checkEmail = userDAO.selectEmail(email);
								
				if(checkName==null && checkEmail==null) {				
					userDAO.insertUser(newUser);
					pw.println("<script>alert('Add user Sucessed')</script>");
					RequestDispatcher rd = request.getRequestDispatcher("list");
		            rd.include(request, response);					
				}
				else {	
					pw.println("<script>alert('Username or Email is exist!!')</script>");   
					rs.include(request, response);					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
