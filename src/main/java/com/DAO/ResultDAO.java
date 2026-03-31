package com.DAO;


import com.entity.Result;
import java.sql.*;
import java.util.*;

public class ResultDAO {
    private Connection conn;

    public ResultDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addResult(Result result) {
        String sql = "INSERT INTO results(student_name, exam_type, subject, marks_obtained, total_marks, percentage) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, result.getStudentName());
            ps.setString(2, result.getExamType());
            ps.setString(3, result.getSubject());
            ps.setInt(4, result.getMarksObtained());
            ps.setInt(5, result.getTotalMarks());
            ps.setDouble(6, result.getPercentage());
            return ps.executeUpdate() == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Result> getResultsByStudent(String studentName) {
        List<Result> list = new ArrayList<>();
        String sql = "SELECT * FROM results WHERE student_name = ? ORDER BY exam_type";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, studentName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                r.setStudentName(rs.getString("student_name"));
                r.setExamType(rs.getString("exam_type"));
                r.setSubject(rs.getString("subject"));
                r.setMarksObtained(rs.getInt("marks_obtained"));
                r.setTotalMarks(rs.getInt("total_marks"));
                r.setPercentage(rs.getDouble("percentage"));
                r.setDate(rs.getTimestamp("date"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Map<String, Map<String, List<Result>>> getGroupedResultsForTeacher() {
        Map<String, Map<String, List<Result>>> data = new LinkedHashMap<>();
        String sql = "SELECT * FROM results ORDER BY student_name, exam_type";

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Result r = new Result();
                r.setId(rs.getInt("id"));
                r.setStudentName(rs.getString("student_name"));
                r.setExamType(rs.getString("exam_type"));
                r.setSubject(rs.getString("subject"));
                r.setMarksObtained(rs.getInt("marks_obtained"));
                r.setTotalMarks(rs.getInt("total_marks"));

                String student = r.getStudentName();
                String exam = r.getExamType();

                data.computeIfAbsent(student, k -> new LinkedHashMap<>())
                    .computeIfAbsent(exam, k -> new ArrayList<>())
                    .add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }
   
    
}
