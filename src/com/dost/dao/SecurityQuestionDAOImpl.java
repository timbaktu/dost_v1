package com.dost.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbSecurityQuestion;

@Repository("securityQuestionDAO")
public class SecurityQuestionDAOImpl implements SecurityQuestionDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<DbSecurityQuestion> getListOfSecurityQuestions() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbSecurityQuestion q");
		List<DbSecurityQuestion> questions = query.list();
		
		return questions;
	}

	public DbSecurityQuestion getSecurityQuestionById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbSecurityQuestion q where q.questionId = :id");
		query.setLong("id", id);
		
		DbSecurityQuestion question = (DbSecurityQuestion)query.uniqueResult();
		return question;
	}

}
