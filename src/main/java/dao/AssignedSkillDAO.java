package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.AssignedSkill;
import util.DBConnection;

public class AssignedSkillDAO {
	
	public List<AssignedSkill> getAllAssignedSkills() {
		
		List<AssignedSkill> list = new ArrayList<>();
		
		String sql = "SELECT u.full_name, s.skill_name, s.category, " +
		             "ss.proficiency_level, ss.progress " +
				     "FROM student_skills ss " +
		             "JOIN users u ON ss.user_id = u.id " +
				     "JOIN skills s on ss.skill_id = s.id " +
		             "ORDER BY u.full_name";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			
			while (rs.next()) {
				AssignedSkill assignedSkill = new AssignedSkill();
				
				assignedSkill.setStudentName(rs.getString("full_name"));
				assignedSkill.setSkillName(rs.getString("skill_name"));
				assignedSkill.setCategory(rs.getString("category"));
				assignedSkill.setProficiencyLevel(rs.getString("proficiency_level"));
				assignedSkill.setProgress(rs.getInt("progress"));
				
				list.add(assignedSkill);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
