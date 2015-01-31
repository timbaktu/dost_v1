package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbUser;
import com.dost.hibernate.Role;

public interface UserDAO {

	public void saveUser(String username, String password, String role);
	public Role authenticateUser(String username, String password);
	public DbUser getUser(Long userId);
	public List<DbUser> getAllUsers();
	public List<DbUser> getAllCounselors();
	public DbUser getUserByUsername(String username);
	public List<DbUser> getUsersByUsernames(List<String> usernames);
	public DbUser checkUserBySecurityQuestion(String username, String question1, String question2,	String answer1, String answer2);
	public DbUser updatePassword(String username, String password);
	public DbUser updateUser(DbUser dbUser);
	public boolean doesUserExists(String username);
}
