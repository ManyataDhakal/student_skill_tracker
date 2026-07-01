package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import util.DBConnection;

public class CategoryDAO {
	
	public List<Category> getAllCategories() {
		
		List<Category> list = new ArrayList<>();
		
		String sql = "SELECT category, COUNT(*) AS total_skills " +
		             "FROM skills " +
				     "GROUP BY category " +
		             "ORDER BY category";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				
				Category category = new Category();
				
				category.setCategoryName(rs.getString("category"));
				category.setTotalSkills(rs.getInt("total_skills"));
				
				list.add(category);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getTotalCategories() {
		
		int total = 0;
		String sql = "SELECT COUNT(DISTINCT category) FROM skills";
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}

}
