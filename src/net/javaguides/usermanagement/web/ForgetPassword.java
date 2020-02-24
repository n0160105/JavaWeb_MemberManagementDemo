package net.javaguides.usermanagement.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.usermanagement.dao.UserDAO;
import net.javaguides.usermanagement.model.User;


@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ForgetPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		UserDAO userDAO = new UserDAO();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		User user = userDAO.getPasswordByUsernameAndEmail(name,email);
		
		if(user!=null && name.equals(user.getName()) && email.equals(user.getEmail())) {
			RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
			pw.print("<script>");
			pw.print("alert('Username: "+user.getName()+"\\nPassword:"+user.getPassword()+"')");
			pw.print("</script>");
            rs.include(request, response);
		}
		else
        {
           pw.println("<script>alert('Username or Email incorrect')</script>");
           RequestDispatcher rs = request.getRequestDispatcher("forget.html");
           rs.include(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
