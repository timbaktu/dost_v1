package com.dost.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbMessage;

@Controller
@RequestMapping("api")
public class MessageController {

	
	@RequestMapping(value="/user/{id}/messages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getAllUserMessages() {
		return null;
	}
	
	@RequestMapping(value="/user/{id}/draftmessages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getDraftUserMessages() {
		return null;
	}
	
	@RequestMapping(value="/user/message", method=RequestMethod.POST)  
	@ResponseBody
	public void sendMessage(DbMessage dbMessage) {

	}
}
