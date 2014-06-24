package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbUser;
import com.dost.service.UserService;

@Controller
@RequestMapping("api")
public class UserController {

	@Autowired
	UserService userService;
	
	/*messages received*/
	@RequestMapping(value="/users", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbUser> getAllUsers() {
		return userService.getAllUsers();
	}
	
	@RequestMapping(value="/user/{username}", method=RequestMethod.GET)  
	@ResponseBody
	public DbUser getUserByUsername(@PathVariable String username) {
		return userService.getUserByUsername(username);
	}
}
