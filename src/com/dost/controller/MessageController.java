package com.dost.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbMessage;
import com.dost.hibernate.DbMessageRecipient;
import com.dost.hibernate.DbUser;
import com.dost.model.Faq;
import com.dost.model.Message;
import com.dost.service.MessageService;
import com.dost.service.UserService;
import com.dost.util.Utils;

@Controller
@RequestMapping("api")
public class MessageController {

	@Autowired
	MessageService messageService;
	
	@Autowired
	UserService userService;
	
	/*messages received*/
	@RequestMapping(value="/message/{id}/", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getAllMessagesById(@PathVariable Long id) {
		List<DbMessage> messages = messageService.getMessagesById(id);
		for(DbMessage msg : messages) {
			msg.setSentDate(Utils.formatDate(msg.getSentDateDb()));
		}
		return messages;
	}
	
	/*messages received*/
	@RequestMapping(value="/user/{id}/messages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getAllUserMessages(@PathVariable Long id) {
		List<DbMessage> messages = messageService.getUserMessages(id);
		for(DbMessage msg : messages) {
			msg.setSentDate(Utils.formatDate(msg.getSentDateDb()));
		}
		return messages;
	}
	
	@RequestMapping(value="/user/{id}/draftmessages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getDraftUserMessages(@PathVariable Long id) {
		return messageService.getDraftUserMessages(id);
	}
	
	@RequestMapping(value="/user/{id}/sentmessages", method=RequestMethod.GET)  
	@ResponseBody
	public List<DbMessage> getSentUserMessages(@PathVariable Long id) {
		List<DbMessage> messages =  messageService.getSentUserMessages(id);
		for(DbMessage msg : messages) {
			msg.setSentDate(Utils.formatDate(msg.getSentDateDb()));
		}
		return messages;
	}
	
	@RequestMapping(value="/message/{id}/details", method=RequestMethod.GET)  
	@ResponseBody
	public DbMessage getMessageDetails(@PathVariable Long id) {
		return messageService.getMessageDetails(id);
	}
	
	@RequestMapping(value="/message/{id}/user/{userid}/setview", method=RequestMethod.GET)  
	public void setViewed(@PathVariable Long id, @PathVariable Long userId) {
		messageService.setViewed(id, userId);
	}
	
	@RequestMapping(value="/msgid/{id}/count", method=RequestMethod.GET)  
	@ResponseBody
	public Map<String, Long> getMsgCount(@PathVariable Long id) {
		Long count = messageService.getMsgCount(id);
		Map<String, Long> countMap = new HashMap<String,Long>();
		countMap.put("count", count);
		return countMap;
	}
	
	@RequestMapping(value="/user/message", method=RequestMethod.POST)  
	@ResponseBody
	public void sendMessage(Message message) {
		messageService.sendMessage(populateDbMessage(message));
	}
	@RequestMapping(value="/messages/add", method=RequestMethod.POST)  
	@ResponseBody
	public Faq addFaq(Faq faq) {
//		DbFaqCategory dbFaqCategory = categoryService.findCategoryByName(faq.getCategory());
//		DbFaq dbFaq = new DbFaq();
//		dbFaq.setQuestion(faq.getQuestion());
//		dbFaq.setAnswer(faq.getAnswer());
//		dbFaq.setCategory(dbFaqCategory);
//		faq.setCategoryId(""+dbFaqCategory.getFaqCategoryId());
//		faqService.addFaq(dbFaq);
//		return faq;
		return null;
	}
	
	private DbMessage populateDbMessage(Message message) {
		DbMessage dbMessage = new DbMessage();
		dbMessage.setContent(message.getContent());
		dbMessage.setSubject(message.getSubject());
		dbMessage.setImportant(message.getImportant());
		// Hibernate will set this
		//dbMessage.setMessageId(messageId)
		if(message.getMsgId() != null) {
			dbMessage.setMsgId(message.getMsgId());
		}
		// If msgId is null then create new..Using bad way of doing it for now
		else {
			Long maxMsgId = messageService.getMaxMsgId();
			dbMessage.setMsgId(maxMsgId + 1);
		}
		dbMessage.setRecipients(createRecipientList(message, dbMessage));
		dbMessage.setSender(userService.getUser(message.getSenderId()));
		dbMessage.setSentDateDb(new Date());
		return dbMessage;
	}
	
	private List<DbMessageRecipient> createRecipientList(Message message, DbMessage dbMessage) {
		List<DbMessageRecipient> lists = new ArrayList<DbMessageRecipient>();
		String recipientIds = message.getRecipientIds();
		String[] recipientArray = recipientIds.split(",");
		for(String userId : recipientArray) {
			DbMessageRecipient dbMessageRecipient = new DbMessageRecipient();
			// Hibernate will put this
			//dbMessageRecipient.setMessageRecipientId(messageRecipientId);
			dbMessageRecipient.setDeleted("0");
			dbMessageRecipient.setMessage(dbMessage);
			DbUser recipient = userService.getUser(Long.parseLong(userId));
			dbMessageRecipient.setRecipient(recipient);
			dbMessageRecipient.setViewed(0l);
		}
		return lists;
	}
}
