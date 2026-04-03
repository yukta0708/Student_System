package com.user.servlet;

import com.DB.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/TrialRegisterServlet")
public class TrialRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneno = request.getParameter("phoneno");
        String rollno = request.getParameter("rollno");
        String role = request.getParameter("role");

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "INSERT INTO user (name, email, password, phoneno, rollno, role) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phoneno);
            ps.setString(5, rollno);
            ps.setString(6, role);

            int result = ps.executeUpdate();

            if (result > 0) {
               
                response.sendRedirect("user-login.jsp");
            } else {
                
                response.getWriter().println("Registration failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
