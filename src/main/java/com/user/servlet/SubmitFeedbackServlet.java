package com.user.servlet;

import com.DAO.FeedbackDAO;
import com.DB.DBConnect;
import com.entity.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/SubmitFeedbackServlet")  
public class SubmitFeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String parentName = request.getParameter("parentName");
        String studentName = request.getParameter("studentName");
        String description = request.getParameter("description");

        Feedback feedback = new Feedback(parentName, studentName, description, null);
        FeedbackDAO dao = new FeedbackDAO(DBConnect.getConnection());

        boolean success = dao.addFeedback(feedback);

        if (success) {
            response.sendRedirect("parent_feedback.jsp?msg=success");
        } else {
            response.sendRedirect("parent_feedback.jsp?msg=error");
        }
    }
}
