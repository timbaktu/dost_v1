package com.dost.dao;

import com.dost.hibernate.Role;

public interface UserDAO {

	public void saveUser(String username, String password, String role);
	public Role authenticateUser(String username, String password);
}
