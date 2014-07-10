package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbMessage;

public interface MessageService {

	public List<DbMessage> getAllUserMessages(Long id);
	
	public List<DbMessage> getMessagesById(Long id);
	
	public List<DbMessage> getUserMessages(Long id);

	public List<DbMessage> getDraftUserMessages(Long id);

	public List<DbMessage> getSentUserMessages(Long id);

	public DbMessage getMessageDetails(Long id);

	public void setViewed(Long id, Long userId);
	
	public void sendMessage(DbMessage dbMessage);
	
	public Long getMaxMsgId();

	public Long getMsgCount(Long id);

}
