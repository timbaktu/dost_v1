package com.dost.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dost.hibernate.DbChatHistory;
import com.dost.hibernate.DbUser;

public class UserChat {

	private Long conversationId;
//	private String username;
	private DbUser user;
//	Map<Long, List<DbChatHistory>> userChats = new HashMap<Long, List<DbChatHistory>>();
	List<DbChatHistory> userChats = new ArrayList<DbChatHistory>();
	
	public Long getConversationId() {
		return conversationId;
	}
	public void setConversationId(Long conversationId) {
		this.conversationId = conversationId;
	}

	public DbUser getUser() {
		return user;
	}
	public void setUser(DbUser user) {
		this.user = user;
	}
//	public Map<Long, List<DbChatHistory>> getUserChats() {
//		return userChats;
//	}
//	public void setUserChats(Map<Long, List<DbChatHistory>> userChats) {
//		this.userChats = userChats;
//	}
	public List<DbChatHistory> getUserChats() {
		return userChats;
	}
	public void setUserChats(List<DbChatHistory> userChats) {
		this.userChats = userChats;
	}
	
	
}
