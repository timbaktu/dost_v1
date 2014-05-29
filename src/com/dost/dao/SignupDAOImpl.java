package com.dost.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbUser;
import com.dost.hibernate.DbUserRole;
import com.dost.hibernate.SecurityRole;

@Repository("signupDAO")
public class SignupDAOImpl implements SignupDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void createUser(DbUser dbUser) {
		Session session = sessionFactory.getCurrentSession();
		DbUserRole dbUserRole = new DbUserRole();
		dbUserRole.setUsername(dbUser.getUsername());
		dbUserRole.setRole(SecurityRole.ROLE_USER.toString());
		
		session.saveOrUpdate(dbUser);
		session.saveOrUpdate(dbUserRole);
	}
}
