package com.dost.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbNote;
import com.dost.service.NoteService;

@Controller
@RequestMapping("api")
public class NoteController {

	@Autowired
	NoteService noteService;

	@RequestMapping(value="/msgId/{msgId}/notes/all", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbNote> getAllNotes(@PathVariable Long msgId) {
		List<DbNote> notes = noteService.getAllNotesForMsgId(msgId);
		return notes;
	}
	
	@RequestMapping(value="/notes/add", method=RequestMethod.POST)  
	@ResponseBody
	public DbNote addNote(DbNote note) {
		return noteService.saveNote(note);
	}
}
