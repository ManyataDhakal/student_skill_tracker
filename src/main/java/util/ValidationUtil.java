package util;

import java.util.regex.Pattern;

public class ValidationUtil {
	
	//Check if a string is null or empty
	public static boolean isEmpty(String value) {
		return value == null || value.trim().isEmpty();
	}
	
	// Validate email format
	public static boolean isValidEmail(String email) {
		if (isEmpty(email)) {
			return false;
		}
		
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
		return Pattern.matches(emailRegex, email);
	}
	
	// Validate password strength (minimum 8 characters)
	public static boolean isStrongPassword(String password) {
		return password != null && password.length() >= 8;
	}
	
	// Validate skill name
	public static boolean isValidSkillName(String skillName) {
		return !isEmpty(skillName) && skillName.length() <= 100;
	}
	
	// Validate category
	public static boolean isValidCategory(String category) {
		return !isEmpty(category) && category.length() <= 50;
	}
	
	// Validate description
	public static boolean isValidDescription(String description) {
		return !isEmpty(description) && description.length() <= 500;
	}
	
	// Validate positive progress (0-100)
	public static boolean isValidProgress(int progress) {
		return progress >= 0 && progress <= 100;
	}
	}
