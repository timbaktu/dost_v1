package com.dost.controller;

import java.util.ArrayList;
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
import com.dost.model.ConversationNote;
import com.dost.service.ConversationNoteService;
import com.dost.service.MessageService;
import com.dost.service.UserService;

@Controller
@RequestMapping("api")
public class ConversationNoteController {

	@Autowired
	ConversationNoteService noteService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MessageService messageService;

	/**
	 * msgid path param is the msgId and not the messageId
	 * @param msgId
	 * @return
	 */
	@RequestMapping(value="/msgId/{msgId}/notes/all", method=RequestMethod.GET)  
	@ResponseBody
	public List<ConversationNote> getAllNotes(@PathVariable Long msgId) {
		List<DbNote> notes = noteService.getAllNotesForMsgId(msgId);
		List<ConversationNote> outputNotes = new ArrayList<ConversationNote>();
		for(DbNote dbnote : notes) {
			ConversationNote note = new ConversationNote();
			populateNote(dbnote, note);
			outputNotes.add(note);
		}
		return outputNotes;
	}
	
	/**
	 * Get all notes by userId
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/user/{userId}/notes/all", method=RequestMethod.GET)  
	@ResponseBody
	public List<ConversationNote> getAllNotesByUser(@PathVariable Long userId) {
		List<DbNote> notes = noteService.getAllNotesForUserId(userId);
		List<ConversationNote> outputNotes = new ArrayList<ConversationNote>();
		for(DbNote dbnote : notes) {
			ConversationNote note = new ConversationNote();
			populateNote(dbnote, note);
			outputNotes.add(note);
		}
		return outputNotes;
	}
	
	/**
	 * MessageId in ConversationNote is messageId and not msgId
	 * @param note
	 * @return
	 */
	@RequestMapping(value="/notes/add", method=RequestMethod.POST)  
	@ResponseBody
	public DbNote addNote(ConversationNote note) {
		DbNote dbnote = new DbNote();
		populateDbNote(dbnote, note);
		return noteService.saveNote(dbnote);
	}
	
	private void populateDbNote(DbNote dbnote, ConversationNote note) {
		if(note != null) {
			dbnote.setNoteId(note.getNoteId());
		}
		DbUser user = new DbUser();
		user.setUserId(note.getUserId());
		dbnote.setUser(userService.getUser(note.getUserId()));
		
		DbMessage message = new DbMessage();
		message.setMessageId(note.getMessageId());
		dbnote.setMessage(message);
		
		dbnote.setNote(note.getNote());
	}
	
	private void populateNote(DbNote dbnote, ConversationNote note) {
		note.setMessageId(dbnote.getMessage().getMessageId());
		note.setMessageSubject(dbnote.getMessage().getSubject());
		note.setNote(dbnote.getNote());
		note.setNoteId(dbnote.getNoteId());
		note.setUserId(dbnote.getUser().getUserId());
		note.setUserName(dbnote.getUser().getUsername());
		note.setNoteDate(dbnote.getNoteDate());
		note.setMsgId(dbnote.getMessage().getMsgId());
	}
}
