package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbMessage;
import com.dost.service.MessageService;

@Controller
@RequestMapping("api")
public class MessageController {

	@Autowired
	MessageService messageService;
	
	@RequestMapping(value="/user/{id}/messages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getAllUserMessages(@PathVariable Long id) {
		return messageService.getUserMessages(id);
	}
	
	@RequestMapping(value="/user/{id}/draftmessages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getDraftUserMessages(@PathVariable Long id) {
		return messageService.getDraftUserMessages(id);
	}
	
	@RequestMapping(value="/user/{id}/sentmessages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getSentUserMessages(@PathVariable Long id) {
		return messageService.getSentUserMessages(id);
	}
	
	@RequestMapping(value="/message/{id}/details", method=RequestMethod.GET)  
	@ResponseBody
	public DbMessage getMessageDetails(@PathVariable Long id) {
		return messageService.getMessageDetails(id);
	}
	
	@RequestMapping(value="/message/{id}/user/{userid}/setview", method=RequestMethod.GET)  
	@ResponseBody
	public void setViewed(@PathVariable Long id, @PathVariable Long userId) {
		messageService.setViewed(id, userId);
	}
	
	@RequestMapping(value="/user/message", method=RequestMethod.POST)  
	@ResponseBody
	public void sendMessage(DbMessage dbMessage) {

	}
}
