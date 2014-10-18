package com.dost.model;


public class ChatHistory {

	private Long conversationID;
	private String fromJIDResource;
	private String toJIDResource;	
	private String toJID;
	private String sentDate;	
	private String body;
	private String note;
	
	public Long getConversationID() {
		return conversationID;
	}
	public void setConversationID(Long conversationID) {
		this.conversationID = conversationID;
	}
	public String getFromJIDResource() {
		return fromJIDResource;
	}
	public void setFromJIDResource(String fromJIDResource) {
		this.fromJIDResource = fromJIDResource;
	}
	public String getToJIDResource() {
		return toJIDResource;
	}
	public void setToJIDResource(String toJIDResource) {
		this.toJIDResource = toJIDResource;
	}
	public String getSentDate() {
		return sentDate;
	}
	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getToJID() {
		return toJID;
	}
	public void setToJID(String toJID) {
		this.toJID = toJID;
	}
	
	
}
