package com.dost.dao;

public interface UserDAO {

	public void saveUser(String username, String password, String role);
	public boolean authenticateUser(String username, String password);
}
