package com.user.servlet;

import com.DAO.AttendanceDAO;
import com.entity.Attendance;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollno");
        String subject = request.getParameter("subject");
        String timing = request.getParameter("timing");
        String status = "Present"; // Default status

        
        String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        
        Attendance attendance = new Attendance();
        attendance.setRollNo(rollNo);
        attendance.setSubject(subject);
        attendance.setTiming(timing);
        attendance.setStatus(status);
        attendance.setDate(currentDate); // set the date

        AttendanceDAO dao = new AttendanceDAO();

        boolean isMarked = dao.markAttendance(attendance);

        if (isMarked) {
            response.getWriter().println("<h2>🎉 Attendance Marked Successfully!</h2>");
        } else {
            response.getWriter().println("<h2>❌ Attendance Submission Failed!</h2>");
        }
    }
}
