package com.user.servlet;


import com.DAO.ResultDAO;
import com.DB.DBConnect;
import com.entity.Result;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewResult")
public class ResultViewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("userobj");

        if (user != null && "student".equalsIgnoreCase(user.getRole())) {
            String studentName = user.getName(); // name used during result entry

            ResultDAO dao = new ResultDAO(DBConnect.getConnection());
            List<Result> results = dao.getResultsByStudent(studentName);

            request.setAttribute("results", results);
            request.getRequestDispatcher("resultview.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}
