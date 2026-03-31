<%@ page import="java.util.*, com.entity.Result, com.DAO.ResultDAO, com.DB.DBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Performance</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #5B21B6;
            --secondary: #7C3AED;
            --accent: #A78BFA;
            --light: #FFFFFF;
            --dark: #1F2937;
            --grade-aplus: #10B981;
            --grade-a: #34D399;
            --grade-b: #60A5FA;
            --grade-c: #FBBF24;
            --grade-d: #F59E0B;
            --grade-f: #EF4444;
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
            padding: 1.75rem;
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

        .container {
            max-width: 1280px;
            width: 100%;
            margin: 1.75rem 0;
        }

        h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 2rem;
            font-weight: 600;
            color: var(--primary);
            text-align: center;
            margin-bottom: 1.75rem;
        }

        .filters {
            background: var(--light);
            padding: 1.5rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            position: relative;
            animation: fadeIn 0.5s ease-out;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .filters::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .form-group {
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 0.3rem;
            font-family: 'Poppins', sans-serif;
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
            color: var(--accent);
            font-size: 0.85rem;
        }

        input[type="text"],
        select {
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

        input:focus,
        select:focus,
        input:hover,
        select:hover {
            border-color: var(--primary);
            box-shadow: 0 0 6px rgba(91, 33, 182, 0.15);
            background: var(--light);
        }

        .table-container {
            background: var(--light);
            padding: 1.5rem;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            position: relative;
            animation: fadeIn 0.5s ease-out;
        }

        .table-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: var(--border-radius);
            overflow: hidden;
        }

        th, td {
            padding: 0.75rem;
            text-align: center;
            vertical-align: middle;
            font-size: 0.9rem;
            border: 1px solid rgba(91, 33, 182, 0.2);
        }

        th {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.95rem;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        th:first-child {
            border-top-left-radius: var(--border-radius);
        }

        th:last-child {
            border-top-right-radius: var(--border-radius);
        }

        tr {
            transition: var(--transition);
        }

        tr:hover {
            background: rgba(91, 33, 182, 0.05);
            box-shadow: 0 1px 4px rgba(91, 33, 182, 0.1);
        }

        .grade-Aplus { color: var(--grade-aplus); font-weight: 600; }
        .grade-A { color: var(--grade-a); font-weight: 600; }
        .grade-B { color: var(--grade-b); font-weight: 600; }
        .grade-C { color: var(--grade-c); font-weight: 600; }
        .grade-D { color: var(--grade-d); font-weight: 600; }
        .grade-F { color: var(--grade-f); font-weight: 600; }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .filters {
                grid-template-columns: 1fr;
                gap: 0.75rem;
                padding: 1rem;
            }

            .container {
                padding: 1rem;
            }

            .navbar {
                flex-direction: column;
                gap: 0.75rem;
                padding: 0.75rem;
            }

            .table-container {
                padding: 1rem;
                margin: 0 -1rem;
            }

            table {
                font-size: 0.85rem;
            }

            th, td {
                padding: 0.6rem;
            }

            input[type="text"],
            select {
                padding: 0.65rem 0.9rem 0.65rem 2rem;
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>

    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Student Performance</h1>
        </div>
        <div class="auth-buttons">
            <a href="teacher.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="container">
        <h2><i class="fas fa-chart-line"></i> Student Performance</h2>

        <div class="filters">
            <div class="form-group input-icon">
                <label for="searchName">Search by Student Name</label>
                <i class="fas fa-search"></i>
                <input type="text" id="searchName" onkeyup="filterTable()" placeholder="Enter student name">
            </div>
            <div class="form-group input-icon">
                <label for="filterExam">Filter by Exam Type</label>
                <i class="fas fa-filter"></i>
                <select id="filterExam" onchange="filterTable()">
                    <option value="all">All Exam Types</option>
                    <option value="unit test">Unit Test</option>
                    <option value="practical">Practical</option>
                    <option value="end sem">End Sem</option>
                </select>
            </div>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Exam Type</th>
                        <th>Total Marks Obtained</th>
                        <th>Total Marks</th>
                        <th>Percentage</th>
                        <th>Grade</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    ResultDAO dao = new ResultDAO(DBConnect.getConnection());
                    Map<String, Map<String, List<Result>>> groupedResults = dao.getGroupedResultsForTeacher();

                    for (Map.Entry<String, Map<String, List<Result>>> studentEntry : groupedResults.entrySet()) {
                        String studentName = studentEntry.getKey();
                        Map<String, List<Result>> examMap = studentEntry.getValue();

                        for (Map.Entry<String, List<Result>> examEntry : examMap.entrySet()) {
                            String examType = examEntry.getKey();
                            List<Result> results = examEntry.getValue();

                            int totalObtained = 0;
                            int totalMarks = 0;

                            for (Result r : results) {
                                totalObtained += r.getMarksObtained();
                                totalMarks += r.getTotalMarks();
                            }

                            double percentage = (totalMarks > 0) ? (totalObtained * 100.0 / totalMarks) : 0.0;
                            String gradeClass = "", gradeLabel = "";

                            if (percentage >= 90) {
                                gradeLabel = "A+";
                                gradeClass = "grade-Aplus";
                            } else if (percentage >= 75) {
                                gradeLabel = "A";
                                gradeClass = "grade-A";
                            } else if (percentage >= 60) {
                                gradeLabel = "B";
                                gradeClass = "grade-B";
                            } else if (percentage >= 50) {
                                gradeLabel = "C";
                                gradeClass = "grade-C";
                            } else if (percentage >= 35) {
                                gradeLabel = "D";
                                gradeClass = "grade-D";
                            } else {
                                gradeLabel = "F";
                                gradeClass = "grade-F";
                            }
                %>
                    <tr>
                        <td><%= studentName %></td>
                        <td><%= examType %></td>
                        <td><%= totalObtained %></td>
                        <td><%= totalMarks %></td>
                        <td><%= String.format("%.2f", percentage) %>%</td>
                        <td class="<%= gradeClass %>"><%= gradeLabel %></td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        function filterTable() {
            const nameInput = document.getElementById("searchName").value.toLowerCase();
            const examFilter = document.getElementById("filterExam").value.toLowerCase();
            const rows = document.querySelectorAll("table tbody tr");

            rows.forEach(row => {
                const name = row.cells[0].innerText.toLowerCase();
                const exam = row.cells[1].innerText.toLowerCase();

                const nameMatch = name.includes(nameInput);
                const examMatch = (examFilter === "all" || exam === examFilter);

                if (nameMatch && examMatch) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>
</body>
</html>