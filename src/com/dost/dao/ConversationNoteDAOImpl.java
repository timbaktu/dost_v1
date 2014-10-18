package com.dost.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dost.hibernate.DbNote;

@Repository("noteDAO")
public class ConversationNoteDAOImpl implements ConversationNoteDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<DbNote> getAllNotesForMsgId(Long msgId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DbNote n where n.message.msgId = :msgId");
		query.setParameter("msgId", msgId);
		List<DbNote> notes = query.list();
		if(notes == null) {
			notes = new ArrayList<DbNote>();
		}
		return notes;
	}

	public DbNote saveNote(DbNote note) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(note);
		
		return note;
	}

}
