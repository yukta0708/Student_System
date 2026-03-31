package com.DAO;


import com.DB.DBConnect;
import com.entity.Timetable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TimetableDAO {
    private Connection conn;
    public TimetableDAO(Connection conn) {
        this.conn = conn;
    }

    public TimetableDAO() {
        conn = DBConnect.getConnection();
    }

    public boolean addTimetable(Timetable t) {
        String sql = "INSERT INTO timetable(day, time_slot, subject, teacher) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, t.getDay());
            ps.setString(2, t.getTimeSlot());
            ps.setString(3, t.getSubject());
            ps.setString(4, t.getTeacher());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Timetable> getAllTimetables() {
        List<Timetable> list = new ArrayList<>();
        String sql = "SELECT * FROM timetable";
        try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Timetable t = new Timetable();
                t.setId(rs.getInt("id"));
                t.setDay(rs.getString("day"));
                t.setTimeSlot(rs.getString("time_slot"));
                t.setSubject(rs.getString("subject"));
                t.setTeacher(rs.getString("teacher"));
                list.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    
    public boolean updateTimetable(int id, String day, String timeSlot, String subject, String teacher) {
        try {
            String query = "UPDATE timetable SET day=?, time_slot=?, subject=?, teacher=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, day);
            ps.setString(2, timeSlot);
            ps.setString(3, subject);
            ps.setString(4, teacher);
            ps.setInt(5, id);

            int rowsAffected = ps.executeUpdate();
            ps.close();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

   
    public boolean deleteTimetable(int id) {
        try {
            String query = "DELETE FROM timetable WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);

            int rowsAffected = ps.executeUpdate();
            ps.close();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}