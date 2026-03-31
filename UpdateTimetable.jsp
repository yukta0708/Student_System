<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="com.DB.DBConnect" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Timetable</title>
    
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: #f5f5f5;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            padding: 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DBConnect.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM timetable WHERE id = ?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    String subject = "", teacher = "";
    if (rs.next()) {
        subject = rs.getString("subject");
        teacher = rs.getString("teacher");
    }
%>

<div class="container">
    <div class="card shadow">
        <h2 class="text-center text-primary">Edit Timetable</h2>
        
        <form action="EditTimetableServlet" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            
            <div class="mb-3">
                <label class="form-label">Subject:</label>
                <input type="text" name="subject" class="form-control" value="<%= subject %>" required>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Teacher:</label>
                <input type="text" name="teacher" class="form-control" value="<%= teacher %>" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="edittimetable.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>

</body>
</html>
