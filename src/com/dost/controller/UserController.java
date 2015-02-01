package com.dost.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbUser;
import com.dost.model.User;
import com.dost.model.UserPopulator;
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
	
	@RequestMapping(value="/userdetail/add", method=RequestMethod.POST)  
	@ResponseBody
	public User addUserDetail(User user) {
		DbUser dbUser = userService.getUser(user.getUserId());
		dbUser.setFname(user.getFname());
		dbUser.setLname(user.getLname());
		dbUser.setHostel(user.getHostel());
		dbUser.setYear(user.getYear());
		dbUser.setBranch(user.getBranch());
		
		dbUser = userService.updateUser(dbUser);
		User userToReturn = new User();
		UserPopulator.populateUser(userToReturn, dbUser);
		return userToReturn;
	}
	
	@RequestMapping(value="user/{userId}/userdetail", method=RequestMethod.GET)  
	@ResponseBody
	public User getUserDetail(@PathVariable String userId) {
		DbUser dbUser = userService.getUser(Long.parseLong(userId));
		User userToReturn = new User();
		UserPopulator.populateUser(userToReturn, dbUser);
		return userToReturn;
	}
	
	@RequestMapping(value="user/{username}/exists", method=RequestMethod.GET)  
	@ResponseBody
	public Map<String, String> checkIfUserExists(@PathVariable String username) {
		Map<String, String> response = new HashMap<String, String>();
		boolean exists = userService.doesUserExists(username);
		response.put("userexists", exists+"");
		
		return response;
	}
}
