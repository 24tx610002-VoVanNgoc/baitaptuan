package ltweb.daos.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import ltweb.configs.DBConnect;
import ltweb.daos.UserDao;
import ltweb.models.UserModel;

public class UserDaoImpl implements UserDao {
    public Connection conn = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;

    // Tìm user theo username
    @Override
    public UserModel findbyUserName(String username) {
        String sql = "SELECT * FROM [Users] WHERE username = ? ";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSet(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Tìm user theo username + password (login)
    @Override
    public UserModel findByUserNameAndPassword(String username, String password) {
        String sql = "SELECT * FROM [Users] WHERE username = ? AND password = ?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSet(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Đăng ký user mới
    @Override
    public boolean register(UserModel user) {
        String sql = "INSERT INTO [Users](username, password, fullname, email, phone, roleid, createddate) VALUES (?,?,?,?,?,?,?)";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullname());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhone());
            ps.setInt(6, 3); // mặc định roleid = 3 (user thường)
            ps.setDate(7, user.getCreateddate());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Kiểm tra username tồn tại chưa
    @Override
    public boolean checkExistUsername(String username) {
        String sql = "SELECT * FROM [Users] WHERE username=?";
        try {
            conn = new DBConnect().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next(); // nếu có kết quả => tồn tại
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Hàm dựng UserModel từ ResultSet
    private UserModel mapResultSet(ResultSet rs) throws Exception {
        UserModel user = new UserModel();
        user.setId(rs.getInt("id"));
        user.setEmail(rs.getString("email"));
        user.setUsername(rs.getString("username"));
        user.setFullname(rs.getString("fullname"));
        user.setPassword(rs.getString("password"));
        user.setAvatar(rs.getString("avatar"));
        user.setRoleid(rs.getInt("roleid"));
        user.setPhone(rs.getString("phone"));
        user.setCreateddate(rs.getDate("createddate"));
        return user;
    }
}
