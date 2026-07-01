package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Report;
import util.DBConnection;

public class ReportDAO {
	
	public Report getReportData() {

		Report report = new Report();
		
		try {
			Connection conn = DBConnection.getConnection();
			
			// Total students
			String studentSql = "SELECT COUNT(*) AS total FROM users WHERE role = 'student'";
			PreparedStatement ps1 = conn.prepareStatement(studentSql);
			ResultSet rs1 = ps1.executeQuery();
			
			if (rs1.next()) {
				report.setTotalStudents(rs1.getInt("total"));
			}
			
			// Total Skills
			String skillSql = "SELECT COUNT(*) AS total FROM skills";
			PreparedStatement ps2 = conn.prepareStatement(skillSql);
			ResultSet rs2 = ps2.executeQuery();
			
			if (rs2.next()) {
				report.setTotalSkills(rs2.getInt("total"));
			}
			
			// Total assigned skills
			String assignedSql = "SELECT COUNT(*) AS total FROM student_skills";
			PreparedStatement ps3 = conn.prepareStatement(assignedSql);
			ResultSet rs3 = ps3.executeQuery();
			
			if (rs3.next()) {
				report.setTotalAssignedSkills(rs3.getInt("total"));
			}
			
			// Total categories
			String categorySql = "SELECT COUNT(DISTINCT category) AS total FROM skills";
			PreparedStatement ps4 = conn.prepareStatement(categorySql);
			ResultSet rs4 = ps4.executeQuery();
			
			if (rs4.next()) {
				report.setTotalCategories(rs4.getInt("total"));
			}
			
			// Average progress
			String progressSql = "SELECT AVG(progress) AS average_progress FROM student_skills";
			PreparedStatement ps5 = conn.prepareStatement(progressSql);
			ResultSet rs5 = ps5.executeQuery();
			
			if (rs5.next()) {
				report.setAverageProgress(rs5.getDouble("average_progress"));
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		return report;
	}
}
