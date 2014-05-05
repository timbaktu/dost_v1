package com.dost.dao;

public interface UserDAO {

	public boolean authenticateUser(String username, String password);
}
