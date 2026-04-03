<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Leave Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }
        .leave-container {
            width: 50%;
            margin: auto;
            margin-top: 50px;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .btn-submit {
            background-color: #5a2d82;
            color: white;
            width: 100%;
            border-radius: 5px;
            padding: 10px;
        }
        .btn-submit:hover {
            background-color: #45206d;
        }
        label {
            font-weight: bold;
        }
    </style>

    <script>
        function validateForm() {
            var name = document.getElementById("studentName").value;
            var rollNo = document.getElementById("rollNo").value;
            var fromDate = document.getElementById("fromDate").value;
            var toDate = document.getElementById("toDate").value;
            var reason = document.getElementById("reason").value;

            if (name == "" || rollNo == "" || fromDate == "" || toDate == "" || reason == "") {
                alert("All fields are required!");
                return false;
            }
            if (new Date(fromDate) > new Date(toDate)) {
                alert("End date should be after start date!");
                return false;
            }
            alert("Leave Application Submitted Successfully!");
            return true;
        }
    </script>
</head>
<body>

<div class="leave-container">
    <h3 class="text-center text-primary">Student Leave Application</h3>
    <p class="text-center text-muted">Please fill in the form to apply for leave.</p>

    <form onsubmit="return validateForm()">
        <div class="form-group">
            <label>Student Name</label>
            <input type="text" class="form-control" id="studentName" placeholder="Enter Student Name">
        </div>

        <div class="form-group">
            <label>Roll Number</label>
            <input type="text" class="form-control" id="rollNo" placeholder="Enter Roll Number">
        </div>

        <div class="form-group">
            <label>From Date</label>
            <input type="date" class="form-control" id="fromDate">
        </div>

        <div class="form-group">
            <label>To Date</label>
            <input type="date" class="form-control" id="toDate">
        </div>

        <div class="form-group">
            <label>Reason for Leave</label>
            <textarea class="form-control" id="reason" rows="3" placeholder="Enter Reason"></textarea>
        </div>

        <button type="submit" class="btn btn-submit">Submit Leave Application</button>
    </form>
</div>

</body>
</html>
