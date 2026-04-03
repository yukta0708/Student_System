<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Feedback</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .feedback-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .feedback-box {
            width: 50%;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            background: #f9f9f9;
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
    </style>
</head>
<body>

<div class="feedback-container">
    <div class="feedback-box">
        <h3 class="text-center text-primary">Teacher Feedback</h3>
        <p class="text-center">Parents can share feedback about their child's performance.</p>
        
        <form>
            <div class="form-group">
                <label>Parent's Name</label>
                <input type="text" class="form-control" placeholder="Enter Your Name">
            </div>
            
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" placeholder="Enter Your Email">
            </div>
            
            <div class="form-group">
                <label>Student's Name</label>
                <input type="text" class="form-control" placeholder="Enter Student's Name">
            </div>

            <div class="form-group">
                <label>Feedback Message</label>
                <textarea class="form-control" rows="4" placeholder="Write about your child's performance..."></textarea>
            </div>
            
            <button type="submit" class="btn btn-submit">Send Feedback</button>
        </form>
    </div>
</div>

</body>
</html>
