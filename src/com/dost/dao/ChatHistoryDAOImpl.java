package com.dost.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.dost.hibernate.DbChatHistory;

@Repository("chatHistoryDAO")
public class ChatHistoryDAOImpl implements ChatHistoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<DbChatHistory> getAllChatHistory() {
		// TODO Auto-generated method stub
		return null;
	}

}
