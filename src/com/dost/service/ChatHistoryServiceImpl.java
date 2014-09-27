package com.dost.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.ChatHistoryDAO;
import com.dost.hibernate.DbChatHistory;

@Service("chatHistoryService")
@Transactional(propagation = Propagation.SUPPORTS)
public class ChatHistoryServiceImpl implements ChatHistoryService {

	@Autowired
	ChatHistoryDAO chatHistoryDAO;
	
	public Map<Long, List<DbChatHistory>> getAllChatHistory(int count) {
		return chatHistoryDAO.getAllChatHistory(count);
	}

	public List<DbChatHistory> getAllChatsById(Long id) {
		return chatHistoryDAO.getAllChatsById(id);
	}

}
