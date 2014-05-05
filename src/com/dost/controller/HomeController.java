package com.dost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// Adding Comments
@Controller
public class HomeController {

	@RequestMapping("/index")  
	public ModelAndView index() {
		return new ModelAndView("index"); 
	}
	
	@RequestMapping("/talkToFriend")  
	public ModelAndView talkToFriend() {
		return new ModelAndView("talkToFriend"); 
	}
	
	@RequestMapping("/login")  
	public ModelAndView login() {
		return new ModelAndView("login"); 
	}
	
	@RequestMapping("/signupNow")  
	public ModelAndView signupNow() {
		return new ModelAndView("signupNow"); 
	}
	
	@RequestMapping("/discussionsAll")  
	public ModelAndView discussionsAll() {
		return new ModelAndView("discussionsAll"); 
	}
}
