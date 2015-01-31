package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbUser;
import com.dost.hibernate.Role;

public interface UserService {

	public void saveUser(String username, String password, String role);
	public Role authenticateUser(String username, String password);
	
	public DbUser getUser(Long userId);
	
	public List<DbUser> getAllUsers();
	
	public List<DbUser> getAllCounselors();
	
	public DbUser getUserByUsername(String username);
	
	public DbUser checkUserBySecurityQuestion(String username, String question1, String question2, String answer1, String answer2);
	public DbUser updatePassword(String username, String password);
	
	public DbUser updateUser(DbUser dbUser);
	
	public boolean doesUserExists(String username);
}
