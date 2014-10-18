package com.dost.model;

import com.dost.hibernate.DbChatHistory;

public class ChatHistoryPopulator {

	public static ChatHistory populateChatHistory(DbChatHistory dbChatHistory) {
		ChatHistory chatHistory = new ChatHistory();
		chatHistory.setConversationID(dbChatHistory.getConversationID());
		chatHistory.setFromJIDResource(dbChatHistory.getFromJIDResource());
		chatHistory.setToJIDResource(dbChatHistory.getToJIDResource());
		chatHistory.setToJID(dbChatHistory.getToJID());
		chatHistory.setSentDate(dbChatHistory.getSentDate());
		chatHistory.setBody(dbChatHistory.getBody());
		
		return chatHistory;
	}
}
