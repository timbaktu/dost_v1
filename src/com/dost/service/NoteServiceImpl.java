package com.dost.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dost.dao.NoteDAO;
import com.dost.hibernate.DbNote;

@Service("noteService")
@Transactional(propagation = Propagation.SUPPORTS)
public class NoteServiceImpl implements NoteService {

	@Autowired
	NoteDAO noteDAO;

	public List<DbNote> getAllNotesForMsgId(Long msgId) {
		return noteDAO.getAllNotesForMsgId(msgId);
	}

	public DbNote saveNote(DbNote note) {
		return noteDAO.saveNote(note);
		
	}
	
	
}
