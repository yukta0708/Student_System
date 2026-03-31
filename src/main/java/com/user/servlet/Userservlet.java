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

@WebServlet("/register")
public class Userservlet extends HttpServlet {

    public Userservlet() {
        super();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phoneno = req.getParameter("phoneno");
        String role = req.getParameter("role"); 
        String rollno = req.getParameter("rollno"); 

        
        if (role == null || role.isEmpty()) {
            role = "student"; 
        }

        User u = new User();
        u.setName(name);
        u.setEmail(email);
        u.setPassword(password);
        u.setPhoneno(phoneno);
        u.setRole(role);
        u.setRollno(rollno);

        UserDAO dao = new UserDAO(DBConnect.getConnection());
        boolean f = dao.addUser(u);

        HttpSession session = req.getSession();
        if (f) {
            session.setAttribute("reg-msg", "Registration Successful.");
            resp.sendRedirect("login.jsp");
        } else {
            session.setAttribute("error-msg", "Something went wrong.");
            resp.sendRedirect("register.jsp");
        }
    }
}
