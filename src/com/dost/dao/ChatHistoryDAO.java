package com.dost.dao;

import java.util.List;
import java.util.Map;

import com.dost.hibernate.DbChatHistory;

public interface ChatHistoryDAO {
	Map<Long, List<DbChatHistory>> getAllChatHistory(int count);

	List<DbChatHistory> getAllChatsById(Long id);
}
