package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.ConversationNoteDAO;
import com.dost.hibernate.DbNote;

@Service("conversationNoteService")
@Transactional(propagation = Propagation.SUPPORTS)
public class ConversationNoteServiceImpl implements ConversationNoteService {

	@Autowired
	ConversationNoteDAO noteDAO;

	public List<DbNote> getAllNotesForMsgId(Long msgId) {
		return noteDAO.getAllNotesForMsgId(msgId);
	}

	public DbNote saveNote(DbNote note) {
		return noteDAO.saveNote(note);
		
	}
	
	
}
