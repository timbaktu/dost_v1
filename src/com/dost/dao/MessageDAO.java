package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbMessage;

public interface MessageDAO {

	List<DbMessage> getAllUserMessagesById(Long id);
	
	List<DbMessage> getMessagesById(Long id);
	
	List<DbMessage> getUserMessages(Long userId);

	List<DbMessage> getDraftUserMessages(Long userId);

	List<DbMessage> getSentUserMessages(Long userId);

	DbMessage getMessageDetails(Long id);

	void setViewed(Long id, Long userId);
	
	public void sendMessage(DbMessage dbMessage);
	
	public Long getMaxMsgId();
	
	public Long getMsgCount(Long id);

}
