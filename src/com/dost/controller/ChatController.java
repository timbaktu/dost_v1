package com.dost.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbChatHistory;
import com.dost.model.UserChat;
import com.dost.service.ChatHistoryService;

@Controller
@RequestMapping("api")
public class ChatController {

	@Autowired
	ChatHistoryService chatHistoryService;
	
	@RequestMapping(value="/chathistory/all", method=RequestMethod.GET)  
	@ResponseBody
	public Map<Long, List<DbChatHistory>> getAllChatHistory() {
		Map<Long, List<DbChatHistory>> chats = chatHistoryService.getAllChatHistory(3);
		return chats;
	}
	
	@RequestMapping(value="/chathistory/{id}", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbChatHistory> getChatHistoryById(@PathVariable Long id) {
		return chatHistoryService.getAllChatsById(id);
	}
	
	@RequestMapping(value="/chathistory/users", method=RequestMethod.GET)  
	@ResponseBody
	public List<UserChat> getUsersHavingChatHistory() {
		return chatHistoryService.getUsersChatHistory();
	}
	
	@RequestMapping(value="/chathistory/user/{id}", method=RequestMethod.GET)  
	@ResponseBody
	public Map<Long, UserChat> getChatHistoryByUserId(@PathVariable Long id) {
		Map<Long, UserChat> userChatMap = chatHistoryService.getUsersChatHistoryByUserId(id);
		return userChatMap;
	}
	
}
