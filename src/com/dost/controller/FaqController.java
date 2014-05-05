package com.dost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqController {

	@RequestMapping("/talkToFriend")  
	public ModelAndView talkToFriend() {
		return new ModelAndView("talkToFriend"); 
	}
}
