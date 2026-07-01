package util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtil {
	
	// Hash password before saving to database
	public static String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}
	
	// Verify entered password against stored hash
	public static boolean checkPassword(String password, String hashedPassword) {
		return BCrypt.checkpw(password, hashedPassword);
	}
}
