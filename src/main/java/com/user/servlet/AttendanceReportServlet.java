package com.user.servlet;

import com.DAO.AttendanceDAO;
import com.DB.DBConnect;
import com.entity.Attendance;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/downloadAttendancePDF")
public class AttendanceReportServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNo = request.getParameter("rollno");

        if (rollNo == null || rollNo.isEmpty()) {
            response.getWriter().println("Roll number is missing.");
            return;
        }

        AttendanceDAO dao = new AttendanceDAO(DBConnect.getConnection());
        List<Attendance> list = dao.getAttendanceByRollNo(rollNo);

        long presentCount = list.stream().filter(a -> a.getStatus().equalsIgnoreCase("Present")).count();
        long absentCount = list.stream().filter(a -> a.getStatus().equalsIgnoreCase("Absent")).count();
        double percentage = list.size() > 0 ? ((double) presentCount / list.size()) * 100 : 0;

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=Attendance_Report_" + rollNo + ".pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
            Paragraph title = new Paragraph("Attendance Report for Roll No: " + rollNo, titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(6); // 6 columns
            table.setWidthPercentage(100);
            table.setWidths(new int[]{3, 2, 2, 2, 3, 2});

            table.addCell("Subject");
            table.addCell("Timing");
            table.addCell("Status");
            table.addCell("Roll No");
            table.addCell("Scanned Time");
            table.addCell("Date"); // ✅ Add Date Column

            for (Attendance a : list) {
                table.addCell(a.getSubject());
                table.addCell(a.getTiming());
                table.addCell(a.getStatus());
                table.addCell(a.getRollNo());
                table.addCell(a.getScannedTime() != null ? a.getScannedTime() : "-");
                table.addCell(a.getDate() != null ? a.getDate() : "-"); // ✅ Date Cell
            }

            document.add(table);
            document.add(new Paragraph(" "));

            Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
            document.add(new Paragraph("Total Days: " + list.size(), boldFont));
            document.add(new Paragraph("Present: " + presentCount, boldFont));
            document.add(new Paragraph("Absent: " + absentCount, boldFont));
            document.add(new Paragraph("Attendance %: " + String.format("%.2f", percentage) + "%", boldFont));

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
