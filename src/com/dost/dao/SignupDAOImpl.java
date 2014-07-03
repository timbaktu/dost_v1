package com.dost.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbUser;

@Repository("signupDAO")
public class SignupDAOImpl implements SignupDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void createUser(DbUser dbUser) {
		Session session = sessionFactory.getCurrentSession();
		session.save(dbUser);
	}
}
