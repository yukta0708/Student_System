package com.user.servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.TimetableDAO;
import com.DB.DBConnect;

@WebServlet("/EditTimetable")
public class EditTimetableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String day = request.getParameter("day");
        String timeSlot = request.getParameter("timeSlot");
        String subject = request.getParameter("subject");
        String teacher = request.getParameter("teacher");

        TimetableDAO dao = new TimetableDAO(DBConnect.getConnection());
        boolean success = dao.updateTimetable(id, day, timeSlot, subject, teacher);

        if (success) {
            response.sendRedirect("editTimetable.jsp?success=Timetable updated successfully!");
        } else {
            response.sendRedirect("UpdateTimetable.jsp?error=Failed to update timetable.");
        }
    }
}
