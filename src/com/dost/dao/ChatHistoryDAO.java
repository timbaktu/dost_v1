package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbChatHistory;

public interface ChatHistoryDAO {
	List<DbChatHistory> getAllChatHistory();
}
