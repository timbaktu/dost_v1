package com.dost.hibernate;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="MESSAGE")
public class DbMessage extends DbGeneric implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "messageId")
	private Long messageId;
	
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="senderid", nullable=false)
	private DbUser sender;
    
    @Column(name="sentdate")
	private Date sentDate;
    @Column(name="subject")
	private String subject;
    @Column(name="content")
	private String content;
    @Column(name="status")
	private MessageStatus messageStatus;
    @Column(name="important")
	private Long important;
    @OneToMany (fetch=FetchType.EAGER, mappedBy="message")
    @JsonIgnore
    private List<DbMessageRecipient> recipients;

	
	public Long getMessageId() {
		return messageId;
	}
	public void setMessageId(Long messageId) {
		this.messageId = messageId;
	}
	public DbUser getSender() {
		return sender;
	}
	public void setSender(DbUser sender) {
		this.sender = sender;
	}
	public Date getSentDate() {
		return sentDate;
	}
	public void setSentDate(Date sentDate) {
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
	public MessageStatus getMessageStatus() {
		return messageStatus;
	}
	public void setMessageStatus(MessageStatus messageStatus) {
		this.messageStatus = messageStatus;
	}
	public Long getImportant() {
		return important;
	}
	public void setImportant(Long important) {
		this.important = important;
	}
	public List<DbMessageRecipient> getRecipients() {
		return recipients;
	}
	public void setRecipients(List<DbMessageRecipient> recipients) {
		this.recipients = recipients;
	}

	
}
