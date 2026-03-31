package com.user.servlet;

import com.DAO.ResultDAO;
import com.DB.DBConnect;
import com.entity.Result;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/addResult")
public class AddResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentName = req.getParameter("studentName");
        String examType = req.getParameter("examType");
        int totalSubjects = Integer.parseInt(req.getParameter("totalSubjects"));

        int totalMarks = 0;
        int totalOutOf = 0;

        ResultDAO dao = new ResultDAO(DBConnect.getConnection());
        for (int i = 1; i <= totalSubjects; i++) {
            String subject = req.getParameter("subject" + i);
            int marks = Integer.parseInt(req.getParameter("marks" + i));
            int outof = Integer.parseInt(req.getParameter("total" + i));

            totalMarks += marks;
            totalOutOf += outof;

            Result r = new Result();
            r.setStudentName(studentName);
            r.setExamType(examType);
            r.setSubject(subject);
            r.setMarksObtained(marks);
            r.setTotalMarks(outof);
            r.setPercentage((marks * 100.0) / outof);

            dao.addResult(r);
        }

        resp.sendRedirect("resultadd.jsp?msg=success&total=" + totalMarks + "&outof=" + totalOutOf);
    }
}
