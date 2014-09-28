package com.dost.service;

import java.util.List;
import java.util.Map;

import com.dost.hibernate.DbChatHistory;

public interface ChatHistoryService {

	public Map<Long, List<DbChatHistory>> getAllChatHistory(int count);

	public List<DbChatHistory> getAllChatsById(Long id);
}
