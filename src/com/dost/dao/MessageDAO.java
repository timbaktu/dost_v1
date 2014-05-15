package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbMessage;

public interface MessageDAO {

	List<DbMessage> getUserMessages(Long userId);

	List<DbMessage> getDraftUserMessages(Long userId);

	List<DbMessage> getSentUserMessages(Long userId);

	DbMessage getMessageDetails(Long id);

	void setViewed(Long id, Long userId);

}
