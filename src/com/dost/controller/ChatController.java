package com.dost.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbFaq;
import com.dost.service.ChatHistoryService;

@Controller
@RequestMapping("api")
public class ChatController {

	@Autowired
	ChatHistoryService chatHistoryService;
	
//	@RequestMapping(value="/chathistory/{id}", method=RequestMethod.GET)  
//	@ResponseBody
//	public DbFaq getFaqById(@PathVariable Long id) {
//		try {
//			System.out.println(new ObjectMapper().writeValueAsString(faqService.getFaqById(id).getCategory()));
//		}
//		catch (Exception e) {
//					e.printStackTrace();
//		}
//		return faqService.getFaqById(id); 
//	}
}
