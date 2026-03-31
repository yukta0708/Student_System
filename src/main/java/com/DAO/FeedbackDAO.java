package com.DAO;
import com.DB.DBConnect;
import com.entity.Feedback;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private Connection conn;
    public FeedbackDAO(Connection conn) {
        this.conn = conn;
    }

    public FeedbackDAO() {
        conn = DBConnect.getConnection();
    }

	public boolean addFeedback(Feedback f) {
	    try {
	        Connection conn = this.conn;
	        PreparedStatement ps = conn.prepareStatement("INSERT INTO feedback (parent_name, student_name, description) VALUES (?, ?, ?)");
	        ps.setString(1, f.getParentName());
	        ps.setString(2, f.getStudentName());
	        ps.setString(3, f.getDescription());
	        return ps.executeUpdate() == 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	public List<Feedback> getAllFeedback() {
	    List<Feedback> list = new ArrayList<>();
	    try {
	        PreparedStatement ps = conn.prepareStatement("SELECT * FROM feedback");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Feedback fb = new Feedback(rs.getInt("id"), rs.getString("parent_name"),
	                    rs.getString("student_name"), rs.getString("description"), rs.getString("reply"));
	            list.add(fb);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	public boolean replyToFeedback(int id, String reply) {
	    try {
	        PreparedStatement ps = conn.prepareStatement("UPDATE feedback SET reply=? WHERE id=?");
	        ps.setString(1, reply);
	        ps.setInt(2, id);
	        return ps.executeUpdate() == 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	public boolean deleteFeedback(int id) {
	    try {
	        PreparedStatement ps = conn.prepareStatement("DELETE FROM feedback WHERE id=?");
	        ps.setInt(1, id);
	        return ps.executeUpdate() == 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	public List<Feedback> getRepliedFeedbackByStudent(String studentName) {
	    List<Feedback> list = new ArrayList<>();
	    String sql = "SELECT * FROM feedback WHERE student_name = ? AND reply IS NOT NULL";
	    try {
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, studentName);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Feedback f = new Feedback();
	            f.setId(rs.getInt("id"));
	            f.setParentName(rs.getString("parent_name"));
	            f.setStudentName(rs.getString("student_name"));
	            f.setDescription(rs.getString("description"));
	            f.setReply(rs.getString("reply"));
	            list.add(f);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	public List<Feedback> getFeedbackByParentName(String parentName) {
	    List<Feedback> list = new ArrayList<>();
	    try {
	        String sql = "SELECT * FROM feedback WHERE parent_name=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, parentName);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Feedback f = new Feedback();
	            f.setId(rs.getInt("id"));
	            f.setStudentName(rs.getString("student_name"));
	            f.setDescription(rs.getString("description"));
	            f.setReply(rs.getString("reply"));
	            list.add(f);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}



}



