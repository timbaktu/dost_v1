package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbChatHistory;

public interface ChatHistoryService {

	public List<DbChatHistory> getAllChatHistory();
}
