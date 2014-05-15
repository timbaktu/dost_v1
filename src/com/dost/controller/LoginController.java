package com.dost.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dost.hibernate.DbUser;
import com.dost.hibernate.Role;
import com.dost.service.UserService;

// Adding more comments
@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("user/conversations")  
	public ModelAndView showMessage() {
		return new ModelAndView("user/conversations"); 
	}
	
	@RequestMapping(value="/authenticate")  
	public ModelAndView authenticateUser(DbUser user) {
		Role role = userService.authenticateUser(user.getUsername(), user.getPassword());
		if(role == Role.USER) {
			return new ModelAndView("user/conversations");	
		}
		else if(role == Role.COUNSELOR) {
			return new ModelAndView("counselor/conversations");	
		}
		else {
			return new ModelAndView("unauthorized");	
		}
	}
	
	@RequestMapping(value="/faq/add", method=RequestMethod.POST)  
	@ResponseBody
	public void addUser(DbUser user) {
		userService.saveUser(user.getUsername(), user.getPassword(), user.getUserRole().toString()); 
	}
}
