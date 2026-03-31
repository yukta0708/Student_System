package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DB.DBConnect;

@WebServlet("/TimetableServlet")  // ✅ Correct servlet mapping
public class TimetableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String day = request.getParameter("day");
        String timeSlot = request.getParameter("timeSlot");
        String subject = request.getParameter("subject");
        String teacher = request.getParameter("teacher");

        try {
            Connection con = DBConnect.getConnection();
            String sql = "INSERT INTO timetable (day, time_slot, subject, teacher) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, day);
            ps.setString(2, timeSlot);
            ps.setString(3, subject);
            ps.setString(4, teacher);

            int row = ps.executeUpdate();
            if (row > 0) {
                response.sendRedirect("edittimetable.jsp?success=Timetable added successfully");
            } else {
                response.sendRedirect("edittimetable.jsp?error=Failed to add timetable");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("edittimetable.jsp?error=Database error");
        }
    }
}
