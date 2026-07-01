package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import model.StudentSkill;
import util.DBConnection;

public class StudentSkillDAO {
	
	public List<StudentSkill> getSkillsByStudentId(int userId){
		List<StudentSkill> list = new ArrayList<>();
		
		String sql = "SELECT ss.id, s.skill_name, s.category, ss.proficiency_level, ss.progress " +
		            "FROM student_skills ss " +
				    "JOIN skills s ON ss.skill_id = s.id " +
		            "WHERE ss.user_id = ?";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,  userId);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				StudentSkill ss = new StudentSkill();
				ss.setId(rs.getInt("id"));
				ss.setSkillName(rs.getString("skill_name"));
				ss.setCategory(rs.getString("category"));
				ss.setProficiencyLevel(rs.getString("proficiency_level"));
				ss.setProgress(rs.getInt("progress"));
				
				list.add(ss);
			}
		} catch (Exception e) {
			e.printStackTrace();		}
		return list;
	}
	
	//Get total assigned skills
	public int getTotalAssignedSkills() {
		
		int total = 0;
		String sql = "SELECT COUNT(*) FROM student_skills";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	// Get assigned skill by id
	public StudentSkill getStudentSkillById(int id) {
		StudentSkill studentSkill = null;
		
		String sql ="SELECT ss.id, s.skill_name, s.category, ss.proficiency_level, ss.progress " +
	                "FROM student_skills ss " +
			        "JOIN skills s ON ss.skill_id = s.id " +
	                "WHERE ss.id = ?";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				studentSkill = new StudentSkill();
				studentSkill.setId(rs.getInt("id"));
				studentSkill.setSkillName(rs.getString("skill_name"));
				studentSkill.setCategory(rs.getString("category"));
				studentSkill.setProficiencyLevel(rs.getString("proficiency_level"));
				studentSkill.setProgress(rs.getInt("progress"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return studentSkill;
	}
	
	// Update progress
	public boolean updateProgress(int id, int progress) {
		String sql = "UPDATE student_skills SET progress=? WHERE id=?";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, progress);
			ps.setInt(2, id);
			
			int row = ps.executeUpdate();
			return row > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	// Assign skill to student
	public boolean assignSkill(int userId, int skillId, String proficiency) {
	    String sql = "INSERT INTO student_skills(user_id, skill_id, proficiency_level, progress) VALUES (?, ?, ?, 0)";

	    try {
	        Connection conn = DBConnection.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setInt(1, userId);
	        ps.setInt(2, skillId);
	        ps.setString(3, proficiency);

	        int row = ps.executeUpdate();
	        return row > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	

}
