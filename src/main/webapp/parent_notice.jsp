<%@ page import="com.DAO.FeedbackDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Feedback" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>
<%
    User user = (User) session.getAttribute("userobj");
    String toast = (String) session.getAttribute("toast");
    String toastType = (String) session.getAttribute("toastType");
    List<Feedback> feedbackList = null;
    if (user != null && user.getName() != null) {
        FeedbackDAO dao = new FeedbackDAO(DBConnect.getConnection());
        feedbackList = dao.getFeedbackByParentName(user.getName());
    } else {
        toast = "You are not logged in!";
        toastType = "error";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parent Notices</title>
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
            --danger: #EF4444;
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

        .glass-panel {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            position: relative;
            animation: fadeIn 0.5s ease-out;
        }

        .glass-panel::before {
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
            font-size: 2rem;
            font-weight: 600;
            color: var(--primary);
            text-align: center;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 8px;
            animation: fadeIn 0.5s ease-out;
        }

        thead th {
            background: linear-gradient(90deg, var(--primary), var(--secondary));
            color: var(--light);
            font-family: 'Poppins', sans-serif;
            font-weight: 500;
            font-size: 0.95rem;
            padding: 0.75rem;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        thead th:first-child {
            border-top-left-radius: var(--border-radius);
            border-bottom-left-radius: var(--border-radius);
        }

        thead th:last-child {
            border-top-right-radius: var(--border-radius);
            border-bottom-right-radius: var(--border-radius);
        }

        tbody tr {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        tbody tr:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        td {
            padding: 0.75rem;
            text-align: center;
            vertical-align: middle;
            font-size: 0.9rem;
            border: none;
        }

        .no-data {
            padding: 1rem;
            border-radius: var(--border-radius);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(4px);
            box-shadow: var(--box-shadow);
            text-align: center;
            animation: fadeIn 0.5s ease-out;
            border-left: 3px solid var(--danger);
            font-size: 0.9rem;
            color: var(--dark);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }

        .toast {
            position: fixed;
            top: 1rem;
            right: 1rem;
            padding: 0.75rem 1.5rem;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-size: 0.85rem;
            font-weight: 500;
            color: var(--light);
            box-shadow: var(--box-shadow);
            z-index: 9999;
            display: none;
            animation: slideIn 0.3s ease-out;
        }

        .toast.success {
            background: var(--success);
        }

        .toast.error {
            background: var(--danger);
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(100%); }
            to { opacity: 1; transform: translateX(0); }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            .navbar {
                flex-direction: column;
                gap: 0.75rem;
                padding: 0.75rem;
            }

            .glass-panel {
                padding: 1rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            table {
                font-size: 0.85rem;
            }

            thead th,
            td {
                padding: 0.6rem;
            }

            .no-data {
                font-size: 0.85rem;
                padding: 0.75rem;
            }

            .toast {
                top: 0.5rem;
                right: 0.5rem;
                padding: 0.5rem 1rem;
                font-size: 0.8rem;
            }
        }
    </style>
    <script>
        window.onload = function () {
            const message = "<%= toast != null ? toast : "" %>";
            const type = "<%= toastType != null ? toastType : "" %>";
            if (message !== "") {
                const toast = document.getElementById("toast");
                toast.innerText = message;
                toast.style.display = "block";
                if (type === "error") {
                    toast.classList.add("error");
                } else {
                    toast.classList.add("success");
                }
                setTimeout(() => {
                    toast.style.display = "none";
                }, 3000);
            }
        };
    </script>
</head>
<body>
    <div class="navbar">
        <div class="navbar-brand">
            <i class="fas fa-chalkboard-teacher"></i>
            <h1>Notification</h1>
        </div>
        <div class="auth-buttons">
            <a href="parent.jsp" class="btn"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <div class="container">
        <h2><i class="fas fa-envelope"></i> Feedback Replies from Teachers</h2>
        <div class="glass-panel">
            <div id="toast" class="toast"></div>
            <%
                session.removeAttribute("toast");
                session.removeAttribute("toastType");
            %>
            <% if (feedbackList == null || feedbackList.isEmpty()) { %>
                <div class="no-data"><i class="fas fa-exclamation-circle"></i> No replies yet. Please check again later.</div>
            <% } else { %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Student Name</th>
                                <th>Your Feedback</th>
                                <th>Teacher Reply</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Feedback fb : feedbackList) { %>
                                <tr>
                                    <td><%= fb.getStudentName() %></td>
                                    <td><%= fb.getDescription() %></td>
                                    <td><%= (fb.getReply() != null && !fb.getReply().isEmpty()) ? fb.getReply() : "Pending" %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>