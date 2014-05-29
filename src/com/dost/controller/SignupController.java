package com.dost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dost.hibernate.DbUser;
import com.dost.service.SignupService;

@Controller
@RequestMapping("api")
public class SignupController {

	@Autowired
	SignupService signupService;
	
	@RequestMapping(value="/user/authenticate")  
	public ModelAndView signup(DbUser user) {
		signupService.signupUser(user);
		ModelAndView model = new ModelAndView();
		model.setViewName("login");
		return model;

	}
}
