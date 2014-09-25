package com.dost.hibernate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonBackReference;
import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="USER_QUESTION")
public class DbUserSecurity {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "user_question_id")
	private Long userQuestionId;

	@JsonBackReference
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="userid", nullable=false)
    @JsonIgnore
	private DbUser user;
	
	@Column(name = "questionid")
	private Long questionId;
	
//	@JsonManagedReference
//	@OneToOne(fetch=FetchType.EAGER)
//	@JoinColumn(name="questionid", nullable=false)
//	private DbSecurityQuestion dbSecurityQuestion;
//	@JsonManagedReference
//	@ManyToMany(fetch=FetchType.EAGER)
//	@JoinColumn(name="questionid", nullable=false)
//	private List<DbSecurityQuestion> dbSecurityQuestion;
	
	@Column(name="answer")
	private String answer;

	public Long getUserQuestionId() {
		return userQuestionId;
	}

	public void setUserQuestionId(Long userQuestionId) {
		this.userQuestionId = userQuestionId;
	}

	public DbUser getUser() {
		return user;
	}

	public void setUser(DbUser user) {
		this.user = user;
	}


	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
}
