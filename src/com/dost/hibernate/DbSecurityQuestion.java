package com.dost.hibernate;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SECURITY_QUESTION")
public class DbSecurityQuestion extends DbGeneric implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "question_id")
	private Long questionId;
	@Column(name = "text")
	private String question;
	
//	@JsonBackReference
//	@OneToOne (fetch=FetchType.EAGER, mappedBy="dbSecurityQuestion", cascade = CascadeType.ALL)
//	private DbUserSecurity dbUserSecurity;
	
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
//	public DbUserSecurity getDbUserSecurity() {
//		return dbUserSecurity;
//	}
//	public void setDbUserSecurity(DbUserSecurity dbUserSecurity) {
//		this.dbUserSecurity = dbUserSecurity;
//	}
//	
//	
}
