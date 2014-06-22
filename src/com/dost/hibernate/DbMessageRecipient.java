package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="MESSAGERECIPIENT")
public class DbMessageRecipient extends DbGeneric implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "messageRecipientId")
	private Long messageRecipientId;
	
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="messageid", nullable=false)
    @JsonIgnore
	private DbMessage message;
    
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="recipientid", nullable=false)
	@JsonIgnore
    private DbUser recipient;
    
    @Column(name="viewed")
	private Long viewed;

	public Long getMessageRecipientId() {
		return messageRecipientId;
	}

	public void setMessageRecipientId(Long messageRecipientId) {
		this.messageRecipientId = messageRecipientId;
	}

	public DbMessage getMessage() {
		return message;
	}

	public void setMessage(DbMessage message) {
		this.message = message;
	}

	public DbUser getRecipient() {
		return recipient;
	}

	public void setRecipient(DbUser recipient) {
		this.recipient = recipient;
	}

	public Long getViewed() {
		return viewed;
	}

	public void setViewed(Long viewed) {
		this.viewed = viewed;
	}
    
    
}
