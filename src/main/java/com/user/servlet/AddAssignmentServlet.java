package com.user.servlet;


import com.DAO.AssignmentDAO;
import com.DB.DBConnect;
import com.entity.Assignment;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addAssignment")
@MultipartConfig
public class AddAssignmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String note = request.getParameter("note");
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        String path = getServletContext().getRealPath("") + "assignments";
        File folder = new File(path);
        if (!folder.exists()) folder.mkdir();

        filePart.write(path + File.separator + fileName);

        Assignment assignment = new Assignment();
        assignment.setTitle(title);
        assignment.setNote(note);
        assignment.setFileName(fileName);

        AssignmentDAO dao = new AssignmentDAO(DBConnect.getConnection());
        boolean saved = dao.addAssignment(assignment);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (saved) {
            response.sendRedirect("assignments.jsp?msg=success");
        } else {
            response.sendRedirect("assignments.jsp?msg=error");
        }
    }
}
