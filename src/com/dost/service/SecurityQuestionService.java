package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbSecurityQuestion;

public interface SecurityQuestionService {

	public List<DbSecurityQuestion> getListOfSecurityQuestions();
}
