package com.dost.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dost.hibernate.DbUser;

public class UserChat {

	private Long conversationId;
//	private String username;
	private DbUser user;
	Map<Long, List<ChatHistory>> userChatsMap = new HashMap<Long, List<ChatHistory>>();
	List<ChatHistory> userChats = new ArrayList<ChatHistory>();
	private String note; // Spark IM supports only 1 notes for a chat session. It allows you to put multiple notes but they are all stored in one column as single entry
	
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

	public Map<Long, List<ChatHistory>> getUserChatsMap() {
		return userChatsMap;
	}
	public void setUserChatsMap(Map<Long, List<ChatHistory>> userChatsMap) {
		this.userChatsMap = userChatsMap;
	}
	public List<ChatHistory> getUserChats() {
		return userChats;
	}
	public void setUserChats(List<ChatHistory> userChats) {
		this.userChats = userChats;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	
}
