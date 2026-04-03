package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.DAO.UserDAO;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class Loginservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		UserDAO dao = new UserDAO(DBConnect.getConnection());
		
		if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
			User u = new User();
			u.setName("Admin");
			u.setRole("teacher");  // Set role explicitly
			session.setAttribute("userobj", u);
			resp.sendRedirect("teacher.jsp");  // Redirect to teacher dashboard
		} else {
			User u = dao.getLogin(email, password);
			if (u != null) {
				session.setAttribute("userobj", u);
				if ("teacher".equalsIgnoreCase(u.getRole())) {
					resp.sendRedirect("teacher.jsp");  // Redirect for teachers
				} else if ("student".equalsIgnoreCase(u.getRole())) {
					resp.sendRedirect("student.jsp");  // Redirect for students
				} else {
					resp.sendRedirect("index.jsp");  // Redirect to home page if role is unknown
				}
			} else {
				session.setAttribute("errorMsg", "Invalid Email or Password!");
				resp.sendRedirect("login.jsp");  // Redirect to login if authentication fails
			}
		}
	}
}
