package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.SecurityQuestionDAO;
import com.dost.hibernate.DbSecurityQuestion;

@Service("securityQuestionService")
@Transactional(propagation = Propagation.SUPPORTS)
public class SecurityQuestionServiceImpl implements SecurityQuestionService {

	@Autowired
	SecurityQuestionDAO securityQuestionDAO;
	
	public List<DbSecurityQuestion> getListOfSecurityQuestions() {
		return securityQuestionDAO.getListOfSecurityQuestions();
	}

	public DbSecurityQuestion getSecurityQuestionById(Long id) {
		return securityQuestionDAO.getSecurityQuestionById(id);
	}
	
	

}
