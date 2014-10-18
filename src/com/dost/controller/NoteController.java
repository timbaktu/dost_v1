package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbMessage;
import com.dost.hibernate.DbNote;
import com.dost.hibernate.DbUser;
import com.dost.model.Note;
import com.dost.service.MessageService;
import com.dost.service.NoteService;
import com.dost.service.UserService;

@Controller
@RequestMapping("api")
public class NoteController {

	@Autowired
	NoteService noteService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MessageService messageService;

	@RequestMapping(value="/msgId/{msgId}/notes/all", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbNote> getAllNotes(@PathVariable Long msgId) {
		List<DbNote> notes = noteService.getAllNotesForMsgId(msgId);
		return notes;
	}
	
	@RequestMapping(value="/notes/add", method=RequestMethod.POST)  
	@ResponseBody
	public DbNote addNote(Note note) {
		DbNote dbnote = new DbNote();
		populateDbNote(dbnote, note);
		return noteService.saveNote(dbnote);
	}
	
	private void populateDbNote(DbNote dbnote, Note note) {
		if(note != null) {
			dbnote.setNoteId(note.getNoteId());
		}
		DbUser user = new DbUser();
		user.setUserId(note.getUserId());
		dbnote.setUser(userService.getUser(note.getUserId()));
		
		DbMessage message = new DbMessage();
		message.setMessageId(note.getMessageId());
		dbnote.setMessage(message);
	}
}
