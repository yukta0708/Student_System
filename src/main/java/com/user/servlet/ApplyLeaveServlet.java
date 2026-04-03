package com.user.servlet;


import com.DAO.LeaveApplicationDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ApplyLeaveServlet")
public class ApplyLeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("studentName");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String reason = request.getParameter("reason");

        boolean success = LeaveApplicationDAO.applyLeave(name, startDate, endDate, reason);
        
        if (success) {
            response.sendRedirect("applyLeave.jsp?success=true");
        } else {
            response.getWriter().println("Error submitting leave request.");
        }
    }
}

