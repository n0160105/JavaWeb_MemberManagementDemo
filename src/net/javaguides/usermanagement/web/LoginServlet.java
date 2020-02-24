package net.javaguides.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.usermanagement.dao.UserDAO;
import net.javaguides.usermanagement.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
				
		if (name.equals("root")&&password.equals("12345678")) {
			pw.println("<script>alert('Welcome Root')</script>");
			RequestDispatcher rs = request.getRequestDispatcher("user-list.jsp"); //
	        rs.include(request, response);	        	        
		}
		else {
			pw.println("<script>alert('Hello "+name+"!Go shopping')</script>");
			response.sendRedirect("https://shopee.tw/");
		}
		pw.close();

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
