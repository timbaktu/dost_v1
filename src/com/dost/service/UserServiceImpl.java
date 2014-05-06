package com.dost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.UserDAO;

@Service("userService")
@Transactional(propagation = Propagation.SUPPORTS)
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	public void saveUser(String username, String password, String role) {
		userDAO.saveUser(username, password, role);
	}

	public boolean authenticateUser(String username, String password) {
		return userDAO.authenticateUser(username, password);
	}

	
}
