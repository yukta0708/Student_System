package com.user.servlet;
import com.DAO.FeedbackDAO;
import com.DAO.LeaveApplicationDAO;
import com.DB.DBConnect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/DeleteFeedbackServlet")
public class DeleteFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        FeedbackDAO dao = new FeedbackDAO(DBConnect.getConnection());
        dao.deleteFeedback(id);

        response.sendRedirect("feedback_received.jsp");
    }
}
