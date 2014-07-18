package com.dost.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbMessage;
import com.dost.hibernate.DbMessageRecipient;

@Repository("messageDAO")
public class MessageDAOImpl implements MessageDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public List<DbMessage> getAllUserMessagesById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from DbMessage m where m.msgId in (select mi.msgId from DbMessage mi where mi.sender.userId = ?)";
        Query query = session.createQuery(hql);
        query.setParameter(0, id);
        
        List<DbMessage> messages = query.list();
        if(messages == null) {
        	return new ArrayList<DbMessage>();
        }
        return messages;
	}

	public List<DbMessage> getMessagesById(Long id) {
		Session session = sessionFactory.getCurrentSession();
//		String hql = "from DbMessage m join fetch m.recipients r where r.recipient.userId = ? and m.deleted = 0 and r.deleted = 0";
		String hql = "from DbMessage m join fetch m.recipients r where m.msgId = ?";
        Query query = session.createQuery(hql);
        query.setParameter(0, id);
        
        List<DbMessage> messages = query.list();
        if(messages == null) {
        	return new ArrayList<DbMessage>();
        }
        return messages;		
	}
	
	public List<DbMessage> getUserMessages(Long userId) {
		Session session = sessionFactory.getCurrentSession();
//		String hql = "from DbMessage m join fetch m.recipients r where r.recipient.userId = ? and m.deleted = 0 and r.deleted = 0";
		String hql = "from DbMessage m join fetch m.recipients r where r.recipient.userId = ?";
        Query query = session.createQuery(hql);
        query.setParameter(0, userId);
        
        List<DbMessage> messages = query.list();
        if(messages == null) {
        	return new ArrayList<DbMessage>();
        }
        return messages;
	}

	public List<DbMessage> getDraftUserMessages(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<DbMessage> getSentUserMessages(Long userId) {
		Session session = sessionFactory.getCurrentSession();
//		String hql = "select m from DbMessage m left outer join fetch m.recipients r where m.sender.userId = ? and m.deleted = 0";
		String hql = "select m from DbMessage m left outer join fetch m.recipients r where m.sender.userId = ?";

        Query query = session.createQuery(hql);
        query.setParameter(0, userId);

        List<DbMessage> messages = (List<DbMessage>)query.list();
        if(messages == null) {
        	return new ArrayList<DbMessage>();
        }
        return messages;
	}

	public DbMessage getMessageDetails(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbMessage m where m.id = ?");
        query.setParameter(0, id);
        DbMessage dbMessage = (DbMessage) query.uniqueResult();
        return dbMessage;
	}

	public void setViewed(Long id, Long userId) {
		Session session = sessionFactory.getCurrentSession();
		DbMessage message = getMessageDetails(id);
		for (Iterator i = message.getRecipients().iterator(); i.hasNext();) {
			DbMessageRecipient recipient = (DbMessageRecipient) i.next();
			if(recipient.getRecipient().getUserId().longValue() == userId) {
				recipient.setViewed(1l);
				session.saveOrUpdate(recipient);
			}
		}
	}
	
	public void sendMessage(DbMessage dbMessage) {
		Session session = sessionFactory.getCurrentSession();
		
		//dbMessage.setSentDateDb(new Date(1));
		dbMessage.setSentDateDb(null);
//		List<DbMessageRecipient> recipients = dbMessage.getRecipients();
//		for(DbMessageRecipient recipient : recipients) {
//			//recipient.setMessage(dbMessage);
//			session.saveOrUpdate(recipient);
//		}
		session.save(dbMessage);
	}
	
	public Long getMaxMsgId() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select max(m.msgId) from DbMessage m ");
		return (Long)query.uniqueResult();
		
	}

	public Long getMsgCount(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from DbMessage m where m.msgId = :id");
		query.setParameter("id", id);
		return (Long)query.uniqueResult();		
	}
	
	public int getUnreadMessageCount(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select count(*) from DbMessageRecipient mr where mr.recipient.userId = :id and  mr.viewed = 0");
		query.setParameter("id", id);
		Long count = (Long)query.uniqueResult();
		return count.intValue();
	}
}
