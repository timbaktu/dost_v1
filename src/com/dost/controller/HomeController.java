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
	
	@RequestMapping("horoscope")  
	public ModelAndView horoscope() {
		return new ModelAndView("horoscope"); 
	}
	
	@RequestMapping("conversations")  
	public ModelAndView conversations() {
		return new ModelAndView("conversations"); 
	}
	
	@RequestMapping("faqs")  
	public ModelAndView faqs_main() {
		return new ModelAndView("faqs"); 
	}
	
	
	@RequestMapping("user/includes/signUp")  
	public ModelAndView signUp() {
		return new ModelAndView("user/includes/signUp"); 
	}
	
	@RequestMapping("talkToFriend")  
	public ModelAndView talkToFriend() {
		return new ModelAndView("talkToFriend"); 
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
	@RequestMapping("conversationsExpanded")  
	public ModelAndView counselor_conversationsExpanded() {
		return new ModelAndView("conversationsExpanded"); 
	}
	@RequestMapping("patientList")  
	public ModelAndView counselor_patientList() {
		return new ModelAndView("patientList"); 
	}
	@RequestMapping("patientDetails")  
	public ModelAndView patientDetails() {
		return new ModelAndView("patientDetails"); 
	}
	@RequestMapping("onlineCounseling")  
	public ModelAndView counselor_onlineCounseling() {
		return new ModelAndView("onlineCounseling"); 
	}
	@RequestMapping("counselor/popups")  
	public ModelAndView counselor_popups() {
		return new ModelAndView("counselor/popups"); 
	}
}
