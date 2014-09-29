package com.dost.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.ChatHistoryDAO;
import com.dost.dao.UserDAO;
import com.dost.hibernate.DbChatHistory;
import com.dost.hibernate.DbUser;
import com.dost.model.UserChat;

@Service("chatHistoryService")
@Transactional(propagation = Propagation.SUPPORTS)
public class ChatHistoryServiceImpl implements ChatHistoryService {

	@Autowired
	ChatHistoryDAO chatHistoryDAO;
	
	@Autowired
	UserDAO userDAO;
	
	public Map<Long, List<DbChatHistory>> getAllChatHistory(int count) {
		return chatHistoryDAO.getAllChatHistory(count);
	}

	public List<DbChatHistory> getAllChatsById(Long id) {
		return chatHistoryDAO.getAllChatsById(id);
	}

	public List<UserChat> getUsersChatHistory() {
		List<String> usernames = chatHistoryDAO.getUsersHavingChatHistory();
		List<DbUser> users = new ArrayList<DbUser>();
		if(usernames != null && usernames.size() > 0) {
			users = userDAO.getUsersByUsernames(usernames);
		}
		List<UserChat> userChats = new ArrayList<UserChat>();
		for(DbUser user : users) {
			List<DbChatHistory> chats = chatHistoryDAO.getAllChatsByUser(user.getUsername());

			Map<Long, List<DbChatHistory>> output = new HashMap<Long, List<DbChatHistory>>();//userChat.getUserChats();
			List<DbChatHistory> innerChat = null;
			for(DbChatHistory chatHistory : chats) {
				

				// If there is no data in the map, then create new list and add data in it
				if(output.get(chatHistory.getConversationID()) == null) {
					innerChat = new ArrayList<DbChatHistory>();
					output.put(chatHistory.getConversationID(), innerChat);
				}
				innerChat.add(chatHistory);
			}
			
			// Now iterate over map to populate UserChat
			for(Map.Entry<Long, List<DbChatHistory>> entry : output.entrySet()) {
				UserChat userChat = new UserChat();
				userChat.setUser(user);
				userChat.setUserChats(entry.getValue());
				userChats.add(userChat);				
			}
		}
		return userChats;
	}

}
