package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dost.hibernate.DbFaq;
import com.dost.hibernate.DbUser;
import com.dost.service.FaqService;
import com.dost.service.UserService;

// Adding more comments
@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/conversations")  
	public ModelAndView showMessage() {
		return new ModelAndView("conversations"); 
	}
	
	@RequestMapping(value="/user/authenticate", method=RequestMethod.GET, produces = "application/json")  
	@ResponseBody
	public boolean authenticateUser(String username, String password) {
		return userService.authenticateUser(username, password);
	}
	
	@RequestMapping(value="/faq/add", method=RequestMethod.POST)  
	@ResponseBody
	public void addUser(DbUser user) {
		userService.saveUser(user.getUsername(), user.getPassword(), user.getUserRole()); 
	}
}
