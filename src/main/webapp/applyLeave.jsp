<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for Leave</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #5B21B6;
            --secondary: #7C3AED;
            --accent: #A78BFA;
            --light: #FFFFFF;
            --dark: #1F2937;
            --success: #10B981;
            --gray: #6B7280;
            --border-radius: 8px;
            --box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
            --transition: all 0.2s ease-in-out;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"%3E%3Cpath fill="%235B21B6" fill-opacity="0.05" d="M0,160L48,176C96,192,192,224,288,213.3C384,203,480,149,576,138.7C672,128,768,160,864,170.7C960,181,1056,171,1152,149.3C1248,128,1344,96,1392,80L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"%3E%3C/path%3E%3C/svg%3E') no-repeat center center/cover, linear-gradient(180deg, #F9FAFB 0%, #E5E7EB 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(4px);
            color: var(--dark);
            padding: 1rem 2rem;
            width: 100%;
            max-width: 1280px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--box-shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
            border-radius: var(--border-radius);
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .navbar-brand h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
        }

        .navbar-brand i {
            font-size: 1.5rem;
            color: var(--accent);
        }

        .auth-buttons .btn {
            background: var(--primary);
            color: var(--light);
            padding: 0.5rem 1rem;
            font-size: 0.85rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            transition: var(--transition);
        }

        .auth-buttons .btn:hover {
            background: var(--secondary);
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            width: 100%;
            max-width: 480px;
            margin: auto;
            position: relative;
            animation: fadeIn 0.5s ease-out;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary);
            text-align: center;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
            position: relative;
        }

        label {
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.85rem;
            color: var(--dark);
            margin-bottom: 0.3rem;
            display: block;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--accent);
            font-size: 0.85rem;
        }

        input[type="text"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.25rem;
            border: 1px solid rgba(91, 33, 182, 0.3);
            border-radius: 6px;
            font-size: 0.9rem;
            font-family: 'Inter', sans-serif;
            transition: var(--transition);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            color: var(--dark);
        }

        textarea {
            height: 120px;
            resize: vertical;
            padding: 0.75rem 1rem;
        }

        input:focus,
        textarea:focus,
        input:hover,
        textarea:hover {
            border-color: var(--primary);
            box-shadow: 0 0 6px rgba(91, 33, 182, 0.15);
            background: var(--light);
        }

        button {
            width: 100%;
            padding: 0.75rem;
            border: none;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            position: relative;
            overflow: hidden;
            color: var(--light);
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        button:hover {
            background: linear-gradient(90deg, var(--secondary), var(--primary));
            transform: translateY(-1px);
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        button::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.3s ease, height 0.3s ease;
        }

        button:hover::after {
            width: 150px;
            height: 150px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 1rem;
                width: 90%;
            }

            h2 {
                font-size: 1.5rem;
            }

            input[type="text"],
            input[type="date"],
            textarea {
                padding: 0.65rem 0.9rem 0.65rem 2rem;
                font-size: 0.85rem;
            }

            textarea {
                padding: 0.65rem 0.9rem;
            }

            button {
                padding: 0.65rem;
                font-size: 0.8rem;
            }

            .navbar {
                flex-direction: column;
                gap: 0.75rem;
                padding: 0.75rem;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Leave Application</h1>
        </div>
        <div class="auth-buttons">
            <a href="student.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="form-container">
        <h2><i class="fas fa-calendar-check"></i> Leave Application Form</h2>
        <form action="ApplyLeaveServlet" method="post">
            <div class="form-group input-icon">
                <label for="studentName">Name</label>
                <i class="fas fa-user"></i>
                <input type="text" name="studentName" id="studentName" placeholder="Enter your name" required>
            </div>
            <div class="form-group input-icon">
                <label for="startDate">Start Date</label>
                <i class="fas fa-calendar"></i>
                <input type="date" name="startDate" id="startDate" required>
            </div>
            <div class="form-group input-icon">
                <label for="endDate">End Date</label>
                <i class="fas fa-calendar"></i>
                <input type="date" name="endDate" id="endDate" required>
            </div>
            <div class="form-group input-icon">
                <label for="reason">Reason</label>
                <i class="fas fa-comment"></i>
                <textarea name="reason" id="reason" placeholder="Enter reason here..." required></textarea>
            </div>
            <button type="submit"><i class="fas fa-check"></i> Apply Leave</button>
        </form>
    </div>

</body>
</html>