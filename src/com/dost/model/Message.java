package com.dost.model;

public class Message {

	private Long id;
	private Long senderId;
	private String sentDate;
	private String subject;
	private String content;
	private Long important;
	private Long msgId;
	private String recipientIds;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getSenderId() {
		return senderId;
	}
	public void setSenderId(Long senderId) {
		this.senderId = senderId;
	}
	public String getSentDate() {
		return sentDate;
	}
	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getImportant() {
		return important;
	}
	public void setImportant(Long important) {
		this.important = important;
	}
	public Long getMsgId() {
		return msgId;
	}
	public void setMsgId(Long msgId) {
		this.msgId = msgId;
	}
	public String getRecipientIds() {
		return recipientIds;
	}
	public void setRecipientId(String recipientIds) {
		this.recipientIds = recipientIds;
	}
	
	
}
