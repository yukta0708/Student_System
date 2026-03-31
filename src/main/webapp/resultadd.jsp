<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title> | Add Result</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #4B0082;
            --secondary: #6A5ACD;
            --accent: #9370DB;
            --light: #FFFFFF;
            --dark: #2D2D2D;
            --success: #2E7D32;
            --warning: #EF6C00;
            --gray: #4B5563;
            --border-radius: 8px;
            --box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            --transition: all 0.2s ease-in-out;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(180deg, #F9FAFB 0%, #E5E7EB 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 1.5rem;
        }

        .navbar {
            background: var(--primary);
            color: var(--light);
            padding: 1rem 2rem;
            width: 100%;
            max-width: 900px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--box-shadow);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .navbar-brand {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .navbar-brand h1 {
            font-family: 'Inter', sans-serif;
            font-size: 1.5rem;
            font-weight: 600;
        }

        .navbar-brand i {
            font-size: 1.5rem;
        }

        .auth-buttons .btn {
            background: var(--light);
            color: var(--primary);
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
            border-radius: var(--border-radius);
            text-decoration: none;
        }

        .auth-buttons .btn:hover {
            background: #F3F4F6;
            color: var(--secondary);
        }

        .container {
            background: var(--light);
            padding: 2rem;
            max-width: 900px;
            width: 100%;
            box-shadow: var(--box-shadow);
            border-radius: var(--border-radius);
            margin: 1.5rem 0;
            border: 1px solid #E5E7EB;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #E5E7EB;
        }

        h2 {
            font-family: 'Inter', sans-serif;
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--primary);
        }

        .logo {
            font-family: 'Inter', sans-serif;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
            display: flex;
            align-items: center;
        }

        .logo i {
            margin-right: 0.5rem;
            color: var(--accent);
            font-size: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.3rem;
            font-weight: 500;
            color: var(--dark);
            font-size: 0.85rem;
        }

        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            font-size: 0.85rem;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.25rem;
            border: 1px solid #D1D5DB;
            border-radius: 6px;
            font-size: 0.95rem;
            transition: var(--transition);
            background: #F9FAFB;
            color: var(--dark);
        }

        input:focus,
        select:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 2px rgba(75, 0, 130, 0.1);
            background: var(--light);
        }

        .subject-container {
            border: 1px solid #E5E7EB;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin-bottom: 1.25rem;
            background: #F9FAFB;
        }

        .subject-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .subject-title {
            font-family: 'Inter', sans-serif;
            color: var(--primary);
            font-weight: 500;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
        }

        .subject-title i {
            margin-right: 0.5rem;
            color: var(--accent);
        }

        .remove-subject {
            background: none;
            border: none;
            color: var(--warning);
            cursor: pointer;
            font-size: 1rem;
            transition: var(--transition);
        }

        .remove-subject:hover {
            color: #D97706;
        }

        .marks-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .btn-primary {
            background: var(--primary);
            color: var(--light);
        }

        .btn-primary:hover {
            background: var(--secondary);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary {
            background: #E5E7EB;
            color: var(--dark);
        }

        .btn-secondary:hover {
            background: #D1D5DB;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .btn-add {
            background: #F3F4F6;
            color: var(--primary);
            width: 100%;
            margin-bottom: 1.25rem;
        }

        .btn-add:hover {
            background: var(--primary);
            color: var(--light);
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            margin-top: 1.5rem;
        }

        .success-card {
            margin-top: 1.5rem;
            padding: 1.25rem;
            background: var(--light);
            border: 1px solid #D1D5DB;
            border-left: 4px solid var(--success);
            border-radius: var(--border-radius);
            animation: fadeIn 0.5s ease-out;
        }

        .success-header {
            display: flex;
            align-items: center;
            margin-bottom: 0.75rem;
            color: var(--success);
            font-weight: 600;
        }

        .success-header i {
            margin-right: 0.5rem;
            font-size: 1.25rem;
        }

        .success-card p {
            color: var(--gray);
            font-size: 0.9rem;
        }

        .result-stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 0.75rem;
            margin-top: 0.75rem;
        }

        .stat-item {
            background: #F9FAFB;
            padding: 0.75rem;
            border-radius: var(--border-radius);
            text-align: center;
            border: 1px solid #E5E7EB;
        }

        .stat-label {
            font-size: 0.8rem;
            color: var(--gray);
            margin-bottom: 0.25rem;
        }

        .stat-value {
            font-size: 1.1rem;
            font-weight: 500;
            color: var(--primary);
        }

        .grade {
            display: inline-block;
            padding: 0.4rem 0.75rem;
            background: var(--primary);
            color: var(--light);
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.25rem;
            }

            .marks-grid {
                grid-template-columns: 1fr;
            }

            .result-stats {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
                gap: 0.5rem;
            }

            .btn {
                width: 100%;
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
            <h1>Student Result</h1>
        </div>
        <div class="auth-buttons">
            <a href="teacher.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="container">
        <div class="header">
            <div class="logo">
                <i class="fas fa-graduation-cap"></i> 
            </div>
            <h2>Add Student Result</h2>
        </div>

        <form action="addResult" method="post">
            <div class="form-group input-icon">
                <label for="studentName">Student Name</label>
                <i class="fas fa-user"></i>
                <input type="text" id="studentName" name="studentName" placeholder="Enter student full name" required>
            </div>

            <div class="form-group input-icon">
                <label for="examType">Exam Type</label>
                <i class="fas fa-clipboard-list"></i>
                <select id="examType" name="examType" required>
                    <option value="" disabled selected>Select exam type</option>
                    <option value="Unit Test">Unit Test</option>
                    <option value="Practical">Practical</option>
                    <option value="Mid Term">Mid Term</option>
                    <option value="End Semester">End Semester</option>
                </select>
            </div>

            <input type="hidden" name="totalSubjects" id="totalSubjects" value="3">
            <div id="subjects">
                <% for (int i = 1; i <= 3; i++) { %>
                <div class="subject-container" id="subject<%=i%>">
                    <div class="subject-header">
                        <div class="subject-title">
                            <i class="fas fa-book"></i> Subject <%= i %>
                        </div>
                        <% if (i > 1) { %>
                        <button type="button" class="remove-subject" onclick="removeSubject('subject<%=i%>')">
                            <i class="fas fa-times"></i>
                        </button>
                        <% } %>
                    </div>
                    <div class="form-group input-icon">
                        <label>Subject Name</label>
                        <i class="fas fa-tag"></i>
                        <input name="subject<%=i%>" required placeholder="Mathematics, Physics, etc.">
                    </div>
                    <div class="marks-grid">
                        <div class="form-group input-icon">
                            <label>Marks Obtained</label>
                            <i class="fas fa-marker"></i>
                            <input type="number" name="marks<%=i%>" required min="0" step="0.01" placeholder="Enter marks">
                        </div>
                        <div class="form-group input-icon">
                            <label>Maximum Marks</label>
                            <i class="fas fa-chart-line"></i>
                            <input type="number" name="total<%=i%>" required min="1" step="1" placeholder="Out of">
                        </div>
                    </div>
                </div>
                <% } %>
            </div>

            <button type="button" class="btn btn-add" onclick="addSubjectRow()">
                <i class="fas fa-plus"></i> Add Another Subject
            </button>

            <div class="action-buttons">
                
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Save Result
                </button>
            </div>
        </form>

        <% if ("success".equals(request.getParameter("msg"))) {
            int total = Integer.parseInt(request.getParameter("total"));
            int outof = Integer.parseInt(request.getParameter("outof"));
            double percent = (total * 100.0) / outof;
            String grade = "";
            
            if (percent >= 90) grade = "A+";
            else if (percent >= 80) grade = "A";
            else if (percent >= 70) grade = "B+";
            else if (percent >= 60) grade = "B";
            else if (percent >= 50) grade = "C";
            else if (percent >= 40) grade = "D";
            else grade = "F";
        %>
            <div class="success-card">
                <div class="success-header">
                    <i class="fas fa-check-circle"></i>
                    <h3>Result Saved Successfully</h3>
                </div>
                <p>The student's result has been successfully recorded in the system.</p>
                
                <div class="result-stats">
                    <div class="stat-item">
                        <div class="stat-label">Total Marks</div>
                        <div class="stat-value"><%= total %>/<%= outof %></div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">Percentage</div>
                        <div class="stat-value"><%= String.format("%.2f", percent) %>%</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-label">Grade</div>
                        <div class="grade"><%= grade %></div>
                    </div>
                </div>
            </div>
        <% } %>
    </div>

    <script>
        let subjectCount = 3;
        
        function addSubjectRow() {
            subjectCount++;
            const subjectList = document.getElementById('subjects');
            
            const row = document.createElement('div');
            row.className = 'subject-container';
            row.id = 'subject' + subjectCount;
            row.style.opacity = '0';
            row.innerHTML = `
                <div class="subject-header">
                    <div class="subject-title">
                        <i class="fas fa-book"></i> Subject ${subjectCount}
                    </div>
                    <button type="button" class="remove-subject" onclick="removeSubject('subject${subjectCount}')">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
                <div class="form-group input-icon">
                    <label>Subject Name</label>
                    <i class="fas fa-tag"></i>
                    <input name="subject${subjectCount}" required placeholder="Mathematics, Physics, etc.">
                </div>
                <div class="marks-grid">
                    <div class="form-group input-icon">
                        <label>Marks Obtained</label>
                        <i class="fas fa-marker"></i>
                        <input type="number" name="marks${subjectCount}" required min="0" step="0.01" placeholder="Enter marks">
                    </div>
                    <div class="form-group input-icon">
                        <label>Maximum Marks</label>
                        <i class="fas fa-chart-line"></i>
                        <input type="number" name="total${subjectCount}" required min="1" step="1" placeholder="Out of">
                    </div>
                </div>
            `;
            subjectList.appendChild(row);
            
            // Animate in
            setTimeout(() => {
                row.style.transition = 'opacity 0.3s ease-out';
                row.style.opacity = '1';
            }, 10);
            
            document.getElementById("totalSubjects").value = subjectCount;
            
            // Scroll to the newly added row
            row.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
        }
        
        function removeSubject(id) {
            if (subjectCount > 1) {
                const element = document.getElementById(id);
                element.style.transition = 'opacity 0.3s ease-out';
                element.style.opacity = '0';
                setTimeout(() => {
                    element.remove();
                    subjectCount--;
                    document.getElementById("totalSubjects").value = subjectCount;
                    
                    // Renumber remaining subjects
                    const subjects = document.querySelectorAll('.subject-container');
                    subjects.forEach((subject, index) => {
                        const num = index + 1;
                        subject.id = 'subject' + num;
                        subject.querySelector('.subject-title').innerHTML = `
                            <i class="fas fa-book"></i> Subject ${num}
                        `;
                        
                        // Update input names
                        const inputs = subject.querySelectorAll('input');
                        inputs[0].name = 'subject' + num;
                        inputs[1].name = 'marks' + num;
                        inputs[2].name = 'total' + num;
                        
                        // Only show remove button if not the first subject
                        const removeBtn = subject.querySelector('.remove-subject');
                        if (removeBtn) {
                            removeBtn.onclick = function() { removeSubject('subject' + num); };
                            removeBtn.style.display = num > 1 ? 'block' : 'none';
                        }
                    });
                }, 300);
            }
        }
    </script>
</body>
</html>