package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@IdClass(DbChatHistory.class)
@Table(name="ofMessageArchive")
public class DbChatHistory implements Serializable {

//	@Id
//	@Column(name = "ROWID")
//	private String rowId;
	@Column(name = "conversationID")
	private Long conversationID;
	@Column(name = "fromJIDResource")
	private String fromJIDResource;
	@Column(name = "toJIDResource")
	private String toJIDResource;	
	@Id
	@Column(name = "sentDate")
	private String sentDate;	
	@Column(name = "body")
	private String body;
	
	
	
//	public String getRowId() {
//		return rowId;
//	}
//	public void setRowId(String rowId) {
//		this.rowId = rowId;
//	}
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
	
	
}
