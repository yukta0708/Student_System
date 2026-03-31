package com.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDAO {
    private Connection conn;

    public UserDAO(Connection conn) {
        this.conn = conn;
    }

   
    public boolean addUser(User u) {
        boolean f = false;
        String sql = "INSERT INTO user(name, email, password, phoneno, role, rollno) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setString(4, u.getPhoneno());
            ps.setString(5, u.getRole());
            ps.setString(6, u.getRollno());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    
    public User getLogin(String email, String password) {
        User user = null;

        try {
            String sql = "SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new User(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("phoneno"),
                    rs.getString("role"),
                    rs.getString("rollno")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    
    public List<User> getallUser() {
        List<User> list = new ArrayList<>();
        User u = null;

        try {
            String sql = "SELECT * FROM user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPhoneno(rs.getString("phoneno"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    
    public User getUserById(int id) {
        User user = null;

        try {
            String sql = "SELECT * FROM user WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPhoneno(rs.getString("phoneno"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    
    public boolean updateUser(User u) {
        boolean f = false;

        try {
            String sql = "UPDATE user SET name=?, email=?, phoneno=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPhoneno());
            ps.setInt(4, u.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    
    public boolean deleteUser(int id) {
        boolean f = false;

        try {
            String sql = "DELETE FROM user WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
