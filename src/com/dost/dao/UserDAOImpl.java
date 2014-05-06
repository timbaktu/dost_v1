package com.dost.dao;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbUser;

@Repository("userDao")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public boolean authenticateUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbUser u where u.username = :username and u.password = :password");
		query.setParameter("username", username);
		query.setParameter("password", password);
		
		DbUser user = (DbUser)query.uniqueResult();
		if(user == null) {
			return false;
		}
		return true;
	}

	public void saveUser(String username, String password, String userRole) {
		DbUser user = new DbUser();
		user.setUsername(username);
		user.setPassword(password);
		user.setUserRole(userRole);
		user.setCreateBy("system");
		user.setCreateDate(new Date());
		user.setUpdateBy("system");
		user.setUpdateDate(new Date());
		
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	
}
