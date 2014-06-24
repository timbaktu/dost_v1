package com.dost.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

	public DbUser getUser(Long userId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbUser u where u.userId = :id");
		query.setParameter("id", userId);
		
		DbUser user = (DbUser)query.uniqueResult();
		if(user == null){
			user = new DbUser();
		}
		return user;
	}

	public List<DbUser> getAllUsers() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbUser u where u.dbUserRole.role = 'ROLE_USER'");
		List<DbUser> users = query.list();
		if(users == null) {
			users = new ArrayList<DbUser>();
		}
		return users;
	}

	public DbUser getUserByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbUser u where u.username = :username");
		query.setParameter("username", username);
		DbUser user = (DbUser)query.uniqueResult();
		return user;
	}
	
	
	
}
