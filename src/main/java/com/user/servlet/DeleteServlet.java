package com.user.servlet;

import com.DB.DBConnect;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();

        try (Connection conn = DBConnect.getConnection()) {

            
            session.removeAttribute("regmsg");
            session.removeAttribute("failedmsg");

            String sql = "DELETE FROM user WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int rowsDeleted = ps.executeUpdate();

            if (rowsDeleted > 0) {
                session.setAttribute("regmsg", "User deleted successfully.");
            } else {
                session.setAttribute("failedmsg", "Failed to delete user.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedmsg", "An error occurred during deletion.");
        }

        response.sendRedirect("allstudent.jsp");
    }
}
