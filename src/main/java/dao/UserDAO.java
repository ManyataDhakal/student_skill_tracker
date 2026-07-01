package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import model.User;
import util.DBConnection;

public class UserDAO {
	
	//Login
	public User login(String email, String password) {
		User user = null;
		String sql = "SELECT * FROM users WHERE email = ? AND status = 'approved'";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {

			    if (BCrypt.checkpw(password, rs.getString("password"))) {

			        user = new User();

			        user.setId(rs.getInt("id"));
			        user.setFullName(rs.getString("full_name"));
			        user.setEmail(rs.getString("email"));
			        user.setPassword(rs.getString("password"));
			        user.setRole(rs.getString("role"));
			        user.setStatus(rs.getString("status"));
			    }
			}   
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	//Get all students
	public List<User> getAllStudents(){
		
		List<User> students = new ArrayList<>();
		String sql="SELECT *FROM users WHERE role = 'student'";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				User user = new User();
				
				user.setId(rs.getInt("id"));
				user.setFullName(rs.getString("full_name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				user.setStatus(rs.getString("status"));
				
				students.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}
	
	// Get total number of students
	public int getTotalStudents() {
		
		int total = 0;
		String sql = "SELECT COUNT(*) FROM users WHERE role = 'student'";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				total = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
		
	}
}
