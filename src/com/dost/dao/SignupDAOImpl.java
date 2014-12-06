package com.dost.dao;

import org.hibernate.Query;
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
		
		// Create jforum users
		Query jforumUser = session.createSQLQuery("insert into jforum_users (user_id,username, user_password,user_email, user_regdate) values (?,?,'sso','sso@user', NOW())");
		jforumUser.setParameter(0, dbUser.getUserId());
		jforumUser.setParameter(1, dbUser.getUsername());
		jforumUser.executeUpdate();
		
		// Create jforum groups
		Query jforumgroup = session.createSQLQuery("insert into jforum_user_groups values (1,?)");
		jforumgroup.setParameter(0, dbUser.getUserId());
		jforumgroup.executeUpdate();
	}
}
