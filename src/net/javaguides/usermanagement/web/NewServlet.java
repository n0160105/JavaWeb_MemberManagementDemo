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


@WebServlet("/new")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
UserDAO userDAO = new UserDAO();
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		User newUser = new User(name, password, email, country);
		User checkName = userDAO.selectUser(name);
		User checkEmail = userDAO.selectEmail(email);
		
		RequestDispatcher rd = request.getRequestDispatcher("memberRegister.jsp");
		RequestDispatcher bh = request.getRequestDispatcher("index.jsp");
		try {
			if(name.equals("")) {
				pw.print("<script>alert('Username can not be null')</script>");
				rd.include(request, response);				
			}
			else if (password.equals("")) {
				pw.print("<script>alert('Password can not be null')</script>");
				rd.include(request, response);
			}
			else if (email.equals("")) {
				pw.print("<script>alert('Email can not be null')</script>");
				rd.include(request, response);
			}					
			else {								
				if(checkName==null && checkEmail==null) {
					userDAO.insertUser(newUser);
					pw.print("<script>alert('Add new User Successed')</script>");
					bh.include(request, response);
				}
				else {
					pw.print("<script>alert('Username or Email is existed!!')</script>");
					rd.include(request, response);
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
