package com.dost.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbChatHistory;
import com.dost.hibernate.DbUser;

@Repository("chatHistoryDAO")
public class ChatHistoryDAOImpl implements ChatHistoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	UserDAO userDAO;
	
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

	public List<String> getUsersHavingChatHistory() {
		Session session = sessionFactory.getCurrentSession();
		// Take only those users who are not counselors. We donot want to show counselors in patient history..Counselors are not patients.
		Query query = session.createQuery("select username from DbUserRole ur where ur.username in (select toJIDResource from DbChatHistory ch) and role = 'ROLE_USER'");
		List<String> chats = query.list();
		if(chats == null) {
			chats = new ArrayList<String>();
		}
		return chats;
	}

	public List<DbChatHistory> getAllChatsByUser(String username) {
		Session session = sessionFactory.getCurrentSession();
		List<DbUser> counselors = userDAO.getAllCounselors();
		// Adding counselors to list
		List<String> usernames = new ArrayList<String>();
		for(DbUser user : counselors) {
			//usernames.add(user.getUsername());
		}
		// Adding current user to list
		usernames.add(username);
		Query query = session.createQuery("select ch.conversationID, ch.body from DbChatHistory ch where ch.toJIDResource in (:usernames) order by ch.sentDate");
		query.setParameterList("usernames", usernames);
		List<DbChatHistory> chats = query.list();
		if(chats == null) {
			chats = new ArrayList<DbChatHistory>();
		}
		return chats;
	}

	public Map<String, List<Long>> getConversationIdsByUserName(List<String> usernames) {
		Map<String, List<Long>> usernameConversationMap = new HashMap<String, List<Long>>();
		Session session = sessionFactory.getCurrentSession();
		// Take only those users who are not counselors. We do not want to show counselors in patient history..Counselors are not patients.
		Query query = session.createQuery("from DbChatHistory ch where toJIDResource in (:usernames)");
		query.setParameterList("usernames", usernames);
		
		List<DbChatHistory> chats = query.list();
		for(DbChatHistory chatHistory : chats) {
			List<Long> ids = usernameConversationMap.get(chatHistory.getToJIDResource());
			if(ids == null) {
				ids = new ArrayList<Long>();
				usernameConversationMap.put(chatHistory.getToJIDResource(), ids);
			}
			ids.add(chatHistory.getConversationID());
		}
		return usernameConversationMap;
	}
	
	public Long getMaxMsgId() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select max(ch.conversationID) from DbChatHistory ch ");
		return (Long)query.uniqueResult();
		
	}

	public String getNoteBySessionId(String sessionId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createSQLQuery("select notes from fpSession where sessionID = :sessionid").addScalar("notes", Hibernate.STRING);
		query.setParameter("sessionid", sessionId);
		String note = (String)query.uniqueResult();
		if(note == null) {
			note = "";
		}
		return note;
	}
	
	
}
