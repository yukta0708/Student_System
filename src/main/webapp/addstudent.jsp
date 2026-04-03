<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }
        button {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 class="text-center">Add Student</h3>
        <form>
            <div class="form-group">
                <label for="studentName">Student Name</label>
                <input type="text" class="form-control" id="studentName" placeholder="Enter Student Name" required>
            </div>

            <div class="form-group">
                <label for="rollNo">Roll No</label>
                <input type="text" class="form-control" id="rollNo" placeholder="Enter Roll No" required>
            </div>

            <div class="form-group">
                <label for="class">Class</label>
                <input type="text" class="form-control" id="class" placeholder="Enter Class" required>
            </div>

            <button type="submit" class="btn btn-primary">Add Student</button>
        </form>
    </div>
</body>
</html>
