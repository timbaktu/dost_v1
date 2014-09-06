package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbSecurityQuestion;
import com.dost.service.SecurityQuestionService;

@Controller
@RequestMapping("api")
public class SecurityQuestionController {

	@Autowired
	SecurityQuestionService securityQuestionService;
	
	@RequestMapping(value="/securityquestions/all", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbSecurityQuestion> getAllSecurityQuestions() {
		return securityQuestionService.getListOfSecurityQuestions();
	}
	
	@RequestMapping(value="/securityquestions/{id}", method=RequestMethod.GET)  
	@ResponseBody
	public DbSecurityQuestion getSecurityQuestionById(@PathVariable Long id) {
		return securityQuestionService.getSecurityQuestionById(id);
	}
}
