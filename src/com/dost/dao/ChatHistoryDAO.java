package com.dost.dao;

import java.util.List;
import java.util.Map;

import com.dost.hibernate.DbChatHistory;

public interface ChatHistoryDAO {
	Map<Long, List<DbChatHistory>> getAllChatHistory(int count);

	List<DbChatHistory> getAllChatsById(Long id);
	
	List<DbChatHistory> getAllChatsByUser(String username);
	
	Map<String, List<Long>> getConversationIdsByUserName(List<String> usernames);

	List<String> getUsersHavingChatHistory();
	
	
}
