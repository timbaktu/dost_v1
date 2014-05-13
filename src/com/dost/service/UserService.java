package com.dost.service;

import com.dost.hibernate.Role;

public interface UserService {

	public void saveUser(String username, String password, String role);
	public Role authenticateUser(String username, String password);
}
