package com.DAO;

import com.DB.DBConnect;
import com.entity.LeaveApplication;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LeaveApplicationDAO {

   
    public static List<LeaveApplication> getAllLeaveApplications() {
        List<LeaveApplication> leaveList = new ArrayList<>();
        String sql = "SELECT * FROM leave_applications WHERE status = 'Pending'";

        try (Connection conn = DBConnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                LeaveApplication leave = new LeaveApplication();
                leave.setId(rs.getInt("id"));
                leave.setStudentName(rs.getString("student_name"));
                leave.setStartDate(rs.getString("start_date"));
                leave.setEndDate(rs.getString("end_date"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                leaveList.add(leave);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return leaveList;
    }

    
    public static boolean updateLeaveStatus(int id, String status) {
        String sql = "UPDATE leave_applications SET status = ? WHERE id = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, status);
            pstmt.setInt(2, id);

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Rows updated: " + rowsAffected);
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Insert a new leave application into the database (by student)
    public static boolean applyLeave(String studentName, String startDate, String endDate, String reason) {
        String sql = "INSERT INTO leave_applications (student_name, start_date, end_date, reason, status) VALUES (?, ?, ?, ?, 'Pending')";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, studentName);
            pstmt.setString(2, startDate);
            pstmt.setString(3, endDate);
            pstmt.setString(4, reason);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

   
    public static List<LeaveApplication> getLeaveApplicationsByStudent(String studentName) {
        List<LeaveApplication> list = new ArrayList<>();
        String sql = "SELECT * FROM leave_applications WHERE student_name = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, studentName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LeaveApplication leave = new LeaveApplication();
                leave.setId(rs.getInt("id"));
                leave.setStudentName(rs.getString("student_name"));
                leave.setStartDate(rs.getString("start_date"));
                leave.setEndDate(rs.getString("end_date"));
                leave.setReason(rs.getString("reason"));
                leave.setStatus(rs.getString("status"));
                list.add(leave);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
