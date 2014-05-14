package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.MessageDAO;
import com.dost.hibernate.DbMessage;

@Service("messageService")
@Transactional(propagation = Propagation.SUPPORTS)
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageDAO messageDAO;

	public List<DbMessage> getUserMessages(Long userId) {
		return messageDAO.getUserMessages(userId);
	}

	public List<DbMessage> getDraftUserMessages(Long userId) {
		return messageDAO.getDraftUserMessages(userId);
	}

	public List<DbMessage> getSentUserMessages(Long userId) {
		return messageDAO.getSentUserMessages(userId);
	}

	public DbMessage getMessageDetails(Long id) {
		return messageDAO.getMessageDetails(id);
	}

	public void setViewed(Long id, Long userId) {
		messageDAO.setViewed(id, userId);
	}
	
	
}
