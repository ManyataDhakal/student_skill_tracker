package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import model.User;
import util.DBConnection;

public class StudentDAO {
	
	public boolean addStudent(User user) {
		
		String sql = "INSERT INTO users(full_name, email, password, role, status) " +
				     "VALUES (?, ?, ?, 'student', 'approved')";
		
		try {
			Connection conn = DBConnection.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			
			int row = ps.executeUpdate();
			
			return row > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
