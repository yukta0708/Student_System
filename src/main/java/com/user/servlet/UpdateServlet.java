package com.user.servlet;

import com.DB.DBConnect;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneno = request.getParameter("phoneno");

        HttpSession session = request.getSession();

        try (Connection conn = DBConnect.getConnection()) {

            
            session.removeAttribute("regmsg");
            session.removeAttribute("failedmsg");

            String sql = "UPDATE user SET name=?, email=?, phoneno=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phoneno);
            ps.setInt(4, id);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                session.setAttribute("regmsg", "User updated successfully.");
            } else {
                session.setAttribute("failedmsg", "Failed to update user.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedmsg", "Error during update.");
        }

        response.sendRedirect("allstudent.jsp");
    }
}
