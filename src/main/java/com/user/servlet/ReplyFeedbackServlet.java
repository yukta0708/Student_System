package com.user.servlet;
import com.DAO.FeedbackDAO;
import com.DAO.LeaveApplicationDAO;
import com.DB.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReplyFeedbackServlet")
public class ReplyFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String reply = request.getParameter("reply");

        FeedbackDAO dao = new FeedbackDAO(DBConnect.getConnection());
        dao.replyToFeedback(id, reply);

        response.sendRedirect("feedback_received.jsp");
    }
}
