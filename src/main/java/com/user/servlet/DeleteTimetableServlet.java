package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.TimetableDAO;
import com.DB.DBConnect;

@WebServlet("/DeleteTimetable")
public class DeleteTimetableServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        TimetableDAO dao = new TimetableDAO(DBConnect.getConnection());
        boolean success = dao.deleteTimetable(id);

        if (success) {
            response.sendRedirect("edittimetable.jsp?success=Timetable deleted successfully!");
        } else {
            response.sendRedirect("edittimetable.jsp?error=Failed to delete timetable.");
        }
    }
}

