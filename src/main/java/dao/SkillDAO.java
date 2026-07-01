package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Skill;
import util.DBConnection;

public class SkillDAO {
	
	public List<Skill> getAllSkills() {
		List<Skill> skills = new ArrayList<>();
		
		String sql = "SELECT * FROM skills";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				Skill skill = new Skill();
				skill.setId(rs.getInt("id"));
				skill.setSkillName(rs.getString("skill_name"));
				skill.setCategory(rs.getString("category"));
				skill.setDescription(rs.getString("description"));
				
				skills.add(skill);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return skills;
	}
	
	public boolean addSkill(Skill skill) {
		String sql ="INSERT INTO skills(skill_name, category, description) VALUES (?, ?, ?)";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1,  skill.getSkillName());
			ps.setString(2,  skill.getCategory());
			ps.setString(3,  skill.getDescription());
			
			int row = ps.executeUpdate();
			
			return row > 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Skill getSkillById(int id) {
		Skill skill = null;
		String sql = "SELECT * FROM skills WHERE id=?";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				skill = new Skill();
				skill.setId(rs.getInt("id"));
				skill.setSkillName(rs.getString("skill_name"));
				skill.setCategory(rs.getString("category"));
				skill.setDescription(rs.getString("description"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return skill;
	}
	
	public boolean updateSkill(Skill skill) {
		String sql = "UPDATE skills SET skill_name=?, category=?, description=? WHERE id=?";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1,  skill.getSkillName());
			ps.setString(2,  skill.getCategory());
			ps.setString(3,  skill.getDescription());
			ps.setInt(4,  skill.getId());
			
			int row = ps.executeUpdate();
			return row > 0;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	
	public boolean deleteSkill(int id) {
		String sql = "DELETE FROM skills WHERE id=?";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			int row = ps.executeUpdate();
			return row > 0;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int getTotalSkills() {
		int total = 0;
		String sql = "SELECT COUNT(*) FROM skills";
		
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
