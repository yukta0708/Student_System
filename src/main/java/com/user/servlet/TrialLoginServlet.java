package com.user.servlet;

import com.DB.DBConnect;
import com.entity.User;
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/TrialLoginServlet")
public class TrialLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DBConnect.getConnection()) {
            String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role").toLowerCase();
               
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setRole(role);

               
                HttpSession session = request.getSession();
                session.setAttribute("userobj", user); 
                session.setAttribute("role", role);     
                System.out.println("Login Success - Name: " + user.getName() + ", Role: " + role);

                
                switch (role) {
                    case "student":
                        response.sendRedirect("student.jsp");
                        break;
                    case "teacher":
                        response.sendRedirect("teacher.jsp");
                        break;
                    case "parent":
                        response.sendRedirect("parent.jsp");
                        break;
                    default:
                        response.getWriter().println("Unknown role");
                }
            } else {
                response.getWriter().println("Invalid email or password.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
