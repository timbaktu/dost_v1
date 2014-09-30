package com.dost.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
		Map<String, List<Long>> conversationIdsByUser = chatHistoryDAO.getConversationIdsByUserName(usernames);
//		for(Map.Entry<String, List<Long>> map : conversationIdsByUser.entrySet()) {
//			
//		}
		for(DbUser user : users) {
			List<Long> conversationIdsForUserList = conversationIdsByUser.get(user.getUsername());
		    Collections.sort(conversationIdsForUserList, new Comparator<Long>() {
		          public int compare(Long o1, Long o2) {
		                  return o1==null?Integer.MAX_VALUE:o2==null?Integer.MIN_VALUE:o2.compareTo(o1);

		        }
		    });
		    Collections.reverse(conversationIdsForUserList);
		    
			UserChat userChat = new UserChat();
			userChat.setUser(user);
			List<DbChatHistory> chatsByConversation = chatHistoryDAO.getAllChatsById(conversationIdsForUserList.get(0)); // Get chats based on recent id
			List<DbChatHistory> chatToShowOnUI = new ArrayList<DbChatHistory>();
			for(DbChatHistory chatHistory : chatsByConversation) {
				chatToShowOnUI.add(chatHistory);
			}
			
			userChat.setUserChats(chatToShowOnUI);	// adding only 2 lines of chat. This is only what we show on UI
//			userChat.setUserChatsMap(output);
			userChats.add(userChat);			
		}
		return userChats;
	}

}
