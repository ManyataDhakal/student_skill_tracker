package model;

public class StudentSkill {
	private int id;
	private String skillName;
	private String category;
	private String proficiencyLevel;
	private int progress;
	
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
		this.category= category;
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
