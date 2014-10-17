package com.dost.dao;

import java.util.List;

import com.dost.hibernate.DbNote;

public interface NoteDAO {

	public List<DbNote> getAllNotesForMsgId(Long msgId);
	public DbNote saveNote(DbNote note);
}
