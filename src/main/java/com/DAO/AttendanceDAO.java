package com.DAO;


import com.DB.DBConnect;
import com.entity.Attendance;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormatSymbols;
import java.time.Month;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


public class AttendanceDAO {
    private Connection conn;
    public AttendanceDAO(Connection conn) {
        this.conn = conn;
    }
    public AttendanceDAO() {
        this.conn = DBConnect.getConnection();
    }

   
    public boolean markAttendance(Attendance attendance) {
        boolean success = false;
        try {
            String query = "INSERT INTO attendance (roll_no, subject, timing, status, date) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, attendance.getRollNo());
            ps.setString(2, attendance.getSubject());
            ps.setString(3, attendance.getTiming());
            ps.setString(4, attendance.getStatus());
            ps.setString(5, attendance.getDate());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

    
    public String checkAttendance(String rollNo, String subject, String timing) {
        String status = "Absent";
        try {
            String query = "SELECT status FROM attendance WHERE roll_no = ? AND subject = ? AND timing = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, rollNo);
            ps.setString(2, subject);
            ps.setString(3, timing);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = rs.getString("status");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public List<Attendance> getAttendanceByRollNo(String rollno) {
        List<Attendance> list = new ArrayList<>();
        String sql = "SELECT * FROM attendance WHERE roll_no = ? ORDER BY id DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, rollno);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Attendance a = new Attendance();
                a.setRollNo(rs.getString("roll_no"));  
                a.setSubject(rs.getString("subject"));
                a.setTiming(rs.getString("timing"));
                a.setStatus(rs.getString("status"));
                a.setDate(rs.getString("date"));
               
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}

