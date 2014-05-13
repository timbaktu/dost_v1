package com.dost.dao;

import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbUser;
import com.dost.hibernate.Role;

@Repository("userDao")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Role authenticateUser(String username, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbUser u where u.username = :username and u.password = :password");
		query.setParameter("username", username);
		query.setParameter("password", password);
		
		Role outputRole = Role.UNAUTHORIZED;
		DbUser retUser = (DbUser)query.uniqueResult();
		if(retUser != null) {
			outputRole = Role.valueOf(retUser.getUserRole().toString());
		}
		return outputRole;
	}

	public void saveUser(String username, String password, String userRole) {
		DbUser user = new DbUser();
		user.setUsername(username);
		user.setPassword(password);
		user.setUserRole(Role.valueOf(userRole));
		user.setCreateBy("system");
		user.setCreateDate(new Date());
		user.setUpdateBy("system");
		user.setUpdateDate(new Date());
		
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	
}
