<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Assignment</title>
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
            --warning: #F59E0B;
            --gray: #6B7280;
            --border-radius: 10px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease-in-out;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"%3E%3Cpath fill="%235B21B6" fill-opacity="0.1" d="M0,128L48,144C96,160,192,192,288,186.7C384,181,480,139,576,122.7C672,107,768,117,864,149.3C960,181,1056,235,1152,229.3C1248,224,1344,160,1392,128L1440,96L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"%3E%3C/path%3E%3C/svg%3E') no-repeat center center/cover, linear-gradient(135deg, #F3F4F6 0%, #E5E7EB 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 2rem;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: var(--light);
            padding: 1rem 2rem;
            width: 100%;
            max-width: 1200px;
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
            gap: 0.75rem;
        }

        .navbar-brand h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.75rem;
            font-weight: 600;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .navbar-brand i {
            font-size: 1.75rem;
            color: var(--accent);
            animation: pulse 2s infinite;
        }

        .auth-buttons .btn {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            padding: 0.6rem 1.2rem;
            font-size: 0.9rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            transition: var(--transition);
        }

        .auth-buttons .btn:hover {
            background: linear-gradient(90deg, var(--secondary), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        .form-container {
            max-width: 900px;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            padding: 2.5rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin: 2rem 0;
            position: relative;
            overflow: hidden;
            animation: slideUp 0.5s ease-out;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.4rem;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.9rem;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--accent);
            font-size: 0.9rem;
            transition: var(--transition);
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 0.8rem 1rem 0.8rem 2.5rem;
            border: 1px solid rgba(91, 33, 182, 0.2);
            border-radius: 8px;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            transition: var(--transition);
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            color: var(--dark);
        }

        textarea {
            resize: vertical;
            min-height: 180px;
            max-height: 400px;
        }

        input[type="file"] {
            display: none;
        }

        .file-upload {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid rgba(91, 33, 182, 0.2);
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
            transition: var(--transition);
            font-size: 0.95rem;
            color: var(--dark);
        }

        .file-upload:hover,
        .file-upload:focus {
            border-color: var(--primary);
            box-shadow: 0 0 8px rgba(91, 33, 182, 0.2);
            background: var(--light);
        }

        .file-upload i {
            color: var(--accent);
            font-size: 1rem;
            margin-right: 0.5rem;
        }

        .file-upload span {
            flex-grow: 1;
            color: var(--gray);
        }

        .file-upload .upload-btn {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            transition: var(--transition);
        }

        .file-upload .upload-btn:hover {
            background: linear-gradient(90deg, var(--secondary), var(--primary));
            transform: scale(1.05);
        }

        input:focus,
        textarea:focus,
        .file-upload:hover {
            border-color: var(--primary);
            box-shadow: 0 0 8px rgba(91, 33, 182, 0.2);
            background: var(--light);
        }

        .input-icon:hover i,
        input:focus + i,
        textarea:focus + i {
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        .btn {
            width: 100%;
            padding: 0.9rem;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .btn:hover {
            background: linear-gradient(90deg, var(--secondary), var(--primary));
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(91, 33, 182, 0.3);
        }

        .btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.4s ease, height 0.4s ease;
        }

        .btn:hover::after {
            width: 200px;
            height: 200px;
        }

        .message {
            padding: 1rem 1.5rem;
            border-radius: var(--border-radius);
            margin-top: 1.5rem;
            position: relative;
            animation: slideIn 0.5s ease-out;
            border-left: 4px solid;
            background: rgba(255, 255, 255, 0.9);
            box-shadow: var(--box-shadow);
            font-size: 0.95rem;
            text-align: center;
        }

        .success {
            border-color: var(--success);
            color: var(--dark);
        }

        .success i {
            color: var(--success);
            margin-right: 0.5rem;
        }

        .error {
            border-color: var(--warning);
            color: var(--dark);
        }

        .error i {
            color: var(--warning);
            margin-right: 0.5rem;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 1.5rem;
                margin: 1.5rem 1rem;
            }

            .navbar {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            input[type="text"],
            textarea {
                padding: 0.7rem 0.8rem 0.7rem 2.2rem;
                font-size: 0.9rem;
            }

            .file-upload {
                padding: 0.7rem 0.8rem;
            }

            .btn {
                padding: 0.8rem;
                font-size: 0.9rem;
            }

            textarea {
                min-height: 140px;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Assignment</h1>
        </div>
        <div class="auth-buttons">
            <a href="teacher.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="form-container">
        <h2><i class="fas fa-file-alt"></i> Add New Assignment</h2>

        <form action="addAssignment" method="post" enctype="multipart/form-data">
            <div class="form-group input-icon">
                <label for="title">Assignment Title</label>
                <i class="fas fa-heading"></i>
                <input type="text" id="title" name="title" placeholder="Enter assignment title" required>
            </div>
            <div class="form-group input-icon">
                <label for="note">Description</label>
                <i class="fas fa-note-sticky"></i>
                <textarea id="note" name="note" placeholder="Write a short note or description..." required></textarea>
            </div>
            <div class="form-group input-icon">
                <label for="file">Upload File</label>
                <div class="file-upload" onclick="document.getElementById('file').click()">
                    <i class="fas fa-file"></i>
                    <span>  No file chosen</span>
                    <div class="upload-btn">Choose File</div>
                </div>
                <input type="file" id="file" name="file" required onchange="this.previousElementSibling.querySelector('span').textContent = this.files[0] ? this.files[0].name : 'No file chosen'">
            </div>
            <button type="submit" class="btn"><i class="fas fa-upload"></i> Upload Assignment</button>
        </form>

        <% 
            String msg = request.getParameter("msg");
            if ("success".equals(msg)) {
        %>
            <div class="message success"><i class="fas fa-check-circle"></i> Assignment uploaded successfully!</div>
        <% } else if ("error".equals(msg)) { %>
            <div class="message error"><i class="fas fa-exclamation-circle"></i> Something went wrong while uploading!</div>
        <% } %>
    </div>

</body>
</html>