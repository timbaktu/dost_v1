package com.dost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping("index")  
	public ModelAndView index() {
		return new ModelAndView("index"); 
	}

	@RequestMapping("user/includes/signUp")  
	public ModelAndView signUp() {
		return new ModelAndView("user/includes/signUp"); 
	}
	
	@RequestMapping("user/talkToFriend")  
	public ModelAndView talkToFriend() {
		return new ModelAndView("user/talkToFriend"); 
	}
	
	@RequestMapping("user/login")  
	public ModelAndView login() {
		return new ModelAndView("user/login"); 
	}
	
	@RequestMapping("signupNow")  
	public ModelAndView signupNow() {
		return new ModelAndView("signupNow"); 
	}
	
	@RequestMapping("user/discussionsAll")  
	public ModelAndView discussionsAll() {
		return new ModelAndView("user/discussionsAll"); 
	}
	@RequestMapping("user/discussionsDetails")  
	public ModelAndView discussionsDetails() {
		return new ModelAndView("user/discussionsDetails"); 
	}
	
	@RequestMapping("user/faqs")  
	public ModelAndView faqs() {
		return new ModelAndView("user/faqs"); 
	}
	
	@RequestMapping("user/popups")  
	public ModelAndView popups() {
		return new ModelAndView("user/popups"); 
	}
	
	@RequestMapping("counselor/login")  
	public ModelAndView counselor_login() {
		return new ModelAndView("counselor/login"); 
	}
	@RequestMapping("counselor/faqs")  
	public ModelAndView counselor_faqs() {
		return new ModelAndView("counselor/faqs"); 
	}
	@RequestMapping("counselor/conversations")  
	public ModelAndView counselor_conversations() {
		return new ModelAndView("counselor/conversations"); 
	}
	@RequestMapping("counselor/conversationsExpanded")  
	public ModelAndView counselor_conversationsExpanded() {
		return new ModelAndView("counselor/conversationsExpanded"); 
	}
	@RequestMapping("counselor/patientHistory")  
	public ModelAndView counselor_patientHistory() {
		return new ModelAndView("counselor/patientHistory"); 
	}
	@RequestMapping("counselor/onlineCounseling")  
	public ModelAndView counselor_onlineCounseling() {
		return new ModelAndView("counselor/onlineCounseling"); 
	}
	@RequestMapping("counselor/popups")  
	public ModelAndView counselor_popups() {
		return new ModelAndView("counselor/popups"); 
	}
}
