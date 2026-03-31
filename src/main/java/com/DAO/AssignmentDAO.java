package com.DAO;


import com.DB.DBConnect;
import com.entity.Assignment;

import java.sql.*;
import java.util.*;

public class AssignmentDAO {
    private Connection conn;

    public AssignmentDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addAssignment(Assignment assignment) {
        boolean f = false;
        String sql = "INSERT INTO assignments(title, note, file_name) VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, assignment.getTitle());
            ps.setString(2, assignment.getNote());
            ps.setString(3, assignment.getFileName());
            int i = ps.executeUpdate();
            f = i == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Assignment> getAllAssignments() {
        List<Assignment> list = new ArrayList<>();
        String sql = "SELECT * FROM assignments ORDER BY upload_date DESC";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Assignment a = new Assignment();
                a.setId(rs.getInt("id"));
                a.setTitle(rs.getString("title"));
                a.setNote(rs.getString("note"));
                a.setFileName(rs.getString("file_name"));
                a.setUploadDate(rs.getTimestamp("upload_date"));
                list.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
