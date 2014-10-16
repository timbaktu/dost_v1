package com.dost.service;

import java.util.List;
import java.util.Map;

import com.dost.hibernate.DbChatHistory;
import com.dost.model.UserChat;

public interface ChatHistoryService {

	public Map<Long, List<DbChatHistory>> getAllChatHistory(int count);

	public List<DbChatHistory> getAllChatsById(Long id);

	public List<UserChat> getUsersChatHistory();
	
	public Map<Long, UserChat> getUsersChatHistoryByUserId(Long userId);
	
	public Long getMaxMsgId();
}
