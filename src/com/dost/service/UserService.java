package com.dost.service;

public interface UserService {

	public void saveUser(String username, String password, String role);
	public boolean authenticateUser(String username, String password);
}
