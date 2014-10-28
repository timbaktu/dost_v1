package com.dost.service;

import java.util.List;

import com.dost.hibernate.DbNote;

public interface ConversationNoteService {

	public List<DbNote> getAllNotesForMsgId(Long msgId);
	public List<DbNote> getAllNotesForUserId(Long userId);
	public DbNote saveNote(DbNote note);
}
