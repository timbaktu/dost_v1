package com.dost.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// Adding more comments
@Controller
public class LoginController {

	@RequestMapping("/conversations")  
	public ModelAndView showMessage() {
		return new ModelAndView("conversations"); 
	}
}
