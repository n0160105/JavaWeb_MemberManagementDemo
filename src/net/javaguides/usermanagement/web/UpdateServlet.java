package net.javaguides.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.usermanagement.dao.UserDAO;
import net.javaguides.usermanagement.model.User;


@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		User book = new User(id, name, password, email, country);
		
		try {
			userDAO.updateUser(book);//執行update
		} catch (SQLException e) {

			e.printStackTrace();
		}
		response.sendRedirect("list");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
