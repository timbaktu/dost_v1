package com.dost.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbChatHistory;

@Repository("chatHistoryDAO")
public class ChatHistoryDAOImpl implements ChatHistoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Map<Long, List<DbChatHistory>> getAllChatHistory(int count) {
		Map<Long, List<DbChatHistory>> output = new HashMap<Long, List<DbChatHistory>>();
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbChatHistory ch order by ch.sentDate");
		List<DbChatHistory> chats = query.list();
		if(chats == null) {
			chats = new ArrayList<DbChatHistory>();
		}
		
		List<DbChatHistory> innerChat = null;
		int counter = 0;
		for(DbChatHistory chatHistory : chats) {
			// If there is no data in the map, then create new list and add data in it
			if(output.get(chatHistory.getConversationID()) == null) {
				// resetting counter here
				counter = 0;
				innerChat = new ArrayList<DbChatHistory>();
				output.put(chatHistory.getConversationID(), innerChat);
			}
			// Add till what is asked for...
			if(count >= counter) {
				innerChat.add(chatHistory);
			}
			counter++;
		}
		return output;
	}

	public List<DbChatHistory> getAllChatsById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbChatHistory ch where ch.conversationID = :id order by ch.sentDate");
		query.setParameter("id", id);
		List<DbChatHistory> chats = query.list();
		if(chats == null) {
			chats = new ArrayList<DbChatHistory>();
		}
		return chats;
	}
}
