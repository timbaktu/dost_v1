package com.dost.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dost.hibernate.DbUser;
import com.dost.hibernate.DbUserRole;
import com.dost.model.User;
import com.dost.service.SignupService;
import com.dost.service.UserService;

@Controller
@RequestMapping("api")
public class SignupController {

	@Autowired
	SignupService signupService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/su/{id}", method=RequestMethod.GET)  
	@ResponseBody
	public void signup1(@PathVariable Long id) {
		System.out.println("test id : " + id);

	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)  
	public ModelAndView signup(User user) {
		Map<String, Boolean> output = new HashMap<String, Boolean>();
		if(user.getUsername() == null) {
			output.put("status", false);
			return new ModelAndView(""); 
		}
		DbUser existingUser = userService.getUserByUsername(user.getUsername());
		// User does not exists
		if(existingUser == null) {
			DbUser newUser = populateDbUser(user);	
			signupService.signupUser(newUser);
			output.put("status", true);
			return new ModelAndView("index"); 
		}
		// User already exists with same username
		else {
			output.put("status", false);
			return new ModelAndView(""); 
		}
	}

	private DbUser populateDbUser(User user) {
		DbUser dbUser = new DbUser();
		dbUser.setUsername(user.getUsername());
		dbUser.setPassword(user.getPassword());
		dbUser.setDeleted("0");
		dbUser.setEnabled(1);
		dbUser.setAvatar(user.getAvatarId());
		
		DbUserRole userRole = new DbUserRole();
		userRole.setUsername(user.getUsername());
		userRole.setRole("ROLE_USER");
		userRole.setDbUser(dbUser);
		
		dbUser.setDbUserRole(userRole);
		return dbUser;
	}
}
