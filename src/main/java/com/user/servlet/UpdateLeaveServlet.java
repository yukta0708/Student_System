package com.user.servlet;

import com.DAO.LeaveApplicationDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateLeaveServlet")
public class UpdateLeaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int leaveId = Integer.parseInt(request.getParameter("id"));
        String status = request.getParameter("status");

        boolean result = LeaveApplicationDAO.updateLeaveStatus(leaveId, status);

        HttpSession session = request.getSession();
        if (result) {
            session.setAttribute("toast", "Leave request " + status + " successfully.");
            session.setAttribute("toastType", "success");
        } else {
            session.setAttribute("toast", "Something went wrong while updating leave status.");
            session.setAttribute("toastType", "error");
        }

        response.sendRedirect("viewLeaveRequests.jsp"); // the JSP page you already created
    }
}
