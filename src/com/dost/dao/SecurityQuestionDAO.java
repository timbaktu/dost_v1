package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbSecurityQuestion;

public interface SecurityQuestionDAO {

	public List<DbSecurityQuestion> getListOfSecurityQuestions();

	public DbSecurityQuestion getSecurityQuestionById(Long id);
}
