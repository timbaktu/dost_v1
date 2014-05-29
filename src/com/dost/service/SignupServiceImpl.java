package com.dost.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.SignupDAO;
import com.dost.hibernate.DbUser;

@Service("signupService")
@Transactional(propagation = Propagation.SUPPORTS)
public class SignupServiceImpl implements SignupService {

	@Autowired
	SignupDAO signupDAO;
	
	public void signupUser(DbUser user) {
		signupDAO.createUser(user);
	}
}
