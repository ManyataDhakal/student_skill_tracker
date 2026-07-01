package model;

public class AssignedSkill {
	
	private String studentName;
	private String skillName;
	private String category;
	private String proficiencyLevel;
	private int progress;
	
	public String getStudentName() {
		return studentName;
	}
	
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	
	public String getSkillName() {
		return skillName;
	}
	
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getProficiencyLevel() {
		return proficiencyLevel;
	}
	
	public void setProficiencyLevel(String proficiencyLevel) {
		this.proficiencyLevel = proficiencyLevel;
	}
	
	public int getProgress() {
		return progress;
	}
	
	public void setProgress(int progress) {
		this.progress = progress;
	}
}
